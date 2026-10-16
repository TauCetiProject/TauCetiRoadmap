# Roadmap: continuous cohomology of profinite groups

Continuous cochain cohomology of a profinite group acting on discrete modules is the language of
Galois cohomology. Local and global class field theory, the duality theorems, Demushkin groups,
and the cohomological invariants of quadratic forms are all written in it. Mathlib supplies a deep
theory of discrete group cohomology and a continuous cohomology functor; §4 records that
inventory. This roadmap builds what one computes with: explicit inhomogeneous `H⁰, H¹, H²` with
their cocycle identities, the comparison isomorphisms between models, the description as a colimit
over finite quotients, long exact sequences, corestriction, Shapiro's lemma for closed subgroups,
cup products with their compatibilities, cohomological dimension, Hilbert 90 and Kummer theory in
profinite form, and the Evens norm.

One definitional decision is fixed before anything else: **we do not create a third cohomology
theory.** Mathlib's continuous cohomology is the canonical object. An explicit inhomogeneous
low-degree layer, with `H⁰, H¹, H²` presented as subquotients of honest function spaces, is the
calculational interface. Comparison isomorphisms in degrees `0, 1, 2` identify the two, so that
restriction, inflation, corestriction, cup products and connecting maps each have one public
normalization and one computable description. The low-degree layer is where arithmetic happens;
the canonical layer is where the theory is stated in all degrees.

Suggested home: `TauCeti/RepresentationTheory/Homological/ContCohomology/`, mirroring the Mathlib
path so that files can be refactored onto the canonical API one at a time, with the
field-theoretic interface (Hilbert 90, Kummer classes) in
`TauCeti/FieldTheory/GaloisCohomology/`. Tau Ceti already implements a large part of this roadmap
there: the coefficient dictionary and the named restriction, inflation and coefficient maps of
Layer 1, the explicit complex and its functoriality of Layer 2, the comparisons of Layer 3, the
finite-quotient systems and their colimit theorems of Layer 4, the long exact sequence, inflation
and the five-term sequence with its transgression of Layer 5, the transversal calculus and the
low-degree corestriction with its identities of Layer 6, the coinduced module with its functor,
trace, exactness, algebraic comparison and explicit Shapiro isomorphisms of Layer 7, the six
explicit cups and their connecting-map identities of Layer 8, the Galois coefficients, Kummer
theory and Hilbert 90 of Layer 9, the all-degree connecting map and the trace of Layer 10, the
cohomological-dimension invariants of Layer 11, and the index-two cochains and graph class of
Layer 13, among others. Wherever a
milestone below is stated on such an object, the declaration it names is Tau Ceti's:
`Suggested.lean` carries this roadmap's name as an abbreviation of the Tau Ceti declaration, or as
a theorem proved by the Tau Ceti theorem, and names the Tau Ceti declaration in its docstring.

---

## 1. Scope

### Owned here

1. Discrete modules over a topological group: the openness API, the closure properties actually
   used, continuous sections of profinite quotients (Layer 0).
2. Adoption of Mathlib's compatible-pair functoriality for continuous cohomology, together with
   named restriction and inflation maps and the dictionary from the unbundled classes into its
   category (Layer 1).
3. The explicit inhomogeneous complex in degrees `0, 1, 2` over an arbitrary topological group,
   with functoriality by compatible pairs and the three named instances (Layer 2).
4. The comparison isomorphisms: explicit against canonical for profinite groups, and continuous
   against Mathlib's discrete `groupCohomology` for discrete groups (Layer 3).
5. The description of `Hⁱ(G, M)` as a colimit over finite quotients, in low degrees explicitly
   and in all degrees canonically (Layers 4 and 10).
6. Long exact sequences, inflation-restriction, and the five-term sequence with an explicit
   transgression (Layer 5).
7. Change of groups: restriction, corestriction, conjugation, transitivity, `cor ∘ res`, and the
   Mackey double-coset formula (Layer 6), and their all-degree forms (Layer 10), together with
   the descent of a vanishing restriction from a closed subgroup to an open subgroup containing it
   (Layer 10).
8. Coinduced discrete modules over closed subgroups, Shapiro's lemma, acyclicity, and dimension
   shifting (Layers 7 and 10).
9. Cup products in the six low-degree shapes with associativity, graded commutativity, and the
   restriction, inflation, projection and connecting-map compatibilities (Layer 8), together with
   the graded all-bidegree product (Layer 12).
10. Cohomological dimension `cd_p`, `cd`, `scd_p` with their dévissage and closed-subgroup
    theory, the `p`-primary torsion of the cohomology of `p`-primary coefficients, the criterion
    computing `scd_p` from `cd_p`, and the class module of a group of strict
    `p`-cohomological dimension at most two (Layer 11).
11. The Galois interface: profinite Hilbert 90 and the Kummer isomorphism with its explicit
    cocycle (Layer 9).
12. The Evens norm on `𝔽₂`-cohomology for open subgroups, in both the explicit index-2 form and
    the general monomial construction, together with the index-two exact sequence and the
    index-two norm as the pullback of the extension class of `D₁₆` (Layer 13).

### Consumed

Named theorem by theorem, or file by file, in §4. They are: Mathlib's discrete `groupCohomology`
package including `LowDegree`, `Functoriality`, `LongExactSequence`, `Shapiro` and `Hilbert90`;
Mathlib's `OpenSubgroup`/`OpenNormalSubgroup`, `ProfiniteGrp` and `ClopenNhdofOne` material;
Mathlib's Krull topology, infinite Galois correspondence and separable-closure API; and Mathlib's
`continuousCohomology` carrier together with the compatible-pair maps in
`Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`. The exact repository
pin contains `resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id`, and `map_comp`, and this
roadmap consumes those declarations directly rather than restating them. From Tau Ceti it consumes,
by name, the modules of `TauCeti/RepresentationTheory/Homological/ContCohomology/` that implement
its objects (`SmoothDiscrete`, `Functoriality`, `Additive`, `LowDegree`, `ExplicitFunctoriality`,
`CohomologyComparison`, `ContinuousCohomologyIso`, `GroupCohomologyIso`, `Invariants`,
`Inflation/Basic`, `Inflation/Comparison`, `FiniteQuotient/Basic`, `FiniteQuotient/Explicit`,
`FiniteQuotient/Colimit`, `FiniteQuotient/DegreeTwoDescent`, `Conjugation`, `FiveTerm`,
`Transgression`, `ShortExact`, `LongExact`, `DeltaNaturality`, `ExactCochains`,
`HomologySequence`, `Inflation/ConnectingMap`, `ConnectingMapComparison`, `Corestriction/Basic`,
`Corestriction/Transitivity`, `ProjectionFormula`, `Coinduced`, `Coinduced/Discrete`,
`Coinduced/Exact`, `Coinduced/Functor`, `Coinduced/PreservesExactness`, `Shapiro`,
`DimensionShifting/Basic`, `Cup/Product`, `Cup/ConnectingMap`, `CohomologicalDimension`,
`TrivialF2`, `Evens/Cochain`, `Evens/Class`), the transversal word `TauCeti.lWord` of
`TauCeti/GroupTheory/TransversalWord.lean` with its continuity `TauCeti.continuous_lWord`, the
uniform local constancy `TauCeti.isOpen_rightTranslationStabilizer` of
`TauCeti/Topology/Algebra/Group/LocallyConstant.lean`, the inclusion of a subgroup as a continuous
homomorphism `TauCeti.ContinuousMonoidHom.subgroupSubtype`, the
Galois-cohomology modules of `TauCeti/FieldTheory/GaloisCohomology/` (`Coefficients`, `Kummer`,
`Hilbert90`, `BrauerTorsion`) with `TauCeti.AbsoluteGaloisGroup`,
`TauCeti.absoluteGaloisGroupRestrictEquiv`, `TauCeti.galoisSubgroup` and the power classes of
`TauCeti/Algebra/Group/PowerClassGroup.lean`, together with `TauCeti.InternalHom`, the
`G ⧸ H`-action on
`FixedPoints.addSubgroup H M` in `TauCeti/GroupTheory/GroupAction/FixedPoints.lean`,
`TauCeti.QuotientGroup.mapOfLE`, `TauCeti.exists_openNormalSubgroup_smul_eq_self`,
`TauCeti.exists_continuous_section`, `TauCeti.leastENatBound`, `TauCeti.IsPPrimaryTorsion`,
`TauCeti.quotientOpenSubgroup`, `TauCeti.maximalProPQuotient` and the conjugation action on
`TopologicalAbelianization`.

### Supplied to other roadmaps

Theorem-level contracts only, listed in §2.

### Out of scope

This list is definitive, not a list of things that might come later.

- The Hochschild-Serre spectral sequence. Layer 5 builds the five-term exact sequence directly
  from cochains and stops there.
- Non-discrete topological coefficient modules: `ℤ_p(1)`, Iwasawa-theoretic limits, condensed
  coefficient systems. The canonical object is defined for these, but no theorem here is stated
  for them. The one exception is the cohomology of a finite discrete group, where every cochain is
  continuous and the topology of the coefficients plays no part: Layer 11's class-module theorem
  is stated for the finite quotient `G ⧸ V` acting on the profinite group `V^ab(p)`.
- All-degree explicit inhomogeneous cochains `C(Gⁿ, M)` for groups that are not profinite. Layer
  3 gives the inhomogeneous description exactly where currying is an equivalence.
- Evens norms for coefficients other than `𝔽₂` with trivial action, and the even-degree
  restriction that general coefficients force.
- Profinite Sylow theory and the resulting equality `cd_p G = cd_p G_p`. That belongs to the
  Profinite Pro-`p` Groups roadmap, which owns the existence and conjugacy of pro-`p` Sylow subgroups
  and supernatural indices.
- Projective representations, factor sets, and Schur multipliers as representation theory. This
  roadmap supplies `H²` and nothing about its representation-theoretic applications.

### Portfolio export contract

The exact declarations in `Suggested.lean` are the sole continuous-cohomology interface consumed
by `ProfiniteProPGroups`, `ClassFieldTheory`, `LocalGaloisGroups`, and
`QuadraticFormInvariants`. Finite-group Tate cohomology in negative degrees and
`FiniteClassFormation` are owned by `ClassFieldTheory`; this roadmap contains neither. Ordinary
continuous cohomology in all degrees, `cd_p`, continuous corestriction, Kummer theory, and the
continuous cup product remain here.

### The canonical carrier

The canonical object is Mathlib's continuous cohomology, and this roadmap does not build a
competing one. The pinned Mathlib supplies it:
`continuousCohomology R G n : Action (TopModuleCat R) G ⥤ TopModuleCat R`, in
`Mathlib/Algebra/Category/ContinuousCohomology/Basic.lean`, with
`ContinuousCohomology.homogeneousCochains` for the complex it is the homology of,
`ContinuousCohomology.invariants`, and
`continuousCohomologyZeroIso : continuousCohomology R G 0 ≅ invariants R G` for the one degree
Mathlib computes. The exact repository pin additionally supplies
`ContinuousCohomology.resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id`, and
`map_comp` in `RepresentationTheory/Homological/ContCohomology/Functoriality.lean`. Layer 1 and
`Suggested.lean` use those Mathlib declarations directly. Every canonical-facing statement below
is written against `TopRep R G`, an abbreviation for the pin's `Action (TopModuleCat R) G`.

Any other implementation of continuous cohomology replaces this one only after an explicit
comparison of the coefficient categories and of the resolutions has been proved. Equivalence of
the categories together with agreement of the constructions makes such a replacement a transport;
it is not a definitional identity, and nothing here assumes one.

---

## 2. Boundaries with neighboring roadmaps

### With the representation theory family

The repository already has
[`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md),
which covers algebraic induction and coinduction, finite-index comparisons, Mackey theory for
finite groups, and projective representations. The division of labor is:

| That roadmap owns | This roadmap owns |
|---|---|
| Algebraic `Rep` induction and coinduction and their adjunctions | Topological coinduction of discrete modules for closed subgroups of profinite groups |
| `Rep.indCoindIso` and the finite-index algebraic comparison | The comparison of the topological coinduction with the algebraic one for open subgroups |
| Mackey decomposition and the irreducibility criterion for finite groups | Continuous restriction, corestriction, Shapiro, the continuous Mackey formula, and their comparison with the finite-level statements |
| Projective representations, factor sets, Schur multipliers | The continuous and discrete `H²` themselves, with no representation-theoretic application |

Layer 7 cites that roadmap where it uses the algebraic finite-index theory, and does not restate
algebraic induction milestones. The theorem joining the two is Layer 7's comparison for open
subgroups.

### The exported interface

This roadmap owns the continuous cohomology of profinite groups: the carrier, its functoriality,
the explicit low-degree model, and the comparison between them. Anything downstream that needs a
continuous cohomology group uses the declarations below rather than a private copy, so that two
developments cannot drift into two theories that only prose says will agree. A development that
already carries its own carrier joins this one either by replacing it with these declarations or
by supplying explicit natural comparison isomorphisms and transporting every operation it uses;
those are the only two acceptable states.

What is exported is exactly this, named. Every entry in the declaration column is a Lean
identifier: either one this roadmap builds, carried with its signature in `Suggested.lean`, or one
Mathlib already supplies, which here is only `continuousCohomology`. A description such as "the
colimit theorem" or "the six cup shapes" is not a citable export, and no row contains one.

| Exported object or theorem | Supplier layer | Declaration | Mathematical type |
|---|---|---|---|
| the canonical carrier | 1 | `TopRep`, `continuousCohomology` | `TopRep R G ⥤ TopModuleCat R` |
| compatible-pair functoriality | 1 | `map`, `map_id`, `map_comp` | `Hⁿ(G, X) ⟶ Hⁿ(H, Y)` for `φ : H →ₜ* G` |
| restriction, inflation, coefficient maps | 1 | `res`, `infl`, `coeffMap` | morphisms of `TopModuleCat R` |
| the coefficient dictionary | 1 | `ofDiscreteModule`, `ofDiscreteModule_isSmoothDiscrete`, `ofDiscreteModuleMap`, `ofDiscreteModulePair`, `ofDiscreteModuleRes`, `ofDiscreteModuleQuotient`, `Invariants`, `IsSmoothDiscrete`, `SmoothDiscreteTopRep`, `discreteRepEquivSmoothTopRep` | `DiscreteRep R G ≌ SmoothDiscreteTopRep R G`; Tau Ceti's `TauCeti.ofDiscreteModule ℤ G M` and its companions |
| explicit `H⁰`, `H¹`, `H²` | 2 | `C1`, `C2`, `d0`, `d1`, `Z1`, `Z2`, `B1`, `B2`, `H0`, `H1`, `H2`, `H1pi`, `H2pi`, `DiscreteH1`, `DiscreteH2`, `discreteH1Equiv`, `discreteH2Equiv` | `M^G`, and quotients of additive subgroups of the cochain spaces; Tau Ceti's `TauCeti.ContCohomology` complex |
| explicit low-degree functoriality | 2 | `explicitMap1`, `explicitMap1Equiv`, `explicitRes0`, `explicitRes1`, `explicitRes2`, `explicitInfl1`, `explicitInfl2`, `explicitCoeff0`, `explicitCoeff1`, `explicitCoeff2`, `explicitConj1`, `explicitConj1_eq_id_of_mem` | additive maps between the explicit groups |
| the comparison in degrees 0, 1, 2 | 3 | `explicitH0IsoContinuousCohomology`, `explicitH1IsoContinuousCohomology`, `explicitH2IsoContinuousCohomology` | isomorphisms in `TopModuleCat ℤ` |
| the comparison with discrete `groupCohomology` | 3 | `explicitH0IsoGroupCohomology`, `explicitH1IsoGroupCohomology`, `explicitH2IsoGroupCohomology` | additive equivalences with `groupCohomology (Rep.ofDistribMulAction ℤ G M) i` |
| naturality of the comparison | 3 | `explicitIso_map`, `explicitIso_res`, `explicitIso_infl`, `explicitIso_coeffMap` | commuting squares in compatible pairs |
| the finite-quotient system | 4 | `finiteQuotientMap`, `invariantsInclusion`, `invariantsInclusion_equivariant`, `transitionPair`, `finiteLevelTransition`, `finiteLevelTransition_id`, `finiteLevelTransition_comp` | a functor on `(OpenNormalSubgroup G)ᵒᵖ` |
| the finite-quotient colimit | 4 | `explicitFiniteQuotientTransition1`, `explicitFiniteQuotientSystem0`, `explicitFiniteQuotientSystem1`, `explicitFiniteQuotientSystem2`, `explicitFiniteQuotientSystem0_map`, `explicitFiniteQuotientSystem1_map`, `explicitFiniteQuotientSystem2_map`, `explicitFiniteQuotientComparison0`, `explicitFiniteQuotientComparison1`, `explicitFiniteQuotientComparison2`, `explicitFiniteQuotientCocone0`, `explicitFiniteQuotientCocone1`, `explicitFiniteQuotientCocone2`, `explicitFiniteQuotientColimit0`, `explicitFiniteQuotientColimit1`, `explicitFiniteQuotientColimit2` | the universe-polymorphic explicit `Hⁱ(G, M) ≅ colim_U Hⁱ(G ⧸ U, M^U)` for `i = 0,1,2` |
| the long exact sequence in low degrees | 5 | `DiscreteShortExact`, `DiscreteShortExact.restrict`, `explicitDelta0`, `explicitDelta0_apply`, `explicitDelta1`, `explicitDelta1_apply`, `explicitLongExact_H0A`, `explicitLongExact_H0B`, `explicitLongExact_H0C`, `explicitLongExact_H1A`, `explicitLongExact_H1B`, `explicitLongExact_H1C`, `explicitLongExact_H2A`, `explicitLongExact_H2B`, `explicitDelta0_res`, `explicitDelta1_res` | connecting maps and exactness at eight nodes |
| the five-term sequence | 5 | `H1ConjInvariants`, `explicitInfl1_injective`, `explicitInfRes_exact`, `explicitRes1_mem_conjInvariants`, `explicitResConj1`, `explicitInfResConj_exact`, `transgressionLift`, `transgressionCochain`, `transgressionCochain_apply`, `transgressionCochain_isCocycle`, `transgressionCochain_sub_mem_B2`, `transgression`, `transgression_apply`, `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`, `transgression_explicitResConj1`, `explicitInfl2_transgression` | `0 → H¹(G⧸N, M^N) → H¹(G, M) → H¹(N, M)^{G⧸N} → H²(G⧸N, M^N) → H²(G, M)` |
| the all-degree colimit and exact sequence | 10 | `continuousCohomologyFunctor`, `continuousFiniteQuotientSystem`, `continuousFiniteQuotientCocone`, `continuousFiniteQuotientColimit`, `continuousCohomology_preservesFilteredColimits`, `continuousCochainsShortExact`, `continuousCochainsShortExact_shortExact`, `delta`, `longExact_exact`, `delta_naturality`, `delta_res`, `delta_infl`, `delta_corestriction`, `explicitIso_delta0`, `explicitIso_delta1` | the canonical colimit, filtered-colimit preservation, and `Hⁿ(G, C) ⟶ Hⁿ⁺¹(G, A)` with all exactness and naturality data |
| low-degree corestriction | 6 | `lWord`, `lWord_mem`, `explicitCor0Transversal`, `explicitCor1Transversal`, `explicitCor2Transversal`, `explicitCor0_changeTransversal`, `explicitCor1_changeTransversal`, `explicitCor2_changeTransversal`, `explicitCor0`, `explicitCor1`, `explicitCor2`, `explicitCor_comp_res0`, `explicitCor_comp_res1`, `explicitCor_comp_res2`, `explicitCor_delta0`, `explicitCor_delta1` | finite-index additive maps on cochains, descending to classes; Tau Ceti's declarations of the same names, read at an open subgroup with a finite quotient |
| all-degree corestriction | 10 | `coindTrace`, `corestriction`, `corestrictionLe`, `corestriction_naturality`, `corestriction_trans`, `corestriction_comp_res`, `mackeyTerm`, `corestriction_mackey` | `Hⁿ(U, res X) ⟶ Hⁿ(G, X)` for open `U` |
| descent from a closed subgroup | 10 | `exists_openSubgroup_res_eq_zero_of_res_eq_zero` | a class of `Hⁿ(G, X)` with zero restriction to a closed `H` has zero restriction to some open `U ⊇ H`, in every degree |
| agreement of the two corestrictions | 10 | `explicitIso_cor0`, `explicitIso_cor`, `explicitIso_cor2` | commuting squares in degrees 0, 1, 2 |
| explicit Shapiro and coinduction | 7 | `Coind`, `coindTraceRaw`, `coindTopRep`, `coindFunctor`, `coindFunctor_obj`, `coindFunctor_map_shortExact`, `explicitShapiro0`, `explicitShapiro1`, `explicitShapiro2`, `algebraicCoindAsSmooth`, `topologicalCoindIsoAlgebraic`, `topologicalCoindIsoAlgebraic_shapiro` | `Hⁱ(G, Coind_H^G A) ≃+ Hⁱ(H, A)` for `i = 0, 1, 2`, and the open-subgroup algebraic comparison; Tau Ceti's `TauCeti.coind`, `TauCeti.coindTrace`, `TauCeti.coindTopRep`, `TauCeti.coindFunctor` and their companions, except `topologicalCoindIsoAlgebraic_shapiro` |
| all-degree Shapiro and dimension shifting | 10 | `shapiroCochainMap`, `shapiroMap`, `isIso_shapiroMap`, `quasiIso_shapiroCochainMap`, `shapiroIso`, `shapiroIso_hom`, `coindEmbedding`, `dimensionShiftQuotient`, `coindAcyclic`, `dimensionShiftIso` | the canonical Shapiro map `Hⁿ(G, Coind_H^G A) ⟶ Hⁿ(H, A)`, induced by a cochain map that is a quasi-isomorphism and not an isomorphism of complexes, an isomorphism in every degree; and the closed dependency chain used by Layer 11 |
| the six low-degree cups | 8 | `explicitCup00`, `explicitCup01`, `explicitCup10`, `explicitCup02`, `explicitCup11`, `explicitCup20` | `H^p(G, M) × H^q(G, N) → H^{p+q}(G, P)`, `p + q ≤ 2` |
| the connecting maps and the low-degree cups | 8 | `explicitDelta0_explicitCup00_left`, `explicitDelta1_explicitCup01_left`, `explicitDelta1_explicitCup10_left`, `explicitDelta0_explicitCup00_right`, `explicitDelta1_explicitCup01_right`, `explicitDelta1_explicitCup10_right` | `δ(x ⌣ y) = δx ⌣ y` and `δ(x ⌣ y) = (-1)^p x ⌣ δy` for a map of short exact coefficient sequences, in the six instances of degree `≤ 2`; Tau Ceti's theorems of the same names |
| the graded cup | 12 | `TopPairing`, `resolutionCupPairing`, `resolutionCupPairing_apply_zero`, `resolutionCupPairing_apply_succ`, `cupCochain`, `cupCochain_apply`, `cupCochain_leibniz`, `cupAssocHomotopy`, `cupAssocHomotopy_spec`, `cupCommHomotopy`, `cupCommHomotopy_spec`, `cup`, `cup_add_left`, `cup_add_right`, `cup_one_left`, `cup_one_right`, `cup_assoc`, `cup_gradedComm`, `cup_res`, `cup_infl`, `cup_coeffMap`, `cup_projection` | `Hᵐ × Hⁿ → H^{m+n}` constructed on Mathlib's coinduction resolution |
| agreement of the two cups | 12 | `ofDiscreteModulePairing`, `explicitIso_cup` | commuting square in bidegree `(1,1)` |
| the evaluation pairing for duality | 0, 12 | `homAction`, `evalPairing`, `evalPairing_equivariant`, `TopPairing`, `ofDiscreteModulePairing`, `cup`, `cup_add_left`, `cup_add_right` | `Hⁱ(G, M →+ N) × H^{2-i}(G, M) → H²(G, N)`, the internal hom being Tau Ceti's `TauCeti.InternalHom G M N` |
| the Kummer isomorphism | 9 | `AbsoluteGaloisGroup`, `muN`, `KummerCoeff`, `kummerCoeff_continuousSMul`, `powerSubgroup`, `powerClassQuotient`, `powerClassMap`, `kummerMap`, `kummerIso`, `kummerIsoTransport`, `kummerRes`, `kummerIso_res`, `kummerIso_norm`, `kummerMapCanonical`, `explicitIso_kummerMap` | `Kˣ ⧸ (Kˣ)ⁿ ≃* Multiplicative (H¹(AbsoluteGaloisGroup K, KummerCoeff K n))`; Tau Ceti's `TauCeti.kummerIso` and its companions, except the norm square |
| the multiplicative coefficients, the Kummer sequence and Hilbert 90 | 9 | `UnitsCoeff`, `unitsCoeff_continuousSMul`, `baseUnitsEquivInvariants`, `kummerCoeffIncl`, `unitsCoeffPow`, `kummerShortExact`, `kummerShortExact_incl`, `kummerShortExact_proj`, `hilbert90`, `kummerCoeffToUnits`, `h2KummerToUnits`, `h2KummerToUnits_injective`, `h2KummerToUnits_range` | `H¹(G_K, (Kˢ)ˣ) = 0`, and `H²(G_K, μₙ) ↪ H²(G_K, (Kˢ)ˣ)` with image the `n`-torsion; Tau Ceti's declarations of the same names |
| the field-extension bridge | 9, with 10, 12 and 13 | `galoisSubgroup`, `galoisSubgroup_index`, `galoisSubgroupEquiv`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisEvens`, `galoisConj`, `galoisCharacter`, `galoisRes_galoisCor`, `galoisConj_evensConj`, `galoisRes_cup`, `galoisCor_cup`, `galoisRes_galoisEvens`, `galoisEvens_add`, `galoisEvens_galoisRes`, `galoisRes_eq_zero_iff`, `galoisRes_galoisCor_exact`, `galoisRes_comp`, `galoisSubgroup_conj`, `galoisRes_embedding_independent`, `galoisCor_embedding_independent`, `galoisEvens_embedding_independent`, `galoisCharacter_embedding_independent` | restriction, corestriction, the index-two norm and the quadratic character for a finite separable `L/K`; `res ∘ cor = id + conj`; the conjugate as the transport of `evensConj`; the cup and projection formulas; the Evens identities and the index-two exact sequence read on the `L/K` side; tower functoriality and embedding independence |
| cohomological dimension | 11 | `IsPPrimaryTorsion`, `isPPrimaryTorsion_continuousCohomology`, `CohomologicalDimensionLE`, `StrictCohomologicalDimensionLE`, `cd_p`, `scd_p`, `cd`, `cd_p_le_iff`, `scd_p_le_iff`, `cohomologicalDimensionLE_iff_torsion`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`, `cd_p_le_scd_p`, `scd_p_le_cd_p_add_one`, `cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd`, `strictCohomologicalDimensionAt_openSubgroup_le`, `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` | Tau Ceti's `ℕ∞`-valued invariants `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt` and `TauCeti.cohomologicalDimension` at the coefficient universe of `G`, and `Hⁿ(G, M)` `p`-primary for `p`-primary `M` |
| the class module of strict dimension two | 11 | `abelianizationProP`, `abelianizationProPFactorSet`, `abelianizationProPClass`, `subsingleton_h1_abelianizationProP`, `abelianizationProPClass_generates` | for `scd_p G ≤ 2` and open normal `V`: `H¹(G ⧸ V, V^ab(p)) = 0`, and `H²(G ⧸ V, V^ab(p))` is cyclic of order `#(G ⧸ V)_p`, generated by the class of the extension, which `abelianizationProPClass` takes with the proof that `V` is open |
| the Evens norm | 13 | `evensNorm`, `homClass`, `homClass_eq_cochainClass`, `homClass_surjective`, `evensGraphCochain`, `graphClass`, `graphClass_eq_cochainClass`, `graphClass_representative_independent`, `evensNormIndexTwo`, `evensNormIndexTwo_homClass`, `evensConj`, `evensConj_eq_conjMapOf`, `evensNormIndexTwo_eq`, `evensNorm_eq_graphClass` | `H^q(U, 𝔽₂) → H^{l q}(G, 𝔽₂)` for open `U` of index `l`; at index two and degree one, the graph class |
| the index-2 Evens identities | 13 | `evensNorm_res`, `evensNorm_polarization`, `evensNorm_cor_shapiro`, `evensNorm_identity_infl`, `indexTwoCharacter`, `indexTwoCharacterClass`, `evensGraphCochain_comp_subtype`, `evensNorm_of_res` | identities of classes in `H²(G, 𝔽₂)`, the fifth with the class `χ_U` of the index-two character |
| the index-two exact sequence | 13 | `indexTwo_ker_res1`, `indexTwo_exact_res1_cor1`, `indexTwo_exact_cor1_cup`, `indexTwo_exact_cup_res2`, `indexTwo_exact_res2_cor2` | `H¹(G) → H¹(U) → H¹(G) → H²(G) → H²(U) → H²(G)` by restriction, corestriction and cup with `χ_U`, exact, with `{0, χ_U}` the kernel of restriction in degree one |
| the index-two norm as a pullback of `D₁₆` | 13 | `WreathC2`, `wreathBase`, `wreathTautological`, `wreathSwap`, `dihedralToWreath`, `dihedralToWreath_eq_one_iff`, `wreathSection`, `dihedralToWreath_wreathSection`, `wreathD16Cocycle`, `wreathD16Cocycle_isCocycle`, `wreathWitness`, `evensGraphCochain_wreath`, `evensGraphCochain_comap`, `indexTwoInd`, `comap_indexTwoInd_wreathBase`, `wreathTautological_indexTwoInd`, `evensGraphCochain_indexTwoInd`, `evensGraphCochain_eq_indexTwoInd_pullback`, `evensNormIndexTwo_eq_ind_pullback` | the graph cochain of the tautological character of `C₂ ≀ C₂` is the factor set of `D₁₆ → C₂ ≀ C₂` plus an explicit coboundary; every index-two norm is its pullback along `Ind α : G → C₂ ≀ C₂` |

Three points about the index-2 Evens identities, because they are exact and easy to get wrong. The
identities are statements about **cohomology classes**, not about the graph cochain, and
`Suggested.lean` states them that way. The polarization is
```
N(α + β) - N(α) - N(β) = cor (α ⌣ (s · β)),
```
with the **conjugate** class on the right. Dropping the conjugate gives a different statement, and
this roadmap does not supply it; a consumer that wants the unconjugated form must prove the two
equivalent under stated hypotheses. And the conjugate `s · β` is `evensConj`, which is defined
without choosing `s`: an element outside `U` appears only where a right-hand side is a cochain
formula (identity 3, `graphClass_eq_cochainClass`, `evensNormIndexTwo_eq_ind_pullback`), and there
it is universally quantified, so none of the identities is a statement about a choice.

### The comparisons carry the operations, not only the groups

Exporting an isomorphism of underlying groups in each of degrees `0, 1, 2` is not enough, and a
roadmap that stopped there would leave every consumer to prove for itself that the explicit
corestriction is the canonical one. So the equations saying that the degree-`0`, `1` and `2`
comparisons carry **each exported operation** to its counterpart are milestones of this roadmap in
their own right, listed in the layer where both sides first exist:

| Operation | Comparison milestone | Layer |
|---|---|---|
| compatible pairs | `explicitIso_map` | 3 |
| restriction | `explicitIso_res` | 3 |
| inflation | `explicitIso_infl` | 3 |
| coefficient maps | `explicitIso_coeffMap` | 3 |
| connecting maps | `explicitIso_delta0`, `explicitIso_delta1` | 5 with 10 |
| corestriction | `explicitIso_cor0`, `explicitIso_cor`, `explicitIso_cor2` | 10 |
| cup products | `explicitIso_cup` | 12 |
| Kummer classes | `explicitIso_kummerMap` | 9 |
| the Evens norm | `evensNormIndexTwo_eq`, `evensNorm_eq_graphClass` | 13 |

No downstream development is asked to prove that two of this roadmap's constructions agree. Where
two constructions of the same operation exist here, the identification is a target here.

A joint contract with a consuming roadmap is recorded as a four-column table, consumer layer
against supplier layer against exact object against declaration name, carried identically in both
roadmaps. This section states settled contracts only; unsettled coordination is handled outside
the normative roadmap.

Nothing here depends on another roadmap except the merged
[`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md),
cited in Layer 7.

---

## 3. Standing hypotheses and pinned conventions

- **Groups.** `G` is a topological group: `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`.
  The explicit low-degree complex (Layer 2) and its exactness and cup-product identities (Layers
  5 and 8) are stated at that generality; profiniteness is not needed to define cochains.
  **Profinite** means the additional classes `[CompactSpace G] [TotallyDisconnectedSpace G]`,
  exactly the hypotheses of Mathlib's `exist_openNormalSubgroup_sub_open_nhds_of_one`.
  Profiniteness enters for the canonical comparison (Layer 3), the colimit theorem (Layer 4),
  continuous sections and the transgression (Layers 0, 5, 7), cohomological dimension (Layer 11)
  and the Galois interface (Layer 9). Do not take `ProfiniteGrp` (the category) as a hypothesis of
  a theorem: use the unbundled classes, as Mathlib's `ClopenNhdofOne.lean` does, and reserve
  `ProfiniteGrp` for categorical statements.
- **Discrete `G`-modules, in Mathlib's classes.** A topological `G`-module is `[AddCommGroup M]
  [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]`; a
  **discrete** module adds `[DiscreteTopology M]`. No bundling class is introduced: instance
  search composes these freely and each statement quantifies over exactly the classes it needs.
  For discrete `M`, continuity of the action is equivalent to openness of every point stabilizer
  (`continuousSMul_iff_stabilizer_isOpen`); state and use both forms. The categorical form is
  `TopRep k G` for canonical-facing statements, and the translation between the two is a Layer 0
  target modelled on the pin's discrete `Rep.ofDistribMulAction`.
- **Scalars.** The primary coefficient ring is `ℤ`: the explicit theory is stated for
  `DistribMulAction G M`, and the canonical statements are stated against `TopRep ℤ G`. A
  `TopRep k G` refinement for a ring `k` requires a genuine `Module k M` structure on the
  coefficients and a restriction-of-scalars compatibility theorem; state that refinement only
  where the `k`-action exists, and never add a `Module k` hypothesis to a statement about
  profinite groups that does not need it.
- **Universes.** The group and its coefficient modules live in one universe; the coefficient
  **ring** lives in another, so that a small ring such as `ZMod n` in `Type 0` is usable over a
  Galois group in any universe. The first half is forced by the pin: the canonical resolution is
  built from `C(G, -)`, so a coefficient module of `TopRep R G` cannot live below the universe of
  `G`. Where a `Type 0` object is needed as coefficients over a group in a higher universe, as
  `𝔽₂` is for the Evens norm, it is lifted (`trivialF2` carries `ULift (ZMod 2)`). The **only**
  declarations pinned to `Type 0` are the three comparisons with Mathlib's discrete
  `groupCohomology`, `explicitH0IsoGroupCohomology` and its two siblings, because `Rep k G` puts
  `k` and `G` in one universe (Mathlib #33608) and `k` here is `ℤ`; they carry their own binders,
  and lifting that restriction upstream makes them polymorphic by deleting those binders.
  ⚠ Do not restrict any other statement to `Type 0` to make an
  elaboration problem go away: the arithmetic consumers instantiate `K` in an arbitrary universe,
  and a `Type 0` signature here forces a `Type 0` section on each of them.
- **Left actions throughout**, written `g • m`. A right-module statement, if one ever arises, is
  phrased through `Gᵐᵒᵖ`.
- **Cochains are plain functions with continuity as a predicate.** `C¹(G,M)` is the subgroup of
  continuous elements of `G → M` and `C²(G,M)` of `G × G → M`, matching the shape of the pin's
  `groupCohomology.cocycles₁ : Submodule k (G → A)` rather than bundled `C(G, M)`. The canonical
  object uses bundled iterated `C(G, -)`, and Layer 3 crosses between the two descriptions once.
- **The differentials and cocycle identities follow Mathlib's
  `GroupCohomology/LowDegree.lean` conventions**, with continuity added:
  - `(d⁰ m) g = g • m - m`;
  - `(d¹ f) (g, h) = g • f h - f (g * h) + f g`;
  - `(d² f) (g, h, j) = g • f (h, j) - f (g * h, j) + f (g, h * j) - f (g, h)`;
  - 1-cocycle identity: `f (g * h) = g • f h + f g`, definitionally
    `groupCohomology.IsCocycle₁`;
  - 2-cocycle identity: `f (g * h, j) + f (g, h) = g • f (h, j) + f (g, h * j)`, definitionally
    `groupCohomology.IsCocycle₂`.

  Cochains are **not normalized**: `f 1 = 0` in degree 1 and the degree-2 normalizations are
  lemmas (`cocycles₁_map_one`, `cocycles₂_map_one_fst/snd`), never definitional conditions.
- **Cohomology presentation.** `H¹(G,M) = Z¹/B¹` and `H²(G,M) = Z²/B²` as quotients of additive
  subgroups of the function spaces, with `Z¹ = C¹ ⊓ ker d¹`, `B¹ = range d⁰` (automatically
  continuous), `Z² = C² ⊓ ker d²`, and `B² = d¹(C¹)`, the image of the **continuous** 1-cochains.
  `H⁰(G,M)` is the invariant subgroup `M^G` itself, not a quotient.
- **Functoriality is by compatible pairs**, in the direction of Mathlib's discrete
  `groupCohomology.cochainsMap` and of `ContinuousCohomology.cochainsMap`: a continuous
  homomorphism `φ : H →ₜ* G` together with an `H`-equivariant continuous map from the restricted
  module (`f (φ h • m) = h • f m`) induces `Hⁱ(G, M) → Hⁱ(H, N)`. Restriction (`φ` the inclusion
  of a subgroup, any subgroup; openness is needed only for corestriction), inflation (`φ` a
  quotient map, coefficients the invariants) and coefficient maps (`φ = id`) are the three named
  instances, each with its composition laws.
- **Cup products.** A cup product is relative to a `G`-equivariant biadditive pairing
  `μ : M →+ N →+ P` with `μ (g • m) (g • n) = g • μ m n`, together with joint continuity
  `Continuous fun p : M × N => μ p.1 p.2`, which is automatic when `M` and `N` are discrete and so
  holds throughout the arithmetic applications. Layer 12's graded cup carries the same
  hypothesis.
  The explicit theory covers the **six low-degree shapes**
  ```
  (p, q) ∈ {(0,0), (0,1), (1,0), (0,2), (1,1), (2,0)},   p + q ≤ 2,
  ```
  all instances of the general inhomogeneous formula
  `(a ⌣ b)(g₁, …, g_{p+q}) = μ (a (g₁, …, g_p)) ((g₁ ⋯ g_p) • b (g_{p+1}, …, g_{p+q}))`:
  - `(0,0)`: `m ⌣ n = μ m n`;
  - `(0,1)`: `(m ⌣ b) g = μ m (b g)`;
  - `(1,0)`: `(a ⌣ n) g = μ (a g) (g • n)`;
  - `(0,2)`: `(m ⌣ b) (g, h) = μ m (b (g, h))`;
  - `(1,1)`: `(a ⌣ b) (g, h) = μ (a g) (g • b h)`;
  - `(2,0)`: `(a ⌣ n) (g, h) = μ (a (g, h)) ((g * h) • n)`.

  No explicit cup goes above degree `2`; a product of total degree `3`, such as `(1,2)`, is part
  of the all-bidegree canonical package of Layer 12 and is not a target of the low-degree
  quotient model. Signs: the Leibniz rule is `d(a ⌣ b) = da ⌣ b + (-1)^p (a ⌣ db)` for `a` of
  degree `p`, and graded commutativity is
  `a ⌣_μ b = (-1)^{pq} (b ⌣_{μᵒᵖ} a)` **as an identity of cohomology classes**, where `μᵒᵖ n m =
  μ m n`. In the `𝔽₂`-valued arithmetic applications every sign is `1` and the cup is symmetric on
  classes.
- **Corestriction.** Fix an open subgroup `U ≤ G` (of finite index automatically when `G` is
  compact; include `[U.FiniteIndex]` otherwise). A **transversal** is a map `t : G ⧸ U → G` with
  `(t u : G ⧸ U) = u` for every `u`, and its **transversal word** is
  ```
  ℓᵗ_u(γ) = (t u)⁻¹ * γ * t (γ⁻¹ • u) ∈ U.
  ```
  Corestriction is defined for a variable transversal first:
  - degree 0: `cor⁰_t m = ∑ u : G ⧸ U, t u • m`, the norm;
  - degree 1: `(cor¹_t f) γ = ∑ u : G ⧸ U, t u • f (ℓᵗ_u γ)`;
  - degree 2: `(cor²_t f) (γ, η) = ∑ u : G ⧸ U, t u • f (ℓᵗ_u γ, ℓᵗ_{γ⁻¹ • u} η)`.

  The factor `t u •` is forced, not decoration. The identity `t u * ℓᵗ_u(γ) = γ * t (γ⁻¹ • u)` is
  what turns the `U`-cocycle law for `f` into the `G`-cocycle law for `cor f`, and without the
  action factor the sums are not cocycles. The factor is invisible only when `G` acts trivially on
  the coefficients. A trivial-action formula that omits it is correct for trivial coefficients
  and wrong in general, so Layer 6 proves the general statement rather than transcribing one.

  The public `cor` is the specialization `t = Quotient.out`. Independence of the transversal is a
  **theorem**, proved by exhibiting the difference of the two cochains as a coboundary, and it can
  only be stated once `t` is a variable, which is why the variable-transversal definitions come
  first.
- **The corestriction normalization.** `cor ∘ res = (G : U) • id` **on cohomology** in degrees
  `0, 1, 2`. In degree `0` the identity already holds on invariants. In degree `1` it does not
  hold on cochains: for a continuous 1-cocycle `f` on `G`,
  ```
  cor¹_t (res f) = (G : U) • f + d⁰ c,     where   c = ∑_{u : G ⧸ U} f (t u) ∈ M,
  ```
  and the analogous degree-2 statement holds with an explicit continuous 1-cochain in place of the
  element `c`. Both correction terms are named lemmas of Layer 6. Never state
  `cor ∘ res = index` as a cochain identity.
- **The finite-quotient system.** Mathlib's `OpenNormalSubgroup G` is ordered by inclusion, and
  `ProfiniteGrp.toFiniteQuotientFunctor` sends `V ≤ U` to the quotient map `G ⧸ V → G ⧸ U`. The
  cohomological system goes the other way: for `V ≤ U` the transition map is
  ```
  Hⁱ(G ⧸ U, M^U) ⟶ Hⁱ(G ⧸ V, M^V).
  ```
  So the index category is `(OpenNormalSubgroup G)ᵒᵖ`, and the transition map is the compatible
  pair consisting of the quotient homomorphism `G ⧸ V → G ⧸ U` and the coefficient inclusion
  `M^U ↪ M^V`, which is equivariant after restriction along that quotient homomorphism. Both
  halves are named separately, in `Suggested.lean` as `finiteQuotientMap` and
  `invariantsInclusion` with its equivariance lemma; the pair they assemble to and the map it
  induces on cohomology are `transitionPair` and `finiteLevelTransition`. The comparison map to
  `Hⁱ(G, M)` is inflation along `G → G ⧸ U` followed by the coefficient inclusion `M^U ↪ M`. The
  colimit is taken in `AddCommGrpCat` for the explicit low-degree statement and in `TopModuleCat ℤ`
  for the canonical all-degree statement of Layer 10.
- **Shapiro's direction.** Coinduction is the right adjoint, and Shapiro's lemma reads
  `Hⁿ(G, Coind_H^G A) ≅ Hⁿ(H, A)`, the direction of the pin's discrete `groupCohomology.coindIso`.
  For profinite `G` and closed `H ≤ G`, `Coind_H^G A` is the discrete module of continuous
  (equivalently locally constant) `H`-equivariant maps `G → A`. For **open** `H` the natural map
  `Ind_H^G A → Coind_H^G A` is an isomorphism, with the pin's discrete `Rep.indCoindIso` as the
  model, and both transports are stated.
- **Transversals and sections are different objects.** An **open subgroup of a compact group** has
  finite index. Outside the compact case, openness and finite index are independent, so every
  finite-sum declaration also carries `[Fintype (G ⧸ U)]` (equivalently a finite-index witness).
  When that witness is present, `Quotient.out` is an adequate set-theoretic transversal and the
  quotient is discrete, so each of its coordinate maps is continuous. A **closed** subgroup of
  infinite index has no finite transversal, and every
  construction that lifts through `G → G ⧸ H` for closed `H` uses a genuine continuous section,
  supplied by Layer 0 and cited by name. Do not use `Quotient.out` in the closed-subgroup
  statements.
- **Multiplicative coefficients** (units of a field, roots of unity) enter through `Additive`, by
  the pin's own idiom (`groupCohomology.IsMulCocycle₁`, `Rep.ofMulDistribMulAction`). No parallel
  multiplicative cohomology is developed.
- **The Galois coefficient model.** `Kˢ = SeparableClosure K` is the coefficient field of the
  Galois layer, not the algebraic closure. Mathlib defines `Field.absoluteGaloisGroup K` as
  `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`; for an imperfect `K` the fixed field of that
  group is the purely inseparable closure of `K`, not `K`, so the invariants of
  `(AlgebraicClosure K)ˣ` are not `Kˣ` and the Kummer sequence has the wrong left-hand term. An
  algebraic closure is **not** a separable closure in general. Layer 9 either takes
  `G_K = Kˢ ≃ₐ[K] Kˢ` outright or keeps `Field.absoluteGaloisGroup K` and proves it is
  topologically isomorphic to `Kˢ ≃ₐ[K] Kˢ`, compatibly with the action on `Kˢ`; either way every
  coefficient module is a `G_K`-submodule of `(Kˢ)ˣ`.
- **The Evens norm** is developed for `𝔽₂ = ZMod 2` coefficients with trivial action, the
  generality Evens' multiplicative transfer admits with no parity constraint and the one the
  Evens-Kahn formula consumes, for an open subgroup of arbitrary finite index in the general
  construction, with the index-2 degree-`1 → 2` case additionally given by the explicit two-point
  graph cocycle. Layer 13 fixes both and identifies them.

---

## 4. What Mathlib already has (consume)

All paths at the Mathlib the repository currently builds.

- **Discrete group cohomology, the model API:**
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` (`groupCohomology`,
  `inhomogeneousCochains`); `LowDegree.lean` (`d₀₁`, `d₁₂`, `d₂₃`, `cocycles₁/₂`,
  `mem_cocycles₁_iff`, `mem_cocycles₂_iff`, `IsCocycle₁/₂`, `IsCoboundary₁/₂`, the
  `DistribMulAction` and multiplicative translations `cocyclesOfIsCocycle₁`,
  `isMulCocycle₁_of_mem…`, `H0Iso`, `H1π`, `H2π`, `H1IsoOfIsTrivial`); `Functoriality.lean`
  (`cochainsMap` for a pair `(f : G →* H, φ : res f A ⟶ B)`, `map`, `mapCocycles₁/₂`, `H1InfRes`
  with `H1InfRes_exact`, `resNatTrans`, `infNatTrans`, `functor`); `LongExactSequence.lean`
  (`groupCohomology.δ`, `mapShortComplex₁/₂/₃_exact`, `δ₀_apply`, `δ₁_apply`); `Shapiro.lean`
  (`coindIso : Hⁿ(G, Coind_S^G A) ≅ Hⁿ(S, A)`); `Hilbert90.lean` (`H1ofAutOnUnitsUnique`,
  `hilbert90`); `FiniteCyclic.lean` (`groupCohomologyIsoEven/Odd`); `Resolution.lean` (the bar
  resolution).
- **Coinduction and finite index, discrete:** `Mathlib/RepresentationTheory/Coinduced.lean`
  (`Representation.coind` along any `φ`), `Induced.lean`, `FiniteIndex.lean`
  (`Rep.indCoindIso : Ind_S^G A ≅ Coind_S^G A` for `[S.FiniteIndex]`).
- **Continuous representations:** `Mathlib/RepresentationTheory/Continuous/Basic.lean`
  (`ContRepresentation R G V = G →* V →L[R] V`, `ContIntertwiningMap`,
  `ContRepresentation.coind₁`), the unbundled counterpart of the `TopRep` carrier fixed in §1;
  `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` (`TopRep.resolutionX`,
  the coinduced resolution `X, C(G, X), C(G, C(G, X)), …` whose `G`-invariants, shifted by one,
  are `TopRep.homogeneousCochains`), and `Functoriality.lean` beside it
  (`ContinuousCohomology.cochainsMap`, the cochain map of a compatible pair, and
  `ContinuousCohomology.map`, the map it induces on homology).
- **Homological algebra:** `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`
  (`HomologicalComplex.homologyMap`) and `Mathlib/Algebra/Homology/QuasiIso.lean` (`QuasiIso`,
  `quasiIsoAt_iff_isIso_homologyMap`).
- **Profinite groups:** `Mathlib/Topology/Algebra/OpenSubgroup.lean` (`OpenSubgroup`,
  `OpenNormalSubgroup`, their lattice structure); `Mathlib/Topology/Algebra/ClopenNhdofOne.lean`
  (`exist_openNormalSubgroup_sub_open_nhds_of_one` under
  `[CompactSpace G] [TotallyDisconnectedSpace G]`, and
  `ProfiniteGrp.closedSubgroup_eq_sInf_open`);
  `Mathlib/Topology/Algebra/Category/ProfiniteGrp/{Basic,Limits,Completion}.lean` (`ProfiniteGrp`,
  `toFiniteQuotientFunctor : OpenNormalSubgroup P ⥤ FiniteGrp`,
  `continuousMulEquivLimittoFiniteQuotientFunctor`);
  `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` (`ContinuousMonoidHom`,
  `ContinuousAddMonoidHom`).
- **Compact-open function spaces:** `Mathlib/Topology/CompactOpen.lean`
  (`ContinuousMap.curry : C(X × Y, Z) → C(X, C(Y, Z))`, which needs no hypothesis;
  `ContinuousMap.uncurry`, which needs `[LocallyCompactSpace Y]`; and `Homeomorph.curry`, the
  equivalence, which needs local compactness of both factors). Layer 3 rests on exactly these.
- **Discrete actions:** `Mathlib/Topology/Algebra/MulAction.lean` (`stabilizer_isOpen`,
  `continuousSMul_iff_stabilizer_isOpen`).
- **Galois theory:** `Mathlib/FieldTheory/KrullTopology.lean` (the Krull topology,
  `krullTopology_t2`, total separatedness); `Mathlib/FieldTheory/Galois/Profinite.lean`
  (`CompactSpace Gal(K/k)` for `[IsGalois k K]`, `InfiniteGalois.profiniteGalGrp`, the limit
  presentation over `FiniteGaloisIntermediateField`); `Mathlib/FieldTheory/Galois/Infinite.lean`
  (the fundamental theorem of infinite Galois theory:
  `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`,
  `InfiniteGalois.normalAutEquivQuotient : Gal(K/k) ⧸ H ≃* Gal(fixedField H / k)`,
  `InfiniteGalois.isOpen_iff_finite`, `InfiniteGalois.normal_iff_isGalois`,
  `InfiniteGalois.isOpen_and_normal_iff_finite_and_isGalois`);
  `Mathlib/FieldTheory/SeparableClosure.lean` (`separableClosure`, `SeparableClosure F`,
  `separableClosure.isGalois`, `SeparableClosure.isSepClosed`);
  `Mathlib/FieldTheory/PurelyInseparable/Basic.lean`
  (`separableClosure.isPurelyInseparable : IsPurelyInseparable (separableClosure F E) E` for
  algebraic `E/F`, and `instSubsingletonAlgHomOfIsPurelyInseparable`, which together make
  restriction from the algebraic closure to the separable closure injective);
  `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` (`Field.absoluteGaloisGroup` and its topological
  abelianization); `Mathlib/FieldTheory/KummerExtension.lean` (the polynomial and extension-level
  Kummer theory: `autEquivRootsOfUnity`, `autEquivZmod`).
- **Order and torsion vocabulary for Layer 11:** `ℕ∞` (`ENat`, which is `WithTop ℕ`) as a
  `CompleteLinearOrder`;
  `CommGroup.primaryComponent` and `AddCommGroup.primaryComponent`, with the submonoid forms
  `CommMonoid.primaryComponent` and `AddCommMonoid.primaryComponent` they extend
  (`Mathlib/GroupTheory/Torsion.lean`); `AddMonoid.IsTorsion`; `IsSimpleModule`;
  `CategoryTheory.Simple`.
- **Group theory for Layers 11 and 13:**
  `Mathlib/Topology/Algebra/Group/TopologicalAbelianization.lean` (`TopologicalAbelianization`, the
  quotient by the closure of the commutator subgroup);
  `Mathlib/GroupTheory/Transfer.lean` (`MonoidHom.transfer`, the transfer to a subgroup of finite
  index); `Mathlib/GroupTheory/Index.lean` (`Subgroup.mul_mem_iff_of_index_two`);
  `Mathlib/GroupTheory/RegularWreathProduct.lean` (`RegularWreathProduct`, notation `D ≀ᵣ Q`, and
  `RegularWreathProduct.rightHom`); `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`
  (`DihedralGroup`, with `DihedralGroup 8` the dihedral group of order 16).
- **Finite group theory for Layer 11's class module:** `Mathlib/GroupTheory/Transfer.lean`
  (`MonoidHom.transfer_def`); `Mathlib/GroupTheory/Sylow.lean` (`Sylow`, `Sylow.nonempty`,
  `Sylow.not_dvd_index`, `Sylow.card_eq_multiplicity`); `Mathlib/GroupTheory/PGroup.lean`
  (`IsPGroup`, `IsPGroup.center_nontrivial`); `Mathlib/GroupTheory/Perm/Cycle/Type.lean`
  (`exists_prime_orderOf_dvd_card'`); `Mathlib/GroupTheory/Subgroup/Center.lean`
  (`Subgroup.normal_of_le_center`); `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`
  (`AddCommGroup.equiv_directSum_zmod_of_finite`); `Mathlib/GroupTheory/QuotientGroup/Basic.lean`
  (`QuotientGroup.quotientKerEquivRange`, `QuotientGroup.quotientQuotientEquivQuotient`);
  `Mathlib/Algebra/Group/Subgroup/Map.lean` (`Subgroup.subgroupOfEquivOfLe`);
  `Mathlib/GroupTheory/Index.lean` (`Subgroup.finiteIndex_of_finite_quotient`);
  `Mathlib/Topology/Algebra/OpenSubgroup.lean` (`Subgroup.quotient_finite_of_isOpen`,
  `Subgroup.isOpen_mono`); `Mathlib/Data/Nat/Factorization/Defs.lean` (`Nat.factorization_def`).

---

## 5. The build, in layers

The numbering is the dependency order. As each layer makes the next layer's types expressible,
record its milestones in `Suggested.lean` with `sorry`.

Each layer opens with a **Prerequisites** line. Every entry on it is one of exactly four kinds: a
Mathlib declaration, named in §4; a declaration in the Tau Ceti code repository; an earlier layer
of this roadmap; or a named layer of another merged roadmap. Nothing else may appear there. In
particular a branch, an open pull request, a future toolchain pin, an outside repository and an
unmerged roadmap are all excluded, and no milestone below depends on one.

Two further conventions apply throughout, and a milestone that does not meet them is not finished.

**Every new object carries its basic API.** Introducing an object is not a contribution until it
is usable, so each one is accompanied by: its constructors; at least one worked example computed
by hand; its morphisms, with whatever algebraic structure they carry; its functoriality in every
argument; the lemmas comparing it with the neighboring description of the same thing; the
naturality squares of every map into and out of it; the degenerate cases, computed rather than
excluded; and the interfaces its consumers name. Layers below record this as an **API** line,
which lists what those eight headings mean for that particular object; the headings themselves are
not repeated.

**Every hard theorem carries its source and its hypotheses.** For each theorem that is not
routine, record the exact citation (author, work, numbered item), the hypotheses actually needed
rather than the hypotheses convenient to carry, and, where one exists, a nearby statement that is
false, with the counterexample that kills it. The false neighbor is the part that saves time: it
is what stops a contributor from proving a more general statement that is not true. Layers below
record this as a **Source** line.

### Layer 0: discrete modules and continuous sections

**Prerequisites.** Mathlib: `continuousSMul_iff_stabilizer_isOpen`, `stabilizer_isOpen`,
`exist_openNormalSubgroup_sub_open_nhds_of_one`, `OpenSubgroup`, `OpenNormalSubgroup`,
`ProfiniteGrp.closedSubgroup_eq_sInf_open`, `FixedPoints.addSubgroup`. Tau Ceti:
`TauCeti.exists_openNormalSubgroup_smul_eq_self`
(`TauCeti/Topology/Algebra/GroupAction/Discrete.lean`), the actions on `FixedPoints.addSubgroup` in
`TauCeti/GroupTheory/GroupAction/FixedPoints.lean` and their continuity
`TauCeti.continuousSMulQuotientFixedPoints`, `TauCeti.exists_continuous_section` and
`TauCeti.exists_continuous_section_of_le` (`TauCeti/Topology/Algebra/Group/Profinite/Section.lean`).
Nothing else: this layer opens the roadmap.

The coefficient theory and the two topological inputs the later layers lift through, stated in the
unbundled classes of §3.

- **Openness.** Point stabilizers of a discrete module are open; for finite `M` the kernel of the
  action is open; over a profinite `G`, a finite discrete module has an open **normal** subgroup
  acting trivially, so its action factors through a finite quotient. (Consume
  `continuousSMul_iff_stabilizer_isOpen` and `exist_openNormalSubgroup_sub_open_nhds_of_one`.) For
  an arbitrary discrete `M` over a profinite `G`, every element is fixed by an open normal
  subgroup, so `M = ⋃_U M^U`: Tau Ceti's `TauCeti.exists_openNormalSubgroup_smul_eq_self`, which
  `Suggested.lean` applies. Layer 4 uses that union.
- **Constructions.** Invariants `M^U` as a `G ⧸ U`-module for normal `U`, with the induced discrete
  action: this is the coefficient system of the finite-level tower. It is `Invariants U M`, which is
  Mathlib's `FixedPoints.addSubgroup U M` with Tau Ceti's `G`- and `G ⧸ U`-actions
  (`TauCeti.distribMulActionFixedPointsAddSubgroup`,
  `TauCeti.distribMulActionQuotientFixedPointsAddSubgroup`) and, for open normal `U`, the
  continuity of the latter (`TauCeti.continuousSMulQuotientFixedPoints`). **Finite** products of
  discrete modules, and subgroups and quotients with their induced and quotient topologies, are
  again discrete `G`-modules. An infinite product of discrete spaces carries the product topology
  and is **not** discrete, so it is absent from that list, and so is the infinite direct sum, whose
  topology and continuity of action would have to be supplied and proved separately. Nothing in
  Layers 2 to 13 needs either. For **finite** `M` and discrete `N`, the internal hom `M →+ N` with
  the conjugation action `(g • φ) m = g • φ (g⁻¹ • m)` is again a discrete `G`-module, and
  evaluation `(M →+ N) →+ M →+ N` is a `G`-equivariant pairing. Layer 8's duality pairings
  consume that pairing, and only finite products of it; this roadmap states no duality theorem.
- **Continuous sections of profinite quotients.** For a profinite `G` and closed subgroups
  `K ≤ H ≤ G`, the projection `G ⧸ K → G ⧸ H` admits a continuous section, with the normalized
  specialization: `G ⧸ H → G` continuous with `s 1 = 1` (Ribes-Zalesskii Prop. 2.2.2). Prove the
  companion extension lemma in the form the proofs use: a continuous map from a closed subspace of
  a profinite space to a finite discrete target extends continuously. This is stated once and
  consumed in exactly three places: Layer 5's transgression, Layer 7's exactness of coinduction,
  and Layer 7's explicit inverse in Shapiro's lemma. It is not needed anywhere an **open**
  subgroup is in play, where `Quotient.out` already suffices. Tau Ceti proves both forms,
  `TauCeti.exists_continuous_section` and `TauCeti.exists_continuous_section_of_le`, and its
  transgression is built on the first.

### Layer 1: the canonical carrier and its functoriality

**Prerequisites.** Mathlib: `continuousCohomology`, `ContinuousCohomology.homogeneousCochains`,
`ContinuousCohomology.invariants`, `continuousCohomologyZeroIso`, and, at the repository pin,
`ContinuousCohomology.{resolutionMap,cochainsMap,cocyclesMap,map,map_id,map_comp}` from
`ContCohomology/Functoriality.lean`; also `Action`, `Action.res`,
`TopModuleCat`, `ContinuousMonoidHom`. This roadmap: Layer 0.

The pin supplies the carrier and compatible-pair functoriality. This layer consumes those maps and
supplies only the named restriction, inflation, coefficient, and coefficient-dictionary interface
that every canonical-facing statement below uses.

- **The carrier, named once.** `TopRep R G` as an abbreviation for `Action (TopModuleCat R) G`,
  and `Hⁿ_cont(G, X) = (continuousCohomology R G n).obj X` as the canonical object of every
  all-degree statement below. Record `homogeneousCochains` as the complex it is the homology of,
  and `continuousCohomologyZeroIso : continuousCohomology R G 0 ≅ invariants R G` as the one
  degree Mathlib computes. `Suggested.lean` uses Mathlib's `resolutionMap`, `cochainsMap`,
  `cocyclesMap`, `map`, `map_id`, and `map_comp` directly, then adds `res`,
  `quotientToInvariants`, `infl`, and `coeffMap`.
- **Smooth discrete objects.** `TopRep R G` is wider than the discrete `G`-modules of §3, and
  deliberately so: an object carries one continuous operator per group element, and nothing there
  forces the action to be continuous in the group variable. An object of `TopRep ℤ G` whose module
  happens to be discrete can therefore have non-open point stabilizers, so there is no dictionary
  between all of `TopRep ℤ G` and the discrete `G`-modules. Define
  ```
  IsSmoothDiscrete X  ⟺  X.V is discrete and every {g | X.ρ g x = x} is open,
  ```
  which for a discrete module is exactly continuity of the action, and prove the closure
  properties this roadmap uses: smooth discrete objects are closed under finite products, under
  subobjects and quotients, and under restriction along a continuous homomorphism.
- **The categorical dictionary, on that subcategory.** In the style of the discrete
  `Rep.ofDistribMulAction`: `ofDiscreteModule` sends a discrete `G`-module in the unbundled
  classes of §3 to an object of `TopRep ℤ G`, and that object is smooth discrete; a
  `G`-equivariant continuous homomorphism becomes a morphism, and every morphism between objects
  in the image arises that way; and the two translations are mutually inverse **on the smooth
  discrete subcategory**, which they exhibit as equivalent to the discrete `G`-modules. Nothing is
  claimed outside that subcategory. This is where the statements of Layers 2 to 9 meet the
  canonical API.
  ⚠ Keep every *theorem* of Layers 2 to 9 stated against the unbundled classes wherever possible.
  The bundled forms are interfaces, and mismatches between instances and structures here are the
  main source of unusable statements.
  ⚠ Every canonical-facing comparison below quantifies over the image of `ofDiscreteModule`, never
  over an arbitrary `TopRep` object. A statement that forgets this is false, not merely
  unprovable.
- **Functoriality in compatible pairs (consume current Mathlib).** For a continuous homomorphism `φ : H →ₜ* G` and a
  morphism `f : Action.res _ φ X ⟶ Y` in `TopRep R H`: the cochain map `cochainsMap φ f`, then
  `cocyclesMap φ f n`, then `map φ f n : Hⁿ_cont(G, X) ⟶ Hⁿ_cont(H, Y)`, with `map_id` and
  `map_comp`. These are the declarations now provided by
  `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`. The compatibility
  prototypes at the older repository pin must be deleted when the pin is updated; downstream code
  uses Mathlib's names and types rather than a parallel implementation.
- **The three named instances.** Restriction along the inclusion of a subgroup, inflation along a
  quotient map with invariant coefficients, and coefficient maps at `φ = id`, each as a natural
  transformation of functors on `TopRep R G`, and each with its composition law. Name the first
  two `resNatTrans` and `inflNatTrans`, again matching Mathlib.
- **Degree 0.** `map φ f 0` commutes with `continuousCohomologyZeroIso` and the induced map on
  invariants, which is what makes the low-degree comparisons of Layer 3 checkable at `n = 0`
  before any of the harder degrees exist.
- **Additivity and linearity.** `continuousCohomology R G n` is additive and `R`-linear, and
  `map` is additive in `f`. The pin proves the corresponding facts for `invariants` and for the
  cochain functors; these are the same statements one level up.

**API** for the carrier. Constructors: `TopRep.of` from an unbundled continuous representation,
and `ofDiscreteModule` for the discrete case. Worked example: the trivial representation, `ℤ` and
`ZMod n` with trivial action, `(Kˢ)ˣ` for Layer 9; each checked to be smooth discrete. Morphisms:
the intertwining maps, with their additive and `R`-linear structure. Functoriality: `map` above,
in both arguments. Comparison lemmas: Layer 3, quantified over the image of `ofDiscreteModule`.
Naturality: of `map` in `X` and in `Y`, and of the three named instances. Edge cases: `n = 0`, the
trivial group, the trivial subgroup, and an object that is discrete but **not** smooth, which
exists and is the reason the subcategory is named. Downstream interfaces: Layers 3, 4, 7, 8, 10
and 12 all state their canonical halves against this layer and against nothing else.

⚠ Do not restate the carrier or compatible-pair functoriality. If a milestone below needs a
property Mathlib already proves, cite it; this layer adds only the named restriction/inflation
interfaces, the discrete-module dictionary, and compatibility results not supplied upstream.

**API** for `M^U`. Constructors: `Invariants U M` as an additive subgroup of `M`, its `G`-action
for normal `U`, and the descent of that action to `G ⧸ U`; all three are Mathlib's and Tau Ceti's,
with membership `FixedPoints.mem_addSubgroup`. Worked example: for `M = ZMod n` with
the trivial action every `M^U` is `M`, and `((Kˢ)ˣ)^{G_K} = Kˣ` in Layer 9. Morphisms: the
inclusions `M^U ↪ M^V` for `V ≤ U` and `M^U ↪ M`, both additive and both equivariant in the sense
Layer 4 needs. Functoriality: in `M` along equivariant continuous maps, and in `U` along
inclusions. Comparison: with Mathlib's `Rep.quotientToInvariants` under Layer 1's dictionary, which
on the canonical side is Tau Ceti's `TauCeti.ofDiscreteModuleQuotient`.
Naturality: of both inclusions in `M`. Edge cases: `U = ⊥` gives `M`, `U = G` gives `M^G`, and
`M = 0` gives `0`. Consumers: Layer 4's finite-quotient system, Layer 5's inflation, Layer 11's
dévissage.

**Source** for the continuous section. Ribes-Zalesskii, *Profinite Groups*, Prop. 2.2.2. The
hypotheses are that `G` is profinite and `H` is closed, and neither is decoration: the projection
`ℝ → ℝ ⧸ ℤ` onto the circle has no continuous section at all, so the theorem is about profinite
groups and not about topological groups. The false neighbor to avoid is the same statement with a
*homomorphic* section, which already fails for `ℤ_p → ℤ ⧸ p`, since a homomorphism from a finite
group to a torsion-free group is trivial.

### Layer 2: the explicit low-degree complex and its functoriality

**Prerequisites.** Mathlib: `groupCohomology.d₀₁`, `d₁₂`, `d₂₃`, `cocycles₁`, `cocycles₂`,
`IsCocycle₁`, `IsCocycle₂`, `groupCohomology.cochainsMap`, `ContinuousMap`,
`ContinuousMonoidHom`. This roadmap: Layer 0.

- **The complex.** `C1`, `C2`, `Z1`, `Z2`, `B1`, `B2`, `H0`, `H1`, `H2` as fixed in §3, with
  `d ∘ d = 0` (`B1_le_Z1`, `B2_le_Z2`), the class maps `H1pi` and `H2pi`, the
  membership lemmas in the exact `IsCocycle₁/₂` shapes, the evaluation lemmas (`Z¹` vanishes at
  `1`, the inverse formula, the degree-2 normalizations), and the trivial-action
  characterizations: `B¹ = ⊥`, `H¹` additively isomorphic to the continuous homomorphisms
  `G →ₜ* M`, and `H⁰ = M`. Degree 0 is `H0 G M = M^G`, an additive subgroup and not a quotient.
- **Compatible-pair functoriality.** The pullback `Hⁱ(G, M) → Hⁱ(H, N)` of §3, on cochains,
  cocycles and cohomology, with the identity and composition laws, as `explicitMap1` in degree 1
  and its degree-0 and degree-2 counterparts. This is the continuous twin of
  Mathlib's `groupCohomology.cochainsMap` package, named to align with Layer 1's
  `ContinuousCohomology.cochainsMap`.
- **The three instances, in all three degrees.** Restriction `explicitRes0`, `explicitRes1`,
  `explicitRes2` for any subgroup with the subspace topology; inflation `explicitInfl1` and
  `explicitInfl2` for closed normal `N`, with the invariants as coefficients (Tau Ceti's, in
  `ContCohomology/Inflation/Basic.lean`); and coefficient maps
  `explicitCoeff0`, `explicitCoeff1`, `explicitCoeff2` along `G`-equivariant continuous
  homomorphisms. Composition laws mixing the three: `res ∘ inf`, and coefficient naturality of
  both. Degree 2 of inflation is not a variant of degree 1: it is the last map of Layer 5's
  five-term sequence, and degree 0 and degree 2 of the coefficient maps are three of the eight
  nodes of Layer 5's long exact sequence.
- **Conjugation.** The compatible pair (conjugation by `g`, action of `g`) induces an action of
  `G` on `Hⁱ(N, M)` for closed normal `N`, which is `explicitConj1` in degree 1, and **inner
  automorphisms act trivially on `Hⁱ(G, M)`** (`explicitConj1_eq_id_of_mem`),
  by an explicit chain homotopy in degrees `≤ 2`. Both are Tau Ceti's, in
  `ContCohomology/Conjugation.lean`. Without it the `G ⧸ N`-action on `Hⁱ(N, M)` is
  not well defined, and Layer 5's five-term sequence needs that action.
  ⚠ The degree-2 homotopy has many terms and is easy to get wrong. Write it once for the
  compatible-pair form and derive the degree-1 case, rather than proving the two separately.

**API** for the explicit complex. Constructors: `C¹`, `C²` as subgroups of the function spaces,
`Z¹`, `Z²` as their intersections with the kernels, `B¹`, `B²` as the images of the differentials,
and `H⁰`, `H¹`, `H²` as fixed in §3. Worked examples: `H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ` and `H¹(ℤ_p, ℤ) = 0`,
both in `Suggested.lean`, and both true only because of continuity. Morphisms: the compatible-pair
pullback, with its additive structure. Functoriality: in the group and in the coefficients
separately, with the composition laws, and the three named instances. Comparison: Layer 3.
Naturality: of `d⁰`, `d¹`, `d²` and of the quotient maps `Z¹ ↠ H¹`, `Z² ↠ H²`, in compatible
pairs. Edge cases: the trivial group, where `H⁰ = M` and `H¹ = H² = 0`; the trivial action, where
`B¹ = ⊥` and `H¹` is the continuous homomorphisms; and `M = 0`. Consumers: every later layer
except 1.

**Source** for the triviality of inner automorphisms. Milne, *Arithmetic Duality Theorems*,
Prop. 0.15. The hypothesis is that the automorphism is inner in `G` itself; the false neighbor is
that an automorphism of `G` acting trivially on `Hⁱ` must be inner, which is not so, and the
statement one actually wants downstream is the induced `G ⧸ N`-action on `Hⁱ(N, M)`, which needs
nothing beyond the inner case.

### Layer 3: the comparison isomorphisms

**Prerequisites.** Mathlib: `groupCohomology`, `mem_cocycles₁_iff`, `mem_cocycles₂_iff`,
`Rep.ofDistribMulAction`, `ContinuousMap.curry`, `ContinuousMap.uncurry`, `Homeomorph.curry`.
This roadmap: Layers 1 and 2.

Without this layer the explicit complex would be a second theory rather than a second description
of the canonical one, so it is what keeps the roadmap from forking the canonical API. The
condition it has to meet is that the comparison map to the inhomogeneous complex is a
quasi-isomorphism in the discrete case.

- **Continuous against discrete.** For `G` with the discrete topology (finite `G` being the case
  Layer 4 uses) and any discrete `G`-module `M`: `Hⁱ_explicit(G, M) ≅ groupCohomology` in degrees
  `0, 1, 2`, through the pin's `cocycles₁/₂` and `IsCocycle₁/₂`, as
  `explicitH0IsoGroupCohomology`, `explicitH1IsoGroupCohomology` and
  `explicitH2IsoGroupCohomology`. Every continuity condition is
  vacuous, so this identifies subquotients of the same function spaces. Layer 4 uses it at every
  finite level.
  ⚠ Mathlib's `groupCohomology` is `k`-linear over `Rep k G` while the explicit theory is
  `ℤ`-linear. Compare against `Rep ℤ G` through `Rep.ofDistribMulAction`, and state the `k`-linear
  refinement only where a `k`-action genuinely exists.
- **Inhomogeneous against canonical, for profinite `G`, degrees `0, 1, 2`.** The canonical model
  uses invariant elements of iterated compact-open function spaces `C(G, C(G, …, M))`, not
  functions on `Gⁿ`. Mathlib's `ContinuousMap.curry : C(G × G, M) → C(G, C(G, M))` is defined with
  no hypothesis, but its inverse `ContinuousMap.uncurry` needs `[LocallyCompactSpace G]`, and the
  equivalence `Homeomorph.curry` needs local compactness of both factors. So the passage from the
  canonical description back to functions on `G × G` is exactly a local-compactness statement,
  and avoiding that hypothesis is why the canonical model is homogeneous rather than `n`-ary.

  Accordingly this milestone is stated for **profinite `G`**, which is compact Hausdorff and hence
  locally compact, with discrete coefficients. State the compact-open equivalence as an explicit
  prerequisite of the degree-2 comparison. A locally compact Hausdorff generalization may be added
  only when the exact Mathlib theorem and all its hypotheses are named in the statement.

  The chain-level correspondence is the classical one: in degree 1,
  `f (g₀, g₁) = g₀ • c (g₀⁻¹ * g₁)` with inverse `c g = f (1, g)`; in degree 2,
  `f (g₀, g₁, g₂) = g₀ • c (g₀⁻¹ * g₁, g₁⁻¹ * g₂)`. Prove it is a chain map in both directions and
  conclude
  ```
  Hⁱ_explicit(G, M) ≅ continuousCohomology i (ofDiscreteModule M)   for i ≤ 2,
  ```
  naturally in compatible pairs. The canonical side is the image of `M` under Layer 1's
  dictionary, **not** an arbitrary object of `TopRep`: a general `TopRep` object need not be
  smooth, and the explicit complex is not a description of its cohomology. A quotient
  presentation of the canonical side, `ker d` modulo `im d` in `TopModuleCat R`, is part of this
  milestone.
- **The category of the comparison.** For compact `G` and discrete `M`, prove that `C(G, M)` is
  discrete in the compact-open topology, hence that every term of the homogeneous cochain complex
  and every subquotient of it is discrete. With that in hand, state the comparison as an
  isomorphism in `TopModuleCat ℤ` between discrete objects, rather than as an additive isomorphism
  after forgetting the topology. Whichever of the two a given statement makes, it must say which:
  an `explicit ≅ continuousCohomology` with the category left unsaid is not a usable statement.
  ⚠ The explicit side has to be **given** the discrete topology, not left with the one it
  inherits. `H¹` and `H²` are quotients of subgroups of `G → M` and `G × G → M`, which carry the
  pointwise topology, and that quotient topology is not discrete for an infinite profinite `G`:
  with trivial `𝔽₂` coefficients on a product of infinitely many copies of `C₂`, no finite set of
  evaluations isolates the zero character. Reusing it would make the categorical statement false
  while leaving the underlying additive statement true, which is the trap. `Suggested.lean`
  carries the discrete objects as `DiscreteH1` and `DiscreteH2`, with additive equivalences back
  to the quotients so that computations on representatives stay available.
- **Transport.** Under these isomorphisms: compatible pairs to Layer 1's `map`
  (`explicitIso_map`), restriction to restriction (`explicitIso_res`), inflation to inflation read
  through the coefficient map of `ofDiscreteModuleQuotient` (`explicitIso_infl`), and coefficient
  maps to `coeffMap` (`explicitIso_coeffMap`). All four are Tau Ceti's, in
  `ContCohomology/CohomologyComparison.lean` and `ContCohomology/Inflation/Comparison.lean`. One
  transport lemma per operation, each an equation between two named maps, carrying the same
  profiniteness hypotheses as the comparison itself. Only the operations that exist by this layer
  are transported here; the connecting maps are transported in Layer 5 against Layer 10's `delta`,
  corestriction in Layer 10, the Kummer class in Layer 9 and the cups in Layer 12, each
  in the layer where both sides are first available. The table in §2 lists all of them, and every
  entry on it is a milestone.

**Source** for the inhomogeneous-against-canonical comparison. The chain-level correspondence is
classical and is displayed above; what has to be watched is the hypothesis. `ContinuousMap.curry`
needs nothing, `ContinuousMap.uncurry` needs `[LocallyCompactSpace Y]`, and `Homeomorph.curry`
needs local compactness of both factors, so the comparison is stated for profinite `G`, which is
compact Hausdorff. The false neighbor is the compact-open exponential law itself,
`C(G × G, M) ≃ C(G, C(G, M))` for an arbitrary topological group: currying is continuous with no
hypothesis and the inverse is not, which is exactly why Mathlib carries the local-compactness
hypothesis on `uncurry` and on `Homeomorph.curry`. What this does **not** establish is that the
induced map on cohomology fails to be an isomorphism for a general
topological group; no statement here asserts that, and the comparison is claimed only where the
exponential law holds.

### Layer 4: the finite-quotient colimit description

**Prerequisites.** Mathlib: `OpenNormalSubgroup`, `ProfiniteGrp.toFiniteQuotientFunctor`,
`Rep.quotientToInvariants`, `groupCohomology.map`, `AddCommGrpCat`. Tau Ceti: the modules
`FiniteQuotient/Basic`, `FiniteQuotient/Explicit`, `FiniteQuotient/Colimit` and
`FiniteQuotient/DegreeTwoDescent` of `TauCeti/RepresentationTheory/Homological/ContCohomology/`,
which implement this layer apart from its coefficient colimits: the six milestones of the system as
`TauCeti.QuotientGroup.mapOfLE`, `TauCeti.invariantsInclusion`,
`TauCeti.invariantsInclusion_equivariant`, `TauCeti.transitionPair`,
`TauCeti.finiteLevelTransition`, `TauCeti.finiteLevelTransition_refl` and
`TauCeti.finiteLevelTransition_comp`; the explicit
systems, cocones and colimit theorems in degrees `0, 1, 2` under the names below; and the strict
descents `TauCeti.ContCohomology.descendZ1` and
`TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2`. `Suggested.lean` carries this
layer's names as aliases of those. This roadmap: Layers 2 and 3.

For profinite `G` and discrete `M`; the theorem most computations use (NSW (1.2.5),
Ribes-Zalesskii Cor. 6.5.6(a), Koch Thm. 3.16; Serre, *Local Fields* X §3 takes it as the
*definition*, so the three textbooks present the three descriptions Layers 2 to 4 relate).

- **The system.** The functor `U ↦ Hⁱ(G ⧸ U, M^U)` on `(OpenNormalSubgroup G)ᵒᵖ`, with the
  transition maps and comparison maps as fixed in §3. Six separate milestones, not one:
  1. the quotient homomorphism `G ⧸ V → G ⧸ U` for `V ≤ U`;
  2. the coefficient inclusion `M^U ↪ M^V`, on the `G ⧸ U`-module `M^U` supplied by Layer 0;
  3. its equivariance after restriction along the quotient homomorphism, without which the two
     are not a compatible pair;
  4. the induced transition map `Hⁱ(G ⧸ U, M^U) → Hⁱ(G ⧸ V, M^V)`;
  5. the identity law at `V = U`; and
  6. the composition law for `W ≤ V ≤ U`, identifying the `U`-to-`W` map with the composite
     through the `V`-level.

  The word "functor" in the first sentence means items 5 and 6, so state them as theorems rather
  than leaving them inside the phrase "transition maps". Also state functoriality of the whole
  system in `M`. The construction must typecheck against
  `ProfiniteGrp.toFiniteQuotientFunctor`, whose arrows go the other way, which is the reason for
  the opposite category.
- **The colimit theorem.** `Hⁱ(G, M) ≅ colim_U Hⁱ(G ⧸ U, M^U)` in `AddCommGrpCat`, for `i = 0, 1, 2`
  on the explicit model. It is stated as universality of the **named** comparison cocone rather
  than as a bare isomorphism, since a bare isomorphism does not say that the comparison maps are
  the ones that induce it. On the explicit side, the transition
  `explicitFiniteQuotientTransition1` is defined directly by `explicitMap1` from the quotient map
  and the inclusion `M^U ↪ M^V`; it is not the universe-restricted canonical
  `finiteLevelTransition`. Its identity and composition laws are
  `explicitFiniteQuotientTransition1_id` and `explicitFiniteQuotientTransition1_comp`, and
  `explicitFiniteQuotientSystem1_map` pins the functor's arrow to that map. This direct definition
  is universe-polymorphic and avoids transporting through the `Type 0` comparison with
  `groupCohomology`.

  All three degrees are named, not abbreviated as “the same shape”:
  `explicitFiniteQuotientSystem0/1/2`, `explicitFiniteQuotientSystem0/1/2_obj`,
  `explicitFiniteQuotientComparison0/1/2`, `explicitFiniteQuotientCocone0/1/2`, and
  `explicitFiniteQuotientColimit0/1/2`. Each system has a corresponding `_map` theorem fixing its
  arrows. The canonical `finiteLevelTransition` remains the comparison target, and Layer 3 proves
  that the explicit and canonical transitions agree wherever the small-universe comparison is
  available.
  Surjectivity is a strict statement: a continuous 1-cocycle is *itself*
  inflated from a finite level, with no coboundary subtracted, because its zero set is an open
  subgroup and any open normal subgroup inside it makes the cocycle both right-invariant and
  invariant-valued. In degree 2, uniform local constancy on the compact space `G × G` descends
  both variables at once, and an open normal subgroup fixing the finite image makes the values
  invariant, again strictly. A coboundary enters only in the injectivity half, where a
  finite-level class that becomes zero in `G` is already zero at some deeper finite level.
  ⚠ Degree 2 is where `CompactSpace` is genuinely used, not just total disconnectedness.
- **Coefficient colimits.** `Hⁱ(G, -)` commutes with filtered colimits of discrete modules for
  `i ≤ 2` on the explicit model: a continuous cochain into a filtered colimit takes its values in
  a single stage, by compactness again. With Layer 0: the cohomology of any discrete module is the
  filtered colimit
  over its finitely generated `ℤ[G ⧸ U]`-submodules.
- **First consequences.** `H⁰(G, M) = M^G`; for finite `M` the tower stabilizes levelwise
  (`M^U = M` for small `U`); and `Hⁱ(G, M)` for `i ≥ 1` is a colimit of cohomology of finite
  groups, which Layer 10's torsion corollary uses.
- **All degrees.** The same theorem against the canonical object, in every degree, is a Layer 10
  milestone and is stated there.

**API** for the finite-quotient system. Constructors: the six milestones above, together with the
colimit cocone. Worked example: `Hⁱ(Ẑ, -)` in §6, where the tower is the system over `nẐ` and the
colimit is visible. Morphisms: the transition maps, and the comparison maps to `Hⁱ(G, M)`.
Functoriality: the two laws above in `U`, and functoriality of the whole system in `M`.
Comparison: with `ProfiniteGrp.toFiniteQuotientFunctor`, whose arrows go the other way, and in all
degrees with Layer 10. Naturality: of the comparison map in `M` and in `U`. Edge cases: `U = G`,
where the system is `Hⁱ(1, M^G)`; finite `G`, where the system is eventually constant; and finite
`M`, where the tower stabilizes levelwise. Consumers: Layer 9's Hilbert 90, Layer 10's all-degree
colimit, Layer 11's dévissage, and the Quadratic Form Invariants roadmap, through `Invariants` and
the degree-two system `explicitFiniteQuotientSystem2` with `explicitFiniteQuotientComparison2`,
`explicitFiniteQuotientCocone2` and `explicitFiniteQuotientColimit2`, for the finite-quotient
description of `H²(G_K, (Kˢ)ˣ)`. Membership in `Invariants U M` is Mathlib's
`FixedPoints.mem_addSubgroup`, a condition on the elements of `U` as a type, and a continuous
2-cocycle is built from its continuity and its cocycle identity by
`TauCeti.ContCohomology.mem_Z2_iff`.

**Source** for the colimit theorem. NSW (1.2.5); Ribes-Zalesskii Cor. 6.5.6(a); Koch Thm. 3.16;
Serre, *Local Fields* X §3 takes it as the definition. The hypotheses are that `G` is profinite
and `M` is discrete, and both are used. Discreteness is what makes a continuous cochain locally
constant. Compactness is used in degree `2` separately from total disconnectedness: descending
both variables at once is uniform local constancy on `G × G`, and total disconnectedness alone
does not give it. No counterexample is recorded here, because none is needed to see where each
hypothesis enters; what a contributor must not do is drop either one and expect the argument to
survive.

### Layer 5: exact sequences

**Prerequisites.** Mathlib: `groupCohomology.δ`, `δ₀_apply`, `δ₁_apply`,
`mapShortComplex₁_exact`, `H1InfRes`, `H1InfRes_exact`. Tau Ceti: `ContCohomology/Inflation/Basic`,
`ContCohomology/Conjugation`, `ContCohomology/FiveTerm` and `ContCohomology/Transgression`, which
implement the inflation-restriction and five-term sequences below, and
`ContCohomology/ShortExact`, `ContCohomology/LongExact` and `ContCohomology/DeltaNaturality`, which
implement the long exact sequence. This roadmap: Layer 0 for the continuous section, and Layer 2.

- **Exactness of cochains.** For a short exact sequence `0 → A → B → C → 0` of discrete
  `G`-modules and any topological group `G`, the cochain sequences
  `0 → Cⁿ(G, A) → Cⁿ(G, B) → Cⁿ(G, C) → 0` are exact: a continuous cochain into discrete `C` is
  locally constant, so composing with **any** set-theoretic section of `B → C` preserves
  continuity.
  ⚠ This is the one place where discreteness of the coefficients cannot be relaxed. For general
  topological modules there is no such section and no long exact sequence; do not state this layer
  beyond discrete coefficients.
- **The short exact sequence as data.** `DiscreteShortExact G A B C` carries the two maps of
  `0 → A → B → C → 0` with their continuity, equivariance and exactness. Every statement of this
  layer, and the corestriction compatibility of Layer 6, is about the same sequence and has to name
  the same two coefficient maps, so the sequence is an object and not a list of side conditions.
  `DiscreteShortExact.restrict` restricts it to a subgroup, which is what the naturality statements
  below are stated against. It is Tau Ceti's `TauCeti.ContCohomology.DiscreteShortExact`, whose
  two maps carry no continuity field, every map between discrete modules being continuous, and
  whose exactness in the middle is `Function.Exact incl proj`. The connecting maps, the eight
  exactness nodes and the restriction squares below are Tau Ceti's too, in `ShortExact.lean`,
  `LongExact.lean` and `DeltaNaturality.lean`, and `Suggested.lean` carries them under this layer's
  names.
- **The long exact sequence** through degree 2 (NSW (1.3.2)): explicit connecting maps
  `explicitDelta0 : H⁰(G, C) → H¹(G, A)` (choose a preimage, apply `d⁰`) and
  `explicitDelta1 : H¹(G, C) → H²(G, A)`, their
  well-definedness, their descriptions on representatives (`explicitDelta0_apply`,
  `explicitDelta1_apply`), exactness at the eight nodes from `H⁰(G, A)` to `H²(G, B)`
  (`explicitLongExact_H0A`, `explicitLongExact_H0B`, `explicitLongExact_H0C`,
  `explicitLongExact_H1A`, `explicitLongExact_H1B`, `explicitLongExact_H1C`,
  `explicitLongExact_H2A`, `explicitLongExact_H2B`), and naturality both
  in morphisms of short exact sequences and in compatible pairs, so that restriction and inflation
  commute with `δ`; restriction is `explicitDelta0_res` and `explicitDelta1_res`. Mirror the pin's
  `δ₀_apply`/`δ₁_apply` interface so that the discrete and
  continuous theories are used identically. The all-degree sequence is a Layer 10 milestone, and
  the two connecting maps agree with its `delta` by `explicitIso_delta0` and `explicitIso_delta1`,
  which are milestones of this layer and not of the consumer's.
- **Inflation-restriction.** The exact sequence `0 → H¹(G ⧸ N, M^N) → H¹(G, M) → H¹(N, M)` for
  closed normal `N`, by a direct cochain argument, with the pin's discrete `H1InfRes_exact` as the
  model: `explicitInfl1_injective` and `explicitInfRes_exact`. Valid for an arbitrary topological
  group with discrete coefficients.
- **The five-term sequence, for profinite `G` and closed normal `N`** (NSW (1.6.7),
  Ribes-Zalesskii Cor. 7.2.5(a); Koch Thm. 3.14 gives the degree-`n` form under vanishing below
  `n`, which Layer 11's dévissage uses). The pieces are: the invariants `H1ConjInvariants` of
  Layer 2's conjugation action; `G ⧸ N`-invariance of the image of
  restriction (`explicitRes1_mem_conjInvariants`) and the resulting map `explicitResConj1`; the
  `transgression`
  `tg : H¹(N, M)^{G ⧸ N} → H²(G ⧸ N, M^N)`, defined by lifting a representative cocycle on `N`
  through a **continuous section** of `G → G ⧸ N` supplied by Layer 0 and differentiating;
  independence of the chosen section and of the representative, as an identity of classes. The
  construction is pinned by `transgressionLift`, the section-dependent continuous extension to `G`
  of a representative `c : Z1 N M` whose class is conjugation-invariant (a lift needs a cocycle, not
  a class, and uses compactness of `N`),
  `transgressionCochain`, `transgressionCochain_apply` (the descended value of `d¹` of that lift),
  `transgressionCochain_isCocycle`, `transgressionCochain_sub_mem_B2` (an explicit `B²`
  membership), and `transgression_apply`, which identifies its class with the public map. Its two
  compatibilities `transgression_explicitResConj1` and `explicitInfl2_transgression`; and
  exactness of
  ```
  0 → H¹(G⧸N, M^N) → H¹(G, M) → H¹(N, M)^{G⧸N} → H²(G⧸N, M^N) → H²(G, M)
  ```
  at its four nodes, which is `explicitInfl1_injective`, `explicitInfResConj_exact` (the second
  node, read with the invariant-valued restriction; `explicitInfRes_exact` is its three-term form),
  `fiveTerm_exact_H1N` and `fiveTerm_exact_H2Q`. These are Tau Ceti's names for the landed
  sequence, and `Suggested.lean` carries every one of them as an alias of, or a theorem proved by,
  the Tau Ceti declaration.
  ⚠ Profiniteness is a genuine hypothesis here, not a convenience: extending a continuous cocycle
  off a closed subgroup, or building one from a section, is exactly what Layer 0's section theorem
  provides and what fails for an arbitrary topological group. The three-term inflation-restriction
  sequence above keeps its wider generality; the five-term sequence does not.
  ⚠ Define `tg` by the named lift-and-differentiate formula, not merely by its endpoint, and prove
  the change-of-section coboundary before quotienting. Then prove the two compatibilities, with
  inflation on the right and restriction on the left. Spectral sequences are out of scope (§1).

  The presentation theory of
  the Profinite Pro-`p` Groups roadmap is built from this
  sequence; its `𝔽_p` instance, with `N` the relation kernel of a minimal presentation, is the case
  that roadmap consumes, through `transgression`, `fiveTerm_exact_H1N` and `fiveTerm_exact_H2Q`.

**Source** for the exactness of the cochain sequences. NSW (1.3.2) for the long exact sequence.
The hypothesis that cannot be relaxed is that the coefficients are **discrete**: a continuous
cochain into a discrete `C` is locally constant, so composing with any set-theoretic section of
`B → C` is still continuous. For general topological coefficients that argument has nothing to
stand on, since a set-theoretic section of `B → C` need not be continuous and `Cⁿ(G, B) → Cⁿ(G, C)`
need not be surjective. This roadmap therefore states the layer for discrete coefficients only and
asserts nothing about the general case.

**Source** for the five-term sequence. NSW (1.6.7); Ribes-Zalesskii Cor. 7.2.5(a); Koch Thm. 3.14
gives the degree-`n` form under vanishing below `n`, which Layer 11's dévissage uses. The
hypotheses are `G` profinite and `N` closed normal. Profiniteness is genuine here and not a
convenience: the transgression is defined by lifting through a continuous section of `G → G ⧸ N`,
which Layer 0 supplies and which does not exist in general. The false neighbor is the five-term
sequence for an arbitrary topological group; the three-term inflation-restriction sequence keeps
that wider generality and the five-term one does not.

### Layer 6: change of groups

**Prerequisites.** Mathlib: `Subgroup.index`, `Subgroup.FiniteIndex`,
`Subgroup.finiteIndex_of_finite_quotient`, `OpenSubgroup`, `QuotientGroup.mk`, `Quotient.out`. Tau
Ceti: `TauCeti.lWord`, `TauCeti.lWord_mem`, `TauCeti.lWord_mul_lWord` and
`TauCeti.transversal_mul_lWord` (`TauCeti/GroupTheory/TransversalWord.lean`),
`TauCeti.continuous_lWord` (`TauCeti/Topology/Algebra/Group/TransversalWord.lean`), and the
corestrictions with their identities in `Corestriction/Basic.lean`,
`Corestriction/Transitivity.lean`, `DeltaNaturality.lean` and `ProjectionFormula.lean` of
`TauCeti/RepresentationTheory/Homological/ContCohomology/`. This roadmap: Layer 2, and Layer 5 for
the compatibility of corestriction with the connecting maps.

For open `U ≤ G`, with `[Fintype (G ⧸ U.toSubgroup)]` carried on every finite-sum declaration.
Compactness of `G` may synthesize this instance, but openness alone never may: the trivial subgroup
of an infinite discrete group is open and can have infinite index. Everything is built through the
transversal formulas of §3.

Tau Ceti supplies most of this layer, and `Suggested.lean` carries this roadmap's names as its
declarations. The transversal calculus is `TauCeti.lWord` with `lWord_mem`, `lWord_mul_lWord`,
`transversal_mul_lWord` and `continuous_lWord`. In `TauCeti.ContCohomology`, the corestrictions
`explicitCor0Transversal`, `explicitCor1Transversal` and `explicitCor2Transversal`, the
change-of-transversal coboundaries `cochainsCor1_changeTransversal` and
`cochainsCor2_changeTransversal` with the resulting independence `explicitCor0_changeTransversal`,
`explicitCor1_changeTransversal` and `explicitCor2_changeTransversal`, the public `explicitCor0`,
`explicitCor1` and `explicitCor2`, and `cor ∘ res = (G : U) • id` with its two cochain-level
corrections (`explicitCor0_comp_res0`, `explicitCor1_comp_res1`, `explicitCor2_comp_res2`,
`cochainsCor1_res`, `cochainsCor2_res`) are Tau Ceti's, and so are the compatibility with the
connecting maps (`DiscreteShortExact.explicitCor_delta0`, `explicitCor_delta1`), the projection
formula in the six low-degree shapes (`explicitCup_projection` and its five companions) and
transitivity (`explicitCor0_trans`, `explicitCor1_trans`, `explicitCor2_trans`). Tau Ceti states
them for `U : Subgroup G` with `[U.FiniteIndex]` and, in degrees 1 and 2, `IsOpen (U : Set G)`; the
names here read them at an `OpenSubgroup` with a `Fintype` quotient, taking the finite index from
the finite quotient, and are otherwise the Tau Ceti declarations. What remains to build here is the
Mackey formula, naturality of `explicitCor1` and `explicitCor2` in coefficient maps on classes
(Tau Ceti has it on cochains, `map_cochainsCor1` and `map_cochainsCor2`, and in degree 0,
`map_explicitCor0`), the interaction of conjugation with restriction and corestriction, and the
worked example.

- **The transversal calculus.** For a variable transversal `t`, the word `ℓᵗ_u(γ)` lies in `U` and
  satisfies the 1-cocycle law `ℓᵗ_u(γ) * ℓᵗ_{γ⁻¹ • u}(η) = ℓᵗ_u(γη)`. This is pure group theory,
  stated for an arbitrary subgroup, and `Suggested.lean` fixes both statements. Continuity of
  `γ ↦ ℓᵗ_u(γ)` for open `U`. The identity `t u * ℓᵗ_u(γ) = γ * t (γ⁻¹ • u)`, which the cocycle
  computations use.
- **Corestriction in degrees `0, 1, 2`.** The three formulas of §3, for a variable transversal:
  each takes its values in continuous cochains, sends cocycles to cocycles and coboundaries to
  coboundaries, is additive, and carries `[Fintype (G ⧸ U.toSubgroup)]`. The named maps are
  `explicitCor0Transversal`, `explicitCor1Transversal`, and `explicitCor2Transversal`; the named
  change-of-transversal coboundaries are `explicitCor0_changeTransversal`,
  `explicitCor1_changeTransversal`, and `explicitCor2_changeTransversal`. The proof that `cor¹`
  preserves cocycles visibly uses the factor
  `t u •`; a
  version of the argument that does not is wrong. Then: change of transversal, as an explicit
  coboundary identity between the two cochains, and the resulting independence on cohomology. Only
  after all of that, define the public `explicitCor0`, `explicitCor1` and `explicitCor2` as the
  `t = Quotient.out` specializations. All three degrees are exported, and all three agree with
  Layer 10's all-degree `corestriction` by `explicitIso_cor0`, `explicitIso_cor` and
  `explicitIso_cor2`.
  ⚠ Prove independence as a change-of-transversal coboundary identity, not by re-deriving the map
  abstractly. Downstream computations use the formula, so the formula is the definition.
- **The identities.** Every declaration in this bullet carries the finite-index instance for each
  subgroup over which it sums. `cor ∘ res = (G : U) • id` on `H⁰, H¹, H²` (NSW (1.5.7); Serre, *Local
  Fields* VII §7 Prop. 6; Koch Thm. 3.10), with the two explicit cochain-level correction terms of
  §3 as named lemmas; naturality in coefficient maps; compatibility with the connecting maps of
  Layer 5 (`cor ∘ δ = δ ∘ cor`, NSW (1.5.2)), which is `explicitCor_delta0` and
  `explicitCor_delta1`; the low-degree projection formula; and transitivity
  `cor_V^G = cor_U^G ∘ cor_V^U` for open `V ≤ U ≤ G`, with finite-index data for `V ≤ U` and
  `U ≤ G`.
- **The Mackey double-coset formula** (NSW (1.5.6)). For open finite-index `U, V ≤ G`, with the
  finite quotient and double-coset indexing supplied explicitly,
  ```
  res^G_V ∘ cor^G_U = ∑_{VgU ∈ V \ G / U} cor^V_{V ∩ gUg⁻¹} ∘ (g)_* ∘ res^U_{U ∩ g⁻¹Vg},
  ```
  with `(g)_*` the conjugation isomorphism of Layer 2. State the exact double-coset indexing and
  the intersection subgroups; prove it first in degrees `0, 1, 2` on the explicit model, and prove
  independence of the double-coset representatives. Add the finite-group specialization as an
  acceptance check. Mackey is part of the basic change-of-groups API and is built here whether or
  not a current consumer asks for it.
- **Conjugation, again.** Layer 2 constructs the conjugation maps; this layer states their
  interaction with restriction and corestriction, which the Mackey formula needs.
- **Conventions.** The normalization is `cor ∘ res = index • id`, in that order and with that
  direction, which is NSW's and is also the one the finite-level literature uses, so a
  finite-level statement can be read against this one without translation.
  ⚠ Naming collision: at the pin, Mathlib's `GroupHomology/Functoriality.lean` already uses
  "corestriction" for the covariant functoriality of *homology* along a group homomorphism. Ours
  is the classical cohomological transfer (NSW I §5). Keep the name `cores` or `corestriction`,
  which is NSW's usage, say in the docstring which of the two is meant, and never abbreviate it
  to "transfer", since Layer 13's norm is the *multiplicative* transfer.

**API** for corestriction. Constructors: `explicitCor0Transversal`,
`explicitCor1Transversal`, `explicitCor2Transversal` for a variable transversal, and the public
`explicitCor0`, `explicitCor1`, `explicitCor2` at `t = Quotient.out`; all six carry the finite-index
instance. Worked example: `cor ∘ res` on `H¹(Ẑ, ℤ/m)` for the
open subgroup `nẐ`, computed on explicit cocycles, once with the trivial action and once with a
nontrivial one so that the factor `t u •` is tested. Morphisms: each `cor` is additive.
Functoriality: naturality in coefficient maps, transitivity in the subgroup, and compatibility
with connecting maps. Comparison: independence of the transversal, stated as an explicit
coboundary identity; and agreement with Layer 10's all-degree corestriction. Naturality: of `cor`
in `M`. Edge cases: `U = G`, where `cor` is the identity; index `1`; and the trivial action, where
the representative factor disappears. Consumers: Layer 8's projection formula, Layer 9's norm
compatibility, Layer 13's identity 2.

**Source** for `cor ∘ res`. NSW (1.5.7); Serre, *Local Fields* VII §7 Prop. 6; Koch Thm. 3.10. The
hypothesis is finite index; openness is additionally used for continuity. Compactness makes an open
subgroup finite-index, but no such implication is used for a general topological group. The statement is
`cor ∘ res = (G : U) • id` **on cohomology**; the false neighbor is the same identity on cochains,
which is false in degrees `1` and `2`, where the two sides differ by the explicit coboundary
recorded in §3. Never state it as a cochain identity in positive degrees.

### Layer 7: coinduced modules and Shapiro's lemma

**Prerequisites.** Mathlib: `Representation.coind`, `Rep.indCoindIso`,
`groupCohomology.coindIso`, `IsLocallyConstant`. Tau Ceti:
`TauCeti.isOpen_rightTranslationStabilizer`
(`TauCeti/Topology/Algebra/Group/LocallyConstant.lean`) and the modules `Coinduced`,
`Coinduced/Discrete`, `Coinduced/Exact`, `Coinduced/Functor`, `Coinduced/PreservesExactness`,
`Shapiro` and `DimensionShifting/Basic` of
`TauCeti/RepresentationTheory/Homological/ContCohomology/`. This roadmap: Layers 0, 2 and 6. Other
roadmaps: `RepresentationTheory/InductionRestriction`, for the algebraic finite-index theory it
owns.

For profinite `G` and a **closed** subgroup `H ≤ G`, on discrete `H`-modules `A`. The generality is
decided up front: closed, not merely open, since the trivial subgroup is the acyclicity case.

Tau Ceti supplies the coinduced module, its functor and trace, the algebraic comparison and the
explicit Shapiro isomorphisms, and `Suggested.lean` carries this roadmap's names as those
declarations: `Coind` is `TauCeti.coind`, with the discrete carrier `TauCeti.DiscreteCoind`,
`coindTraceRaw` is `TauCeti.coindTrace`, `coindTopRep`, `coindFunctor` and `coindFunctor_obj` are
`TauCeti.coindTopRep`, `TauCeti.coindFunctor` and `TauCeti.coindFunctor_obj`,
`coindFunctor_map_shortExact` is `TauCeti.coindFunctor_map_shortExact`, `algebraicCoindAsSmooth`
and `topologicalCoindIsoAlgebraic` are Tau Ceti's declarations of those names, and
`explicitShapiro0`, `explicitShapiro1` and `explicitShapiro2` are
`TauCeti.ContCohomology.explicitShapiro0/1/2`. What remains to build here is the continuous
Frobenius reciprocity, the naturality of the explicit Shapiro isomorphisms in `A` and their
compatibility with restriction and corestriction, `Ind_H^G A ≅ Coind_H^G A` for open `H` with the
induced-module form of Shapiro, `topologicalCoindIsoAlgebraic_shapiro`, the categorical forms
`coindFunctor_preservesMonomorphisms` and `coindFunctor_preservesEpimorphisms`, and the worked
example.

- **The coinduced module.** `Coind_H^G A` is the locally constant `H`-equivariant maps `G → A`
  (`f (h * g) = h • f g`) with the right-translation action `(g • f) x = f (x * g)`; this is
  Milne's `M_*` (ADT Remark 0.11) and Ribes-Zalesskii's `Coind_H^G` (Thm. 6.10.5). It is again
  **discrete** (a locally constant map on a profinite group is uniformly locally constant, so
  stabilizers are open: `TauCeti.isOpen_stabilizer_coind`,
  `TauCeti.DiscreteCoind.instContinuousSMul`), functorial in `A` (`TauCeti.coindMap`), and exact
  in `A` (`TauCeti.coindMap_injective`,
  `TauCeti.coindMap_range_eq_ker`, `TauCeti.coindMap_surjective`); exactness on the right uses
  Layer 0's continuous section of `G → G ⧸ H`, cited by name. The counit is evaluation at `1`
  (`TauCeti.coindEval`, bundled as `TauCeti.coindCounit`). Adjunction with restriction:
  `Hom_G(M, Coind_H^G A) ≃ Hom_H(res M, A)`, the continuous Frobenius reciprocity, in the
  direction of the pin's discrete adjunction.
  Exactness is not represented only by preservation of monomorphisms and epimorphisms:
  `coindFunctor_map_shortExact` states that an injective map followed by a surjective one, exact at
  the middle object, is sent to maps with the same three properties, including exactness at the
  middle object.
  ⚠ Terminology trap: NSW writes `Ind_G^H` for this **coinduced** functor and flags the abuse only
  in a footnote (2nd ed., p. 61). When citing NSW (1.6.4) next to a Lean `coind`, cite the
  footnote too, and reserve `ind` for the genuine left adjoint.
- **Shapiro's lemma.** `Hⁱ(G, Coind_H^G A) ≅ Hⁱ(H, A)` for `i = 0, 1, 2` on the explicit model
  (NSW (1.6.4), Ribes-Zalesskii Thm. 6.10.5, Koch Thm. 3.9), natural in `A` and compatible with
  restriction and, for open intermediate subgroups, corestriction. The forward map is restriction
  to `H` followed by evaluation at `1`, and involves no choice; the inverse is the section formula
  for every continuous right-coset factorization of `G` over `H`, which Layer 0's continuous section
  supplies for closed `H`, open or not. The named maps are `explicitShapiro0`, `explicitShapiro1`,
  and `explicitShapiro2`, on the discrete carrier `TauCeti.DiscreteCoind G H A`; their forward
  application theorems (`TauCeti.ContCohomology.explicitShapiro1_apply` and its siblings) pin
  evaluation at `1`, and their inverses pin the section formula
  (`TauCeti.ContCohomology.explicitShapiro1_symm_apply`, `explicitShapiro2_symm_apply`). Degree `0`
  needs no closedness. The pin's `coindIso` fixes the direction. The canonical Shapiro map in every
  degree and its isomorphism `shapiroIso` are Layer 10 milestones, not Layer 7 exports.
- **Open subgroups and the algebraic comparison.** For **open** `H`, prove `Ind_H^G A ≅
  Coind_H^G A` using a finite transversal, with the pin's discrete `Rep.indCoindIso` as the model,
  and derive the induced-module form of Shapiro. Then state the theorem that joins this roadmap to
  the representation theory family: for open `H`, the topological coinduction of a discrete module
  agrees with the algebraic coinduction of
  [`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md),
  by the named `topologicalCoindIsoAlgebraic`, with compatibility with the explicit and canonical
  Shapiro maps stated by `topologicalCoindIsoAlgebraic_shapiro`. For closed `H` of infinite index
  only the coinduced form is asserted.
- **Acyclicity and dimension shifting.** `Coind_1^G A`, the locally constant maps `G → A`, has
  vanishing `Hⁱ` for `i = 1, 2` (Shapiro at `H = 1`); every discrete `M` embeds in a discrete
  acyclic module `M ↪ Coind_1^G M`; hence dimension shifting `Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)`
  in the range where both sides are defined. Tau Ceti supplies all three in
  `DimensionShifting/Basic.lean`: `TauCeti.ContCohomology.subsingleton_H1_discreteCoind_bot`,
  `subsingleton_H2_discreteCoind_bot`, the embedding `coindBotEmbedding` with its quotient
  `DimensionShiftQuotient` and short exact sequence `coindBotShortExact`, and the shifts
  `explicitDimensionShift0` and `explicitDimensionShift1`. The statement in all positive degrees,
  which Layer 11 runs its induction on, is a Layer 10 milestone.

**API** for `Coind_H^G A`. Constructors: the locally constant `H`-equivariant maps `G → A` with
the right-translation action. Worked example: `Coind_1^G A`, the locally constant maps `G → A`,
which is the acyclic module of the dimension-shifting argument. Morphisms: functoriality in `A`,
and the counit `Coind_H^G A → A` given by evaluation at `1`. Functoriality: exactness in `A`.
Comparison: with `Ind_H^G A` for open `H`, and with the algebraic coinduction of
`RepresentationTheory/InductionRestriction` for open `H`. Naturality: of the Shapiro isomorphism
in `A`, and its compatibility with restriction and, for open intermediate subgroups,
corestriction. Edge cases: `H = G`, where `Coind` is the identity; `H = 1`, which is the
acyclicity case; and `A = 0`. Consumers: Layer 10's dimension shifting, Layer 11's dévissage.

**Source** for Shapiro's lemma. NSW (1.6.4), with the p. 61 footnote, since NSW writes `Ind` for
what is here the coinduced functor; Ribes-Zalesskii Thm. 6.10.5, which uses `Coind` by that name;
Koch Thm. 3.9. The hypotheses are `G` profinite and `H` closed; openness is not needed, and the
trivial subgroup is the case the acyclicity argument runs on. The false neighbor is
`Ind_H^G A ≅ Coind_H^G A` for closed `H`: that isomorphism needs a finite transversal and fails
for a closed subgroup of infinite index, so only the coinduced form is asserted there.

### Layer 8: cup products in low degrees

**Prerequisites.** Mathlib: `groupCohomology.IsCocycle₁`, `IsCocycle₂`, `AddMonoidHom`.
This roadmap: Layers 2, 5 and 6.

On the explicit model, relative to an equivariant pairing as fixed in §3. Discreteness of `M` and
`N` makes every cochain-level continuity automatic.

- **The six low-degree shapes.** `⌣ : H^p(G, M) × H^q(G, N) → H^{p+q}(G, P)` for the six pairs
  `(p, q)` of §3 with `p + q ≤ 2`, each with: the cochain formula, cocycle cup cocycle is a cocycle,
  descent through coboundaries, and biadditivity by construction. The family is closed: every
  operation used in an associativity or commutativity statement below is one of these six. Each is
  a declaration of its own, `explicitCup00`, `explicitCup01`, `explicitCup10`, `explicitCup02`,
  `explicitCup11` and `explicitCup20`, so that a consumer names the shape it uses rather than a
  bidegree of Layer 12's graded product. The six are Tau Ceti's, in
  `ContCohomology/Cup/Product.lean`.
- **Associativity.** Typing both sides needs four `G`-equivariant biadditive pairings and one
  coefficient identity. Given `μ₁ : A →+ B →+ D`, `μ₂ : D →+ C →+ E`, `ν₁ : B →+ C →+ F` and
  `ν₂ : A →+ F →+ E` with `μ₂ (μ₁ a b) c = ν₂ a (ν₁ b c)` for all `a, b, c`, and classes of degrees
  `p, q, r` with `p + q + r ≤ 2`:
  ```
  (x ⌣_{μ₁} y) ⌣_{μ₂} z = x ⌣_{ν₂} (y ⌣_{ν₁} z)
  ```
  already at the cochain level (Brown V (3.5)). The instances in range are `(0,0,0)`, `(0,0,1)`,
  `(0,1,0)`, `(1,0,0)`, `(0,0,2)`, `(0,1,1)`, `(1,1,0)`, `(1,0,1)`, `(0,2,0)` and `(2,0,0)`.
  The instance `(1,1,0)` needs the `(1,0)` cup on the right-hand side, which is why `(1,0)` and
  `(0,0)` belong to the family. State also the specialization all applications use: a discrete
  `G`-ring `R`, with all four pairings its multiplication.
- **Graded commutativity.** `a ⌣_μ b = (-1)^{pq} (b ⌣_{μᵒᵖ} a)` **in cohomology** (NSW (1.4.4),
  Brown V (3.6)). For `(0,q)` against `(q,0)` the two cochains are literally equal, because the
  degree-0 class is invariant, so state that case at cochain level. For `(1,1)` they are not: give
  the explicit 1-cochain whose `d¹` is the difference, name it in the file docstring, and derive
  the statement on classes from it. State the characteristic-2 symmetric specialization separately,
  since that is the case the arithmetic applications use.
  ⚠ Signs are the usual source of error here, between the `(1,1)` homotopy and the
  connecting-map formulas below. Fix the homotopy formula in the file docstring and refer to it.
- **Compatibilities.** Four theorems, in the degrees where both sides are defined:
  1. restriction: `res (a ⌣ b) = res a ⌣ res b` (NSW (1.5.3)(i));
  2. inflation: `inf (a ⌣ b) = inf a ⌣ inf b`, over the quotient's pairing (NSW (1.5.3)(iii),
     Milne (0.1.6));
  3. coefficient maps, that is naturality in `μ` (NSW (1.4.2));
  4. the **projection formula** `cor (res a ⌣ b) = a ⌣ cor b` for open `U`, by the transversal
     argument (NSW (1.5.3)(iv), Ribes-Zalesskii 7.9.6 and 7.9.7, Brown V (3.8)).
- **Connecting maps, as typed diagrams.** The generic Leibniz identity for `δ` is not a statement
  until the coefficient sequences are named, so state two separate theorems.
  1. *First variable.* For a short exact sequence `0 → A' → A → A'' → 0` of discrete modules, a
     module `B`, and pairings `A × B → C`, `A' × B → C'`, `A'' × B → C''` compatible with a short
     exact sequence `0 → C' → C → C'' → 0`: for `a'' ∈ H^p(G, A'')` and `b ∈ H^q(G, B)`,
     ```
     δ (a'' ⌣ b) = δ(a'') ⌣ b   in H^{p+q+1}(G, C').
     ```
  2. *Second variable.* For `0 → B' → B → B'' → 0` and pairings compatible with
     `0 → C' → C → C'' → 0`: for `a ∈ H^p(G, A)` and `b'' ∈ H^q(G, B'')`,
     ```
     δ (a ⌣ b'') = (-1)^p (a ⌣ δ(b''))   in H^{p+q+1}(G, C').
     ```

  The coefficient diagrams are inputs of the theorems, not prose around an untyped equation. The
  instances required downstream, all with target degree at most 2, are six lemmas, named by the
  connecting map on the left and the cup shape, as in Tau Ceti, which proves all six in
  `ContCohomology/Cup/ConnectingMap.lean`; `Suggested.lean` proves each by the Tau Ceti theorem. In
  the first variable: `explicitDelta0_explicitCup00_left` (`δ⁰` of the class, `(p, q) = (0, 0)`),
  `explicitDelta1_explicitCup01_left` (`δ⁰` of the class, `(0, 1)`) and
  `explicitDelta1_explicitCup10_left` (`δ¹` of the class, `(1, 0)`). In the second variable:
  `explicitDelta0_explicitCup00_right` (`δ⁰`, `(0, 0)`), `explicitDelta1_explicitCup10_right`
  (`δ⁰`, `(1, 0)`, with the sign `-1`) and `explicitDelta1_explicitCup01_right` (`δ¹`, `(0, 1)`).
  Layer 13's index-two exact sequence reads its connecting map off
  `explicitDelta1_explicitCup10_right` at the class `1`.
- **The Bockstein.** The sum rule `δ(a ⌣ b) = δa ⌣ b + (-1)^p (a ⌣ δb)` is a statement about a
  single derivation, and needs multiplicative short-exact-sequence data that the two theorems above
  do not carry. Build it once, for the case the applications use: the Bockstein
  `β : Hⁿ(G, 𝔽₂) → Hⁿ⁺¹(G, 𝔽₂)` attached to `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` with its ring structure,
  with `β ∘ β = 0` and `β (x ⌣ y) = β x ⌣ y + x ⌣ β y` in the degrees where both sides are
  defined. No generic derivation formula is stated without those hypotheses.
- **The duality pairings.** For finite discrete `M`, the evaluation pairing `evalPairing` of
  Layer 0, with its equivariance `evalPairing_equivariant` and the conjugation action `homAction`,
  composed with the cups gives `Hⁱ(G, M →+ N) × H²⁻ⁱ(G, M) → H²(G, N)` for `i = 0, 1, 2`. These are
  instances of the six-shape API above. Against the canonical object the same pairing is
  `evalPairing` fed to `ofDiscreteModulePairing`, a `TopPairing`, with `cup`, `cup_add_left` and
  `cup_add_right` for biadditivity. The Class Field Theory roadmap states local Tate duality for
  its own named evaluation pairing on `ZMod n`-coefficient objects, a `TopPairing`, and takes from
  here Layer 12's `TopPairing`, `cup` and `degreeCast`.
**API** for the cup products. Constructors: the six cochain formulas of §3, one per shape. Worked
example: the `(1,1)` square on `C₂` with `𝔽₂` coefficients is the nontrivial class of
`H²(C₂, 𝔽₂)`, and its Galois form `[-1] ⌣ [-1] ≠ 0` in `H²(G_ℝ, 𝔽₂)`; both are in
`Suggested.lean`. Morphisms: biadditivity in each argument, by construction. Functoriality:
naturality in the pairing `μ`, and the restriction, inflation and projection compatibilities.
Comparison: with Layer 12's graded cup, under Layer 3. Naturality: the connecting-map identities,
stated as typed diagrams with their coefficient sequences as inputs. Edge cases: `(0,0)`, where
the cup is the pairing itself; a degenerate pairing, where every cup vanishes, which is what the
`C₂` example rules out. Consumers: Layer 9's mod-2 pairing and Layer 13's identity 1.

**Source** for graded commutativity. NSW (1.4.4); Brown, *Cohomology of Groups*, V (3.6). The
identity `a ⌣_μ b = (-1)^{pq} (b ⌣_{μᵒᵖ} a)` holds **on cohomology classes**. The false neighbor
is the same identity on cochains: it is true for `(0,q)` against `(q,0)`, because a degree-0 class
is invariant, and false for `(1,1)`, where the two cochains differ by the coboundary of an
explicit 1-cochain. State the `(0,q)` case at cochain level and the `(1,1)` case on classes.

### Layer 9: the Galois interface: Hilbert 90 and Kummer theory

**Prerequisites.** Mathlib: `SeparableClosure`, `separableClosure.isGalois`,
`SeparableClosure.isSepClosed`, `separableClosure.isPurelyInseparable`,
`instSubsingletonAlgHomOfIsPurelyInseparable`, `AlgEquiv.restrictNormalHom_surjective`,
`Field.absoluteGaloisGroup`, `InfiniteGalois.isOpen_and_normal_iff_finite_and_isGalois`,
`InfiniteGalois.normalAutEquivQuotient`, `rootsOfUnity`, `powMonoidHom`,
`groupCohomology.H1ofAutOnUnitsUnique`, `krullTopology`. Tau Ceti: `TauCeti.AbsoluteGaloisGroup`
and `TauCeti.absoluteGaloisGroupRestrictEquiv`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`), the power classes of
`TauCeti/Algebra/Group/PowerClassGroup.lean`, the action
`TauCeti.rootsOfUnity.mulDistribMulAction`, and `TauCeti/FieldTheory/GaloisCohomology/` (the
coefficient modules and the Kummer sequence in `Coefficients.lean`, the Kummer map, isomorphism and
restriction square in `Kummer.lean`, `Hilbert90.lean`, and `h2KummerToUnits` in
`BrauerTorsion.lean`), which implement this layer apart from the norm square and the
field-extension bridge. This roadmap: Layers 3, 4, 5 and 8; the field-extension bridge also Layers
10, 12 and 13.

`K` a field, `Kˢ = SeparableClosure K`, and `G_K` its Galois group with the Krull topology. The
Kummer half of this layer needs Layers 3, 4, 5 and 8. The field-extension bridge at its end also
needs Layer 10 (`corestriction`), Layer 12 (`cup_res`, `cup_projection`) and Layer 13
(`evensNormIndexTwo`, `evensConj`, `indexTwoCharacterClass` and the index-two identities), so it
is built after Layer 13 (§7).

- **The group, fixed once.** `AbsoluteGaloisGroup K = Kˢ ≃ₐ[K] Kˢ`. This is the carrier, not one
  of two options: every statement in this layer and every interface it exports names it.
  Mathlib's `Field.absoluteGaloisGroup K` uses the algebraic closure, so a separate milestone
  proves that restriction to `Kˢ` is a topological group isomorphism
  `Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`, compatibly with the action on `Kˢ`.
  Injectivity is `instSubsingletonAlgHomOfIsPurelyInseparable` together with
  `separableClosure.isPurelyInseparable`; surjectivity is `AlgEquiv.restrictNormalHom_surjective`.
  Tau Ceti's `AbsoluteGaloisGroup` and `absoluteGaloisGroupRestrictEquiv` are both.
  `G_K` is profinite in the unbundled sense (`CompactSpace`, `TotallyDisconnectedSpace`), by
  `separableClosure.isGalois` together with the pin's `[IsGalois k K] → CompactSpace Gal(K/k)`.
- **The coefficient field and the invariant units.** The coefficient modules are `(Kˢ)ˣ` and its
  submodules. The module `(Kˢ)ˣ` is **discrete**, since every element lies in a finite
  subextension and so has open stabilizer; so are `μₙ ⊆ (Kˢ)ˣ` and the finite subquotients.
  `H⁰(G_K, (Kˢ)ˣ)` is the invariant subgroup `((Kˢ)ˣ)^{G_K}`, which is **not the same type** as
  `Kˣ`. What exists is a canonical equivalence, written additively as Layer 2's `H0`,
  ```
  baseUnitsEquivInvariants : Additive Kˣ ≃+ H⁰(G_K, UnitsCoeff K),
  ```
  induced by the algebra map and the fixed-field theorem (Tau Ceti's
  `TauCeti.baseUnitsEquivInvariants`). Name it, prove it, and use that exact
  map wherever `Kˣ` is the source of a cohomological construction; do not write the two as equal.
  As a coefficient module `(Kˢ)ˣ` is fixed once, as `UnitsCoeff K = Additive (Kˢ)ˣ` with the
  transported action, the discrete topology and continuity of the action installed as instances,
  exactly as for `KummerCoeff`. This is the module Hilbert 90 and the cohomological Brauer group
  are stated at, and a consumer that needs `H^i(G_K, (Kˢ)ˣ)` names it rather than building a
  second one. Both coefficient modules, with their topologies, actions and continuity instances,
  are Tau Ceti's `TauCeti.UnitsCoeff` and `TauCeti.KummerCoeff`.
- **The Kummer coefficient module.** `μₙ` carries the natural `G_K`-action, which is in general
  nontrivial, and continuous cohomology depends on that action. So the coefficient object is fixed
  once, as `KummerCoeff K n = Additive μₙ` with the transported action and the discrete topology,
  and every Kummer statement below is against it. A consumer with its own model of `μₙ` reaches
  the same theorem through a transport lemma whose hypothesis is a **continuous `G_K`-equivariant**
  additive equivalence. An identification of `μₙ` as a bare group is not enough: the same abstract
  cyclic group carrying the trivial action would satisfy it, and the Kummer isomorphism is false
  there.
- **The finite-level Galois dictionary.** Finite Galois intermediate fields `K ⊆ L ⊆ Kˢ` correspond
  to open normal subgroups of `G_K`; `G_K ⧸ U` is continuously isomorphic to `Gal(L/K)` for the
  corresponding `L`; `(Kˢ)^U = L`; and these subgroups are cofinal in the system Layer 4 uses.
  Most of this is Mathlib's infinite Galois correspondence
  (`InfiniteGalois.isOpen_and_normal_iff_finite_and_isGalois`,
  `InfiniteGalois.normalAutEquivQuotient`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`);
  what has to be added is the identification of the quotient as a **topological** group and the
  cofinality statement in the form Layer 4 consumes.
- **Hilbert 90, in two steps.** First, for a specified Galois extension `L/K` with `Gal(L/K)`
  profinite: `H¹(Gal(L/K), Lˣ) = 0` (NSW (6.2.1); multiplicative coefficients through `Additive`).
  Prove it by Layer 4's colimit from the pin's finite-level `groupCohomology.hilbert90`
  (`H1ofAutOnUnitsUnique`) through Layer 3's finite comparison and the dictionary above, citing the
  named quotient and fixed-field equivalences rather than "by Layer 4". Then specialize to
  `L = Kˢ`, which is the exported `hilbert90`, stated at `UnitsCoeff K` against the canonical
  carrier: Tau Ceti's `TauCeti.subsingleton_H1_additive_units` and `TauCeti.hilbert90`. Layer 4
  makes this proof possible. Write the proof so that a reader can see this.
  ⚠ The pin's `Rep` universe restriction (`k` and `G` in one universe, tracked in Mathlib #33608)
  touches exactly this comparison. Keep the profinite statement universe-clean and confine any
  workaround to the finite-level step.
- **The Kummer sequence and isomorphism**, for `[NeZero n]` and `hn : IsUnit (n : K)`. Split into
  agent-sized targets, in order. Tau Ceti implements all eight (`TauCeti.unitsCoeffPow_surjective`,
  `TauCeti.kummerShortExact`, `TauCeti.powerSubgroup`, `TauCeti.kummerMap` with
  `TauCeti.kummerMap_eq_kummerCocycleClass`, `TauCeti.kummerCocycleClass_congr`,
  `TauCeti.ker_kummerMap` and `TauCeti.kummerMap_surjective`, `TauCeti.kummerIso` with
  `TauCeti.kummerIsoTransport`, and `TauCeti.kummerMapCanonical` with
  `TauCeti.explicitIso_kummerMap`), and `Suggested.lean` carries them under the names below.
  1. Surjectivity of the `n`-th power map on `(Kˢ)ˣ`: for `a ≠ 0`, `Xⁿ - a` is separable when `n`
     is invertible, and `Kˢ` is separably closed (`SeparableClosure.isSepClosed`).
  2. The short exact sequence `1 → μₙ → (Kˢ)ˣ → (Kˢ)ˣ → 1` of discrete `G_K`-modules, with `μₙ` the
     `n`-torsion subgroup, as `kummerShortExact`, a `DiscreteShortExact` whose two maps are pinned
     to the named `kummerCoeffIncl` and `unitsCoeffPow`. Its long exact sequence is what puts
     `H²(G_K, μₙ)` inside the cohomological Brauer group: `h2KummerToUnits` is injective by
     Hilbert 90, with image the `n`-torsion.
  3. The subgroup of `n`-th powers `(Kˣ)ⁿ = (powMonoidHom n : Kˣ →* Kˣ).range` and the quotient
     type `Kˣ ⧸ (Kˣ)ⁿ`, again named.
  4. The connecting map `δ⁰ : Kˣ → H¹(G_K, μₙ)` from Layer 5, and the explicit cocycle description:
     for a chosen `n`-th root `α` of `a` in `Kˢ`, `δ⁰(a)` is the class of `g ↦ g α / α`.
  5. Independence of the choice of root: two roots differ by an element of `μₙ`, and the two
     cocycles differ by the corresponding coboundary.
  6. Multiplicativity of `δ⁰`, its kernel `(Kˣ)ⁿ`, and its surjectivity (Hilbert 90); the class
     map itself is `kummerMap`.
  7. The resulting isomorphism `kummerIso : Kˣ ⧸ (Kˣ)ⁿ ≅ H¹(G_K, μₙ)` (NSW, the display after
     (6.2.1), and (6.2.2) for the pairing form), with `kummerIsoTransport` for a consumer carrying
     its own model of `μₙ` through a continuous `G_K`-equivariant identification.
  8. The same class map against the canonical object, `kummerMapCanonical`, and its agreement with
     the explicit one under Layer 3, `explicitIso_kummerMap`. Both maps are named, so a consumer
     that works in all degrees moves between the two by citing this theorem rather than by
     transporting the isomorphism itself.
- **Functoriality in the field**, stated as two commuting squares rather than as naturality in `K`,
  which is not a statement without a chosen embedding of separable closures. For a **finite
  separable** extension `L/K` together with a `K`-embedding `L ↪ Kˢ`, which makes `Kˢ` a separable
  closure of `L` as well and `G_L = Gal(Kˢ/L)` an open subgroup of `G_K`:
  - restriction `H¹(G_K, μₙ) → H¹(G_L, μₙ)` corresponds to `Kˣ ⧸ (Kˣ)ⁿ → Lˣ ⧸ (Lˣ)ⁿ`, that is
    `kummerIso_res` against `powerClassMap`, which is Tau Ceti's `TauCeti.kummerIso_res`;
  - corestriction `H¹(G_L, μₙ) → H¹(G_K, μₙ)` corresponds to the norm `N_{L/K}`, that is
    `kummerIso_norm` against `powerClassNorm`.

  Both squares include the finiteness and separability hypotheses and the chosen embedding
  explicitly. These are the compatibilities that the Quadratic Form Invariants roadmap consumes,
  `kummerIso_res` and `kummerIso_norm`. That roadmap also reads its Layer 9 Kummer characters
  through `kummerMapCanonical`, `explicitIso_kummerMap` and Layer 3's `explicitIso_coeffMap`.
- **The field-extension bridge.** The operations of Layers 1, 10 and 13 are indexed by a
  **subgroup** of the ambient group, and a finite separable `L/K` supplies one only after an
  embedding is chosen. Both halves of the passage are targets here, not a consumer's work:
  `galoisSubgroup K L σ`, the open subgroup cut out by the embedding, with `galoisSubgroup_index`
  saying its index is `[L : K]`; and `galoisSubgroupEquiv`, the isomorphism of **topological**
  groups `G_L ≃ₜ* galoisSubgroup K L σ`, from which `galoisF2Iso` transports `𝔽₂`-cohomology.
  The first two halves are Tau Ceti's `TauCeti.galoisSubgroup`, `TauCeti.galoisSubgroup_index` and
  `TauCeti.galoisSubgroupEquiv`, in
  `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean`.
  On top of those, `galoisRes`, `galoisCor` and `galoisEvens` are Layer 1's `res`, Layer 10's
  `corestriction` and Layer 13's `evensNormIndexTwo` read through the transport, each with a real
  body so that no second copy of those operations exists, together with `galoisConj` for the
  conjugate class of a quadratic extension and `galoisCharacter`, the class
  `χ_{L/K} ∈ H¹(G_K, 𝔽₂)` of the character with kernel `G_L`, which is Layer 13's
  `indexTwoCharacterClass` at `galoisSubgroup`. Their laws are targets too, each by name.
  `galoisRes_galoisCor`: at index two `res ∘ cor = id + galoisConj`, which holds by the definition
  of `galoisConj`. `galoisConj_evensConj`: `galoisConj` is the transport of Layer 13's `evensConj`
  through `galoisF2Iso`, which is what lets the index-two identities be read on the `L/K` side.
  The two cup compatibilities: `galoisRes_cup`, restriction preserves the mod-2 cup, an instance
  of Layer 12's `cup_res` at `f2Pairing`; and `galoisCor_cup`, the projection formula
  `cor (res x ⌣ y) = x ⌣ cor y`, an instance of Layer 12's `cup_projection`. The Evens identities
  at the bridge: `galoisRes_galoisEvens`, `res N^{Ev}(x) = x ⌣ galoisConj x`, the transport of
  `evensNorm_res`; `galoisEvens_add`,
  `N^{Ev}(x + y) = N^{Ev} x + N^{Ev} y + cor (x ⌣ galoisConj y)`, the transport of
  `evensNorm_polarization`, with the **conjugate** class in the cross term; and
  `galoisEvens_galoisRes`, `N^{Ev}(res y) = y ⌣ y + χ_{L/K} ⌣ y`, the transport of
  `evensNorm_of_res`. The index-two exact sequence at the bridge: `galoisRes_eq_zero_iff`, the
  kernel of `res : H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)` is `χ_{L/K} ⌣ H¹(G_K, 𝔽₂)`, and
  `galoisRes_galoisCor_exact`, restriction then corestriction is exact at `H¹(G_L, 𝔽₂)` and at
  `H²(G_L, 𝔽₂)`; all of these need `[L : K] = 2`. Functoriality in a tower is `galoisRes_comp`,
  and independence of the embedding is `galoisRes_embedding_independent` with its three
  companions for `galoisCor`, `galoisEvens` and `galoisCharacter`, which is what makes every
  statement downstream a statement about `L/K` rather than about a chosen `σ`. A consumer that
  built these adapters itself would be building restriction, corestriction and the norm a second
  time, with nothing saying that its copies agreed with these. The coefficients are the trivial
  `𝔽₂` object, because that is where the Evens norm lives; at other coefficients a consumer uses
  `res` and `corestriction` at `galoisSubgroup` directly, together with whatever coefficient
  comparison its own modules need.
- **The mod-2 specialization.** Under `h2 : IsUnit (2 : K)`, with `μ₂ = {±1} ⊆ K` carrying the
  trivial action and `𝔽₂ = ZMod 2` written additively: the Kummer class `[a] ∈ H¹(G_K, 𝔽₂)` with
  cocycle `g ↦ 0` if `g √a = √a` and `1` otherwise, the square-class isomorphism
  `Kˣ ⧸ (Kˣ)² ≃ H¹(G_K, 𝔽₂)`, and the `𝔽₂`-valued pairing `[a] ⌣ [b]`. This is the specialization
  of `kummerIso` at `n = 2` and the trivial action, and it is what the quadratic-form consumers
  name.
  ⚠ Do not assume `CharZero`. The hypothesis is `IsUnit (n : K)` with `[NeZero n]`, so finite
  fields of odd characteristic remain in scope for `n = 2`.

**API** for `μₙ` and the power classes. Constructors: `μₙ` as the `n`-torsion subgroup of `(Kˢ)ˣ`,
`(Kˣ)ⁿ` as the range of `powMonoidHom n`, and `Kˣ ⧸ (Kˣ)ⁿ`. Worked example: `n = 2` over `ℚ`, where
`H¹(G_ℚ, 𝔽₂) ≅ ℚˣ ⧸ (ℚˣ)²` and `[a]` is the explicit square-root cocycle. Morphisms: the Kummer
map `Kˣ → H¹(G_K, μₙ)` and the isomorphism it induces. Functoriality: the two commuting squares in
the field, for a finite separable `L/K` with a chosen embedding, one for restriction and one for
the norm. Comparison: with Mathlib's `autEquivRootsOfUnity` at the finite level. Naturality: of the
connecting map in the short exact sequence. Edge cases: `n = 1`; `μₙ ⊆ K`, where the action is
trivial and the isomorphism is with `Hom_cont(G_K, μₙ)`; and `K` separably closed, where both sides
vanish. Consumers: the Class Field Theory and Quadratic Form Invariants roadmaps.

**Source** for the Kummer isomorphism. NSW (6.2.1) and the display after it, with (6.2.2) for the
pairing form. The hypotheses are `[NeZero n]` and `IsUnit (n : K)`. The false neighbor is the
same statement over the algebraic closure: for imperfect `K` the fixed field of `Aut(K̄/K)` is the
purely inseparable closure, so the invariants of `(K̄)ˣ` are not `Kˣ` and the left-hand term is
wrong. This is why the layer uses `SeparableClosure K` throughout. Separately, and not a false
statement but a needlessly narrow one, `CharZero K` in place of `IsUnit (n : K)` is true and
excludes the finite fields of odd characteristic that the `n = 2` applications run on; state the
hypothesis that is actually used.

### Layer 10: continuous cohomology in all degrees

**Prerequisites.** Mathlib: `continuousCohomology`, `TopRep.resolutionX`,
`ContinuousCohomology.resolutionMap`, `ContinuousCohomology.cochainsMap`,
`ContinuousCohomology.map`, `HomologicalComplex.homologyMap`, `QuasiIso`,
`quasiIsoAt_iff_isIso_homologyMap`, `ProfiniteGrp.closedSubgroup_eq_sInf_open`. Tau Ceti:
`ContinuousMap.exists_extension_of_discrete`, `TauCeti.coindTopRep`, `TauCeti.coindCounit` and
`TauCeti.coindTraceHom` (`Coinduced/Functor.lean`), `TauCeti.ContinuousMonoidHom.subgroupSubtype`.
This roadmap: Layers 1, 3, 4, 5, 6 and 7.

Everything above except Layer 3's comparison is stated in degrees `0, 1, 2`, because that is where
explicit cochains are usable. Cohomological dimension, dévissage, the general torsion statements
and the Evens norm are all-degree statements, and they all rest on this layer. It is stated
against the canonical object of Layer 1 throughout.

- `Hⁿ(G, M)` for all `n`, for a profinite `G` and a discrete `G`-module `M`, as the canonical
  `continuousCohomology n` applied to the image of `M` under Layer 0's dictionary, with `ℤ` the
  default coefficient ring.
- Restriction, inflation, coefficient maps and conjugation in every degree, with their composition
  laws, and their agreement in degrees `0, 1, 2` with Layer 2's explicit maps under Layer 3.
- **The all-degree finite-quotient colimit.** For every `n`, construct the functor
  `continuousFiniteQuotientSystem n`, the inflation-and-inclusion comparison cocone
  `continuousFiniteQuotientCocone n`, and the universality proof
  `continuousFiniteQuotientColimit n` over `(OpenNormalSubgroup G)ᵒᵖ`. Pin its object and arrow
  formulas and prove naturality in coefficients. The resulting theorem
  `Hⁿ(G, M) ≅ colim_U Hⁿ(G ⧸ U, M^U)` agrees with every Layer 4 system in degrees `0, 1, 2`.
- **Filtered coefficient colimits.** Package the canonical carrier as
  `continuousCohomologyFunctor n` on smooth discrete coefficients and prove
  `continuousCohomology_preservesFilteredColimits`. Layer 11 cites this theorem, not an unnamed
  compactness argument.
- **The long exact sequence in every degree.** Convert a `DiscreteShortExact` sequence into the
  named short complex `continuousCochainsShortExact`; prove it degreewise short exact by the
  discrete cochain-lifting lemma, obtaining `continuousCochainsShortExact_shortExact`. Apply
  Mathlib's `HomologicalComplex.HomologySequence`/snake construction to define `delta`, then state
  `longExact_exact` at all three repeating nodes, `delta_naturality` for a morphism of short exact
  sequences, and the named compatibilities `delta_res`, `delta_infl`, and
  `delta_corestriction`. Finally prove agreement with Layer 5's `explicitDelta0` and
  `explicitDelta1` (`explicitIso_delta0`, `explicitIso_delta1`). This construction is required
  because the pinned continuous-cohomology `Basic.lean` deliberately leaves long exact sequences
  as a TODO; the carrier alone does not supply them. Tau Ceti supplies it:
  `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact` (`ExactCochains.lean`),
  `delta`, `longExact_exact₁`, `longExact_exact₂`, `longExact_exact₃` and `delta_res`
  (`HomologySequence.lean`), `delta_infl` (`Inflation/ConnectingMap.lean`), and
  `explicitIso_delta0`, `explicitIso_delta1` (`ConnectingMapComparison.lean`); Tau Ceti's short
  exactness of the cochain sequence is stated after forgetting the topology, so
  `continuousCochainsShortExact_shortExact`, `delta_naturality` for a morphism of coefficient short
  complexes, and `delta_corestriction` remain targets here.
- **All-degree Shapiro and dimension shifting.** For a closed subgroup `H` and a smooth discrete
  `A`, the compatible pair of the inclusion `H ↪ G` and the counit of coinduction, evaluation at
  `1` (Tau Ceti's `TauCeti.coindCounit`), gives Mathlib's cochain map `shapiroCochainMap` from the
  homogeneous cochains of `G` with coefficients `Coind_H^G A` to those of `H` with coefficients
  `A`, and the map it induces on homology, the canonical Shapiro map `shapiroMap` (Mathlib's
  `ContinuousCohomology.map` at that pair), which is restriction to `H` followed by the
  coefficient map of evaluation at `1`. Shapiro's lemma in every degree is that this cochain map is
  a quasi-isomorphism: `isIso_shapiroMap` in every degree, equivalently
  `quasiIso_shapiroCochainMap`. `shapiroIso` is `shapiroMap` as an isomorphism (`shapiroIso_hom`),
  so nothing about it depends on a choice. The proof is by induction on the degree. Degrees `0`
  and `1` are `explicitShapiro0` and `explicitShapiro1` under Layer 3's comparisons. For `n ≥ 1`,
  take the short exact sequence `0 → A → Coind_1^H A → Q → 0` (Tau Ceti's `coindBotShortExact`)
  and its coinduction to `G`, which is exact because `H` is closed (`coindFunctor_map_shortExact`).
  The connecting maps of the two sequences commute with the Shapiro maps, the Shapiro map being
  restriction followed by a coefficient map (`delta_res`, `delta_naturality`), and both are
  isomorphisms in positive degree because both middle terms are acyclic: `Coind_1^H A` by
  `coindAcyclic` for `H`, and `Coind_H^G (Coind_1^H A)`, which transitivity of coinduction
  identifies with `Coind_1^G A`, by `coindAcyclic` for `G`. So degree `n + 1` for `A` is degree
  `n` for `Q`. The argument runs over `ℤ`; over another coefficient ring the cohomology is that of
  the underlying abelian groups, compatibly with the maps of compatible pairs. Tau Ceti has the case
  `R = ℤ` on the image of the dictionary, proved by this route, as
  `TauCeti.ContinuousCohomology.shapiroMap`, `isIso_shapiroMap` and `shapiroIso`
  (`Shapiro/Canonical.lean`, `Shapiro/AllDegrees.lean`), with the transitivity
  `TauCeti.DiscreteCoind.transIsoBot`, and it has the change of coefficient ring as
  `TauCeti.ContCohomology.restrictScalarsIntIso`; all of these landed after this repository's Tau
  Ceti pin. ⚠ Do not ask for an isomorphism of the two homogeneous-cochain complexes: none exists.
  A degree-0 homogeneous cochain is determined by its value at `1`
  (`TauCeti.ContCohomology.cochainEquiv0`), so for `G = C₂`, `H = 1` and `A = 𝔽₂` the degree-0
  terms are `Coind_1^{C₂} 𝔽₂ = 𝔽₂^{C₂}`, of order `4`, and `𝔽₂`, of order `2`; only the maps
  induced on cohomology are isomorphisms. Prove that `shapiroMap` agrees in degrees `0, 1, 2` with
  `explicitShapiro0/1/2`. Construct the embedding into the trivial-subgroup coinduced module and
  its quotient (for a discrete module, Tau Ceti's `coindBotEmbedding` and `DimensionShiftQuotient`),
  prove `coindAcyclic` in every positive degree (Tau Ceti's `TauCeti.ContCohomology.coindAcyclic`,
  `Coinduced/Acyclic.lean`, which landed after this repository's Tau Ceti pin), and derive the named
  `dimensionShiftIso : Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)` for `i ≥ 1`.
- **Corestriction in every degree, through coinduction.** Mathlib has no all-degree cohomological
  transfer and Layer 6 builds one only in degrees `0, 1, 2`, so this layer builds it, in five
  milestones rather than one:
  1. the **trace morphism** `tr_U^G : Coind_U^G (res_U M) → M` for open `U ≤ G`, given by
     `f ↦ ∑_{gU ∈ G ⧸ U} g • f (g⁻¹)`; the sum is finite because the index is, the value is
     independent of the coset representatives because `f` is `U`-equivariant, and the result is a
     morphism of discrete `G`-modules. Tau Ceti supplies it: the trace is `TauCeti.coindTrace`
     (`Coinduced.lean`), and the morphism is `TauCeti.coindTraceHom` (`Coinduced/Functor.lean`),
     which `coindTrace` here is;
  2. all-degree corestriction as the composite
     ```
     Hⁿ(U, res_U M) ≅ Hⁿ(G, Coind_U^G (res_U M)) → Hⁿ(G, M),
     ```
     the first map this layer's Shapiro isomorphism and the second the image of `tr_U^G`;
  3. naturality in `M` (`corestriction_naturality`), transitivity `cor_V^G = cor_U^G ∘ cor_V^U`
     for open `V ≤ U ≤ G` (`corestriction_trans`, through the relative `corestrictionLe`),
     `cor ∘ res = (G : U) • id` (`corestriction_comp_res`), and compatibility with the connecting
     maps of the long exact sequence, each in every degree;
  4. the Mackey double-coset formula in every degree (`mackeyTerm`, `corestriction_mackey`);
  5. agreement in degrees `0, 1, 2` with Layer 6's explicit transversal formulas, under Layer 3:
     `explicitIso_cor0`, `explicitIso_cor`, `explicitIso_cor2`, one per degree.
  ⚠ The finite index is used in milestone 1 and nowhere else. Do not define the all-degree
  corestriction by an all-degree cochain formula: the canonical model is built from homogeneous
  cochains through a coinduction resolution and has no inhomogeneous cochains to write one on.
- **Vanishing on a closed subgroup descends to an open one** (NSW (1.5.1), the injectivity half,
  for a closed `H` as the inverse limit of the open subgroups containing it). For profinite `G`, a
  closed subgroup `H` and a smooth discrete `X`, a class `x ∈ Hⁿ(G, X)` with `res_H x = 0` has
  `res_U x = 0` for some open subgroup `U ⊇ H`, in every degree
  (`exists_openSubgroup_res_eq_zero_of_res_eq_zero`). With `corestriction_comp_res` it carries
  prime-to-`p` arguments from open subgroups to closed ones; the Profinite Pro-`p` Groups roadmap
  consumes it for restriction to a `p`-Sylow subgroup. The proof stays on Mathlib's canonical
  complex and never passes to functions on `Gⁿ`. A homogeneous `n`-cochain is a `G`-invariant
  element of the resolution term `TopRep.resolutionX X (n + 1)`, the iterated function space
  `C(G, C(G, …, X))`, and restriction to a subgroup `S` is `ContinuousCohomology.resolutionMap`
  along the inclusion `S ↪ G` with the identity on coefficients, which evaluates the iterated map
  on tuples from `S`. Three facts about the resolution, each by induction on the degree, carry it:
  1. the restriction of an element to `S` vanishes exactly when the element vanishes on every
     tuple of points of `S`;
  2. an element vanishing on the tuples from `H` vanishes on the tuples from some open subgroup
     `U ⊇ H`: at each stage the continuous map takes finitely many values on the compact `H`,
     each of which vanishes on an open set around `H` by induction, and an open set around the
     closed subgroup `H` contains an open subgroup containing it
     (`ProfiniteGrp.closedSubgroup_eq_sInf_open` and compactness of the complement);
  3. in positive degree, an `H`-invariant element of the resolution of the restriction of `X` to
     `H` is the restriction of a `G`-invariant element of the resolution of `X`: its value at `1`
     lifts to the resolution of `X`, degree by degree, by extending continuous maps from the
     closed subspace `H` into a discrete space (`ContinuousMap.exists_extension_of_discrete`), and
     the orbit map of the lift is continuous because the resolution of a smooth discrete object of
     a compact group is again smooth discrete, by Layer 7's uniform local constancy
     (`TauCeti.IsSmoothDiscrete.resolutionX`).

  Write `x` as the class of a cocycle `z`. Then `res_H x = 0` makes the restriction of `z` a
  coboundary `d w`, fact 3 extends `w` to a `G`-invariant cochain `W`, the restriction of `z - d W`
  to `H` is `0`, so by facts 1 and 2 its restriction to some open `U ⊇ H` is `0`, and there
  `res_U z = d (res_U W)`. Tau Ceti has the theorem as
  `TauCeti.ContinuousCohomology.exists_openSubgroup_le_res_eq_zero`, stated against
  `TauCeti.ContinuousCohomology.res`, which is, like Layer 1's `res`, Mathlib's `map` along the
  inclusion with the identity on coefficients, and it has facts 1 to 3 as
  `TauCeti.ContinuousCohomology.resolutionMap_subgroupSubtype_eq_zero_iff`,
  `TauCeti.ContinuousCohomology.exists_openSubgroup_le_resolutionMap_subgroupSubtype_eq_zero` and
  `TauCeti.ContinuousCohomology.exists_mem_invariants_resolutionMap_subgroupSubtype_eq`, in
  `TauCeti/RepresentationTheory/Homological/ContCohomology/ClosedSubgroup.lean`.
- **Annihilation and torsion** (NSW (1.6.1); Brown III (10.1) is the discrete model). For
  profinite `G` and `i ≥ 1`: a class of `Hⁱ(G, M)` annihilated by restriction to an open `U` is
  annihilated by `(G : U)`; every element of `Hⁱ(G, M)` is torsion; and `Hⁱ(G, M) = 0` when `M` is a
  `ℚ`-vector space. The `p`-primary refinement for pro-`p` groups belongs to
  the Profinite Pro-`p` Groups roadmap; state here the general
  torsion statement and the finite-level annihilation the orders of the `G ⧸ U` provide.

**API** for the all-degree package. Constructors: Layer 1's carrier, with the operations of this
layer. Worked example: `Hⁱ(Ẑ, -)` in every degree, which is where the torsion corollary is first
visible. Morphisms: restriction, inflation, coefficient maps, conjugation and corestriction, in
every degree. Functoriality: the composition laws for each, and the long exact sequence.
Comparison: agreement in degrees `0, 1, 2` with Layers 2, 4, 6 and 7, one lemma per operation.
Naturality: of the connecting maps and of the colimit isomorphism. Edge cases: `n = 0`, which is
Layer 1's `continuousCohomologyZeroIso`; the trivial group; and `M` a `ℚ`-vector space, where
every positive degree vanishes. Consumers: Layer 11 in full, and Layer 12 for the graded product.

**Source** for the all-degree Shapiro lemma. NSW (1.6.4), with the p. 61 footnote on `Ind`;
Ribes-Zalesskii Thm. 6.10.5; NSW (1.3.7) for the dimension-shifting argument. The hypotheses are
`G` profinite and `H` closed; closedness is used for the explicit base cases and for exactness of
coinduction on the right. The false neighbor is an isomorphism of the homogeneous-cochain
complexes themselves, which fails already in degree `0` for `G = C₂`, `H = 1`, `A = 𝔽₂`: only
the comparison cochain map exists, and it is a quasi-isomorphism.

**Source** for the all-degree corestriction. Brown, *Cohomology of Groups*, III §9 gives five
constructions of the transfer, of which the one used here is the coinduced-module construction;
NSW (1.5.7) is the identity it has to satisfy. The hypothesis is that `U` is open, equivalently of
finite index in the compact case. The narrow neighbor to avoid is defining it only where an
inhomogeneous cochain formula is available, which is degrees `0, 1, 2`; the point of this
construction is that it needs no cochains at all.

**Source** for the descent from a closed subgroup. NSW (1.5.1), for `H` the inverse limit of the
open `U ⊇ H`, and Serre, *Galois Cohomology* I §2.2 Prop. 8. Both prove it on inhomogeneous
cochains `Gⁿ → A`, the description of the canonical complex that Mathlib leaves as a TODO; the
route above needs none of it. The hypotheses are `G` profinite, `H` closed and `X` smooth
discrete, and closedness is used twice: `H` is compact in fact 2 and a closed subspace in fact 3.
The false neighbor is a levelwise shortcut through the finite-quotient colimit. At a level `V`
the classes of `HV` and of `H` lie over the same finite group `HV ⧸ V ≅ H ⧸ (H ⊓ V)`, but with
coefficients `X^V ⊆ X^{H ⊓ V}`, and that inclusion need not be injective on cohomology: for `C₂`
the diagonal `𝔽₂ ↪ 𝔽₂[C₂]` kills `H¹(C₂, 𝔽₂) = 𝔽₂`, since `H¹(C₂, 𝔽₂[C₂]) = 0`. So vanishing on
`H` at a level does not give vanishing on `HV` at that level.

**Source** for the torsion statement. NSW (1.6.1); Brown III (10.1) is the discrete model. The
hypotheses are `G` profinite and `i ≥ 1`. The false neighbor is the same statement in degree `0`,
where `H⁰(G, M) = M^G` is not torsion in general, and the `p`-primary refinement for pro-`p`
groups, which is the Profinite Pro-`p` Groups roadmap's and not this one's.

### Layer 11: cohomological dimension

**Prerequisites.** Mathlib: `ENat`, `AddCommGroup.primaryComponent`,
`CategoryTheory.Simple`, `IsSimpleModule`; for the class-module theorem also
`TopologicalAbelianization`, `MonoidHom.transfer` with `MonoidHom.transfer_def`, and the finite
group theory of §4's last bullet (`Sylow`, `Sylow.nonempty`, `Sylow.not_dvd_index`,
`Sylow.card_eq_multiplicity`, `IsPGroup.center_nontrivial`, `exists_prime_orderOf_dvd_card'`,
`Subgroup.normal_of_le_center`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
`QuotientGroup.quotientKerEquivRange`, `QuotientGroup.quotientQuotientEquivQuotient`,
`Subgroup.subgroupOfEquivOfLe`, `Subgroup.quotient_finite_of_isOpen`,
`Subgroup.finiteIndex_of_finite_quotient`, `Subgroup.isOpen_mono`, `Nat.factorization_def`).
Tau Ceti: the invariants and their theory in
`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension.lean`
(`TauCeti.CohomologicalDimensionLE`, `TauCeti.StrictCohomologicalDimensionLE`,
`TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`,
`TauCeti.cohomologicalDimension`, `TauCeti.cohomologicalDimensionAt_le_iff`,
`TauCeti.strictCohomologicalDimensionAt_le_iff`,
`TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt` and
`TauCeti.isPPrimaryTorsion_continuousCohomology`), `TauCeti.leastENatBound`,
`TauCeti.IsPPrimaryTorsion`, `TauCeti.ofDiscreteModule_V`, `TauCeti.maximalProPQuotient` with
`TauCeti.maximalProPQuotient.map` and `TauCeti.maximalProPQuotient.lift`, `TauCeti.IsProP` with
`TauCeti.isProP_maximalProPQuotient`, the conjugation action
`TopologicalAbelianization.instMulDistribMulActionQuotient` with its `ContinuousSMul` instance,
`TauCeti.GroupExtension.contCohomologyClass_factorSet_eq`, and the explicit low-degree operations
at arbitrary topological coefficients `TauCeti.ContCohomology.explicitRes1`, `explicitRes2`,
`explicitInfl1`, `explicitInfl2`, `explicitInfRes_exact`, `explicitMap1`, `explicitMap2`,
`explicitMap2Equiv`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2`. This roadmap: Layer 10;
the class-module theorem also Layers 2, 3, 5, 6 and 7.

For profinite `G` and a prime `p`; NSW III §3 is the source of record. This layer rests on
Layer 10.

- **Types and definitions.** The three invariants `cd_p`, `scd_p` and `cd` are valued in `ℕ∞`
  (Mathlib's `ENat`). The first two are infima of `Prop`-valued predicates on `ℕ`, and each
  predicate is named and stated in its own right rather than folded into the infimum. In the four
  headers below `M` ranges over discrete `G`-modules with continuous action in the unbundled
  classes of §3, and `Hⁱ(G, M)` is Mathlib's `continuousCohomology i (ofDiscreteModule G M)`;
  `leastENatBound` sends a predicate on `ℕ` to the infimum in `ℕ∞` of the naturals satisfying it,
  and to `⊤` when none does.
  ```lean
  IsPPrimaryTorsion (p : ℕ) (M : Type*) : Prop :=
    ∀ m : M, m ∈ AddCommGroup.primaryComponent M p

  CohomologicalDimensionLE (p : ℕ) (G : Type u) (n : ℕ) : Prop :=
    ∀ M : Type u, IsPPrimaryTorsion p M → ∀ i : ℕ, n < i → Subsingleton Hⁱ(G, M)

  StrictCohomologicalDimensionLE (p : ℕ) (G : Type u) (n : ℕ) : Prop :=
    ∀ M : Type u, ∀ i : ℕ, n < i → (Hⁱ(G, M)).primaryComponent p = ⊥

  cd_p  (p : ℕ) (G : Type u) : ℕ∞ := leastENatBound (CohomologicalDimensionLE p G)
  scd_p (p : ℕ) (G : Type u) : ℕ∞ := leastENatBound (StrictCohomologicalDimensionLE p G)
  ```
  All of these are Tau Ceti's: `TauCeti.IsPPrimaryTorsion`, `TauCeti.CohomologicalDimensionLE`,
  `TauCeti.StrictCohomologicalDimensionLE`, `TauCeti.cohomologicalDimensionAt` and
  `TauCeti.strictCohomologicalDimensionAt`, with `TauCeti.leastENatBound` and
  `TauCeti.cohomologicalDimension` for `cd`. Tau Ceti lets the coefficients range over
  `Type (max u v)` for an extra universe `v`; this roadmap reads its invariants at `v = 0`, which is
  §3's convention that the coefficients live in the universe of the group, and `Suggested.lean`
  carries its names as abbreviations of the Tau Ceti declarations at that universe. So
  `cd_p G ≤ n ↔ CohomologicalDimensionLE p G n` (`cd_p_le_iff`, which is
  `TauCeti.cohomologicalDimensionAt_le_iff`), and `cd_p G = ⊤` exactly when no bound holds; likewise
  for `scd_p` (`scd_p_le_iff`). Finally `cd G = ⨆ p, cd_p G` in `ℕ∞`, over primes `p`. The
  definitions do not use that `p` is prime; they are meant for prime `p`, and the theorems below
  that need primality carry `[Fact p.Prime]`.

  In the headers `M` ranges over **arbitrary** discrete `G`-modules in the unbundled classes of §3,
  subject only to the stated primary-torsion condition. Restricting the ordinary predicate to
  coefficients of bounded exponent would define a different invariant by fiat; that the two agree
  is `cd_p_le_iff_boundedExponent` below, a theorem proved through Layer 10's compatibility with
  filtered colimits.

  The ordinary and the strict predicate differ in both places at once, and swapping either half
  gives the wrong invariant. Ordinary dimension asks the whole of `Hⁱ` to vanish, but only for
  `p`-primary torsion coefficients; strict dimension allows arbitrary discrete coefficients, but
  asks only the `p`-primary part of `Hⁱ` to vanish. In particular `scd_p` still depends on `p`:
  defining it by vanishing of all of `Hⁱ(G, M)` for all discrete `M` would drop `p` from the
  statement. Here `p`-primary means every element is annihilated by a power of `p`
  (`AddCommGroup.primaryComponent`, which also supplies `.primaryComponent p` above). Also state
  and prove the equivalence of `CohomologicalDimensionLE` with the other common interface for
  *ordinary* dimension, vanishing of the `p`-primary component of `Hⁱ(G, M)` for every discrete
  **torsion** `M`, so that both may be used; NSW (3.3.1) states the latter and
  `cohomologicalDimensionLE_iff_torsion` is the theorem. That second interface
  is one torsion hypothesis away from the strict predicate, so keep the three statements apart.
- **`p`-primary coefficients give `p`-primary cohomology.** For profinite `G` and a discrete
  `p`-primary torsion `G`-module `M`, `Hⁿ(G, M)` is `p`-primary torsion in every degree, `n = 0`
  included (`isPPrimaryTorsion_continuousCohomology`, proved by Tau Ceti's theorem of the same
  name). Read at a class `x`, this is a `k : ℕ` with
  `p ^ k • x = 0` (`AddCommGroup.mem_primaryComponent`). The proof is on Mathlib's canonical
  complex, with no functions on `Gⁿ` and no finite quotients, and it uses only compactness of `G`.
  A continuous map from the compact `G` into a discrete `p`-primary group has finite image, so a
  single power of `p` kills it (`TauCeti.IsPPrimaryTorsion.continuousMap`). Every term
  `C(G, C(G, …, M))` of the coinduced resolution is discrete, so by induction on the number of
  arguments every term is `p`-primary (`TauCeti.isPPrimaryTorsion_resolutionX`); so are the
  homogeneous cochains, which are invariant elements of those terms
  (`TauCeti.isPPrimaryTorsion_homogeneousCochains`), and their cohomology, a subquotient
  (`TauCeti.isPPrimaryTorsion_continuousCohomology`, stated for Tau Ceti's dictionary
  `TauCeti.ofDiscreteModule`, whose underlying module is `M` by `TauCeti.ofDiscreteModule_V`).
  It is the step from the strict predicate to the ordinary one in `cd_p_le_scd_p`. The Profinite
  Pro-`p` Groups roadmap consumes it for restriction to a `p`-Sylow subgroup, where it supplies the
  power of `p` that a prime-to-`p` index is played against.
- **Dévissage** (NSW (3.3.2)), in three reductions, each stated as an equivalence with
  `cd_p p G ≤ n` so that it can be used in both directions:
  1. `cd_p_le_iff_boundedExponent`: it is enough to test the modules killed by a single power of
     `p`, because an arbitrary `p`-primary module is the filtered colimit of its `pᵏ`-torsion
     submodules and Layer 10's cohomology commutes with those colimits;
  2. `cd_p_le_iff_finite_pPrimary`: it is enough to test the single degree `n + 1` on **finite**
     discrete `p`-primary modules, by Layer 10's colimit, long exact sequence and dimension
     shifting;
  3. the same test on the finite **simple** such modules. "Simple" is spelled as follows: a finite
     discrete `p`-primary `G`-module `M` is simple if it is
     nontrivial, `p • M = 0`, and, for one (equivalently any) open normal `U` acting trivially on
     `M`, the corresponding object of `Rep (ZMod p) (G ⧸ U)` is `CategoryTheory.Simple`. Prove the
     independence of `U` as part of the milestone, and include all finiteness hypotheses in the
     reduction theorem.

  For `G` pro-`p` the single module `𝔽_p` suffices (NSW (3.3.2) final clause;
  Koch Def. 5.1 takes that as the definition); that refinement lives in
  the Profinite Pro-`p` Groups roadmap, built on this layer.
- **Subgroups.** Three theorems:
  1. `cd_p_le_of_isClosed`, that is `cd_p H ≤ cd_p G` for closed `H ≤ G`, by coinduction and
     Shapiro for the cofinal open case and then the limit argument (NSW (3.3.5), Ribes-Zalesskii
     Thm. 7.3.1);
  2. `cd_p_eq_of_index_not_dvd`, equality when `H` is open of index prime to `p`, from Layer 10's
     `cor ∘ res`;
  3. `cd_p_le_scd_p` and `scd_p_le_cd_p_add_one`, that is `cd_p G ≤ scd_p G ≤ cd_p G + 1`
     (NSW (3.3.3)). State all three as inequalities in `ℕ∞`,
     including the case `cd_p G = ⊤`, where `⊤ + 1 = ⊤`.
- **First values.** `cd_p G = 0` if and only if `Hⁱ(G, M) = 0` in positive degrees for every
  `p`-primary `M`; `cd_p Ẑ = 1` for every `p` (the worked example in §6); and `H²(Ẑ, M) = 0` for
  finite `M`.
  ⚠ Do not attempt values of `cd_p G_K` or `scd_p G_K` for local fields here. They are
  the Class Field Theory roadmap's `cd_ℓ(G_K) = 2` and `scd_ℓ(G_K) = 2`, for `K/ℚ_p` finite and
  every prime `ℓ`, which rest on its local duality and class formation, on the Profinite Pro-`p`
  Groups roadmap's Sylow equality, and from this layer on `cd_p_le_of_isClosed`, `cd_p_le_scd_p`,
  and the strict-dimension criterion `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` at
  `n = 2`. The `p`-Sylow equality
  `cd_p G = cd_p G_p` (NSW (3.3.6)) belongs to the Profinite Pro-`p` Groups roadmap together with
  the profinite Sylow theory it consumes; this layer supplies the definitions, the monotonicity,
  the prime-to-`p` equality, and Layer 10's all-degree tools that the Sylow argument uses.
- **The strict dimension from the ordinary one** (NSW (3.3.4) and its proof). Two milestones.
  `strictCohomologicalDimensionAt_openSubgroup_le`: `scd_p U ≤ scd_p G` for an open subgroup `U`
  (NSW (3.3.5)), since `Hⁱ(U, A) ≅ Hⁱ(G, Coind_U^G A)` by Layer 10's Shapiro isomorphism. And
  `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`: `scd_p G ≤ n` if and only if
  `cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for every open `U`, with `ℤ`
  carrying the trivial action. The forward direction is `cd_p ≤ scd_p` with the first milestone.
  For the converse, `scd_p G ≤ cd_p G + 1` (NSW (3.3.3)) disposes of the degrees above `n + 1`. In
  degree `n + 1`, a discrete module finitely generated over `ℤ` is a quotient `B ⧸ C` with
  `B = Coind_U^G (ℤ^m)` for an open `U` acting trivially on it; the `p`-primary parts of
  `H^{n+1}(G, B) ≅ H^{n+1}(U, ℤ)^m` and of `H^{n+2}(G, C)` vanish, and passing to `p`-primary parts
  is exact on torsion groups (Layer 10's torsion statement); Layer 10's filtered colimits then give
  every discrete module. NSW states the criterion as "if `cd_p G = n` is finite, then `scd_p G = n`
  if and only if …"; the `≤` form holds for every `n` and is the one stated.
- **The class module of a group of strict dimension two** (NSW (3.6.4), (i) ⇒ (iii), in
  `p`-primary form). For open subgroups `V ◁ U` of `G`, `V^ab(p)` is the maximal pro-`p` quotient
  of the topological abelianization of `V` (`abelianizationProP`: Tau Ceti's `maximalProPQuotient`
  of Mathlib's `TopologicalAbelianization`), with the conjugation action of `U ⧸ V`
  (`abelianizationProPAction`, carried from Tau Ceti's action on the topological abelianization),
  and `u_{U/V}(p) ∈ H²(U ⧸ V, V^ab(p))` is the class of the extension
  `1 → V^ab(p) → U ⧸ K → U ⧸ V → 1`, where `K` is the kernel of `V → V^ab(p)`: in Layer 2's
  explicit `H²`, the class of the factor set `(σ, τ) ↦ σ.out * τ.out * (σ * τ).out⁻¹` read in
  `V^ab(p)`, with representatives chosen by `Quotient.out` (`abelianizationProPFactorSet`,
  `abelianizationProPClass`). Openness of `V` is what makes this factor set a continuous cocycle,
  since `U ⧸ V` is then finite and discrete and every cochain on it is continuous; so
  `abelianizationProPFactorSet_mem_Z2` and `abelianizationProPClass` take the proof that `V` is
  open. The class is the class of the extension for every continuous section
  (`TauCeti.GroupExtension.contCohomologyClass_factorSet_eq`). The theorem: if `scd_p G ≤ 2`, then
  `H¹(U ⧸ V, V^ab(p)) = 0` and `H²(U ⧸ V, V^ab(p))` is cyclic of order the `p`-part of
  `#(U ⧸ V)`, generated by `u_{U/V}(p)`. `Suggested.lean` states it for `U = G`
  (`subsingleton_h1_abelianizationProP`, `abelianizationProPClass_generates`); a pair `V ◁ U` is the
  case of the group `U`, whose strict dimension is at most that of `G`. The route has five
  sub-milestones, each in the `p`-primary form that NSW leaves implicit. The first two are NSW's
  proof of (i) ⇒ (ii). The last three prove (ii) ⇒ (iii) by direct statements about Layer 2's
  explicit model in place of NSW's diagram (3.6.2) and its snake lemma, so that no group homology
  and no Tate cohomology enters. All the finite-group cohomology below is the explicit `H¹` and `H²`
  of a finite discrete quotient with the profinite coefficients `V^ab(p)`: every cochain on a
  discrete group is continuous, and Layer 2's restriction, inflation and compatible-pair pullback
  and Layer 6's corestriction need no discreteness of the coefficients. The maps of the route are
  built from Tau Ceti's explicit operations, which carry none: restriction at these coefficients
  (`abelianizationProPRes1`, `abelianizationProPRes2`) is `TauCeti.ContCohomology.explicitRes1` and
  `explicitRes2`, the map `i` of sub-milestone 4 is `TauCeti.ContCohomology.explicitMap1` and
  `explicitMap2`, and the change of group of sub-milestone 4 is `explicitMap1Equiv` and
  `TauCeti.ContCohomology.explicitMap2Equiv`; `explicitInfl1`, `explicitInfl2`,
  `explicitInfRes_exact`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2` are Tau Ceti's
  too.
  1. **(3.3.11), corestriction in the top degree.** For `scd_p G ≤ n` and an open subgroup `V`,
     every `p`-primary class of `H^n(G, X)` is a corestriction of a `p`-primary class of
     `H^n(V, X)` (`corestriction_surjective_primaryComponent`); for `V` normal, a `p`-primary class
     of `H^n(V, X)` with trivial corestriction lies in the subgroup generated by the `(g)_* w - w`
     (`corestriction_ker_primaryComponent`, with Layer 10's `conjMapOf`, which acts on `H^n(V, X)`
     by `conjOpenSubgroup_eq_of_normal`), so corestriction is injective on the coinvariants.
     Surjectivity: Layer 10's `longExact_exact` for `0 → B → Coind_V^G X → X → 0`, the last map
     `coindTrace`, with `shapiroIso` identifying the middle term with `H^n(V, X)` and the induced
     map with `corestriction`, and `H^{n+1}(G, B)(p) = 0`. Injectivity: the augmentation sequence
     `0 → I → ℤ[G/V] → ℤ → 0` tensored with `X`, whose middle term is `Coind_V^G X` and whose last
     map is the trace, and the cover `⊕_σ Coind_V^G X → I ⊗ X`, `e_σ ⊗ x ↦ (σ - 1) ⊗ x`; the
     vanishing of `H^{n+1}(G, -)(p)` makes `H^n(G, ⊕_σ Coind_V^G X)(p) → H^n(G, I ⊗ X)(p)`
     surjective, and under `shapiroIso` right multiplication by `σ - 1` on `Coind_V^G X` is
     `(σ)_* - 1`. Passing to `p`-primary parts is exact on these torsion groups (Layer 10's torsion
     statement).
  2. **(1.5.9) and (i) ⇒ (ii): the transfer.** The transfer `Ver : G → V^ab(p)` is Mathlib's
     `MonoidHom.transfer` of the quotient map `abelianizationProPMk`
     (`abelianizationProPTransfer`, continuous by `continuous_abelianizationProPTransfer`), and it
     is the product of Layer 6's transversal words (`abelianizationProPTransfer_eq_prod_lWord`, by
     `MonoidHom.transfer_def`): Layer 6's degree-1 corestriction of a character `ψ` of `V^ab(p)`,
     with trivial coefficients, is `ψ ∘ Ver`, which is (1.5.9). For the Bockstein sequence
     `0 → ℤ → ℤ → ℤ/p^k → 0` of trivial discrete modules, Layer 10's `delta` and `longExact_exact`
     make `δ_k : H¹(-, ℤ/p^k) → H²(-, ℤ)` injective, a continuous homomorphism from a profinite
     group to `ℤ` being zero, and put every `p`-primary class of `H²(-, ℤ)` in the image of some
     `δ_m`, compatibly in `m` (`delta_naturality`); `H¹` with trivial coefficients is the group of
     continuous characters by Layer 2's trivial-action description through Layer 3. The connecting
     map commutes with corestriction (`delta_corestriction`, with `explicitIso_cor`) and with
     conjugation (`delta_conjMapOf`). So sub-milestone 1 at `n = 2` and `X = ℤ` reads on characters
     as `zmodChar_eq_one_of_transfer_eq_one` (a character of `G` of `p`-power order dies on the
     kernel of `Ver`) and `zmodChar_eq_one_of_comp_transfer_eq_one` (a character of `V^ab(p)` that
     dies on the image of `Ver` dies on the `G ⧸ V`-invariants). The only duality used is
     `exists_continuous_zmodChar_of_notMem`: continuous characters into `ZMod (p ^ k)` separate a
     point of a pro-`p` abelian group from a closed subgroup (an open subgroup containing the one
     and missing the other, and a character of the finite abelian `p`-group quotient, from
     `AddCommGroup.equiv_directSum_zmod_of_finite`). Together these are (3.6.4)(ii) in `p`-primary
     form, `Ver : G^ab(p) ≅ V^ab(p)^{G/V}`: `abelianizationProPTransfer_eq_one_iff` (the kernel of
     `Ver` is that of `G → G^ab(p)`) and `abelianizationProPTransfer_range` (the image, compact and
     hence closed, is the invariants).
  3. **(ii) ⇒ (iii) for `G ⧸ V` of order `p`.** Three statements about the transfer and two about a
     finite cyclic group do the work of NSW's diagram (3.6.2). On `V` the transfer is the norm,
     `Ver v = ∏_q q • [v]` (`abelianizationProPTransfer_apply_of_mem`), and at a representative it
     is the sum of the factor set, `Ver σ.out = ∑_τ u(τ, σ)` (`abelianizationProPTransfer_out`,
     NSW's `ρ`). For `G ⧸ V` a cyclic `p`-group generated by the image of `s`, an element of `V`
     that dies in `G^ab(p)` has class `(s • b) / b` (`abelianizationProPMk_eq_smul_div_of_mk_eq_one`:
     the quotient of `G` by the preimage of `(s - 1) V^ab(p)` is an extension of the cyclic `G ⧸ V`
     by a central subgroup, hence abelian, and pro-`p`, so `G` maps onto it through `G^ab(p)`; this
     is NSW's injectivity of `i` for cyclic `U/V`, without `H₂`). For a finite cyclic `Γ = ⟨σ⟩`, any
     coefficients `A` and the norm `groupNorm`: `H¹(Γ, A) = 0` as soon as the kernel of the norm is
     `(σ - 1) A` (`subsingleton_H1_of_isCyclic`), and `H²(Γ, A) ≅ A^Γ / N(A)` by
     `f ↦ ∑_τ f (τ, σ)` (`explicitH2CyclicEquiv`, `explicitH2CyclicEquiv_mk`, with
     `sum_cocycle_mem_H0`), both proved on explicit cochains, with Mathlib's
     `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` and `groupCohomologyIsoEven` as the discrete
     model. Then for `#(G ⧸ V) = p`: `subsingleton_h1_abelianizationProP_of_card_eq_prime`, since
     `N [v] = 0` makes `Ver v = 1`, so `v` dies in `G^ab(p)` and `[v] = (σ • b) / b`; and
     `abelianizationProPClass_generates_of_card_eq_prime`, since `u_{G/V}` goes to the class of
     `Ver σ.out`, every invariant is `Ver (σ.out ^ i v) = i • Ver σ.out + N [v]`, `p • Ver σ.out`
     is the norm `Ver (σ.out ^ p)`, and `Ver σ.out` is not a norm: `Ver σ.out = Ver v` would put
     `σ.out v⁻¹` in the kernel of `G → G^ab(p) → G ⧸ V`.
  4. **(3.6.1) and the change of group.** For `V ≤ W` open with `V` normal in `G`, the pair
     `V ◁ W` computed in the group `W` is the subgroup `W.map (mk' V)` of `G ⧸ V`:
     `quotientSubgroupOfEquivMap` (Mathlib's `QuotientGroup.quotientKerEquivRange`, a homeomorphism
     for open `V`, both groups being discrete) and `abelianizationProPSubgroupOfEquiv` (through
     `Subgroup.subgroupOfEquivOfLe`, continuous in both directions and intertwining the two
     conjugation actions: `continuous_abelianizationProPSubgroupOfEquiv`,
     `continuous_abelianizationProPSubgroupOfEquiv_symm`, `abelianizationProPSubgroupOfEquiv_smul`)
     give `abelianizationProPSubgroupOfH1Equiv` and `abelianizationProPSubgroupOfH2Equiv`, the
     compatible-pair pullbacks along this pair, and the latter carries `u_{W/V}` to the
     restriction of `u_{G/V}` (`abelianizationProPSubgroupOfH2Equiv_class`, NSW (3.6.1)(i));
     restriction at these coefficients is `abelianizationProPRes1` and `abelianizationProPRes2`.
     For `V ≤ W` both open and normal in `G`, the transfer
     `Ver_{W→V} : W^ab(p) → V^ab(p)` (`abelianizationProPTransferLe`) is injective with image the
     `W ⧸ V`-invariants (`abelianizationProPTransferLe_injective`,
     `abelianizationProPTransferLe_range`: sub-milestone 2 for the group `W`, whose strict dimension
     is at most that of `G` by `strictCohomologicalDimensionAt_openSubgroup_le`, transported), and
     it is continuous and equivariant along `G ⧸ V → G ⧸ W`
     (`continuous_abelianizationProPTransferLe`, `abelianizationProPTransferLe_smul`). NSW's
     map `i : Hⁱ(G ⧸ W, W^ab(p)) → Hⁱ(G ⧸ V, V^ab(p))`, the compatible pair of `G ⧸ V → G ⧸ W` and
     `Ver_{W→V}`, is `abelianizationProPInfl1` and `abelianizationProPInfl2`.
     `abelianizationProPInfl2_class` is (3.6.1)(ii), `i (u_{G/W}) = (W : V) • u_{G/V}`: the
     inflation of `u_{G/W}` to `G ⧸ V` and the push-forward of `u_{G/V}` along `V^ab(p) → W^ab(p)`
     are one class of `H²(G ⧸ V, W^ab(p))`, and `Ver_{W→V}` after `V^ab(p) → W^ab(p)` is the norm
     of `W ⧸ V`, which acts on `H²(G ⧸ V, V^ab(p))` as multiplication by `(W : V)` (it does so on
     invariants, and two dimension shifts through Layer 7's acyclic coinduced module, with Layer 5's
     connecting maps, carry this to degree 2).
     `abelianizationProPInfl1_exact` and `abelianizationProPInfl2_exact` are NSW (1.6.7) for this
     pair: `i` is injective with image the kernel of restriction to `W.map (mk' V)`, in degree 2
     when `H¹(W ⧸ V, V^ab(p)) = 0`. Their inputs are Layer 5's inflation-restriction sequence at the
     normal subgroup `W.map (mk' V)`, its extension to degree 2 under the vanishing of `H¹` (proved
     on explicit cochains: a 2-cocycle killed by restriction is cohomologous to one vanishing on
     pairs from `W ⧸ V`, and the vanishing of `H¹` then makes it inflated),
     `QuotientGroup.quotientQuotientEquivQuotient`, and `Ver_{W→V}` onto the invariants.
  5. **(3.6.3), `p`-groups and then Sylow.** For `G ⧸ V` a `p`-group,
     `subsingleton_h1_abelianizationProP_of_isPGroup` and
     `abelianizationProPClass_generates_of_isPGroup` go by induction on `#(G ⧸ V)`, the trivial
     group being Layer 2's edge case. Otherwise the centre of the `p`-group `G ⧸ V` is nontrivial
     (`IsPGroup.center_nontrivial`) and has an element of order `p`
     (`exists_prime_orderOf_dvd_card'`), whose `zpowers` is normal (`Subgroup.normal_of_le_center`),
     with preimage `W` open (`Subgroup.isOpen_mono`), normal, and of index `p` over `V`.
     Sub-milestone 3 for the group `W`, carried by sub-milestone 4's change of group, makes
     `H¹(W ⧸ V, V^ab(p)) = 0` and `H²(W ⧸ V, V^ab(p))` of order `p`. The induction hypothesis for
     `W ◁ G` with `abelianizationProPInfl1_exact` and `abelianizationProPInfl2_exact` gives
     `H¹(G ⧸ V, V^ab(p)) = 0` and `#H²(G ⧸ V, V^ab(p)) ≤ #(G ⧸ W) · p = #(G ⧸ V)`; by
     `abelianizationProPInfl2_class` and the injectivity of `i`, `(W : V) • u_{G/V}` has order
     `#(G ⧸ W)`, so `u_{G/V}` has order `#(G ⧸ V)` and generates. For general `G ⧸ V`, a Sylow
     `p`-subgroup `P` of the finite group `G ⧸ V` (`Sylow`, nonempty by `Sylow.nonempty`) has index
     prime to `p` (`Sylow.not_dvd_index`) and order `p ^ v_p(#(G ⧸ V))`
     (`Sylow.card_eq_multiplicity` with `Nat.factorization_def`). Restriction to `P` is injective in
     degrees 1 and 2 (`abelianizationProPRes1_injective`, `abelianizationProPRes2_injective`, from
     `cor ∘ res = index`, the order of `G ⧸ V` killing both groups, and
     `abelianizationProP_pow_bijective`, `V^ab(p)` being pro-`p` because the open `V` is compact),
     and the `p`-group case for the
     preimage of `P`, carried by sub-milestone 4, makes `H¹(P, V^ab(p)) = 0` and the restriction of
     `u_{G/V}` a generator of a group of order `#P`. So restriction is an isomorphism carrying
     `u_{G/V}` to a generator. Only finite Sylow theory is used, and nothing from the Profinite
     Pro-`p` Groups roadmap.

**API** for cohomological dimension. Constructors: the two predicates and the three invariants
above, through `leastENatBound`. Worked example: `cd_p Ẑ = 1` for every `p`, with `H²(Ẑ, M) = 0`
for finite `M`, in §6. Morphisms: none; these are order-valued invariants, and the content is in
the inequalities. Functoriality: monotonicity in the closed subgroup, and equality for an open
subgroup of index prime to `p`. Comparison: the equivalence of `CohomologicalDimensionLE` with the
`p`-primary-component interface. Naturality: not applicable. Edge cases: `cd_p G = 0`, computed;
`cd_p G = ⊤`, where `⊤ + 1 = ⊤` and the inequality still has to hold; and `p` not dividing the
order of any `G ⧸ U`. Consumers: the Profinite Pro-`p` Groups roadmap, through `cd_p`,
`cd_p_le_iff`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`,
`cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd`, `IsPPrimaryTorsion` and
`isPPrimaryTorsion_continuousCohomology`; the Class Field Theory roadmap, through `cd_p`, `scd_p`,
`cd_p_le_of_isClosed`, `cd_p_le_scd_p` and
`strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` at `n = 2`, for
`cd_ℓ(G_K) = scd_ℓ(G_K) = 2`; and the Local Galois Groups roadmap, through `cd_p`,
`cd_p_le_iff_finite_pPrimary` and `cd_p_le_iff_boundedExponent`, and through the class module at
`G = G_K` and `V = G_L` for a finite Galois `L/K`: `abelianizationProP`,
`abelianizationProPFactorSet`, `abelianizationProPClass` and the degree-two statement
`abelianizationProPClass_generates`. Its hypothesis `scd_p(G_K) ≤ 2` is the Class Field Theory
roadmap's `scd_p_absoluteGaloisGroup_eq_two`, which is a statement about the same invariant `scd_p`,
so no comparison enters. That roadmap also reads the carrier
`abelianizationProP`, with its conjugation action, and the class `abelianizationProPClass` at the
relation subgroup of a free profinite group, for Lyndon's theorem and the extension it lifts; it
uses the generation theorem only at `G_K`.

**Source** for the `p`-primary torsion of cohomology. The proof of NSW (3.3.2), (i) ⇔ (ii), uses it
in the form `Hq(G, A)(p) = Hq(G, A(p))` for torsion `A`. The hypothesis that cannot be dropped is
compactness of `G`: for the discrete group `⊕_ℕ ℤ` acting trivially,
`H¹(⊕_ℕ ℤ, ℚ_p/ℤ_p) = Hom(⊕_ℕ ℤ, ℚ_p/ℤ_p) = ∏_ℕ ℚ_p/ℤ_p`, and the element whose `k`-th
coordinate is `1/pᵏ` is killed by no power of `p`.

**Source** for dévissage. NSW (3.3.2); Koch Def. 5.1 takes the pro-`p` case as the definition. The
reduction is to **finite** discrete `p`-primary modules and then to the finite simple ones, and
the finiteness is what the colimit and dimension-shifting argument needs. The inequality
`cd_p G ≤ scd_p G ≤ cd_p G + 1` is NSW (3.3.3), and the false neighbor is equality of the two: for
`G = ℤ_p` one has `cd_p G = 1` and `scd_p G = 2`, so the upper bound is attained and `cd_p` alone
does not determine `scd_p`.

**Source** for the strict-dimension criterion and the class module. NSW (3.3.4) and (3.3.5) for the
criterion; NSW (3.3.11), (1.5.9) and (3.6.1)-(3.6.4) for the class module, stated there for
`scd G = 2`, all primes at once. The hypothesis here is `scd_p G ≤ 2` at the one prime `p`, and the
`p`-primary refinement of each step is part of the milestone. The false neighbors are the same
statement under a weaker hypothesis. With none, `G = ℤ/p` and `V = 1` give `V^ab(p) = 0` while
`#(G/V)_p = p` (there `scd_p G = ∞`). With `cd_p G ≤ 2` only, `G = ℤ_p²` and `V = pG` give
`H²((ℤ/p)², ℤ_p²)` of order `p⁴` rather than `p²` (there `cd_p G = 2` and `scd_p G = 3`).
Openness of `V` cannot be dropped from the unique divisibility of `V^ab(p)` either: for the dense
subgroup `V = ℤ` of `G = ℤ₂` at `p = 2`, the open normal subgroups `2ⁿℤ` of `V` have `2`-group
quotients and meet in `0`, so the maximal pro-`2` quotient of `V^ab = ℤ` is `ℤ` itself, on which
multiplication by `3` is not surjective although `3` is prime to `2`.

### Layer 12: the graded cup product in all degrees

**Prerequisites.** Mathlib: `continuousCohomology`, `CochainComplex`. This roadmap: Layers 1
and 8, Layer 3 for the agreement with the explicit shapes, and Layer 10 for the projection
formula.

Layer 8's cups are the low-degree calculational interface; the Evens norm multiplies degrees and
so needs the product in every bidegree. Everything here is stated against Layer 1's carrier.

This is the hardest multiplicative work in the roadmap and it is eleven milestones, not one.
"Build it through the coinduction resolution" is a route, not a specification.

1. **The coefficient pairing** `TopPairing`. For `X, Y, Z : TopRep R G`, an `R`-bilinear map
   `X.V →ₗ[R] Y.V →ₗ[R] Z.V` that is jointly continuous and `G`-equivariant,
   `μ (g • x) (g • y) = g • μ x y`. This is the input type of everything below, and it is the
   all-degree form of the pairing §3 fixes for the explicit cups. `ofDiscreteModulePairing` builds
   one from a biadditive equivariant map of discrete modules, which is how a consumer supplies a
   pairing without constructing a `TopPairing` by hand.
2. **The pairing on the resolution.** Use the direct homogeneous-cochain route. Define
   `resolutionCupPairing`, the Alexander–Whitney recursion on Mathlib's actual iterated-curried
   coinduction resolution, taking the `m`-th term against the `n`-th to the `(m + n)`-th.
   `resolutionCupPairing_apply_zero` and `resolutionCupPairing_apply_succ` pin the base case and
   recursive application formula; equivariance and continuity are separate named lemmas. This is
   not a transport from the bar resolution and does not appeal to an unnamed comparison theorem.
3. **The cochain product** `cupCochain`, defined from `resolutionCupPairing` after invariants.
   `cupCochain_apply` identifies it with the named resolution pairing, so the public cochain map is
   determined by the recursion rather than only by its endpoint type.
4. **The Leibniz identity** `cupCochain_leibniz`, `d (a ⌣ b) = da ⌣ b + (-1)^m (a ⌣ db)`, with the
   sign convention fixed here once and referred to everywhere else.
5. **Descent** to cocycles and then to cohomology, giving
   `cup : Hᵐ(G, X) × Hⁿ(G, Y) → H^{m+n}(G, Z)`, biadditive in each argument (`cup_add_left`,
   `cup_add_right`).
6. **The unit**, the class of `1` in `H⁰` for a discrete `G`-ring, with `1 ⌣ a = a = a ⌣ 1`
   (`cup_one_left`, `cup_one_right`).
7. **Associativity.** Construct the named operator `cupAssocHomotopy` and prove
   `cupAssocHomotopy_spec`, whose boundary is the difference between the two parenthesizations;
   derive the class-level theorem `cup_assoc`. This is done for the four-pairing input of Layer 8
   and for a discrete `G`-ring.
8. **Graded commutativity.** Construct `cupCommHomotopy` and prove `cupCommHomotopy_spec`; derive
   the class-level theorem `cup_gradedComm`, giving
   `a ⌣_μ b = (-1)^{mn} (b ⌣_{μᵒᵖ} a)` on classes.
9. **Restriction, inflation and coefficient compatibility** in all bidegrees: `cup_res`,
   `cup_infl`, `cup_coeffMap`.
10. **The projection formula** `cup_projection`, `cor (res a ⌣ b) = a ⌣ cor b` in all bidegrees,
    with Layer 10's all-degree corestriction.
11. **Agreement with Layer 8's six explicit shapes** under Layer 3's comparison, of which
    `explicitIso_cup` is the `(1,1)` case and the other five have the same form.

The characteristic-2 specialization the norm consumes falls out of 6 to 8: over `𝔽₂` with trivial
action there are no signs, so `H^•(G, 𝔽₂) = ⨁ₙ Hⁿ(G, 𝔽₂)` is a graded-commutative `𝔽₂`-algebra.
Fix the graded-object notation and its API here, so that the degree multiplication `q ↦ l * q` of
Layer 13 is typeable.

**Source** for the construction. The direct Alexander–Whitney recursion is written on Mathlib's
iterated coinduction resolution and fixed by the two `resolutionCupPairing_apply_*` theorems.
Brown, *Cohomology of Groups*, V §3 supplies the model identities: (3.5) is cochain-level
associativity and (3.6) the commutativity homotopy. Brown I §7 is a mathematical cross-check, not a
substitute for constructing a comparison with Mathlib's chosen resolution. NSW I §4 states the identities the descended product must
satisfy: (1.4.1) Leibniz, (1.4.2) naturality, (1.4.3) and (1.4.5) compatibility with `δ`, (1.4.4)
associativity and graded commutativity. The hypothesis carried throughout is joint continuity of
the pairing, which is automatic for discrete coefficients and is not automatic in general. The
false neighbor is graded commutativity at cochain level, which fails for the same reason it fails
in Layer 8 and is why milestone 8 is a homotopy and not an equality.

**API** for the graded product. Constructors: the cup in each bidegree, and the unit. Worked
example: `H^•(C₂, 𝔽₂) = 𝔽₂[x]` with `x` in degree `1`, which the Layer 8 `C₂` computation is the
first case of. Morphisms: biadditivity in each argument. Functoriality: restriction, inflation and
the projection formula in all bidegrees. Comparison: agreement with Layer 8's six shapes under
Layer 3. Naturality: in the pairing, and in the coefficient short exact sequences. Edge cases:
bidegree `(0,0)`; the characteristic-2 specialization, where all signs are `1`. Consumers:
Layer 13, which needs the degree multiplication `q ↦ l * q` to be typeable.

### Layer 13: the Evens norm

**Prerequisites.** Mathlib: `RegularWreathProduct`, `DihedralGroup`,
`Subgroup.mul_mem_iff_of_index_two`, `Equiv.Perm`, `ZMod`, `OpenSubgroup`. Tau Ceti: the index-two
cochains of `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Cochain.lean`
(`TauCeti.ContCohomology.evensExtend`, `evensB1`, `evensBs`, `evensCorCochain`, `evensGraphCochain`
with their evaluation rules, the multiplication rule `evensB1_mul_of_mem`, `evensB1_mul_of_notMem`,
`evensBs_mul_of_mem`, `evensBs_mul_of_notMem`, `evensCorCochain_mul`,
`evensGraphCochain_cocycle_identity`, the continuity lemmas and
`evensGraphCochain_sub_evensGraphCochain`), the graph class `TauCeti.ContCohomology.graphClass` with
`graphClass_eq_cochainClass` (`Evens/Class.lean`), the trivial coefficients `TauCeti.trivialF2` with
`TauCeti.trivialF2ResMap`, `TauCeti.isSmoothDiscrete_trivialF2` and
`TauCeti.ofDiscreteModule_trivialF2`, `TauCeti.quotientOpenSubgroup`, and the connecting-map cup
identities of `Cup/ConnectingMap.lean`. This roadmap: Layers 5, 6, 7 and 8 for the cochains of the
explicit index-2 form, with Layer 3's comparisons, Layer 10's corestriction and Layer 12's `(1,1)`
cup for its statements on the canonical carrier; Layers 10 and 12 for the general construction.

The multiplicative transfer on `𝔽₂`-cohomology for an open subgroup `U ≤ G` of finite index, in
the shape the Evens-Kahn formula uses. Trivial `𝔽₂`-action throughout. The explicit half is the
half the sibling roadmap consumes; the general construction needs Layers 10 and 12 in full.

#### The explicit index-2 form

- For `(G : U) = 2` (so `U` is normal and `G ⧸ U ≅ C₂`), a chosen `s ∉ U`, and a continuous
  homomorphism `α : U → 𝔽₂`: the Shapiro components `b₁ γ = α γ` for `γ ∈ U` and `b₁ γ = α (γ s)`
  otherwise, and `b_s γ = b₁ (s⁻¹ γ)`; then the **two-point graph 2-cochain**
  ```
  ν_α (γ, η) = b₁ γ · b_s η                     if γ ∈ U,
  ν_α (γ, η) = b₁ γ · b₁ η + b₁ η · b_s η       otherwise,
  ```
  its continuity and its 2-cocycle identity, and the resulting class
  `N^{Ev}(α) ∈ H²(G, 𝔽₂)`. In `Suggested.lean` these are `evensExtend`, `evensB1`, `evensBs`,
  `evensCorCochain`, `evensGraphCochain` with its cocycle theorem, the class `graphClass` of that
  cocycle, choice-free by `graphClass_eq_cochainClass`; the cochains, their cocycle identities and
  the graph class are Tau Ceti's (`TauCeti.ContCohomology.evensGraphCochain`,
  `evensGraphCochain_cocycle_identity`, `graphClass`), and the names here are abbreviations of them
  and theorems proved by them. Then the index-2 norm itself,
  `evensNormIndexTwo : H¹(U, 𝔽₂) → H²(G, 𝔽₂)`, **defined** as `graphClass` descended through
  `homClass`. `homClass` is the class of a continuous homomorphism, pinned by
  `homClass_eq_cochainClass`; `homClass_surjective` says every class is one (the trivial-action
  `B¹ = 0` of Layer 2, through Layer 3's comparison); `graphClass_representative_independent` says
  the graph class depends only on that class; and `evensNormIndexTwo_homClass` is the resulting
  equation. The identities below are statements about this graph class. Its agreement with the
  general construction is milestone 10 of the second half, `evensNormIndexTwo_eq`, and nothing in
  this half or in its consumer rests on it. Independence of the choice of `s`, as an explicit
  coboundary.
  ⚠ The element `s` is data of the **cochain** formulas and of nothing else. `graphClass` and the
  identities below take only `(G : U) = 2`, and `graphClass_eq_cochainClass` ties the class to
  the cochain at every `s ∉ U` rather than at one. Do not bundle `(G : U) = 2` with a chosen `s`
  into a structure and carry it in the exported signatures: that makes every identity a statement
  about the choice, and independence of the choice is a theorem here.
  ⚠ `b₁` and `b_s` are **cochains and not cocycles**, so neither has a class in `H¹(G, 𝔽₂)`. For
  `G = C₄ = ⟨σ⟩`, `U = ⟨σ²⟩` and `α ≠ 0`, the values of `b₁` at `1, σ, σ², σ³` are `0, 1, 1, 0`,
  so `b₁(σ · σ) = 1` while `b₁(σ) + b₁(σ) = 0`. Only the sum is a cocycle, so identity 3 below is
  an equation about the sum, and giving the two components separate classes is a type error
  dressed as a statement. Tau Ceti's `Evens/Cochain.lean` carries that computation as its
  acceptance check.
- **The five characterizing identities**, of which the first four are what Evens-Kahn uses
  (Kozlowski Lemma 2.4 in cohomological form):
  1. `evensNorm_res`, `res_U N^{Ev}(α) = α ⌣ (s · α)`, the cup with the conjugate class, which is
     `evensConj`;
  2. `evensNorm_polarization`,
     `N^{Ev}(α + β) - N^{Ev}(α) - N^{Ev}(β) = cor (α ⌣ (s · β))`, with Layer 6's corestriction and
     again the **conjugate** class;
  3. `evensNorm_cor_shapiro`, `cor¹ α = b₁ + b_s`, agreeing with Layer 6's transversal formula at
     the transversal `{1, s}`;
  4. `evensNorm_identity_infl`, compatibility with inflation;
  5. `evensNorm_of_res`, the norm of a restricted class, `N^{Ev}(res_U y) = y ⌣ y + χ_U ⌣ y` for
     `y ∈ H¹(G, 𝔽₂)`, where `χ_U = indexTwoCharacterClass U` is the class of the character
     `indexTwoCharacter` of `G` with kernel `U`, a homomorphism exactly because the index is two.
     At cochain level both Shapiro components of `y|_U` are the homomorphism `b = y + y(s) · χ_U`,
     so `ν = b ⌣ b + χ_U ⌣ b` (`evensGraphCochain_comp_subtype`, proved in `Suggested.lean`), and
     the two `χ_U ⌣ χ_U` terms cancel on classes by the mod-2 symmetry of the `(1,1)` cup, which
     does not hold on cochains. This identity evaluates the norm on the image of restriction,
     which identities 1 and 2 do not determine: they fix `N` only modulo `χ_U ⌣ H¹(G, 𝔽₂)`, the
     kernel of restriction in degree 2 (below).

  The conjugate `s · α` in the first two is `evensConj`, defined as `res ∘ cor - id` on
  `H^n(U, 𝔽₂)`. That is what makes it choice-free: at index two `res ∘ cor` is `1 + s` for either
  element of the nontrivial coset, so the difference is the conjugation and nothing in it depends
  on a representative. The identification with conjugation by a named element is
  `evensConj_eq_conjMapOf`, against Layer 10's `conjMapOf`, and it holds for every `s ∉ U`. Only
  identity 3 mentions an element outside `U`, because its right-hand side is a cochain formula.

  What the Quadratic Form Invariants roadmap's Evens-Kahn layer needs from here is identities 1, 2
  and 5, the kernel of restriction in degree two from the index-two exact sequence below
  (`indexTwo_exact_cup_res2`), and the pullback formula below, all at index exactly two and read on
  the `L/K` side through Layer 9's bridge; its total-Stiefel-Whitney expansion
  `w(Tr ⟨a⟩) = w(Tr ⟨1⟩) · (1 + cor[a] + N^{Ev}[a])` in degrees `≤ 2` is the application. This
  roadmap owns the cohomological operation; that one owns its application to transferred quadratic
  forms.
- **The index-two exact sequence** in degrees `≤ 2`. With `χ_U` as above and coefficients `𝔽₂`,
  ```
  H⁰(G) →χ_U⌣ H¹(G) →res H¹(U) →cor H¹(G) →χ_U⌣ H²(G) →res H²(U) →cor H²(G)
  ```
  is exact: `indexTwo_ker_res1` (the kernel of restriction in degree 1 is `{0, χ_U}`),
  `indexTwo_exact_res1_cor1`, `indexTwo_exact_cor1_cup` (`χ_U ⌣ x = 0` exactly when `x` is a
  corestriction), `indexTwo_exact_cup_res2` (`ker res² = χ_U ⌣ H¹(G, 𝔽₂)`) and
  `indexTwo_exact_res2_cor2`. Proof: the coefficient sequence `0 → 𝔽₂ → 𝔽₂[G ⧸ U] → 𝔽₂ → 0`, the
  constants followed by the sum over the two cosets, is exact because the index is two; its long
  exact sequence is Layer 5's (`explicitLongExact_H1A` to `explicitLongExact_H2B`); Layer 7's
  Shapiro isomorphisms identify `Hⁿ(G, 𝔽₂[G ⧸ U])` with `Hⁿ(U, 𝔽₂)`, under which the constants
  induce restriction and the sum over the cosets induces corestriction (Layer 10's `corestriction`
  is Shapiro followed by the trace, and `explicitIso_cor`, `explicitIso_cor2` carry it to the
  explicit model); `δ⁰ 1 = χ_U`, since the indicator of the coset `U` lifts `1` and its `d⁰` is
  `χ_U` (`explicitDelta0_apply`); and the connecting map in degree 1 is `x ↦ x ⌣ χ_U` by
  `explicitDelta1_explicitCup10_right` at the class `1`, which is `χ_U ⌣ x` by the mod-2 symmetry
  of the `(1,1)` cup. The statements are made on the canonical carrier through Layer 3's
  comparisons, the dictionary sending the trivial `𝔽₂` module to `trivialF2`
  (`TauCeti.ofDiscreteModule_trivialF2`).
  ⚠ Index exactly two is load-bearing. At index three the kernel of the sum over the cosets is
  two-dimensional, and for `S₃ ⊇ C₂` restriction and corestriction in degree 1 are both
  surjective, so `indexTwo_exact_res1_cor1` fails. The map `H²(G) → H²(U)` is restriction and not
  corestriction: for `C₄ ⊇ C₂` restriction in degree 2 is injective while `χ_U ⌣ H¹(C₄, 𝔽₂) = 0`,
  in accordance with `H^*(C₄, 𝔽₂) = 𝔽₂[χ, u]/(χ²)`. There is no sign to fix, only the
  normalization of `δ⁰`, and either lift of `1` gives `χ_U`.
- **The index-two norm as a pullback of the `D₁₆` class.** On `C₂ ≀ C₂ = D₈` (`WreathC2`, Mathlib's
  `RegularWreathProduct` of `C₂` by itself, read on coordinates `(a, b, c)` with
  `(a, b, c)(a', b', c') = ((a, b) + swapᶜ(a', b'), c + c')`), take the base group
  `U₀ = {c = 0}` (`wreathBase`), the tautological character `α_taut(a, b, 0) = a`
  (`wreathTautological`) and `s = (0, 0, 1)` (`wreathSwap`), and write `u = (1, 0, 0)`,
  `v = (0, 1, 0)`. Then `b₁ = a` and `b_s = b` (`evensB1_wreath`, `evensBs_wreath`), and
  ```
  ν_taut = c_{D₁₆} + δ 1_{{u, uv, s, vs}}
  ```
  as cochains (`evensGraphCochain_wreath`), where `c_{D₁₆}` (`wreathD16Cocycle`) is the factor set
  of the section `(us)^i s^j ↦ r^i f^j` (`wreathSection`) of the quotient
  `D₁₆ = ⟨r, f⟩ → C₂ ≀ C₂`, `r ↦ us`, `f ↦ s` (`dihedralToWreath`, on Mathlib's `DihedralGroup 8`
  with `f = sr 0`), whose kernel is the centre `{1, r⁴}`. So the index-two norm of `α_taut` is the
  extension class of `D₁₆`. `Suggested.lean` proves the identity, the cocycle identity of
  `c_{D₁₆}`, the kernel and the section property by computation. Naturality
  (`evensGraphCochain_comap`, proved there too): for `φ : G → G'` and `U = φ⁻¹(U')`, the graph
  cochain of the pulled-back homomorphism is the pullback of the graph cochain, with `s` replaced
  by `φ(s)`. For `U` of index two, `s ∉ U` and `α : U → 𝔽₂`, the homomorphism
  `Ind α : G → C₂ ≀ C₂`, `γ ↦ ((b₁ γ, b_s γ), χ_U γ)` (`indexTwoInd`, a homomorphism by the
  multiplication rule of the Shapiro components, Tau Ceti's
  `TauCeti.ContCohomology.evensB1_mul_of_mem`, `evensB1_mul_of_notMem`, `evensBs_mul_of_mem` and
  `evensBs_mul_of_notMem`), is the `φ` it is applied to. Two separate
  facts then carry the result back to `U` and `α`:
  1. `Ind α` pulls `U₀` back to `U` (`comap_indexTwoInd_wreathBase`), an equality of subgroups;
  2. on that pullback the tautological character pulls back to `α`
     (`wreathTautological_indexTwoInd`, an equality of homomorphisms after transport along 1 by
     `MulEquiv.subgroupCongr`).

  The first says nothing about characters, and the second is needed because the two characters
  live on different subtypes; `evensGraphCochain_subgroupCongr` says the graph cochain does not see
  that transport. With naturality they give `evensGraphCochain_indexTwoInd`,
  `ν_α (g, h) = ν_taut (Ind α g, Ind α h)` with `s` replaced by `Ind α (s)`. Since
  `Ind α (s) = (α(s²), 0, 1)` (`coordB_indexTwoInd_self`, `coordC_indexTwoInd_self`), and at every
  element `(a, 0, 1)` the graph cochain of `α_taut` is the one at `s = (0, 0, 1)` exactly
  (`evensGraphCochain_wreath_of_coord`), the universal identity gives
  `evensGraphCochain_eq_indexTwoInd_pullback`:
  `ν_α = c_{D₁₆} ∘ (Ind α × Ind α) + δ (1_{{u, uv, s, vs}} ∘ Ind α)` as cochains. `Suggested.lean`
  proves all of this. On classes, `graphClass_eq_cochainClass`, the continuity of the two pulled-back
  functions (`continuous_wreathD16Cocycle_indexTwoInd`, `continuous_wreathWitness_indexTwoInd`) and
  Layer 3's `cochainClass_inhomogeneousCochain2_eq_of_coboundary` (cohomologous inhomogeneous
  2-cocycles have the same canonical class) give `evensNormIndexTwo_eq_ind_pullback`:
  `N^{Ev}(α) = (Ind α)^* c_{D₁₆}`, the class of `c_{D₁₆} ∘ (Ind α × Ind α)`. This is what ties the
  index-two norm to a standard construction.
  Read through the signed-permutation representation `C₂ ≀ C₂ ⊂ O₂`, `c_{D₁₆}` is the class of the
  `Pin⁺` extension, the second Stiefel-Whitney class of that representation, so the theorem says
  that the index-two norm of `α` is `w₂` of the representation induced from `α` (Kahn 1984,
  th. I.4.2 at rank one). That reading belongs to the Quadratic Form Invariants roadmap, which
  consumes the pullback formula.
  ⚠ The extension is `D₁₆`, not `SD₁₆` or `Q₁₆`: for the same identification of the quotient their
  classes are `[ν_taut] + y²` and `[ν_taut] + x² + y²`, where `x` and `y` are the characters of
  `C₂ ≀ C₂` with kernels `U₀` and `⟨uv, s⟩`. The witness `1_{{u, uv, s, vs}}` depends on the
  section and on `s`; the class does not.

#### The general construction

Evens' multiplicative transfer (Evens 1963: the monomial embedding from a transversal, §§2-3; the
norm through the wreath product, §§4-5; transitivity, double cosets and multiplicativity, §6
Props. 1-4). Over a commutative `G`-ring Evens' Thm. 1 states the expansion
`𝒩(1 + χ) = 1 + tr(χ) + ⋯ + 𝒩(χ)` for **even-degree** `χ`, the parity coming from signs; over `𝔽₂`
the construction gives a norm in **every** degree, and the mod-2 all-degree form is the one built
here, since Kozlowski's formula consumes it. The construction is not one milestone; it
is these:

1. The wreath product itself. Mathlib has only the **regular** wreath product
   `RegularWreathProduct D Q = (Q → D) × Q` (notation `D ≀ᵣ Q`,
   `Mathlib/GroupTheory/RegularWreathProduct.lean`), and what the norm needs is the permutation
   wreath product `Uˡ ⋊ 𝔖_l` for the standard action of `𝔖_l` on `Fin l`. Generalize Mathlib's
   construction to an arbitrary `Q`-set `X`, giving `(X → D) ⋊ Q` with `RegularWreathProduct` as
   the case `X = Q`. Sources differ on whether this group is written `U ≀ 𝔖_l` or `𝔖_l ≀ U`, so
   name the base and top factors in the docstring rather than relying on the notation.
2. The transversal-dependent continuous monomial homomorphism `Φ : G → Uˡ ⋊ 𝔖_l` for
   `l = (G : U)`, with the left and right conventions stated explicitly, and its continuity for
   open `U`.
3. The tensor-power object and its `𝔖_l`-action in characteristic 2, together with the tensor
   induction functor the norm factors through.
4. The norm at cochain or resolution level, with its degree formula `q ↦ l q`.
5. Cocycles map to cocycles, and equivalent representatives give the same class.
6. Independence of the transversal.
7. The public function
   ```
   N_U^G : H^q(U, 𝔽₂) → H^{l * q}(G, 𝔽₂),
   ```
   which is a **function**, not an additive homomorphism and not a morphism in any category: its
   Lean signature uses `→` between the underlying types, never `→+`, `→ₗ` or `⟶`. Its failure of
   additivity is exactly the content of identity 2 of the explicit form above.
8. Multiplicativity `N(x ⌣ y) = N x ⌣ N y`, transitivity `N_V^G = N_U^G ∘ N_V^U`, the restriction
   and double-coset formula, and inflation compatibility.
9. Comparison with the finite-quotient norms, if the profinite construction is obtained by descent
   through Layer 10's colimit.
10. **Specialization to index 2 and degree 1, and equality with the graph class
    `evensNormIndexTwo` of the first half** (`evensNormIndexTwo_eq`, with `evensNorm_eq_graphClass`
    its value on `homClass α`). This identification is the mathematical content that distinguishes
    this layer from a transcription: it turns the graph cocycle into a standard cohomological
    construction rather than an ad hoc formula.

Every object the norm is built from is constructed in one of those ten milestones or in Layer 12.
A phrase like "the norm through the wreath product" is not a milestone: the wreath product, the
tensor induction and the graded algebra each have to be built. Sequence the explicit form first,
since its identities are provable directly and are what the sibling roadmap needs; the
general construction is the hardest single piece of work in this roadmap.

##### What the sibling roadmap consumes

The Quadratic Form Invariants roadmap uses only the explicit index-2 form, in degrees `1` and `2`,
always at index exactly two. It reads identities 1, 2 and 5 and the kernel of restriction in degree
two on the `L/K` side, for `[L : K] = 2`, through Layer 9's bridge: `galoisEvens`, `galoisConj`,
`galoisCharacter`, `galoisRes_galoisCor`, `galoisConj_evensConj`, `galoisRes_galoisEvens`,
`galoisEvens_add`, `galoisEvens_galoisRes`, `galoisRes_eq_zero_iff` and
`galoisEvens_embedding_independent`. From this layer it takes the norm `evensNormIndexTwo` on the
class `homClass` of a continuous homomorphism, `evensConj` with `evensConj_eq_conjMapOf`, and the
pullback formula `evensNormIndexTwo_eq_ind_pullback` with the objects it is stated with: `WreathC2`
with `WreathC2.mk`, the coordinates `WreathC2.coordA`, `WreathC2.coordB` and `WreathC2.coordC` and
the lemmas `WreathC2.mk_zero`, `WreathC2.coordA_mk`, `WreathC2.coordB_mk`, `WreathC2.coordC_mk` and
`WreathC2.mk_mul_mk`, then `wreathSection`, `dihedralToWreath`, `wreathD16Cocycle` with
`wreathD16Cocycle_isCocycle`, `indexTwoInd` and `continuous_wreathD16Cocycle_indexTwoInd`. From
Layers 1 and 3 it takes the class of an explicit 2-cocycle, `cochainClass` with
`cochainClass_eq_of_sub_eq_d`, `inhomogeneousCochain2` with `inhomogeneousCochain2_d_eq_zero`,
`cochainClass_inhomogeneousCochain2_eq_of_coboundary`, and `homClass_eq_cochainClass`. It does not name the group-level identities, `indexTwo_exact_cup_res2`
or the cochain identity `evensGraphCochain_eq_indexTwoInd_pullback`; it reaches them only through
these statements.
The ten milestones of the general construction are this roadmap's own completion of the theory,
and that roadmap needs none of them.

**API** for the Evens norm. Constructors: the explicit index-2 graph cocycle `ν_α`, and the
general `N_U^G` through the monomial homomorphism. Worked example: `G = C₄ ⊇ U = C₂` with `α ≠ 0`,
where `N^{Ev}(α) ≠ 0` in `H²(C₄, 𝔽₂)` and the extension it classifies is `C₈`; both halves are in
`Suggested.lean`; and the universal case, the tautological character of `C₂ ≀ C₂`, whose norm is the
extension class of `D₁₆`, proved there by computation. Morphisms: none, since `N_U^G` is a plain
function and not additive; its failure of additivity is identity 2. Functoriality: transitivity in
the subgroup, the restriction and double-coset formula, and compatibility with inflation; at
index two, naturality of the graph cochain in the group. Comparison: the general construction at
index 2 and degree 1 is the graph class `evensNormIndexTwo`, which is milestone 10; and the
index-two norm is the pullback of the `D₁₆` extension class. Naturality: multiplicativity
`N(x ⌣ y) = N x ⌣ N y`. Edge cases: index 1, where `N` is the identity; `α = 0`; and degree 0.
Consumers: the Quadratic Form Invariants roadmap, which uses the explicit form and nothing else.

**Source** for the expansion. Evens, Trans. AMS 108 (1963), Thm. 1 (p. 63), with §§2-5 for the
construction and §6 Props. 1-4 for transitivity, double cosets and multiplicativity; Kozlowski,
Proc. AMS 91 (1984), Lemma 2.4 for the index-2 expansion in low degrees. The hypothesis in Evens'
Thm. 1 is that `χ` has **even** degree, the parity coming from signs over a general commutative
`G`-ring. The false neighbor is that expansion in odd degree over a general ring. Over `𝔽₂` with
trivial action there are no signs, the construction gives a norm in every degree, and that
all-degree mod-2 form is the one built here.

**Source** for the pullback formula. The universal identity on `C₂ ≀ C₂` is a finite computation.
Kahn, Invent. Math. 78 (1984), th. I.4.2 at rank one (with Remarque II.2.3, on the same
`D₈ = C₂ ≀ C₂` and its tautological character), and Serre, Comment. Math. Helv. 59 (1984),
Théorème 1′ read at `n = 2`, identify the class with `w₂` of the induced representation. The
hypotheses are index two and `s ∉ U` for `Ind α` to be a homomorphism; the naturality of the graph
cochain needs neither. The false neighbor is the same statement with `Q₁₆` or `SD₁₆`, whose
classes differ from the norm by `x² + y²` and by `y²`.

---

## 6. Worked examples (acceptance criteria)

Discharge these alongside the layers. Each catches a specific classic mistake: a vacuous quotient,
a reversed transition map, a sign slip, a degenerate pairing, a cochain mistaken for a cocycle, an
impossible group.

- **`H¹(ℤ_p, ℤ/pᵏ)` and `H¹(ℤ_p, ℤ)`** (Layer 2; in `Suggested.lean`). For the profinite additive
  group `ℤ_p`, evaluation at `1` is a bijection from the continuous additive homomorphisms
  `ℤ_p → ℤ/pᵏ` onto `ℤ/pᵏ`, so `H¹ ≅ ℤ/pᵏ` under the trivial-action characterization, while every
  continuous homomorphism `ℤ_p → ℤ` is zero, so `H¹(ℤ_p, ℤ) = 0`. Continuity is what makes both
  statements true.
- **`Hⁱ(Ẑ, -)` and `cd_p Ẑ = 1`** (Layers 4, 6, 10, 11; NSW (1.7.7) and the worked example at NSW
  III p. 173; Serre, *Local Fields* XIII §1 Props. 1-2): `H¹(Ẑ, ℤ/n) ≅ ℤ/n`, `H²(Ẑ, M) = 0` for
  torsion or divisible `M`, and, through the long exact sequence of `0 → ℤ → ℚ → ℚ/ℤ → 0` together
  with Layer 10's torsion corollary killing `Hⁱ(Ẑ, ℚ)`, `H²(Ẑ, ℤ) ≅ ℚ/ℤ`. Build `Ẑ` as the
  profinite completion of `ℤ`, or state the example over an arbitrary procyclic group with a
  topological generator; do not hardcode a product over primes.
- **`H²(Gal(𝔽̄_q/𝔽_q), 𝔽̄_q^×) = 0`** (Layers 4, 5, 9): the Brauer group of a finite field
  vanishes. Route: pass to finite levels by Layer 4, compute
  `H²(Gal(𝔽_{qⁿ}/𝔽_q), 𝔽_{qⁿ}^×) ≅ 𝔽_q^× / N(𝔽_{qⁿ}^×)` by the pin's finite-cyclic API, and use
  surjectivity of the norm of a finite field. This exercises every transition map in the tower and
  fails immediately if the colimit goes in the wrong direction.
- **`cor ∘ res = (G : U)` on `Ẑ`** (Layer 6): for the open subgroup `nẐ ≤ Ẑ`, `cor ∘ res` on
  `H¹(Ẑ, ℤ/m)` is multiplication by `n`, computed on explicit cocycles. This catches both a wrong
  transversal convention and a wrong normalization. Since `Ẑ` acts trivially here, also do the
  same computation for a nontrivial action, so that the representative factor `t u •` is tested.
- **The `C₂` cup and `G_ℝ`** (Layers 8, 9): on `G = C₂` with the discrete topology, the `(1,1)`
  cup of the nontrivial class of `H¹(C₂, 𝔽₂)` with itself is the nontrivial class of
  `H²(C₂, 𝔽₂)`; the raw non-coboundary statement is in `Suggested.lean`. In Galois form: for
  `K = ℝ`, so that `G_ℝ = Gal(ℂ/ℝ) ≅ C₂`, `[-1] ⌣ [-1] ≠ 0` in `H²(G_ℝ, 𝔽₂)`. This is the
  smallest instance of the Kummer cup detecting a non-norm (`-1` is not a norm from `ℂ`), and it
  is the test case that catches a degenerate pairing. It is also the Kummer normalization checked
  over a field with a **finite** Galois group, which is the case where the whole computation can be
  carried out by hand.
- **Kummer over `ℚ`** (Layer 9): `H¹(G_ℚ, 𝔽₂) ≅ ℚˣ ⧸ (ℚˣ)²`, with `[a]` the explicit square-root
  cocycle. This is the same normalization over a genuinely **profinite** Galois group, so the two
  Kummer examples together test that the finite computation and the profinite statement agree.
- **The `C₄` non-cocycle check** (Layer 13): for `G = C₄ = ⟨σ⟩`, `U = ⟨σ²⟩`, `s = σ` and `α ≠ 0`,
  the values of the Shapiro component `b₁` at `1, σ, σ², σ³` are `0, 1, 1, 0`, so
  `b₁(σ · σ) = 1` while `b₁(σ) + b₁(σ) = 0`, and the same failure holds for `b_s`. Neither
  component is a cocycle and neither has a class; only the sum `b₁ + b_s` is, and the sum passes
  the same test. Tau Ceti's `Evens/Cochain.lean` carries all three checks together, as the
  acceptance check of the cochains this roadmap uses. This is what stops identity 3
  of Layer 13 from being written as an equation between two separate classes, which is a type error
  dressed as a statement.
- **The index-2 Evens anchor** (Layer 13): for `G = C₄ ⊇ U = C₂` and `α ≠ 0`, `N^{Ev}(α)`
  restricts to the nontrivial class on `U`, so `N^{Ev}(α) ≠ 0` in `H²(C₄, 𝔽₂) ≅ 𝔽₂`. Read off the
  extension: a class in `H²(C₄, 𝔽₂)` with trivial coefficients classifies a **central** extension
  `1 → C₂ → E → C₄ → 1`, and a central extension whose quotient is cyclic is abelian, so `E` is
  `C₈` or `C₂ × C₄` and no nonabelian group of order 8 can occur. The nonzero class is `C₈`: a
  lift of a generator of `C₄` has fourth power equal to the generator of the kernel, hence order
  8. `Suggested.lean` carries both halves of that computation, and it is the convention anchor for
  the graph cocycle.
- **The `D₁₆` anchor** (Layer 13): on `C₂ ≀ C₂` with the base group `U₀`, `s = (0, 0, 1)` and the
  tautological character, `ν_taut = c_{D₁₆} + δ 1_{{u, uv, s, vs}}` as cochains, where `c_{D₁₆}` is
  the factor set of the section `(us)^i s^j ↦ r^i f^j` of `D₁₆ → C₂ ≀ C₂`. `Suggested.lean` proves
  this, the cocycle identity of `c_{D₁₆}`, the kernel `{1, r⁴}` and the section property by
  computation (`evensGraphCochain_wreath`, `wreathD16Cocycle_isCocycle`,
  `dihedralToWreath_eq_one_iff`, `dihedralToWreath_wreathSection`). It fixes the index-two norm
  against a standard extension: with `SD₁₆` or `Q₁₆` in place of `D₁₆` the identity has no
  coboundary witness.
- **Identity 5 on cochains** (Layer 13): for `y` a homomorphism on `G`, both Shapiro components of
  `y|_U` are `b = y + y(s) · χ_U`, and the graph cochain is `b ⌣ b + χ_U ⌣ b`;
  `evensGraphCochain_comp_subtype` is proved in `Suggested.lean`. The false neighbor
  `N(res y) = y ⌣ y` already fails at `y = χ_U` on `C₂ ≀ C₂`: there `res χ_U = 0`, while
  `χ_U ⌣ χ_U ≠ 0`.
- **The duality-pairing shapes** (Layers 0, 8): for finite discrete `M` and `n`-torsion
  coefficients, the three evaluation cup pairings
  `Hⁱ(G, Hom(M, μ)) × H²⁻ⁱ(G, M) → H²(G, μ)`, `i = 0, 1, 2`, exist with their biadditivity and
  naturality, as instances of the six-shape API. No perfectness statement is made here.

---

## 7. Ordering and parallelism

Layer 0 comes first. Layers 1 and 2 are independent of each other and both rest only on Layer 0,
so the canonical carrier and the explicit complex can be built at the same time. After Layer 2,
three more pieces are independent of one another and three contributors can work on them at once:
Layer 3's finite comparison, Layer 5's exactness and long exact sequence, and Layer 6's transversal
calculus. Layer 8's cups are not among them: their projection formula needs Layer 6 and their
connecting-map identities need Layer 5.

The table below is the dependency graph, and every `Prerequisites` line above agrees with it.

| Layer | Needs |
|---|---|
| 0 discrete modules, sections | Mathlib only |
| 1 canonical carrier, functoriality | Mathlib's `continuousCohomology`; 0 |
| 2 explicit complex | 0 |
| 3 comparisons | 1, 2 |
| 4 finite-quotient colimit | 2, 3 |
| 5 exact sequences | 2; the five-term sequence also needs 0's continuous sections |
| 6 change of groups | 2; `cor ∘ δ = δ ∘ cor` also needs 5 |
| 7 coinduction, Shapiro | 0, 2, 6; the algebraic comparison also needs the merged `RepresentationTheory/InductionRestriction` |
| 8 cup products | 2; the projection formula needs 6, the connecting-map identities need 5 |
| 9 Galois interface | 3, 4, 5, 8; the field-extension bridge also 10, 12, 13 |
| 10 all degrees, additive | 1, and 3, 4, 5, 6, 7, which it generalizes |
| 11 cohomological dimension | 10; the class-module theorem also 2, 3, 5, 6, 7 |
| 12 all bidegrees, multiplicative | 1, 8; agreement with 8 needs 3, the projection formula needs 10 |
| 13 Evens norm | 5, 6, 7, 8 for the explicit form, with 3, 10 and 12 for its statements on the canonical carrier; 10 and 12 for the general construction |

Every entry in the right-hand column is a Mathlib declaration, an earlier layer of this roadmap, or
a merged roadmap. Every dependency points backwards, with one placement exception: the
field-extension bridge at the end of Layer 9 transports Layers 10, 12 and 13 to `L/K`, so it is
built after Layer 13, and it is written in Layer 9 because it is part of the Galois interface.
Otherwise no layer above uses a milestone of a later one, and an integration theorem is stated in
the first layer where both of its sides exist.
Nothing here needs a pull request, a later toolchain pin, or another repository, so every layer can
be started immediately.

---

## 8. References

Item numbers are verified against the editions cited.

- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., Springer
  Grundlehren 323 (2008), the source of record. Ch. I: (1.2.2) the definition by continuous
  homogeneous cochains with the inhomogeneous translation (I §2), (1.2.5) the finite-quotient
  colimit `lim→_U Hⁿ(G/U, A^U) ≅ Hⁿ(G, A)`, (1.3.2) the long exact sequence, I §4 cup products
  ((1.4.1) Leibniz, (1.4.2) naturality, (1.4.3) and (1.4.5) `δ`-compatibility, (1.4.4)
  associativity and graded commutativity), I §5 change of groups ((1.5.1) the cohomology of a
  projective limit, (1.5.2) `cor ∘ δ`, (1.5.3)(i),
  (iii), (iv) restriction, inflation and the projection formula, (1.5.6) the double-coset formula,
  (1.5.7) `cor ∘ res = (G : U)`, (1.5.9) the transfer as the dual of corestriction), (1.6.1)
  torsionness, (1.6.4) Shapiro (with the p. 61 footnote
  naming its `Ind` as the coinduced functor), (1.6.7) the five-term sequence, (1.7.7) procyclic
  computations. Ch. III §3 cohomological dimension: (3.3.1) definitions, (3.3.2) the simple-module
  criterion, (3.3.3) `cd ≤ scd ≤ cd + 1`, (3.3.4) the strict-dimension criterion, (3.3.5) closed
  subgroups, (3.3.6) Sylow, (3.3.11) corestriction in the top degree. Ch. III §6 groups of strict
  cohomological dimension 2: (3.6.1) the classes `u_{U/V}`, (3.6.2) the transfer diagram, (3.6.3)
  the reduction to cyclic quotients of prime order, (3.6.4) the class module. Ch. VI: (6.2.1)
  Hilbert 90 for arbitrary Galois extensions, with the Kummer isomorphism
  `H¹(G_K, μₙ) ≅ Kˣ/(Kˣ)ⁿ` derived on the same page, and (6.2.2) the pairing form.
- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Springer Ergebnisse 40 (2010): Prop. 2.2.2
  (continuous sections of profinite quotients), Thm. 2.1.3 (open normal subgroups as a fundamental
  system, `G = lim← G/U`), Def. 6.4.1 and Cor. 6.5.6(a) (cohomology and its colimit description),
  Thm. 6.10.5 (Shapiro, stated for `Coind_H^G` by that name), §6.7 (restriction and
  corestriction), Cor. 7.2.5(a) (five-term), §7.1 (cd definitions), Thm. 7.3.1 (closed subgroups),
  §7.9 (cup products, with `Cor(a ∪ Res b) = Cor(a) ∪ b` at 7.9.6/7.9.7).
- J-P. Serre, *Galois Cohomology*, Springer (1997), Ch. I §§2-4: the compact exposition this
  layer structure follows; §2.2 Prop. 8 (the cohomology of a projective limit).
- J-P. Serre, *Local Fields*, Springer GTM 67 (1979), Part Three: Ch. VII (basic facts; §5 change
  of group; §7 Prop. 6 `Cor ∘ Res = n`; §8 the transfer), Ch. VIII (finite groups; §2 Props. 3-4;
  §3 cup products), Ch. X §3 (the profinite theory *defined* by the colimit over open normal
  subgroups, the third of the three descriptions Layers 2 to 4 relate), Ch. XIII §1 (the
  cohomology of `Ẑ`: Prop. 1, Prop. 2 `H²(Ẑ, A) = 0` for `A` divisible or torsion).
- L. Evens, "A generalization of the transfer map in the cohomology of groups", Trans. AMS 108
  (1963), 54-65: §§2-5 the monomial and wreath-product norm; §6 Props. 1-4 (transitivity, double
  cosets, multiplicativity); Thm. 1 (p. 63), for `(G : H) = l` and `χ ∈ H^{2r}(H, k)` with `k` a
  commutative `G`-ring, `𝒩(1 + χ) = 1 + tr(χ) + ⋯ + 𝒩(χ)`, whose lowest terms are `1` and the
  ordinary transfer.
- A. Kozlowski, "The Evens-Kahn formula for the total Stiefel-Whitney class", Proc. AMS 91 (1984),
  309-313: Thm. 1.1 (the transfer on the total-class group commuting with `w`) and **Lemma 2.4**
  (the index-2 expansion in low degrees, whose proof appears not there but in his "The transfer
  in Segal's cohomology", Illinois J. Math.). Layer 13's explicit form is the self-contained
  account of that lemma.
- B. Kahn, "Classes de Stiefel-Whitney de formes quadratiques et de représentations galoisiennes
  réelles", Invent. Math. 78 (1984): th. I.4.2 (the Stiefel-Whitney classes of a representation
  induced from a subgroup of index two, through the norm) and Remarque II.2.3, which Layer 13's
  pullback formula makes precise at rank one; the relative Stiefel-Whitney identity that consumes
  Layer 13 is owned by `../QuadraticFormInvariants/`.
- J.-P. Serre, "L'invariant de Witt de la forme Tr(x²)", Comment. Math. Helv. 59 (1984), 651-676:
  Théorème 1′, whose case `n = 2` is the identification of Layer 13's `D₁₆` class with `w₂` of the
  signed-permutation representation of `C₂ ≀ C₂`.
- H. Koch, *Galois Theory of p-Extensions*, Springer (2002), Ch. 3 "Cohomology of Profinite
  Groups", built directly on continuous **inhomogeneous** cochains (§3.1, the textbook model of
  Layer 2): Thm. 3.9 (Shapiro), Thm. 3.10 (`cor ∘ res = (G : H)`), Thm. 3.14
  (inflation-restriction-transgression in degree `n`), Thm. 3.16 (inductive limits), §3.9 (cup
  products); Ch. 5 (cd of pro-`p` groups through `Hⁿ(G, 𝔽_p)`, Def. 5.1) and Ch. 6 (generator and
  relation ranks through `H¹` and `H²`), which is the `../ProfiniteProPGroups/` interface.
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed. (2006), Ch. I §0: the continuous-cochain
  conventions (p. 2), cup-product properties (0.1.1)-(0.1.6), Remark 0.11 (Shapiro for `M_*`),
  Remark 0.10 (`Ext` colimits), Prop. 0.15 (conjugation acts trivially), the reference point for
  the duality-pairing shapes.
- K. S. Brown, *Cohomology of Groups*, Springer GTM 87 (1982), discrete background: Ch. III §9
  (the transfer, five constructions), III §10 ((10.1) annihilation by the index), Ch. V §3 (cup
  products; (3.5) associativity at the cochain level, (3.6) commutativity, (3.8) the transfer
  formula `cor (res u ⌣ v) = u ⌣ cor v`).
