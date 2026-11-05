# Roadmap: continuous cohomology of profinite groups

**Summary.** Continuous cochain cohomology of a profinite group acting on discrete modules is the language of
Galois cohomology. Local and global class field theory, the duality theorems, Demushkin groups,
and the cohomological invariants of quadratic forms are all written in it. Mathlib supplies a deep
theory of discrete group cohomology and continuous cohomology with its compatible-pair maps; Exact supplier contracts
records that inventory. This roadmap builds what one computes with: explicit inhomogeneous
`H⁰, H¹, H²` with their cocycle identities, the comparison isomorphisms between models, the
description as a colimit over finite quotients, long exact sequences, corestriction, Shapiro's
lemma for closed subgroups, cup products with their compatibilities, cohomological dimension,
Hilbert 90 and Kummer theory in profinite form, and the Evens norm.

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
milestone below is stated on such an object, the declaration it names is Tau Ceti's, cited by its
qualified name. `Suggested.lean` is the acceptance test, not an interface: it states only the
headline theorems that the pinned libraries do not yet prove (Layer 11's universe independence of
the dimension invariants, the strict-dimension criterion, and the class-module theorem for an arbitrary open normal subgroup), and
its module docstring names the one headline that is not statable at the pins, the general Evens
norm of Layer 13.

---

## Scope and ownership

### Library scope and remaining targets

The remaining targets are the universe comparison and strict criterion, the class-module
transfer and inflation route, continuous Frobenius reciprocity and its transport laws,
coefficient and connecting-map compatibilities, simple-module dévissage, and the Evens
norm and Galois descent. The list below describes the library scope; a qualified Mathlib
or Tau Ceti declaration is consumed under Exact supplier contracts, not replanned.

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
10. Cohomological dimension `TauCeti.cohomologicalDimensionAt`, `TauCeti.cohomologicalDimension`, `TauCeti.strictCohomologicalDimensionAt` with their dévissage and closed-subgroup
    theory, the `p`-primary torsion of the cohomology of `p`-primary coefficients, the criterion
    computing `TauCeti.strictCohomologicalDimensionAt` from `TauCeti.cohomologicalDimensionAt`, and the class module of a group of strict
    `p`-cohomological dimension at most two (Layer 11).
11. The Galois interface: profinite Hilbert 90 and the Kummer isomorphism with its explicit
    cocycle (Layer 9).
12. The Evens norm for open subgroups: the general monomial construction on even-degree
    cohomology with coefficients in a discrete commutative `G`-ring, its characteristic-two form in
    every degree, and its agreement with the explicit index-two form; the descent of the graph class to cohomology classes and its `D₁₆` pullback formula (Layer 13).

### Supplied to other roadmaps

Theorem-level contracts only, listed in Scope and ownership.

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
- Profinite Sylow theory and the resulting equality `cd_p G = cd_p G_p`. That belongs to the
  Profinite Pro-`p` Groups roadmap, which owns the existence and conjugacy of pro-`p` Sylow subgroups
  and supernatural indices.
- Projective representations, factor sets, and Schur multipliers as representation theory. This
  roadmap supplies `H²` and nothing about its representation-theoretic applications.

### Portfolio export contract

The Mathlib and Tau Ceti declarations named in Scope and ownership and in the layers are the sole
continuous-cohomology interface consumed by `ProfiniteProPGroups`, `ClassFieldTheory`, `LocalGaloisGroups`, and
`QuadraticFormInvariants`. Finite-group Tate cohomology in negative degrees and
`FiniteClassFormation` are owned by `ClassFieldTheory`; this roadmap contains neither. Ordinary
continuous cohomology in all degrees, `TauCeti.cohomologicalDimensionAt`, continuous corestriction, Kummer theory, and the
continuous cup product remain here.

### The canonical carrier

The canonical object is Mathlib's continuous cohomology, and this roadmap does not build a
competing one. The pinned Mathlib supplies it:
`continuousCohomology n X : TopModuleCat R` for `X : TopRep R G`, in
`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`, with
`TopRep.homogeneousCochains` from the same file for the complex it is the homology of,
`TopRep.invariants` and `TopRep.invariantsFunctor` in
`Mathlib/RepresentationTheory/Continuous/TopRep.lean`, and
`ContinuousCohomology.zeroIso : continuousCohomology 0 X ≅ X.invariants` in
`ContCohomology/LowDegree.lean` for the one degree Mathlib computes. The exact repository pin
additionally supplies `ContinuousCohomology.resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`,
`map_id`, and `map_comp` in `ContCohomology/Functoriality.lean`. Layer 1 uses those Mathlib
declarations directly.

Every canonical-facing statement below is written against Mathlib's `TopRep R G`, the
**structure** of continuous representations of `G` on a topological `R`-module, declared in
`Mathlib/RepresentationTheory/Continuous/TopRep.lean`. It is not an abbreviation for
`Action (TopModuleCat R) G`, and the two are not definitionally equal: the pin relates them by the
explicit categorical equivalence
`TopRep.TopRepEquivActionTop : TopRep R G ≌ Action (TopModuleCat R) G`. A statement that needs the
`Action` side transports across that equivalence and says so.

`continuousCohomology` is object-valued at the pin rather than a functor, so `Hⁿ_cont(G, X)` is
`continuousCohomology n X` and its functoriality is the separate `ContinuousCohomology.map`.
Layer 1 packages the two at `φ = id` as the functor
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor`.

Any other implementation of continuous cohomology replaces this one only after an explicit
comparison of the coefficient categories and of the resolutions has been proved. Equivalence of
the categories together with agreement of the constructions makes such a replacement a transport;
it is not a definitional identity, and nothing here assumes one.

---

### Boundaries with neighboring roadmaps

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

What is exported is exactly this, named. Every backticked entry in the declaration column is a
Lean identifier at the pins: Mathlib's `TopRep`, `continuousCohomology` and the compatible-pair
maps `map`, `map_id` and `map_comp`, or the Tau Ceti declaration that implements the object. An
entry written without backticks is an object this roadmap still builds, specified in its layer. A description such as "the colimit theorem" or "the six cup
shapes" is not a citable export, and no row contains one.

| Exported object or theorem | Supplier layer | Declaration | Mathematical type |
|---|---|---|---|
| the canonical carrier | 1 | `TopRep`, `continuousCohomology` | `(n : ℕ) → TopRep R G → TopModuleCat R`, object-valued at the pin |
| compatible-pair functoriality | 1 | `map`, `map_id`, `map_comp`, `TauCeti.ContinuousCohomology.continuousCohomologyFunctor`, `TauCeti.ContinuousCohomology.continuousCochainsFunctor` | `Hⁿ(G, X) ⟶ Hⁿ(H, Y)` for `φ : H →ₜ* G`, with the coefficient functors at `φ = id`; Tau Ceti's `TauCeti.ContinuousCohomology.continuousCohomologyFunctor` and `TauCeti.ContinuousCohomology.continuousCochainsFunctor` |
| restriction, inflation, coefficient maps | 1 | `TauCeti.ContinuousCohomology.res`, `TauCeti.ContinuousCohomology.infl`, `TauCeti.ContinuousCohomology.coeffMap` | morphisms of `TopModuleCat R` |
| the coefficient dictionary | 1 | `TauCeti.ofDiscreteModule`, `TauCeti.ofDiscreteModule_isSmoothDiscrete`, `TauCeti.ofDiscreteModuleMap`, `TauCeti.ofDiscreteModulePair`, ofDiscreteModuleRes, `TauCeti.ofDiscreteModuleQuotient`, Invariants, `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep`, `TauCeti.discreteRepEquivSmoothTopRep` | `DiscreteRep R G ≌ SmoothDiscreteTopRep R G`; Tau Ceti's `TauCeti.ofDiscreteModule ℤ G M` and its companions |
| explicit `H⁰`, `H¹`, `H²` | 2 | `TauCeti.ContCohomology.C1`, `TauCeti.ContCohomology.C2`, `TauCeti.ContCohomology.d0`, `TauCeti.ContCohomology.d1`, `TauCeti.ContCohomology.Z1`, `TauCeti.ContCohomology.Z2`, `TauCeti.ContCohomology.B1`, `TauCeti.ContCohomology.B2`, `TauCeti.ContCohomology.H0`, `TauCeti.ContCohomology.H1`, `TauCeti.ContCohomology.H2`, `TauCeti.ContCohomology.H1pi`, `TauCeti.ContCohomology.H2pi`, `TauCeti.ContCohomology.DiscreteH1`, `TauCeti.ContCohomology.DiscreteH2`, `TauCeti.ContCohomology.discreteH1Equiv`, `TauCeti.ContCohomology.discreteH2Equiv` | `M^G`, and quotients of additive subgroups of the cochain spaces; Tau Ceti's `TauCeti.ContCohomology` complex |
| explicit low-degree functoriality | 2 | `TauCeti.ContCohomology.explicitMap1`, `TauCeti.ContCohomology.explicitMap1Equiv`, `TauCeti.ContCohomology.explicitRes0`, `TauCeti.ContCohomology.explicitRes1`, `TauCeti.ContCohomology.explicitRes2`, `TauCeti.ContCohomology.explicitInfl1`, `TauCeti.ContCohomology.explicitInfl2`, `TauCeti.ContCohomology.explicitCoeff0`, `TauCeti.ContCohomology.explicitCoeff1`, `TauCeti.ContCohomology.explicitCoeff2`, `TauCeti.ContCohomology.explicitConj1`, `TauCeti.ContCohomology.explicitConj1_eq_id_of_mem` | additive maps between the explicit groups |
| the comparison in degrees 0, 1, 2 | 3 | `TauCeti.ContCohomology.explicitH0IsoContinuousCohomology`, `TauCeti.ContCohomology.explicitH1IsoContinuousCohomology`, `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology` | isomorphisms in `TopModuleCat ℤ` |
| the comparison with discrete `groupCohomology` | 3 | `TauCeti.ContCohomology.explicitH0IsoGroupCohomology`, `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`, `TauCeti.ContCohomology.explicitH2IsoGroupCohomology` | additive equivalences with `groupCohomology (Rep.ofDistribMulAction ℤ G M) i` |
| naturality of the comparison | 3 | `TauCeti.ContCohomology.explicitIso_map`, `TauCeti.ContCohomology.explicitIso_res`, `TauCeti.ContCohomology.explicitIso_infl`, `TauCeti.ContCohomology.explicitIso_coeffMap` | commuting squares in compatible pairs |
| the finite-quotient system | 4 | `TauCeti.QuotientGroup.mapOfLE`, `TauCeti.invariantsInclusion`, `TauCeti.invariantsInclusion_equivariant`, `TauCeti.transitionPair`, `TauCeti.finiteLevelTransition`, `TauCeti.finiteLevelTransition_refl`, `TauCeti.finiteLevelTransition_comp` | a functor on `(OpenNormalSubgroup G)ᵒᵖ` |
| the finite-quotient colimit | 4 | `TauCeti.ContCohomology.explicitFiniteQuotientTransition1`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem0`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem1`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem2`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem0_map`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem1_map`, `TauCeti.ContCohomology.explicitFiniteQuotientSystem2_map`, `TauCeti.ContCohomology.explicitFiniteQuotientComparison0`, `TauCeti.ContCohomology.explicitFiniteQuotientComparison1`, `TauCeti.ContCohomology.explicitFiniteQuotientComparison2`, `TauCeti.ContCohomology.explicitFiniteQuotientCocone0`, `TauCeti.ContCohomology.explicitFiniteQuotientCocone1`, `TauCeti.ContCohomology.explicitFiniteQuotientCocone2`, `TauCeti.ContCohomology.explicitFiniteQuotientColimit0`, `TauCeti.ContCohomology.explicitFiniteQuotientColimit1`, `TauCeti.ContCohomology.explicitFiniteQuotientColimit2` | the universe-polymorphic explicit `Hⁱ(G, M) ≅ colim_U Hⁱ(G ⧸ U, M^U)` for `i = 0,1,2` |
| the long exact sequence in low degrees | 5 | `TauCeti.ContCohomology.DiscreteShortExact`, `TauCeti.ContCohomology.DiscreteShortExact.restrict`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_apply`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_apply`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0B`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0C`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1B`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1C`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2B`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_res`, `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_res` | connecting maps and exactness at eight nodes |
| the five-term sequence | 5 | `TauCeti.ContCohomology.H1ConjInvariants`, `TauCeti.ContCohomology.explicitInfl1_injective`, `TauCeti.ContCohomology.explicitInfRes_exact`, `TauCeti.ContCohomology.explicitRes1_mem_conjInvariants`, `TauCeti.ContCohomology.explicitResConj1`, `TauCeti.ContCohomology.explicitInfResConj_exact`, `TauCeti.ContCohomology.transgressionLift`, `TauCeti.ContCohomology.transgressionCochain`, `TauCeti.ContCohomology.transgressionCochain_apply`, `TauCeti.ContCohomology.transgressionCochain_isCocycle`, `TauCeti.ContCohomology.transgressionCochain_sub_mem_B2`, `TauCeti.ContCohomology.transgression`, `TauCeti.ContCohomology.transgression_apply`, `TauCeti.ContCohomology.fiveTerm_exact_H1N`, `TauCeti.ContCohomology.fiveTerm_exact_H2Q`, `TauCeti.ContCohomology.transgression_explicitResConj1`, `TauCeti.ContCohomology.explicitInfl2_transgression` | `0 → H¹(G⧸N, M^N) → H¹(G, M) → H¹(N, M)^{G⧸N} → H²(G⧸N, M^N) → H²(G, M)` |
| the all-degree colimit and exact sequence | 10 | `TauCeti.ContCohomology.continuousFiniteQuotientSystem`, `TauCeti.ContCohomology.continuousFiniteQuotientCocone`, `TauCeti.ContCohomology.continuousFiniteQuotientColimit`, `TauCeti.ContinuousCohomology.continuousCohomology_preservesFilteredColimits`, `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact`, `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact_shortExact`, `TauCeti.ContCohomology.DiscreteShortExact.delta`, longExact_exact, `TauCeti.ContCohomology.DiscreteShortExact.delta_naturality`, `TauCeti.ContCohomology.DiscreteShortExact.delta_res`, `TauCeti.ContCohomology.DiscreteShortExact.delta_infl`, `TauCeti.ContCohomology.DiscreteShortExact.delta_corestriction`, `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1` | the canonical colimit, filtered-colimit preservation, and `Hⁿ(G, C) ⟶ Hⁿ⁺¹(G, A)` with all exactness and naturality data |
| low-degree corestriction | 6 | `TauCeti.lWord`, `TauCeti.lWord_mem`, `TauCeti.ContCohomology.explicitCor0Transversal`, `TauCeti.ContCohomology.explicitCor1Transversal`, `TauCeti.ContCohomology.explicitCor2Transversal`, `TauCeti.ContCohomology.explicitCor0_changeTransversal`, `TauCeti.ContCohomology.explicitCor1_changeTransversal`, `TauCeti.ContCohomology.explicitCor2_changeTransversal`, `TauCeti.ContCohomology.explicitCor0`, `TauCeti.ContCohomology.explicitCor1`, `TauCeti.ContCohomology.explicitCor2`, explicitCor_comp_res0, explicitCor_comp_res1, explicitCor_comp_res2, `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta1` | finite-index additive maps on cochains, descending to classes; Tau Ceti's declarations of the same names, read at an open subgroup with a finite quotient |
| all-degree corestriction | 10 | `TauCeti.coindTraceHom`, `TauCeti.ContinuousCohomology.corestriction`, `TauCeti.ContinuousCohomology.corestriction_naturality`, `TauCeti.ContinuousCohomology.res_comp_corestriction` | `Hⁿ(U, res X) ⟶ Hⁿ(G, X)` for open `U` |
| descent from a closed subgroup | 10 | `TauCeti.ContinuousCohomology.exists_openSubgroup_le_res_eq_zero` | a class of `Hⁿ(G, X)` with zero restriction to a closed `H` has zero restriction to some open `U ⊇ H`, in every degree |
| agreement of the two corestrictions | 10 | `TauCeti.ContinuousCohomology.explicitH0Iso_corestriction`, `TauCeti.ContinuousCohomology.explicitH1AddEquivContinuousCohomology_corestriction`, `TauCeti.ContinuousCohomology.explicitH2AddEquivContinuousCohomology_corestriction` | commuting squares in degrees 0, 1, 2 |
| explicit Shapiro and coinduction | 7 | `TauCeti.coind`, coindTraceRaw, `TauCeti.coindTopRep`, `TauCeti.coindFunctor`, `TauCeti.coindFunctor_obj`, `TauCeti.coindFunctor_map_shortExact`, `TauCeti.ContCohomology.explicitShapiro0`, `TauCeti.ContCohomology.explicitShapiro1`, `TauCeti.ContCohomology.explicitShapiro2`, `TauCeti.algebraicCoindAsSmooth`, `TauCeti.topologicalCoindIsoAlgebraic`, `TauCeti.topologicalCoindIsoAlgebraic_shapiro` | `Hⁱ(G, Coind_H^G A) ≃+ Hⁱ(H, A)` for `i = 0, 1, 2`, and the open-subgroup algebraic comparison; Tau Ceti's `TauCeti.coind`, `TauCeti.coindTrace`, `TauCeti.coindTopRep`, `TauCeti.coindFunctor` and their companions |
| all-degree Shapiro and dimension shifting | 10 | `TauCeti.ContinuousCohomology.shapiroCochainMap`, `TauCeti.ContinuousCohomology.shapiroMap`, `TauCeti.ContinuousCohomology.isIso_shapiroMap`, `TauCeti.ContinuousCohomology.quasiIso_shapiroCochainMap`, `TauCeti.ContinuousCohomology.shapiroIso`, `TauCeti.ContinuousCohomology.shapiroIso_hom`, `TauCeti.ContCohomology.coindAcyclic` | the canonical Shapiro map `Hⁿ(G, Coind_H^G A) ⟶ Hⁿ(H, A)`, induced by a cochain map that is a quasi-isomorphism and not an isomorphism of complexes, an isomorphism in every degree; and the closed dependency chain used by Layer 11 |
| the six low-degree cups | 8 | `TauCeti.ContCohomology.explicitCup00`, `TauCeti.ContCohomology.explicitCup01`, `TauCeti.ContCohomology.explicitCup10`, `TauCeti.ContCohomology.explicitCup02`, `TauCeti.ContCohomology.explicitCup11`, `TauCeti.ContCohomology.explicitCup20` | `H^p(G, M) × H^q(G, N) → H^{p+q}(G, P)`, `p + q ≤ 2` |
| the connecting maps and the low-degree cups | 8 | `TauCeti.ContCohomology.explicitDelta0_explicitCup00_left`, `TauCeti.ContCohomology.explicitDelta1_explicitCup01_left`, `TauCeti.ContCohomology.explicitDelta1_explicitCup10_left`, `TauCeti.ContCohomology.explicitDelta0_explicitCup00_right`, `TauCeti.ContCohomology.explicitDelta1_explicitCup01_right`, `TauCeti.ContCohomology.explicitDelta1_explicitCup10_right` | `δ(x ⌣ y) = δx ⌣ y` and `δ(x ⌣ y) = (-1)^p x ⌣ δy` for a map of short exact coefficient sequences, in the six instances of degree `≤ 2`; Tau Ceti's theorems of the same names |
| the graded cup | 12 | `TauCeti.TopPairing` | `Hᵐ × Hⁿ → H^{m+n}` constructed on Mathlib's coinduction resolution |
| the evaluation pairing for duality | 0, 12 | `TauCeti.homAction`, `TauCeti.InternalHom.evalPairing`, `TauCeti.InternalHom.evalPairing_equivariant`, `TauCeti.TopPairing` | `Hⁱ(G, M →+ N) × H^{2-i}(G, M) → H²(G, N)`, the internal hom being Tau Ceti's `TauCeti.InternalHom G M N` |
| the Kummer isomorphism | 9 | `TauCeti.AbsoluteGaloisGroup`, muN, `TauCeti.KummerCoeff`, `TauCeti.kummerCoeff_continuousSMul`, `TauCeti.powerSubgroup`, `TauCeti.powerClassQuotient`, `TauCeti.powerClassMap`, `TauCeti.kummerMap`, `TauCeti.kummerIso`, `TauCeti.kummerIsoTransport`, `TauCeti.kummerRes`, `TauCeti.kummerIso_res`, `TauCeti.kummerMapCanonical`, `TauCeti.explicitIso_kummerMap`, `TauCeti.kummerCor`, `TauCeti.kummerIso_norm` | `Kˣ ⧸ (Kˣ)ⁿ ≃* Multiplicative (H¹(AbsoluteGaloisGroup K, KummerCoeff K n))`; Tau Ceti's `TauCeti.kummerIso` and its companions |
| the multiplicative coefficients, the Kummer sequence and Hilbert 90 | 9 | `TauCeti.UnitsCoeff`, `TauCeti.unitsCoeff_continuousSMul`, `TauCeti.baseUnitsEquivInvariants`, `TauCeti.kummerCoeffIncl`, `TauCeti.unitsCoeffPow`, `TauCeti.kummerShortExact`, `TauCeti.kummerShortExact_incl`, `TauCeti.kummerShortExact_proj`, `TauCeti.hilbert90`, `TauCeti.kummerCoeffToUnits`, `TauCeti.h2KummerToUnits`, `TauCeti.h2KummerToUnits_injective`, `TauCeti.h2KummerToUnits_range` | `H¹(G_K, (Kˢ)ˣ) = 0`, and `H²(G_K, μₙ) ↪ H²(G_K, (Kˢ)ˣ)` with image the `n`-torsion; Tau Ceti's declarations of the same names |
| the field-extension bridge | 13 | `TauCeti.galoisSubgroup`, `TauCeti.galoisSubgroup_index`, `TauCeti.galoisSubgroupEquiv`, `TauCeti.galoisSubgroup_conj`, `TauCeti.galoisF2Iso`, `TauCeti.galoisRes`, `TauCeti.galoisCor`, `TauCeti.galoisConj`, galoisEvens, `TauCeti.galoisCharacter`, `TauCeti.galoisRes_galoisCor`, `TauCeti.galoisConj_evensConj`, `TauCeti.galoisRes_cup`, `TauCeti.galoisCor_cup`, `TauCeti.galoisRes_eq_zero_iff`, `TauCeti.exact_galoisRes_galoisCor_of_finrank_eq_two`, `TauCeti.galoisRes_comp`, `TauCeti.galoisRes_embedding_independent`, `TauCeti.galoisCor_embedding_independent`, `TauCeti.galoisConj_embedding_independent`, `TauCeti.galoisCharacter_embedding_independent`, galoisRes_galoisEvens, galoisEvens_add, galoisEvens_galoisRes, galoisEvens_embedding_independent | restriction, corestriction, the index-two norm and the quadratic character for a finite separable `L/K`; `res ∘ cor = id + conj`; the conjugate as the transport of `OpenSubgroup.evensConj`; the cup and projection formulas; the Evens identities and the index-two exact sequence read on the `L/K` side; tower functoriality and embedding independence |
| cohomological dimension | 11 | `TauCeti.IsPPrimaryTorsion`, `TauCeti.isPPrimaryTorsion_continuousCohomology`, `TauCeti.CohomologicalDimensionLE`, `TauCeti.StrictCohomologicalDimensionLE`, `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`, `TauCeti.cohomologicalDimension`, `TauCeti.cohomologicalDimensionAt_le_iff`, `TauCeti.strictCohomologicalDimensionAt_le_iff`, `TauCeti.cohomologicalDimensionLE_iff_torsion`, `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ`, `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`, `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, `TauCeti.cohomologicalDimensionAt_le_of_isClosed`, `TauCeti.cohomologicalDimensionAt_eq_of_not_dvd_index`, `TauCeti.strictCohomologicalDimensionAt_le_of_isClosed`, `strictCriterion` | Tau Ceti's `ℕ∞`-valued invariants `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt` and `TauCeti.cohomologicalDimension` at the coefficient universe of `G`, and `Hⁿ(G, M)` `p`-primary for `p`-primary `M`; `strictCriterion` is a target here |
| the class module of strict dimension two | 11 | `TauCeti.abelianizationProP`, `TauCeti.abelianizationProPClass`, `subsingleton_h1_abelianizationProP`, `abelianizationProPClass_generates` | for `scd_p G ≤ 2` and open normal `V`: `H¹(G ⧸ V, V^ab(p)) = 0`, and `H²(G ⧸ V, V^ab(p))` is cyclic of order `#(G ⧸ V)_p`, generated by the class of the extension, which `TauCeti.abelianizationProPClass` takes with the proof that `V` is open |
| the Evens norm | 13 | `TauCeti.ContCohomology.evensGraphCochain`, `TauCeti.ContCohomology.graphClass`, `OpenSubgroup.evensConj` | `H^q(U, 𝔽₂) → H^{l q}(G, 𝔽₂)` for open `U` of index `l`; at index two and degree one, the graph class |
| the index-2 Evens identities | 13 | `Subgroup.indexTwoCharacter`, `TauCeti.ContCohomology.evensGraphCochain_comp_subtype` | identities of classes in `H²(G, 𝔽₂)`, the fifth with the class `χ_U` of the index-two character |
| the index-two exact sequence | 13 | `TauCeti.exact_trivialF2ResMap_trivialF2CorMap_of_index_two`, `TauCeti.exact_trivialF2ResMap_trivialF2CorMap_of_index_two` | `H¹(G) → H¹(U) → H¹(G) → H²(G) → H²(U) → H²(G)` by restriction, corestriction and cup with `χ_U`, exact, with `{0, χ_U}` the kernel of restriction in degree one |
| the index-two norm as a pullback of `D₁₆` | 13 | `TauCeti.WreathC2`, `TauCeti.wreathBase`, `TauCeti.wreathTautological`, `TauCeti.wreathSwap`, `TauCeti.dihedralToWreath`, `TauCeti.dihedralToWreath_eq_one_iff`, `TauCeti.wreathSection`, `TauCeti.dihedralToWreath_wreathSection`, `TauCeti.wreathD16Cocycle`, `TauCeti.wreathD16Cocycle_isCocycle`, `TauCeti.ContCohomology.wreathWitness`, `TauCeti.ContCohomology.evensGraphCochain_wreath`, `TauCeti.ContCohomology.evensGraphCochain_comap`, `TauCeti.ContCohomology.indexTwoInd`, `TauCeti.ContCohomology.comap_indexTwoInd_wreathBase`, `TauCeti.ContCohomology.wreathTautological_indexTwoInd`, `TauCeti.ContCohomology.evensGraphCochain_indexTwoInd`, `TauCeti.ContCohomology.evensGraphCochain_eq_indexTwoInd_pullback` | the graph cochain of the tautological character of `C₂ ≀ C₂` is the factor set of `D₁₆ → C₂ ≀ C₂` plus an explicit coboundary; every index-two norm is its pullback along `Ind α : G → C₂ ≀ C₂` |

Three points about the index-2 Evens identities, because they are exact and easy to get wrong. The
identities are statements about **cohomology classes**, not about the graph cochain, and Layer 13
states them that way. The polarization is
```
N(α + β) - N(α) - N(β) = cor (α ⌣ (s · β)),
```
with the **conjugate** class on the right. Dropping the conjugate gives a different statement, and
this roadmap does not supply it; a consumer that wants the unconjugated form must prove the two
equivalent under stated hypotheses. And the conjugate `s · β` is `OpenSubgroup.evensConj`, which is defined
without choosing `s`: an element outside `U` appears only where a right-hand side is a cochain
formula (identity 3, `TauCeti.ContCohomology.graphClass_eq_cochainClass`,
evensNormIndexTwo_eq_ind_pullback), and there
it is universally quantified, so none of the identities is a statement about a choice.

### The comparisons carry the operations, not only the groups

Exporting an isomorphism of underlying groups in each of degrees `0, 1, 2` is not enough, and a
roadmap that stopped there would leave every consumer to prove for itself that the explicit
corestriction is the canonical one. So the equations saying that the degree-`0`, `1` and `2`
comparisons carry **each exported operation** to its counterpart are milestones of this roadmap in
their own right, listed in the layer where both sides first exist:

| Operation | Comparison milestone | Layer |
|---|---|---|
| compatible pairs | `TauCeti.ContCohomology.explicitIso_map` | 3 |
| restriction | `TauCeti.ContCohomology.explicitIso_res` | 3 |
| inflation | `TauCeti.ContCohomology.explicitIso_infl` | 3 |
| coefficient maps | `TauCeti.ContCohomology.explicitIso_coeffMap` | 3 |
| connecting maps | `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1` | 10 |
| corestriction | `TauCeti.ContinuousCohomology.explicitH0Iso_corestriction`, `TauCeti.ContinuousCohomology.explicitH1AddEquivContinuousCohomology_corestriction`, `TauCeti.ContinuousCohomology.explicitH2AddEquivContinuousCohomology_corestriction` | 10 |
| cup products | `TauCeti.ContCohomology.explicitIso_cup` and its five siblings | 12 |
| Kummer classes | `TauCeti.explicitIso_kummerMap` | 9 |
| the Evens norm | milestone 8 of 13.2, agreement with evensNormIndexTwo | 13 |

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

## Conventions

- **Groups.** `G` is a topological group: `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`.
  The explicit low-degree complex (Layer 2) and its exactness and cup-product identities (Layers
  5 and 8) are stated at that generality; profiniteness is not needed to define cochains.
  **Profinite** means the additional classes `[CompactSpace G] [TotallyDisconnectedSpace G]`,
  exactly the hypotheses of Mathlib's `exist_openNormalSubgroup_sub_open_nhds_of_one`.
  Profiniteness enters for the canonical comparison (Layer 3), the colimit theorem (Layer 4),
  continuous sections and the transgression (Layers 0, 5, 7, 10), cohomological dimension
  (Layer 11) and the Galois interface (Layer 9). Do not take `ProfiniteGrp` (the category) as a
  hypothesis of a theorem: use the unbundled classes, as Mathlib's `ClopenNhdofOne.lean` does, and
  reserve `ProfiniteGrp` for categorical statements.
- **Discrete `G`-modules, in Mathlib's classes.** A topological `G`-module is `[AddCommGroup M]
  [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]`; a
  **discrete** module adds `[DiscreteTopology M]`. No bundling class is introduced: instance
  search composes these freely and each statement quantifies over exactly the classes it needs.
  For discrete `M`, continuity of the action is equivalent to openness of every point stabilizer
  (`continuousSMul_iff_stabilizer_isOpen`); state and use both forms. The categorical form is
  `TopRep k G` for canonical-facing statements, and the translation between the two is a Layer 1
  target modelled on the pin's discrete `Rep.ofDistribMulAction`.
- **Scalars.** The primary coefficient ring is `ℤ`: the explicit theory is stated for
  `DistribMulAction G M`, and the canonical statements are stated against `TopRep ℤ G`. A
  `TopRep k G` refinement for a ring `k` requires a genuine `Module k M` structure on the
  coefficients, **including** `[ContinuousSMul k M]`, and a restriction-of-scalars compatibility
  theorem. Discreteness of `M` does not make scalar multiplication continuous when `k` has a
  nondiscrete topology: a nonzero real vector space with the discrete topology is the basic
  counterexample, since `r ↦ r • v` pulls `{0}` back to the non-open `{0} ⊆ ℝ`. State that
  refinement only where the continuous `k`-action exists, and never add a `Module k` hypothesis to
  a statement about profinite groups that does not need it.
- **Universes.** The group and its coefficient modules live in one universe; the coefficient
  **ring** lives in another, so that a small ring such as `ZMod n` in `Type 0` is usable over a
  Galois group in any universe. The first half is forced by the pin: the canonical resolution is
  built from `C(G, -)`, so a coefficient module of `TopRep R G` cannot live below the universe of
  `G`. Where a `Type 0` object is needed as coefficients over a group in a higher universe, as
  `𝔽₂` is for the Evens norm, it is lifted (`TauCeti.trivialF2` carries `ULift (ZMod 2)`). The **only**
  declarations pinned to `Type 0` are the three comparisons with Mathlib's discrete
  `groupCohomology`, `TauCeti.ContCohomology.explicitH0IsoGroupCohomology` and its two siblings, because `Rep k G` puts
  `k` and `G` in one universe and `k` here is `ℤ`; they carry their own binders,
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
  cor¹_t (res f) = (G : U) • f + d⁰ c,     where   c = ∑ (u : G ⧸ U), f (t u) ∈ M,
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
  halves are named separately, in Tau Ceti as `TauCeti.QuotientGroup.mapOfLE` and
  `TauCeti.invariantsInclusion` with its equivariance lemma; the pair they assemble to and the map it
  induces on cohomology are `TauCeti.transitionPair` and `TauCeti.finiteLevelTransition`. The comparison map to
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
- **The Evens norm** is developed for an open subgroup of arbitrary finite index `l` with
  coefficients in a discrete commutative `G`-ring `A`, on even-degree classes,
  `H^{2q}(U, A) → H^{2lq}(G, A)`, which is the generality of Evens' construction; when `2 = 0` in
  `A`, in particular for `𝔽₂ = ZMod 2` with trivial action, it is defined in every degree. The
  index-two, degree-`1 → 2` case with coefficients `𝔽₂` is additionally given by the explicit
  two-point graph cocycle, which is the form the Evens-Kahn formula consumes. Layer 13 fixes both
  and identifies them.

---

## Exact supplier contracts

### From Mathlib

All paths at the pinned Mathlib.

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
  `TauCeti.hilbert90`); `FiniteCyclic.lean` (`groupCohomologyIsoEven/Odd`); `Resolution.lean` (the bar
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

### From Tau Ceti

The following inventory fixes the reused carriers and proved results. The mathematical
descriptions and API lists in the layers expand these contracts; they are not targets to
reconstruct the named declarations. The missing dimension, class-module and norm statements
are distinguished as targets in Layers 11 and 13. The interfaces use: Mathlib's discrete `groupCohomology`
package including `LowDegree`, `Functoriality`, `LongExactSequence`, `Shapiro` and `Hilbert90`;
Mathlib's `OpenSubgroup`/`OpenNormalSubgroup`, `ProfiniteGrp` and `ClopenNhdofOne` material;
Mathlib's Krull topology, infinite Galois correspondence and separable-closure API; and Mathlib's
`continuousCohomology` carrier together with the compatible-pair maps in
`Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`. The exact repository
pin contains `resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id`, and `map_comp`, and this
roadmap consumes those declarations directly rather than restating them. From Tau Ceti it consumes,
by name, the modules of `TauCeti/RepresentationTheory/Homological/ContCohomology/` that implement
its objects (`SmoothDiscrete`, `Functoriality`, `Additive`, `LowDegree`, `ExplicitFunctoriality`,
`CohomologyComparison`, `ContinuousCohomologyIso`, `GroupCohomologyIso`, Invariants,
`Inflation/Basic`, `Inflation/Comparison`, `FiniteQuotient/Basic`, `FiniteQuotient/Explicit`,
`FiniteQuotient/Colimit`, `FiniteQuotient/Canonical`, `FiniteQuotient/AllDegreeColimit`,
`FiniteQuotient/DegreeTwoDescent`, `Conjugation`, `FiveTerm`,
`Transgression`, `ShortExact`, `LongExact`, `DeltaNaturality`, `ExactCochains`,
`HomologySequence`, `Inflation/ConnectingMap`, `ConnectingMapComparison`, `Corestriction/Basic`,
`Corestriction/Transitivity`, `ProjectionFormula`, `Coinduced`, `Coinduced/Discrete`,
`Coinduced/Exact`, `Coinduced/Functor`, `Coinduced/PreservesExactness`, `Shapiro`,
`DimensionShifting/Basic`, `Cup/Product`, `Cup/ConnectingMap`, `CohomologicalDimension`,
`TrivialF2`, `Evens/Cochain`, `Evens/Class`, `Evens/DihedralPullback`,
`Corestriction/Mackey/Basic`, `Corestriction/Mackey/AllDegrees`,
`Corestriction/AllDegreeTransitivity`, `Corestriction/ConnectingMap`, `Corestriction/Conjugation`,
`Coinduced/Quotient`, `FiniteCyclic`, `CohomologicalDimension/ClassModule/Basic` and `CohomologicalDimension/ClassModule/ChangeOfGroup`), the transversal word `TauCeti.lWord` of
`TauCeti/GroupTheory/TransversalWord.lean` with its continuity `TauCeti.continuous_lWord`, the
permutation wreath products `TauCeti.PermutationWreathProduct` and `TauCeti.WreathProduct` with the
monomial homomorphism `Subgroup.monomialHom` and its continuity `Subgroup.continuous_monomialHom`,
the profinite integers `TauCeti.zHat` with the cohomology computations of
`TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean`, the
uniform local constancy `TauCeti.isOpen_rightTranslationStabilizer` of
`TauCeti/Topology/Algebra/Group/LocallyConstant.lean`, the inclusion of a subgroup as a continuous
homomorphism `TauCeti.ContinuousMonoidHom.subgroupSubtype`, the
Galois-cohomology modules of `TauCeti/FieldTheory/GaloisCohomology/` (`Coefficients`, `Kummer`,
`Hilbert90`, `BrauerTorsion`, `Restriction`, `Corestriction/Basic`, `Corestriction/Cup`,
`Corestriction/Exact`, `Character`) with `TauCeti.AbsoluteGaloisGroup`,
`TauCeti.absoluteGaloisGroupRestrictEquiv`, `TauCeti.galoisSubgroup` and the power classes of
`TauCeti/Algebra/Group/PowerClassGroup.lean`, together with `TauCeti.InternalHom`, the
`G ⧸ H`-action on
`FixedPoints.addSubgroup H M` in `TauCeti/GroupTheory/GroupAction/FixedPoints.lean`,
`TauCeti.QuotientGroup.mapOfLE`, `TauCeti.exists_openNormalSubgroup_smul_eq_self`,
`TauCeti.exists_continuous_section`, `TauCeti.leastENatBound`, `TauCeti.IsPPrimaryTorsion`,
`TauCeti.quotientOpenSubgroup`, `TauCeti.maximalProPQuotient` and the conjugation action on
`TopologicalAbelianization`.


### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

Consume the sections “What Mathlib already has (consume)” (adjunctions and
`Rep.indCoindIso`) and Layer 0 (transitivity and projection formulas), through Mathlib `Rep.indCoindIso` and Tau Ceti
`TauCeti.topologicalCoindIsoAlgebraic`. Closed-subgroup topological coinduction remains
the continuous interface of Layer 7 below.

## How to read the build

Layers 0–3 fix the coefficient categories, explicit complex and canonical comparisons;
Layers 4–7 give colimits, exact sequences and change of groups; Layers 8–10 connect products
and Galois coefficients to the all-degree theory; Layer 11 gives dimension and class modules;
Layers 12–13 supply the graded product interface and multiplicative transfer. Qualified library
names denote the supplier contracts above and below; their mathematical descriptions specify the
inputs being used, not another construction. Unqualified prose targets and the five named Lean
headlines are the remaining work. Each subsection lists the inputs for its statement and route,
and each layer closes with examples and dependencies. The library implementations are reused
with their hypotheses and normalizations.

## Layer 0: discrete modules and continuous sections

The inputs for this layer are Mathlib: `continuousSMul_iff_stabilizer_isOpen`, `stabilizer_isOpen`,
`exist_openNormalSubgroup_sub_open_nhds_of_one`, `OpenSubgroup`, `OpenNormalSubgroup`,
`ProfiniteGrp.closedSubgroup_eq_sInf_open`, `FixedPoints.addSubgroup`. Tau Ceti:
`TauCeti.exists_openNormalSubgroup_smul_eq_self`
(`TauCeti/Topology/Algebra/GroupAction/Discrete.lean`), the actions on `FixedPoints.addSubgroup` in
`TauCeti/GroupTheory/GroupAction/FixedPoints.lean` and their continuity
`TauCeti.continuousSMulQuotientFixedPoints`, `TauCeti.exists_continuous_section` and
`TauCeti.exists_continuous_section_of_le` (`TauCeti/Topology/Algebra/Group/Profinite/Section.lean`).
This layer has no earlier-layer dependency.

The coefficient theory and the two topological inputs the later layers lift through, stated in the
unbundled classes of Conventions.


### 0.1 Openness

Point stabilizers of a discrete module are open; for finite `M` the kernel of the
action is open; over a profinite `G`, a finite discrete module has an open **normal** subgroup
acting trivially, so its action factors through a finite quotient. (Consume
`continuousSMul_iff_stabilizer_isOpen` and `exist_openNormalSubgroup_sub_open_nhds_of_one`.) For
an arbitrary discrete `M` over a profinite `G`, every element is fixed by an open normal
subgroup, so `M = ⋃_U M^U`: Tau Ceti's `TauCeti.exists_openNormalSubgroup_smul_eq_self`. Layer 4 uses that union.

*Needs:* Mathlib `continuousSMul_iff_stabilizer_isOpen` and `exist_openNormalSubgroup_sub_open_nhds_of_one`.

**Checks.**

- For the sign action of `C₂` on `𝔽₃`, the stabilizer of `1` is `{1}`, whereas for the trivial action it is `C₂`; both are open, so smoothness does not mean triviality.
- For the sign action, the open-normal invariant spaces include `M^{1} = 𝔽₃` while `M^{C₂} = 0`; their union is `𝔽₃`.
- For `ℤ_p` acting trivially on `𝔽_p`, the action kernel is all of `ℤ_p` and the finite quotient has order `1`.

### 0.2 Constructions

Invariants `M^U` as a `G ⧸ U`-module for normal `U`, with the induced discrete
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

*Needs:* Mathlib `FixedPoints.addSubgroup`; the fixed-point actions and `TauCeti.InternalHom` contracts.

**Checks.**

- For trivial `C₂`-actions on `M = N = 𝔽₃`, the internal hom has three fixed maps, multiplication by `0, 1, 2`.
- For the sign action on `M` and trivial action on `N`, conjugation sends `φ` to `−φ`, so only one map is fixed. For `φ = m = 1`, evaluation gives `(-φ)(-m) = 1`; a trivial action on the hom would give `−1 = 2`.
- For sign `M = ℤ`, `G = C₄` and `U = C₂`, `M^U = ℤ` and the quotient generator acts by `−1`; for `U = G` the invariants are `0`.
- The product `𝔽₂²` has four points and open singletons; every basic neighborhood of zero in `∏ℕ 𝔽₂` contains a nonzero vector, so the infinite product is not discrete.

### 0.3 Continuous sections of profinite quotients

For a profinite `G` and closed subgroups
`K ≤ H ≤ G`, the projection `G ⧸ K → G ⧸ H` admits a continuous section, with the normalized
specialization: `G ⧸ H → G` continuous with `s 1 = 1` (Ribes-Zalesskii Prop. 2.2.2). Prove the
companion extension lemma in the form the proofs use: a continuous map from a closed subspace of
a profinite space to a nonempty finite discrete target extends continuously. The section is
stated once and consumed in exactly three places: Layer 5's transgression, Layer 7's exactness of
coinduction, and Layer 7's explicit inverse in Shapiro's lemma. The extension lemma is consumed
in addition by Layer 10's descent from a closed subgroup to an open one
(`TauCeti.ContinuousCohomology.exists_openSubgroup_le_res_eq_zero`). Neither is needed anywhere an **open**
subgroup is in play, where `Quotient.out` already suffices. Tau Ceti proves both forms of the
section, `TauCeti.exists_continuous_section` and `TauCeti.exists_continuous_section_of_le`, and
its transgression is built on the first; it proves the extension lemma, for any nonempty
discrete target, as `ContinuousMap.exists_extension_of_discrete`
(`TauCeti/Topology/Separation/Profinite.lean`).

*Needs:* Tau Ceti `TauCeti.exists_continuous_section`, `TauCeti.exists_continuous_section_of_le` and `ContinuousMap.exists_extension_of_discrete`.

**Checks.**

- For `ℤ_p → ℤ/p`, choose the representatives `0,…,p−1`; the section sends `0` to `0` and is continuous, but sends `(p−1)+1 = 0` to `0` instead of `p`.
- For `H = K`, the quotient projection and its section are the identity; for `H = G`, the normalized section sends the only point to `1`.
- A map from the empty closed subspace of a one-point space extends to a one-point target in one way, but to the empty target in zero ways; nonemptiness is necessary.

### Examples

For the sign action of `C₂` on `𝔽₃`, the stabilizer of `1` is `{1}`, whereas for the trivial action it is `C₂`; both are open, so smoothness does not mean triviality.

### Dependencies

Mathlib: `continuousSMul_iff_stabilizer_isOpen`, `stabilizer_isOpen`,
`exist_openNormalSubgroup_sub_open_nhds_of_one`, `OpenSubgroup`, `OpenNormalSubgroup`,
`ProfiniteGrp.closedSubgroup_eq_sInf_open`, `FixedPoints.addSubgroup`. Tau Ceti:
`TauCeti.exists_openNormalSubgroup_smul_eq_self`
(`TauCeti/Topology/Algebra/GroupAction/Discrete.lean`), the actions on `FixedPoints.addSubgroup` in
`TauCeti/GroupTheory/GroupAction/FixedPoints.lean` and their continuity
`TauCeti.continuousSMulQuotientFixedPoints`, `TauCeti.exists_continuous_section` and
`TauCeti.exists_continuous_section_of_le` (`TauCeti/Topology/Algebra/Group/Profinite/Section.lean`).
This layer has no earlier-layer dependency.

## Layer 1: the canonical carrier and its functoriality

The inputs for this layer are Mathlib: `TopRep`, `TopRep.res`, `TopRep.resFunctor`,
`TopRep.TopRepEquivActionTop`, `TopRep.invariants`, `TopRep.invariantsFunctor` from
`RepresentationTheory/Continuous/TopRep.lean`; `continuousCohomology` and
`TopRep.homogeneousCochains` from `ContCohomology/Basic.lean`; `ContinuousCohomology.zeroIso` from
`ContCohomology/LowDegree.lean`;
`ContinuousCohomology.{resolutionMap,cochainsMap,cocyclesMap,map,map_id,map_comp}` from
`ContCohomology/Functoriality.lean`; and `TopModuleCat`, `ContinuousMonoidHom`. Tau Ceti:
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor`, `TauCeti.ContinuousCohomology.res`, `TauCeti.ContinuousCohomology.infl`, `TauCeti.ContinuousCohomology.coeffMap`,
`resNatTrans` and `inflNatTrans` (`ContCohomology/Functoriality.lean`),
`TopRep.quotientToInvariantsFunctor` (`Continuous/Invariants.lean`), and
`TauCeti.ContinuousCohomology.continuousCochainsFunctor` with the additivity and linearity results
of `ContCohomology/Additive.lean`. This roadmap: Layer 0.

The pin supplies the carrier and compatible-pair functoriality. Use those maps with the named restriction, inflation, coefficient, and coefficient-dictionary
contracts below. These fix the interface every canonical-facing statement uses.


### 1.1 The carrier, named once

Mathlib's `TopRep R G` structure, carrying a continuous
representation on a topological module, and `Hⁿ_cont(G, X) = continuousCohomology n X` as the
canonical object of every all-degree statement below. Record `TopRep.homogeneousCochains` as the
complex it is the homology of, and
`ContinuousCohomology.zeroIso : continuousCohomology 0 X ≅ X.invariants` as the one degree
Mathlib computes. This layer uses Mathlib's `resolutionMap`, `cochainsMap`,
`cocyclesMap`, `map`, `map_id`, and `map_comp` directly, then adds `TauCeti.ContinuousCohomology.res`,
`quotientToInvariants`, `TauCeti.ContinuousCohomology.infl`, and `TauCeti.ContinuousCohomology.coeffMap`. `continuousCohomology` is object-valued. Package the canonical objects and the maps at `φ = id` as
`continuousCohomologyFunctor R G n : TopRep R G ⥤ TopModuleCat R`, using Mathlib's `map_id`
and `map_comp` for the functor laws, and likewise package `TopRep.homogeneousCochains` and
`ContinuousCohomology.cochainsMap` at `φ = id` as `continuousCochainsFunctor R G`. These
functors reuse the canonical objects and maps; they are the packaging used by the natural
transformations below and by the categorical constructions of Layer 10. Tau Ceti has both, as
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor` and
`TauCeti.ContinuousCohomology.continuousCochainsFunctor`.

*Needs:* Mathlib `TopRep`, `continuousCohomology`, `ContinuousCohomology.map`, `map_id`, `map_comp`.

**Checks.**

- For the trivial group and coefficient `ℤ`, degree zero is `ℤ`, and the unit class is `1`.
- For trivial `C₂`-action on `𝔽₃`, degree zero has three elements; for the sign action it has one.
- The zero coefficient object gives zero cohomology; using the whole module instead of invariants fails on the sign example.

### 1.2 Smooth discrete objects

`TopRep R G` is wider than the discrete `G`-modules of Conventions, and
deliberately so: an object carries one continuous operator per group element, and nothing there
forces the action to be continuous in the group variable. An object of `TopRep ℤ G` whose module
happens to be discrete can therefore have non-open point stabilizers, so there is no dictionary
between all of `TopRep ℤ G` and the discrete `G`-modules. Use the smooth-discrete condition
```
IsSmoothDiscrete X  ⟺  X.V is discrete and every {g | X.ρ g x = x} is open,
```
which for a discrete module is exactly continuity of the action, with the closure
properties this roadmap uses: smooth discrete objects are closed under finite products, under
subobjects and quotients, and under restriction along a continuous homomorphism.

*Needs:* Layer 0 open stabilizers; Mathlib `TopRep`.

**Checks.**

- The sign `C₂`-module `𝔽₃` is smooth: its point stabilizers have orders `1` or `2`.
- A nonzero discontinuous abstract map `ℤ_p → ℚ` gives a discrete free abelian permutation module on the set `ℚ` with a non-open stabilizer, so discreteness alone does not imply smoothness.
- For the zero module the only stabilizer is `G`, which is open, so the zero object is smooth.

### 1.3 The categorical dictionary, on that subcategory

In the style of the discrete
`Rep.ofDistribMulAction`: `TauCeti.ofDiscreteModule` sends a discrete `G`-module in the unbundled
classes of Conventions to an object of `TopRep ℤ G`, and that object is smooth discrete. Its
`TopRep R G` refinement, Tau Ceti's `TauCeti.ofDiscreteModule R G M`, carries
`[Module R M] [SMulCommClass G R M] [ContinuousSMul R M]` explicitly; continuity of the scalar
action is never inferred from discreteness of `M`. A `G`-equivariant continuous homomorphism
becomes a morphism, and every morphism between objects in the image arises that way; and the two
translations are mutually inverse **on the smooth discrete subcategory**, which they exhibit as
equivalent to the discrete `G`-modules. Nothing is claimed outside that subcategory. This is
where the statements of Layers 2 to 9 meet the canonical API.
⚠ Keep every *theorem* of Layers 2 to 9 stated against the unbundled classes wherever possible.
The bundled forms are interfaces, and mismatches between instances and structures here are the
main source of unusable statements.
⚠ Every canonical-facing comparison below quantifies over the image of `TauCeti.ofDiscreteModule`, never
over an arbitrary `TopRep` object. A statement that forgets this is false, not merely
unprovable.

*Needs:* Layer 0 discrete actions; `TauCeti.ofDiscreteModule` and the smooth-discrete condition.

**Checks.**

- The sign operator on `𝔽₃` sends `1` to `2` both before and after bundling.
- Multiplication by `2` on the trivial integral module sends the invariant `1` to `2` in both presentations.
- The identity map from sign `𝔽₃` to trivial `𝔽₃` is additive but not equivariant: the two sides at `g,1` are `2` and `1`.

### 1.4 Functoriality in compatible pairs (consume Mathlib)

For a continuous homomorphism
`φ : H →ₜ* G` and a morphism `f : TopRep.res φ X ⟶ Y` in `TopRep R H`: the cochain map
`cochainsMap φ f`, then `cocyclesMap φ f n`, then `map φ f n : Hⁿ_cont(G, X) ⟶ Hⁿ_cont(H, Y)`,
with `map_id` and `map_comp`. These are the declarations provided by
`Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`; downstream code
uses those names and types rather than a parallel implementation.

*Needs:* Mathlib `TopRep.res` and `ContinuousCohomology.map`.

### 1.5 The three named instances

Restriction along the inclusion of a subgroup, inflation along a
quotient map with invariant coefficients, and coefficient maps at `φ = id`, each with its
composition law. For fixed `n`, write `F_G = continuousCohomologyFunctor R G n`. For `S ≤ G`,
package restriction as `resNatTrans : F_G ⟶ TopRep.resFunctor S.subtype ⋙ F_S`. For normal
`N ≤ G`, package inflation as
`inflNatTrans : TopRep.quotientToInvariantsFunctor R G N ⋙ F_(G ⧸ N) ⟶ F_G`, the functor
`TopRep.quotientToInvariantsFunctor` sending `X` to `quotientToInvariants R N X`. The two match
the shape of Mathlib's discrete `groupCohomology.resNatTrans` and `groupCohomology.infNatTrans`.
Coefficient maps are the arrows `F_G.map f = coeffMap f n`, which is
`ContinuousCohomology.map (ContinuousMonoidHom.id G) f n`, rather than a third natural
transformation; the naturality squares of `resNatTrans` and `inflNatTrans` are their
compatibility with coefficient maps. Tau Ceti has the two natural transformations under these
names in `TauCeti.ContinuousCohomology`.

*Needs:* The compatible-pair map; Layer 0 quotient invariants.

**Checks.**

- Restriction of a degree-zero invariant `1` in a trivial integral module is `1`.
- Inflation from `C₂` to `C₄` sends the nonzero `𝔽₂` character to the parity character, with values `0,1,0,1`.
- The coefficient map `ℤ → ℤ`, multiplication by `2`, sends the degree-zero class `1` to `2`; the zero coefficient map sends it to `0`.

### 1.6 Degree 0

`map φ f 0` commutes with `ContinuousCohomology.zeroIso` and the induced map on
invariants, which is what makes the low-degree comparisons of Layer 3 checkable at `n = 0`
before any of the harder degrees exist.

*Needs:* Mathlib `ContinuousCohomology.zeroIso` and `ContinuousCohomology.map`.

### 1.7 Additivity and linearity

For fixed `φ : H →ₜ* G` and `f, g : TopRep.res φ X ⟶ Y`, prove
`map φ (f + g) n = map φ f n + map φ g n` and `map φ 0 n = 0`, and for a commutative coefficient
ring `map φ (r • f) n = r • map φ f n`. Prove the corresponding equations for `cochainsMap` and
`cocyclesMap`, and use the `φ = id` cases to equip `TauCeti.ContinuousCohomology.continuousCochainsFunctor` and
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor` with additive and `R`-linear functor instances. The pin proves the
corresponding instances for `TopRep.invariantsFunctor` and `TopRep.coind₁Functor`; these are the
same statements one level up. Tau Ceti has them as `TauCeti.ContinuousCohomology.map_add`,
`map_zero`, `map_smul`, `cochainsMap_add`, `cochainsMap_smul`, `cocyclesMap_add`,
`cocyclesMap_smul`, `TauCeti.ContinuousCohomology.continuousCohomologyFunctor_additive`,
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor_linear` and
`continuousCochainsFunctor_additive`.

The API for the carrier includes:

- The constructors are `TopRep.of` from an unbundled continuous representation,
and `TauCeti.ofDiscreteModule` for the discrete case.
- A worked example is the trivial representation, `ℤ` and
`ZMod n` with trivial action, `(Kˢ)ˣ` for Layer 9; each checked to be smooth discrete. Morphisms:
the intertwining maps, with their additive and `R`-linear structure.
- Functoriality comprises `map` above,
in both arguments.
- The comparison lemmas identify Layer 3, quantified over the image of `TauCeti.ofDiscreteModule`.
Naturality: of `map` in `X` and in `Y`, and of the three named instances.
- The boundary cases are `n = 0`, the
trivial group, the trivial subgroup, and an object that is discrete but **not** smooth, which
exists and is the reason the subcategory is named.
- The downstream interfaces are Layers 3, 4, 7, 8, 10
and 12 all state their canonical halves against this layer and against nothing else.

⚠ Do not restate the carrier or compatible-pair functoriality. If a milestone below needs a
property Mathlib already proves, cite it; this layer adds only the named restriction/inflation
interfaces, the discrete-module dictionary, and compatibility results not supplied upstream.

The API for `M^U` includes:

- The constructors are `Invariants U M` as an additive subgroup of `M`, its `G`-action
for normal `U`, and the descent of that action to `G ⧸ U`; all three are Mathlib's and Tau Ceti's,
with membership `FixedPoints.mem_addSubgroup`.
- A worked example is for `M = ZMod n` with
the trivial action every `M^U` is `M`, and `((Kˢ)ˣ)^{G_K} = Kˣ` in Layer 9.
- The morphisms are the
inclusions `M^U ↪ M^V` for `V ≤ U` and `M^U ↪ M`, both additive and both equivariant in the sense
Layer 4 needs.
- Functoriality comprises in `M` along equivariant continuous maps, and in `U` along
inclusions.
- The comparison is with Mathlib's `Rep.quotientToInvariants` under Layer 1's dictionary, which
on the canonical side is Tau Ceti's `TauCeti.ofDiscreteModuleQuotient`.
Naturality: of both inclusions in `M`.
- The boundary cases are `U = ⊥` gives `M`, `U = G` gives `M^G`, and
`M = 0` gives `0`.
- The consumers are Layer 4's finite-quotient system, Layer 5's inflation, Layer 11's
dévissage.

The source for the continuous section is Ribes-Zalesskii, *Profinite Groups*, Prop. 2.2.2. The
hypotheses are that `G` is profinite and `H` is closed, and neither is decoration: the projection
`ℝ → ℝ ⧸ ℤ` onto the circle has no continuous section at all, so the theorem is about profinite
groups and not about topological groups. The false neighbor to avoid is the same statement with a
*homomorphic* section, which already fails for `ℤ_p → ℤ ⧸ p`, since a homomorphism from a finite
group to a torsion-free group is trivial.

*Needs:* Mathlib linear maps and `ContinuousCohomology.cochainsMap`; the additive functor contracts.

### Examples

For the trivial group and coefficient `ℤ`, degree zero is `ℤ`, and the unit class is `1`.

### Dependencies

Mathlib: `TopRep`, `TopRep.res`, `TopRep.resFunctor`,
`TopRep.TopRepEquivActionTop`, `TopRep.invariants`, `TopRep.invariantsFunctor` from
`RepresentationTheory/Continuous/TopRep.lean`; `continuousCohomology` and
`TopRep.homogeneousCochains` from `ContCohomology/Basic.lean`; `ContinuousCohomology.zeroIso` from
`ContCohomology/LowDegree.lean`;
`ContinuousCohomology.{resolutionMap,cochainsMap,cocyclesMap,map,map_id,map_comp}` from
`ContCohomology/Functoriality.lean`; and `TopModuleCat`, `ContinuousMonoidHom`. Tau Ceti:
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor`, `TauCeti.ContinuousCohomology.res`, `TauCeti.ContinuousCohomology.infl`, `TauCeti.ContinuousCohomology.coeffMap`,
`resNatTrans` and `inflNatTrans` (`ContCohomology/Functoriality.lean`),
`TopRep.quotientToInvariantsFunctor` (`Continuous/Invariants.lean`), and
`TauCeti.ContinuousCohomology.continuousCochainsFunctor` with the additivity and linearity results
of `ContCohomology/Additive.lean`. This roadmap: Layer 0.

## Layer 2: the explicit low-degree complex and its functoriality

The inputs for this layer are Mathlib: `groupCohomology.d₀₁`, `d₁₂`, `d₂₃`, `cocycles₁`, `cocycles₂`,
`IsCocycle₁`, `IsCocycle₂`, `groupCohomology.cochainsMap`, `ContinuousMap`,
`ContinuousMonoidHom`. This roadmap: Layer 0.


### 2.1 The complex

`TauCeti.ContCohomology.C1`, `TauCeti.ContCohomology.C2`, `TauCeti.ContCohomology.Z1`, `TauCeti.ContCohomology.Z2`, `TauCeti.ContCohomology.B1`, `TauCeti.ContCohomology.B2`, `TauCeti.ContCohomology.H0`, `TauCeti.ContCohomology.H1`, `TauCeti.ContCohomology.H2` as fixed in Conventions, with
`d ∘ d = 0` (`TauCeti.ContCohomology.B1_le_Z1`, `TauCeti.ContCohomology.B2_le_Z2`), the class maps `TauCeti.ContCohomology.H1pi` and `TauCeti.ContCohomology.H2pi`, the
membership lemmas in the exact `IsCocycle₁/₂` shapes, the evaluation lemmas (`Z¹` vanishes at
`1`, the inverse formula, the degree-2 normalizations), and the trivial-action
characterizations: `B¹ = ⊥`, `H¹` additively isomorphic to the continuous homomorphisms
`G →ₜ* M`, and `H⁰ = M`. Degree 0 is `H0 G M = M^G`, an additive subgroup and not a quotient.

*Needs:* Mathlib `groupCohomology.d₀₁`, `d₁₂`, `d₂₃`; Layer 0 continuous actions.

**Checks.**

- For `G = 1`, the unnormalized differentials on `M` are `d⁰ = 0`, `d¹ = id`, `d² = 0`, hence `H⁰ = M` and `H¹ = H² = 0`.
- For `C₂` acting by sign on `ℤ`, `d⁰(1)(s) = −2`, so `B¹ = 2ℤ` and `H¹ = ℤ/2`; reversing the sign changes the cochain value to `2`.
- For trivial coefficients on `ℤ_p`, `H¹(ℤ_p, ℤ/p^k)` has `p^k` elements (one when `k = 0`), and `H¹(ℤ_p, ℤ) = 0`; both values also hold abstractly. Discrete `ℚ` gives continuous `H¹ = 0`, while an abstract map taking `1` to `1` exists by extending `1` to a `ℚ`-basis of `ℚ_p`.

### 2.2 Compatible-pair functoriality

The pullback `Hⁱ(G, M) → Hⁱ(H, N)` of Conventions, on cochains,
cocycles and cohomology, with the identity and composition laws, as `TauCeti.ContCohomology.explicitMap1` in degree 1
and its degree-0 and degree-2 counterparts. This is the continuous twin of
Mathlib's `groupCohomology.cochainsMap` package, named to align with Layer 1's
`ContinuousCohomology.cochainsMap`.

*Needs:* The explicit complex; continuous group and coefficient homomorphisms.

### 2.3 The three instances, in all three degrees

Restriction `TauCeti.ContCohomology.explicitRes0`, `TauCeti.ContCohomology.explicitRes1`,
`TauCeti.ContCohomology.explicitRes2` for any subgroup with the subspace topology; inflation `TauCeti.ContCohomology.explicitInfl1` and
`TauCeti.ContCohomology.explicitInfl2` for closed normal `N`, with the invariants as coefficients (Tau Ceti's, in
`ContCohomology/Inflation/Basic.lean`); and coefficient maps
`TauCeti.ContCohomology.explicitCoeff0`, `TauCeti.ContCohomology.explicitCoeff1`, `TauCeti.ContCohomology.explicitCoeff2` along `G`-equivariant continuous
homomorphisms. Composition laws mixing the three: `res ∘ inf`, and coefficient naturality of
both. Degree 2 of inflation is not a variant of degree 1: it is the last map of Layer 5's
five-term sequence, and degree 0 and degree 2 of the coefficient maps are three of the eight
nodes of Layer 5's long exact sequence.

*Needs:* The compatible-pair maps; Layer 0 invariant coefficients.

### 2.4 Conjugation

The compatible pair (conjugation by `g`, action of `g`) induces an action of
`G` on `Hⁱ(N, M)` for closed normal `N`, which is `TauCeti.ContCohomology.explicitConj1` in degree 1, and **inner
automorphisms act trivially on `Hⁱ(G, M)`** (`TauCeti.ContCohomology.explicitConj1_eq_id_of_mem`),
by an explicit chain homotopy in degrees `≤ 2`. Both are Tau Ceti's, in
`ContCohomology/Conjugation.lean`. Without it the `G ⧸ N`-action on `Hⁱ(N, M)` is
not well defined, and Layer 5's five-term sequence needs that action.
⚠ The degree-2 homotopy has many terms and is easy to get wrong. Write it once for the
compatible-pair form and derive the degree-1 case, rather than proving the two separately.

The API for the explicit complex includes:

- The constructors are `C¹`, `C²` as subgroups of the function spaces,
`Z¹`, `Z²` as their intersections with the kernels, `B¹`, `B²` as the images of the differentials,
and `H⁰`, `H¹`, `H²` as fixed in Conventions.
- Worked examples are `H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ` and `H¹(ℤ_p, ℤ) = 0`,
both valid also for abstract degree-one cohomology. The discrete rational coefficient example distinguishes continuity.
- The morphisms are the compatible-pair
pullback, with its additive structure.
- Functoriality comprises in the group and in the coefficients
separately, with the composition laws, and the three named instances.
- The comparison is Layer 3.
Naturality: of `d⁰`, `d¹`, `d²` and of the quotient maps `Z¹ ↠ H¹`, `Z² ↠ H²`, in compatible
pairs.
- The boundary cases are the trivial group, where `H⁰ = M` and `H¹ = H² = 0`; the trivial action, where
`B¹ = ⊥` and `H¹` is the continuous homomorphisms; and `M = 0`.
- The consumers are every later layer
except 1.

The source for the triviality of inner automorphisms is Milne, *Arithmetic Duality Theorems*,
Prop. 0.15. The hypothesis is that the automorphism is inner in `G` itself; the false neighbor is
that an automorphism of `G` acting trivially on `Hⁱ` must be inner, which is not so, and the
statement one actually wants downstream is the induced `G ⧸ N`-action on `Hⁱ(N, M)`, which needs
nothing beyond the inner case.

*Needs:* Compatible-pair maps and the explicit differential; the conjugation contracts.

### Examples

For `G = 1`, the unnormalized differentials on `M` are `d⁰ = 0`, `d¹ = id`, `d² = 0`, hence `H⁰ = M` and `H¹ = H² = 0`.

### Dependencies

Mathlib: `groupCohomology.d₀₁`, `d₁₂`, `d₂₃`, `cocycles₁`, `cocycles₂`,
`IsCocycle₁`, `IsCocycle₂`, `groupCohomology.cochainsMap`, `ContinuousMap`,
`ContinuousMonoidHom`. This roadmap: Layer 0.

## Layer 3: the comparison isomorphisms

The inputs for this layer are Mathlib: `groupCohomology`, `mem_cocycles₁_iff`, `mem_cocycles₂_iff`,
`Rep.ofDistribMulAction`, `ContinuousMap.curry`, `ContinuousMap.uncurry`, `Homeomorph.curry`.
This roadmap: Layers 1 and 2.

Without this layer the explicit complex would be a second theory rather than a second description
of the canonical one, so it is what keeps the roadmap from forking the canonical API. The
condition it has to meet is that the comparison map to the inhomogeneous complex is a
quasi-isomorphism in the discrete case.


### 3.1 Continuous against discrete

For `G` with the discrete topology (finite `G` being the case
Layer 4 uses) and any discrete `G`-module `M`: `Hⁱ_explicit(G, M) ≅ groupCohomology` in degrees
`0, 1, 2`, through the pin's `cocycles₁/₂` and `IsCocycle₁/₂`, as
`TauCeti.ContCohomology.explicitH0IsoGroupCohomology`, `TauCeti.ContCohomology.explicitH1IsoGroupCohomology` and
`TauCeti.ContCohomology.explicitH2IsoGroupCohomology`. Every continuity condition is
vacuous, so this identifies subquotients of the same function spaces. Layer 4 uses it at every
finite level.
⚠ Mathlib's `groupCohomology` is `k`-linear over `Rep k G` while the explicit theory is
`ℤ`-linear. Compare against `Rep ℤ G` through `Rep.ofDistribMulAction`, and state the `k`-linear
refinement only where a `k`-action genuinely exists.

*Needs:* Layer 2; Mathlib `groupCohomology` and its low-degree cocycles.

### 3.2 Inhomogeneous against canonical, for profinite `G`, degrees `0, 1, 2`

The canonical model
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

*Needs:* Layers 1 and 2; Mathlib `ContinuousMap.curry`, `ContinuousMap.uncurry` and `Homeomorph.curry`.

### 3.3 The category of the comparison

For compact `G` and discrete `M`, prove that `C(G, M)` is
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
while leaving the underlying additive statement true, which is the trap. Tau Ceti
carries the discrete objects as `TauCeti.ContCohomology.DiscreteH1` and `TauCeti.ContCohomology.DiscreteH2`, with additive equivalences back
to the quotients so that computations on representatives stay available.

*Needs:* Mathlib compact-open topology; the discrete wrappers `TauCeti.ContCohomology.DiscreteH1` and `TauCeti.ContCohomology.DiscreteH2`.

**Checks.**

- For `G = C₂`, trivial `𝔽₂` coefficients, both the explicit discrete wrapper and canonical
  `H¹` have two elements, and the comparison sends the nonzero character to the nonzero class.
- For `G = ∏ℕ C₂`, finitely many pointwise evaluations leave a nonzero linear combination of
  coordinate characters in their common kernel; zero is not isolated in the pointwise model.
  In the discrete wrapper, its singleton is open, as on the canonical compact-open side.
- For `G = 1`, degree zero sends `1 ∈ ℤ` to `1`, and both positive-degree groups are zero;
  multiplying the comparison by `−1` would change the degree-zero value.

### 3.4 Transport

Under these isomorphisms: compatible pairs to Layer 1's `map`
(`TauCeti.ContCohomology.explicitIso_map`), restriction to restriction (`TauCeti.ContCohomology.explicitIso_res`), inflation to inflation read
through the coefficient map of `TauCeti.ofDiscreteModuleQuotient` (`TauCeti.ContCohomology.explicitIso_infl`), and coefficient
maps to `TauCeti.ContinuousCohomology.coeffMap` (`TauCeti.ContCohomology.explicitIso_coeffMap`). All four are Tau Ceti's, in
`ContCohomology/CohomologyComparison.lean` and `ContCohomology/Inflation/Comparison.lean`. One
transport lemma per operation, each an equation between two named maps, carrying the same
profiniteness hypotheses as the comparison itself. Only the operations that exist by this layer
are transported here; the connecting maps are transported in Layer 10 against its `TauCeti.ContCohomology.DiscreteShortExact.delta`,
corestriction in Layer 10, the Kummer class in Layer 9 and the cups in Layer 12, each
in the layer where both sides are first available. The table in Scope and ownership lists all of them, and every
entry on it is a milestone.

The source for the inhomogeneous-against-canonical comparison is The chain-level correspondence is
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

*Needs:* Layers 1 and 2 compatible-pair maps and this layer’s comparisons.

### Examples

The trivial group with trivial integral coefficients has `H⁰ = ℤ` and `Hⁱ = 0` for `i > 0`; the degree-zero unit is preserved by the displayed comparisons.

### Dependencies

Mathlib: `groupCohomology`, `mem_cocycles₁_iff`, `mem_cocycles₂_iff`,
`Rep.ofDistribMulAction`, `ContinuousMap.curry`, `ContinuousMap.uncurry`, `Homeomorph.curry`.
This roadmap: Layers 1 and 2.

## Layer 4: the finite-quotient colimit description

The inputs for this layer are Mathlib: `OpenNormalSubgroup`, `ProfiniteGrp.toFiniteQuotientFunctor`,
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
`TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2`. This roadmap: Layers 2 and 3.

For profinite `G` and discrete `M`; the theorem most computations use (NSW (1.2.5),
Ribes-Zalesskii Cor. 6.5.6(a), Koch Thm. 3.16; Serre, *Local Fields* X §3 takes it as the
*definition*, so the three textbooks present the three descriptions Layers 2 to 4 relate).


### 4.1 The system

The functor `U ↦ Hⁱ(G ⧸ U, M^U)` on `(OpenNormalSubgroup G)ᵒᵖ`, with the
transition maps and comparison maps as fixed in Conventions. Six separate milestones, not one:
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

*Needs:* Layer 0 invariants; Layer 2 compatible-pair maps; Mathlib `OpenNormalSubgroup`.

**Checks.**

- At `G = C₂`, trivial `𝔽₂` coefficients, degree one at `U = G` is `0`, and at `U = 1` it is `𝔽₂`; the transition goes from `0` to `𝔽₂`.
- At `V = U`, the transition fixes the class `1` in degree zero; at `W ≤ V ≤ U`, both composites fix that same class.
- For a sign `C₂`-module `𝔽₃`, the invariant coefficient groups at `U = G,1` are `0,𝔽₃`, excluding a constant coefficient system.

### 4.2 The colimit theorem

`Hⁱ(G, M) ≅ colim_U Hⁱ(G ⧸ U, M^U)` in `AddCommGrpCat`, for `i = 0, 1, 2`
on the explicit model. It is stated as universality of the **named** comparison cocone rather
than as a bare isomorphism, since a bare isomorphism does not say that the comparison maps are
the ones that induce it. On the explicit side, the transition
`TauCeti.ContCohomology.explicitFiniteQuotientTransition1` is defined directly by `TauCeti.ContCohomology.explicitMap1` from the quotient map
and the inclusion `M^U ↪ M^V`; it is not the universe-restricted canonical
`TauCeti.finiteLevelTransition`. Its identity and composition laws are
`TauCeti.ContCohomology.explicitFiniteQuotientTransition1_id` and `TauCeti.ContCohomology.explicitFiniteQuotientTransition1_comp`, and
`TauCeti.ContCohomology.explicitFiniteQuotientSystem1_map` pins the functor's arrow to that map. This direct definition
is universe-polymorphic and avoids transporting through the `Type 0` comparison with
`groupCohomology`.

All three degrees are named, not abbreviated as “the same shape”:
`explicitFiniteQuotientSystem0/1/2`, `explicitFiniteQuotientSystem0/1/2_obj`,
`explicitFiniteQuotientComparison0/1/2`, `explicitFiniteQuotientCocone0/1/2`, and
`explicitFiniteQuotientColimit0/1/2`. Each system has a corresponding `_map` theorem fixing its
arrows. The canonical `TauCeti.finiteLevelTransition` remains the comparison target, and Layer 3 proves
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

*Needs:* The finite-quotient system; Layers 2 and 3; compactness and uniform local constancy.

### 4.3 Coefficient colimits

`Hⁱ(G, -)` commutes with filtered colimits of discrete modules for
`i ≤ 2` on the explicit model: a continuous cochain into a filtered colimit takes its values in
a single stage, by compactness again. With Layer 0: the cohomology of any discrete module is the
filtered colimit
over its finitely generated `ℤ[G ⧸ U]`-submodules.

*Needs:* Layer 2 continuous cochains; filtered colimits of discrete modules and compactness.

### 4.4 First consequences

`H⁰(G, M) = M^G`; for finite `M` the tower stabilizes levelwise
(`M^U = M` for small `U`); and `Hⁱ(G, M)` for `i ≥ 1` is a colimit of cohomology of finite
groups, which Layer 10's torsion corollary uses.

*Needs:* The colimit theorem and Layer 0 open stabilizers.

The API for the finite-quotient system includes:

- The constructors are the six milestones above, together with the
colimit cocone.
- A worked example is `Hⁱ(Ẑ, -)` in Worked examples, where the tower is the system over `nẐ` and the
colimit is visible.
- The morphisms are the transition maps, and the comparison maps to `Hⁱ(G, M)`.
Functoriality: the two laws above in `U`, and functoriality of the whole system in `M`.
Comparison: with `ProfiniteGrp.toFiniteQuotientFunctor`, whose arrows go the other way, and in all
degrees with Layer 10.
- The naturality requirements are of the comparison map in `M` and in `U`.
- The boundary cases are `U = G`,
where the system is `Hⁱ(1, M^G)`; finite `G`, where the system is eventually constant; and finite
`M`, where the tower stabilizes levelwise.
- The consumers are Layer 9's Hilbert 90, Layer 10's all-degree
colimit, Layer 11's dévissage, and the Quadratic Form Invariants roadmap, through Invariants and
the degree-two system `TauCeti.ContCohomology.explicitFiniteQuotientSystem2` with `TauCeti.ContCohomology.explicitFiniteQuotientComparison2`,
`TauCeti.ContCohomology.explicitFiniteQuotientCocone2` and `TauCeti.ContCohomology.explicitFiniteQuotientColimit2`, for the finite-quotient
description of `H²(G_K, (Kˢ)ˣ)`. Membership in `Invariants U M` is Mathlib's
`FixedPoints.mem_addSubgroup`, a condition on the elements of `U` as a type, and a continuous
2-cocycle is built from its continuity and its cocycle identity by
`TauCeti.ContCohomology.mem_Z2_iff`.

The source for the colimit theorem is NSW (1.2.5); Ribes-Zalesskii Cor. 6.5.6(a); Koch Thm. 3.16;
Serre, *Local Fields* X §3 takes it as the definition. The hypotheses are that `G` is profinite
and `M` is discrete, and both are used. Discreteness is what makes a continuous cochain locally
constant. Compactness is used in degree `2` separately from total disconnectedness: descending
both variables at once is uniform local constancy on `G × G`, and total disconnectedness alone
does not give it. No counterexample is recorded here, because none is needed to see where each
hypothesis enters; what a contributor must not do is drop either one and expect the argument to
survive.

*Needs:* The canonical colimit contract of Layer 10.

### Examples

At `G = C₂`, trivial `𝔽₂` coefficients, degree one at `U = G` is `0`, and at `U = 1` it is `𝔽₂`; the transition goes from `0` to `𝔽₂`.

### Dependencies

Mathlib: `OpenNormalSubgroup`, `ProfiniteGrp.toFiniteQuotientFunctor`,
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
`TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2`. This roadmap: Layers 2 and 3.

## Layer 5: exact sequences

The inputs for this layer are Mathlib: `groupCohomology.δ`, `δ₀_apply`, `δ₁_apply`,
`mapShortComplex₁_exact`, `H1InfRes`, `H1InfRes_exact`. Tau Ceti: `ContCohomology/Inflation/Basic`,
`ContCohomology/Conjugation`, `ContCohomology/FiveTerm` and `ContCohomology/Transgression`, which
implement the inflation-restriction and five-term sequences below, and
`ContCohomology/ShortExact`, `ContCohomology/LongExact` and `ContCohomology/DeltaNaturality`, which
implement the long exact sequence. This roadmap: Layer 0 for the continuous section, and Layer 2.


### 5.1 Exactness of cochains

For a short exact sequence `0 → A → B → C → 0` of discrete
`G`-modules and any topological group `G`, the cochain sequences
`0 → Cⁿ(G, A) → Cⁿ(G, B) → Cⁿ(G, C) → 0` are exact: a continuous cochain into discrete `C` is
locally constant, so composing with **any** set-theoretic section of `B → C` preserves
continuity.
⚠ This is the one place where discreteness of the coefficients cannot be relaxed. For general
topological modules there is no such section and no long exact sequence; do not state this layer
beyond discrete coefficients.

*Needs:* Layer 2 cochains; a set-theoretic section between discrete coefficient modules.

### 5.2 The short exact sequence as data

`DiscreteShortExact G A B C` carries the two maps of
`0 → A → B → C → 0` with their continuity, equivariance and exactness. Every statement of this
layer, and the corestriction compatibility of Layer 6, is about the same sequence and has to name
the same two coefficient maps, so the sequence is an object and not a list of side conditions.
`TauCeti.ContCohomology.DiscreteShortExact.restrict` restricts it to a subgroup, which is what the naturality statements
below are stated against. It is Tau Ceti's `TauCeti.ContCohomology.DiscreteShortExact`, whose
two maps carry no continuity field, every map between discrete modules being continuous, and
whose exactness in the middle is `Function.Exact incl proj`. The connecting maps, the eight
exactness nodes and the restriction squares below are Tau Ceti's too, in `ShortExact.lean`,
`LongExact.lean` and `DeltaNaturality.lean`.

*Needs:* Layer 0 modules; Mathlib `Function.Exact`; `TauCeti.ContCohomology.DiscreteShortExact`.

**Checks.**

- The integral sequence with inclusion multiplication by `2` and projection modulo `2` has kernel `2ℤ`, image `2ℤ`, and quotient of order `2`.
- Replacing the inclusion by multiplication by `4` keeps the composite zero, but image `4ℤ` differs from kernel `2ℤ`, so the data are not short exact.
- The split sequence `0 → A → A ⊕ C → C → 0` has zero connecting maps in all degrees.

### 5.3 The long exact sequence

through degree 2 (NSW (1.3.2)): explicit connecting maps
`explicitDelta0 : H⁰(G, C) → H¹(G, A)` (choose a preimage, apply `d⁰`) and
`explicitDelta1 : H¹(G, C) → H²(G, A)`, their
well-definedness, their descriptions on representatives (`TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_apply`,
`TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_apply`), exactness at the eight nodes from `H⁰(G, A)` to `H²(G, B)`
(`TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0B`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H0C`,
`TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1B`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1C`,
`TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2A`, `TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H2B`), and naturality both
in morphisms of short exact sequences and in compatible pairs, so that restriction and inflation
commute with `δ`; restriction is `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_res` and `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1_res`. Mirror the pin's
`δ₀_apply`/`δ₁_apply` interface so that the discrete and
continuous theories are used identically. The all-degree sequence is a Layer 10 milestone, and
the two connecting maps agree with its `TauCeti.ContCohomology.DiscreteShortExact.delta` by `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0` and `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1`,
which are milestones of this layer and not of the consumer's.

*Needs:* Exact cochain sequences; the explicit differentials of Layer 2.

### 5.4 Inflation-restriction

The exact sequence `0 → H¹(G ⧸ N, M^N) → H¹(G, M) → H¹(N, M)` for
closed normal `N`, by a direct cochain argument, with the pin's discrete `H1InfRes_exact` as the
model: `TauCeti.ContCohomology.explicitInfl1_injective` and `TauCeti.ContCohomology.explicitInfRes_exact`. Valid for an arbitrary topological
group with discrete coefficients.

*Needs:* Layer 0 invariants; Layer 2 inflation and restriction.

### 5.5 The five-term sequence, for profinite `G` and closed normal `N`

(NSW (1.6.7),
Ribes-Zalesskii Cor. 7.2.5(a); Koch Thm. 3.14 gives the degree-`n` form under vanishing below
`n`, which Layer 11's dévissage uses). The pieces are: the invariants `TauCeti.ContCohomology.H1ConjInvariants` of
Layer 2's conjugation action; `G ⧸ N`-invariance of the image of
restriction (`TauCeti.ContCohomology.explicitRes1_mem_conjInvariants`) and the resulting map `TauCeti.ContCohomology.explicitResConj1`; the
`TauCeti.ContCohomology.transgression`
`tg : H¹(N, M)^{G ⧸ N} → H²(G ⧸ N, M^N)`, defined by lifting a representative cocycle on `N`
through a **continuous section** of `G → G ⧸ N` supplied by Layer 0 and differentiating;
independence of the chosen section and of the representative, as an identity of classes. The
construction is pinned by `TauCeti.ContCohomology.transgressionLift`, the section-dependent continuous extension to `G`
of a representative `c : Z1 N M` whose class is conjugation-invariant (a lift needs a cocycle, not
a class, and uses compactness of `N`),
`TauCeti.ContCohomology.transgressionCochain`, `TauCeti.ContCohomology.transgressionCochain_apply` (the descended value of `d¹` of that lift),
`TauCeti.ContCohomology.transgressionCochain_isCocycle`, `TauCeti.ContCohomology.transgressionCochain_sub_mem_B2` (an explicit `B²`
membership), and `TauCeti.ContCohomology.transgression_apply`, which identifies its class with the public map. Its two
compatibilities `TauCeti.ContCohomology.transgression_explicitResConj1` and `TauCeti.ContCohomology.explicitInfl2_transgression`; and
exactness of
```
0 → H¹(Γ, M^N) → H¹(G, M) → H¹(N, M)^Γ → H²(Γ, M^N) → H²(G, M),     Γ = G⧸N,
```
at its four nodes, which is `TauCeti.ContCohomology.explicitInfl1_injective`, `TauCeti.ContCohomology.explicitInfResConj_exact` (the second
node, read with the invariant-valued restriction; `TauCeti.ContCohomology.explicitInfRes_exact` is its three-term form),
`TauCeti.ContCohomology.fiveTerm_exact_H1N` and `TauCeti.ContCohomology.fiveTerm_exact_H2Q`. These are Tau Ceti's declarations of the
sequence at the pin.
⚠ Profiniteness is a genuine hypothesis here, not a convenience: extending a continuous cocycle
off a closed subgroup, or building one from a section, is exactly what Layer 0's section theorem
provides and what fails for an arbitrary topological group. The three-term inflation-restriction
sequence above keeps its wider generality; the five-term sequence does not.
⚠ Define `tg` by the named lift-and-differentiate formula, not merely by its endpoint, and prove
the change-of-section coboundary before quotienting. Then prove the two compatibilities, with
inflation on the right and restriction on the left. Spectral sequences are out of scope (Scope and ownership).

The presentation theory of
the Profinite Pro-`p` Groups roadmap is built from this
sequence; its `𝔽_p` instance, with `N` the relation kernel of a minimal presentation, is the case
that roadmap consumes, through `TauCeti.ContCohomology.transgression`, `TauCeti.ContCohomology.fiveTerm_exact_H1N` and `TauCeti.ContCohomology.fiveTerm_exact_H2Q`.

The source for the exactness of the cochain sequences is NSW (1.3.2) for the long exact sequence.
The hypothesis that cannot be relaxed is that the coefficients are **discrete**: a continuous
cochain into a discrete `C` is locally constant, so composing with any set-theoretic section of
`B → C` is still continuous. For general topological coefficients that argument has nothing to
stand on, since a set-theoretic section of `B → C` need not be continuous and `Cⁿ(G, B) → Cⁿ(G, C)`
need not be surjective. This roadmap therefore states the layer for discrete coefficients only and
asserts nothing about the general case.

The source for the five-term sequence is NSW (1.6.7); Ribes-Zalesskii Cor. 7.2.5(a); Koch Thm. 3.14
gives the degree-`n` form under vanishing below `n`, which Layer 11's dévissage uses. The
hypotheses are `G` profinite and `N` closed normal. Profiniteness is genuine here and not a
convenience: the transgression is defined by lifting through a continuous section of `G → G ⧸ N`,
which Layer 0 supplies and which does not exist in general. The false neighbor is the five-term
sequence for an arbitrary topological group; the three-term inflation-restriction sequence keeps
that wider generality and the five-term one does not.

*Needs:* Layer 0 continuous sections; Layer 2 conjugation; the explicit transgression and exactness contracts.

**Checks.**

- For `C₂ ⊂ C₄` and trivial `𝔽₂` coefficients, restriction of the parity character is zero; transgression sends the nonzero character of the kernel to the nonzero class of `H²(C₂,𝔽₂)`.
- For `C₃ ⊂ C₉`, lift the kernel character by `f(i) = floor(i/3)` modulo `3`. At the quotient pair `(2,1)`, `d¹f = 0 − 1 + 0 = −1 = 2`, the negative of the positive carry cocycle; this fixes the transgression sign.
- For the split extension `C₂ ⊂ C₂ × C₂`, every kernel character extends, and transgression is zero.
- For `N = G`, the quotient is trivial and restriction is the identity; the transgression target in degree two is zero.

### Examples

The integral sequence with inclusion multiplication by `2` and projection modulo `2` has kernel `2ℤ`, image `2ℤ`, and quotient of order `2`.

### Dependencies

Mathlib: `groupCohomology.δ`, `δ₀_apply`, `δ₁_apply`,
`mapShortComplex₁_exact`, `H1InfRes`, `H1InfRes_exact`. Tau Ceti: `ContCohomology/Inflation/Basic`,
`ContCohomology/Conjugation`, `ContCohomology/FiveTerm` and `ContCohomology/Transgression`, which
implement the inflation-restriction and five-term sequences below, and
`ContCohomology/ShortExact`, `ContCohomology/LongExact` and `ContCohomology/DeltaNaturality`, which
implement the long exact sequence. This roadmap: Layer 0 for the continuous section, and Layer 2.

## Layer 6: change of groups

The inputs for this layer are Mathlib: `Subgroup.index`, `Subgroup.FiniteIndex`,
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
transversal formulas of Conventions.

Tau Ceti supplies most of this layer at the pin. The transversal calculus is `TauCeti.lWord` with `TauCeti.lWord_mem`, `lWord_mul_lWord`,
`transversal_mul_lWord` and `continuous_lWord`. In `TauCeti.ContCohomology`, the corestrictions
`TauCeti.ContCohomology.explicitCor0Transversal`, `TauCeti.ContCohomology.explicitCor1Transversal` and `TauCeti.ContCohomology.explicitCor2Transversal`, the
change-of-transversal coboundaries `cochainsCor1_changeTransversal` and
`cochainsCor2_changeTransversal` with the resulting independence `TauCeti.ContCohomology.explicitCor0_changeTransversal`,
`TauCeti.ContCohomology.explicitCor1_changeTransversal` and `TauCeti.ContCohomology.explicitCor2_changeTransversal`, the public `TauCeti.ContCohomology.explicitCor0`,
`TauCeti.ContCohomology.explicitCor1` and `TauCeti.ContCohomology.explicitCor2`, and `cor ∘ res = (G : U) • id` with its two cochain-level
corrections (`explicitCor0_comp_res0`, `explicitCor1_comp_res1`, `explicitCor2_comp_res2`,
`cochainsCor1_res`, `cochainsCor2_res`) are Tau Ceti's, and so are the compatibility with the
connecting maps (`DiscreteShortExact.explicitCor_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta1`), the projection
formula in the six low-degree shapes (`TauCeti.ContCohomology.explicitCup_projection` and its five companions) and
transitivity (`TauCeti.ContCohomology.explicitCor0_trans`, `TauCeti.ContCohomology.explicitCor1_trans`,
`TauCeti.ContCohomology.explicitCor2_trans`). Tau Ceti states
them for `U : Subgroup G` with `[U.FiniteIndex]` and, in degrees 1 and 2, `IsOpen (U : Set G)`; the
names here read them at an `OpenSubgroup` with a `Fintype` quotient, taking the finite index from
the finite quotient, and are otherwise the Tau Ceti declarations. The Mackey formula is Tau Ceti's as
well, in all three degrees: `TauCeti.ContCohomology.explicitCor0_mackey`,
`TauCeti.ContCohomology.explicitCor1_mackey` and `TauCeti.ContCohomology.explicitCor2_mackey`, with the
summands `TauCeti.ContCohomology.explicitMackeyTerm0`, `TauCeti.ContCohomology.explicitMackeyTerm1` and
`TauCeti.ContCohomology.explicitMackeyTerm2` and their independence of the double-coset representative
(`TauCeti.ContCohomology.explicitMackeyTerm0_eq_of_mk_eq` and its two siblings;
`Corestriction/Mackey/Basic.lean`). What remains to build here is naturality of `TauCeti.ContCohomology.explicitCor1` and `TauCeti.ContCohomology.explicitCor2` in coefficient maps on classes
(Tau Ceti has it on cochains, `map_cochainsCor1` and `map_cochainsCor2`, and in degree 0,
`map_explicitCor0`), explicit degree-one transport of conjugation/corestriction,
and conjugation/restriction compatibility. All-degree conjugation/corestriction and its explicit
degree-two version use the contracts
`TauCeti.ContinuousCohomology.map_comp_corestriction_of_conj` and
`TauCeti.ContCohomology.explicitCor2_explicitMap2_of_conj` in
`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Conjugation.lean`: for
a discrete continuous `G`-module, open finite-index `U`, `V = gUg⁻¹`, the pair
`v ↦ g⁻¹vg`, `m ↦ g • m` followed by corestriction from `V` equals corestriction from `U`.


### 6.1 The transversal calculus

For a variable transversal `t`, the word `ℓᵗ_u(γ)` lies in `U` and
satisfies the 1-cocycle law `ℓᵗ_u(γ) * ℓᵗ_{γ⁻¹ • u}(η) = ℓᵗ_u(γη)`. This is pure group theory,
stated for an arbitrary subgroup (Tau Ceti's `TauCeti.lWord_mul_lWord` and
`TauCeti.transversal_mul_lWord`). Continuity of
`γ ↦ ℓᵗ_u(γ)` for open `U`. The identity `t u * ℓᵗ_u(γ) = γ * t (γ⁻¹ • u)`, which the cocycle
computations use.

*Needs:* Mathlib finite-index transversals; `TauCeti.lWord`.

**Checks.**

- For `C₄ ⊇ C₂` with representatives `1,s`, multiplying twice by `s` yields the Schreier factor `s²`, not `1`.
- For `U = G` and the representative `1`, the word at `γ` is `γ`, so the construction does not replace it by its inverse.
- For `S₃ ⊇ 1` with representatives the group elements, each subgroup word is `1`.

### 6.2 Corestriction in degrees `0, 1, 2`

The three formulas of Conventions, for a variable transversal:
each takes its values in continuous cochains, sends cocycles to cocycles and coboundaries to
coboundaries, is additive, and carries `[Fintype (G ⧸ U.toSubgroup)]`. The named maps are
`TauCeti.ContCohomology.explicitCor0Transversal`, `TauCeti.ContCohomology.explicitCor1Transversal`, and `TauCeti.ContCohomology.explicitCor2Transversal`; the named
change-of-transversal coboundaries are `TauCeti.ContCohomology.explicitCor0_changeTransversal`,
`TauCeti.ContCohomology.explicitCor1_changeTransversal`, and `TauCeti.ContCohomology.explicitCor2_changeTransversal`. The proof that `cor¹`
preserves cocycles visibly uses the factor
`t u •`; a
version of the argument that does not is wrong. Then: change of transversal, as an explicit
coboundary identity between the two cochains, and the resulting independence on cohomology. Only
after all of that, define the public `TauCeti.ContCohomology.explicitCor0`, `TauCeti.ContCohomology.explicitCor1` and `TauCeti.ContCohomology.explicitCor2` as the
`t = Quotient.out` specializations. All three degrees are exported, and all three agree with
Layer 10's all-degree `TauCeti.ContinuousCohomology.corestriction` by `TauCeti.ContinuousCohomology.explicitH0Iso_corestriction`, `TauCeti.ContinuousCohomology.explicitH1AddEquivContinuousCohomology_corestriction` and
`TauCeti.ContinuousCohomology.explicitH2AddEquivContinuousCohomology_corestriction`.
⚠ Prove independence as a change-of-transversal coboundary identity, not by re-deriving the map
abstractly. Downstream computations use the formula, so the formula is the definition.

*Needs:* Transversal words; Layer 2 cocycles and their quotients.

**Checks.**

- For `C₂ ⊇ 1`, trivial integral degree-zero coefficients give `cor(1) = 2`.
- For `U = G`, corestriction fixes every class, in particular `1` in degree zero.
- For `S₃ ⊇ C₂`, trivial integral degree-zero coefficients give `cor(1) = 3`; omitting a coset would give `2`.

### 6.3 The identities

Every declaration in this bullet carries the finite-index instance for each
subgroup over which it sums. `cor ∘ res = (G : U) • id` on `H⁰, H¹, H²` (NSW (1.5.7); Serre, *Local
Fields* VII §7 Prop. 6; Koch Thm. 3.10), with the two explicit cochain-level correction terms of
Conventions as named lemmas; naturality in coefficient maps; compatibility with the connecting maps of
Layer 5 (`cor ∘ δ = δ ∘ cor`, NSW (1.5.2)), which is `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0` and
`TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta1`; the low-degree projection formula; and transitivity
`cor_V^G = cor_U^G ∘ cor_V^U` for open `V ≤ U ≤ G`, with finite-index data for `V ≤ U` and
`U ≤ G`.

*Needs:* Layer 2 functoriality; transversal corestriction; Layer 5 for connecting maps.

### 6.4 The Mackey double-coset formula

(NSW (1.5.6)). For open finite-index `U, V ≤ G`, with the
finite quotient and double-coset indexing supplied explicitly,
```
res(G → V) ∘ cor(U → G) = ∑ (VgU ∈ V \ G / U), cor(V ∩ gUg⁻¹ → V) ∘ conj g ∘ res(U → U ∩ g⁻¹Vg),
```
with `res(A → B)` restriction from `A` to its subgroup `B`, `cor(B → A)` corestriction from `B`
to `A`, and `conj g` the conjugation isomorphism of Layer 2. The double cosets are indexed by
`DoubleCoset.Quotient (V : Set G) (U : Set G)` with a chosen representative `r D` of each, and
the summand at `s` is corestriction from the Mackey subgroup `V ∩ sUs⁻¹` to `V` of the conjugate
by `s` of the restriction to `U ∩ s⁻¹Vs`. In degrees `0, 1, 2` on the explicit model this is Tau
Ceti's `TauCeti.ContCohomology.explicitCor0_mackey`, `TauCeti.ContCohomology.explicitCor1_mackey`
and `TauCeti.ContCohomology.explicitCor2_mackey`, for an open `U` of finite index and any subgroup
`V`, each summand depending only on the double coset
(`TauCeti.ContCohomology.explicitMackeyTerm0_eq_of_mk_eq`,
`TauCeti.ContCohomology.explicitMackeyTerm1_eq_of_mk_eq`,
`TauCeti.ContCohomology.explicitMackeyTerm2_eq_of_mk_eq`); the form in every degree is Layer 10's
`TauCeti.ContinuousCohomology.corestriction_mackey`. The finite-group specialization is the check:
for `G = S₃` and `U = V` a subgroup of order two, on `H⁰` with trivial coefficients `ℤ`, the two
double cosets have sizes `2` and `4`, with Mackey subgroups `V` and `1`, so the right-hand side is
`1 + 2 = 3`, which is `res ∘ cor = (G : U) = 3` on invariants; a formula summing over single
cosets would give `3` summands and a formula using `V ∩ U` for every summand would give `1 + 1`.

*Needs:* Mathlib double cosets and the transversal calculus; the Mackey contracts.

### 6.5 Conjugation, again

Layer 2 constructs the conjugation maps; this layer states their
compatibility with restriction and the explicit degree-one form of corestriction.
The canonical all-degree and explicit degree-two corestriction squares are the supplier
contracts just specified, with their full discrete-coefficient hypotheses.

*Needs:* Layer 2 conjugation and restriction; the two conjugation/corestriction supplier theorems.

**Checks.**

- For `U = ⟨(12)⟩` and `V = ⟨(23)⟩` in `S₃`, both conjugation/corestriction routes take the degree-zero integral class `1` to `3`.
- With trivial `𝔽₂` coefficients in degree two, both routes take the nonzero `C₂` class to the nonzero `S₃` class; restriction back to an order-two subgroup takes it to `1`.
- For the identity conjugation both the subgroup and coefficient maps are identities, so both routes are the original corestriction.

### 6.6 Conventions

The normalization is `cor ∘ res = index • id`, in that order and with that
direction, which is NSW's and is also the one the finite-level literature uses, so a
finite-level statement can be read against this one without translation.
⚠ Naming collision: at the pin, Mathlib's `GroupHomology/Functoriality.lean` already uses
"corestriction" for the covariant functoriality of *homology* along a group homomorphism. Ours
is the classical cohomological transfer (NSW I §5). Keep the name `cores` or `TauCeti.ContinuousCohomology.corestriction`,
which is NSW's usage, say in the docstring which of the two is meant, and never abbreviate it
to "transfer", since Layer 13's norm is the *multiplicative* transfer.

The API for corestriction includes:

- The constructors are `TauCeti.ContCohomology.explicitCor0Transversal`,
`TauCeti.ContCohomology.explicitCor1Transversal`, `TauCeti.ContCohomology.explicitCor2Transversal` for a variable transversal, and the public
`TauCeti.ContCohomology.explicitCor0`, `TauCeti.ContCohomology.explicitCor1`, `TauCeti.ContCohomology.explicitCor2` at `t = Quotient.out`; all six carry the finite-index
instance.
- A worked example is `cor ∘ res` on `H¹(Ẑ, ℤ/m)` for the
open subgroup `nẐ`, computed on explicit cocycles, once with the trivial action and once with a
nontrivial one so that the factor `t u •` is tested.
- The morphisms are each `cor` is additive.
Functoriality: naturality in coefficient maps, transitivity in the subgroup, and compatibility
with connecting maps.
- The comparison is independence of the transversal, stated as an explicit
coboundary identity; and agreement with Layer 10's all-degree corestriction.
- The naturality requirements are of `cor`
in `M`.
- The boundary cases are `U = G`, where `cor` is the identity; index `1`; and the trivial action, where
the representative factor disappears.
- The consumers are Layer 8's projection formula, Layer 9's norm
compatibility, Layer 13's identity 2.

The source for `cor ∘ res` is NSW (1.5.7); Serre, *Local Fields* VII §7 Prop. 6; Koch Thm. 3.10. The
hypothesis is finite index; openness is additionally used for continuity. Compactness makes an open
subgroup finite-index, but no such implication is used for a general topological group. The statement is
`cor ∘ res = (G : U) • id` **on cohomology**; the false neighbor is the same identity on cochains,
which is false in degrees `1` and `2`, where the two sides differ by the explicit coboundary
recorded in Conventions. Never state it as a cochain identity in positive degrees.

*Needs:* The corestriction contracts and Layer 2 coboundaries.

### Examples

For `C₄ ⊇ C₂` with representatives `1,s`, multiplying twice by `s` yields the Schreier factor `s²`, not `1`.

### Dependencies

Mathlib: `Subgroup.index`, `Subgroup.FiniteIndex`,
`Subgroup.finiteIndex_of_finite_quotient`, `OpenSubgroup`, `QuotientGroup.mk`, `Quotient.out`. Tau
Ceti: `TauCeti.lWord`, `TauCeti.lWord_mem`, `TauCeti.lWord_mul_lWord` and
`TauCeti.transversal_mul_lWord` (`TauCeti/GroupTheory/TransversalWord.lean`),
`TauCeti.continuous_lWord` (`TauCeti/Topology/Algebra/Group/TransversalWord.lean`), and the
corestrictions with their identities in `Corestriction/Basic.lean`,
`Corestriction/Transitivity.lean`, `DeltaNaturality.lean` and `ProjectionFormula.lean` of
`TauCeti/RepresentationTheory/Homological/ContCohomology/`. This roadmap: Layer 2, and Layer 5 for
the compatibility of corestriction with the connecting maps.

## Layer 7: coinduced modules and Shapiro's lemma

The inputs for this layer are Mathlib: `Representation.coind`, `Rep.indCoindIso`,
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
explicit Shapiro isomorphisms at the pin: the coinduced module `TauCeti.coind` with the discrete
carrier `TauCeti.DiscreteCoind`, the trace `TauCeti.coindTrace`, the object and functor
`TauCeti.coindTopRep`, `TauCeti.coindFunctor` and `TauCeti.coindFunctor_obj`, the exactness
`TauCeti.coindFunctor_map_shortExact`, the comparison `TauCeti.algebraicCoindAsSmooth` and
`TauCeti.topologicalCoindIsoAlgebraic` with `TauCeti.topologicalCoindIsoAlgebraic_shapiro`, and
the isomorphisms
`TauCeti.ContCohomology.explicitShapiro0`, `TauCeti.ContCohomology.explicitShapiro1` and
`TauCeti.ContCohomology.explicitShapiro2`. What remains to build here is the continuous
Frobenius reciprocity, the naturality of the explicit Shapiro isomorphisms in `A` and their
compatibility with restriction and corestriction, `Ind_H^G A ≅ Coind_H^G A` for open `H` with the
induced-module form of Shapiro, the categorical forms
coindFunctor_preservesMonomorphisms and coindFunctor_preservesEpimorphisms, and the worked
example.


### 7.1 The coinduced module

`Coind_H^G A` is the locally constant `H`-equivariant maps `G → A`
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
`TauCeti.coindFunctor_map_shortExact` states that an injective map followed by a surjective one, exact at
the middle object, is sent to maps with the same three properties, including exactness at the
middle object.
⚠ Terminology trap: NSW writes `Ind_G^H` for this **coinduced** functor and flags the abuse only
in a footnote (2nd ed., p. 61). When citing NSW (1.6.4) next to a Lean `coind`, cite the
footnote too, and reserve `ind` for the genuine left adjoint.

*Needs:* Layer 0 continuous sections and open stabilizers; `TauCeti.DiscreteCoind`, its counit and exactness.

**Checks.**

- For `H = G`, a coinduced function is determined by `f(1) = a`, with `f(g) = g • a`; evaluation and its inverse send `a` to `a`.
- For `H = 1`, `G = C₂` and `A = 𝔽₃`, the module has nine functions and the generator swaps the two coordinates; `(1,0)` goes to `(0,1)`.
- For `G = S₃`, `H = 1`, indicator functions satisfy `(a • (b • f))(x) = f(xab)`; replacing right translation by `f(gx)` yields `f(bax)`, and the indicators at `ab` distinguish these values.

### 7.2 Shapiro's lemma

`Hⁱ(G, Coind_H^G A) ≅ Hⁱ(H, A)` for `i = 0, 1, 2` on the explicit model
(NSW (1.6.4), Ribes-Zalesskii Thm. 6.10.5, Koch Thm. 3.9), natural in `A` and compatible with
restriction and, for open intermediate subgroups, corestriction. The forward map is restriction
to `H` followed by evaluation at `1`, and involves no choice; the inverse is the section formula
for every continuous right-coset factorization of `G` over `H`, which Layer 0's continuous section
supplies for closed `H`, open or not. The named maps are `TauCeti.ContCohomology.explicitShapiro0`, `TauCeti.ContCohomology.explicitShapiro1`,
and `TauCeti.ContCohomology.explicitShapiro2`, on the discrete carrier `TauCeti.DiscreteCoind G H A`; their forward
application theorems (`TauCeti.ContCohomology.explicitShapiro1_apply` and its siblings) pin
evaluation at `1`, and their inverses pin the section formula
(`TauCeti.ContCohomology.explicitShapiro1_symm_apply`, `explicitShapiro2_symm_apply`). Degree `0`
needs no closedness. The pin's `coindIso` fixes the direction. The canonical Shapiro map in every
degree and its isomorphism `TauCeti.ContinuousCohomology.shapiroIso` are Layer 10 milestones, not Layer 7 exports.

*Needs:* Layer 2; the coinduced module, evaluation and section formulas; Layer 6 for corestriction compatibility.

### 7.3 Open subgroups and the algebraic comparison

For **open** `H`, prove `Ind_H^G A ≅
Coind_H^G A` using a finite transversal, with the pin's discrete `Rep.indCoindIso` as the model,
and derive the induced-module form of Shapiro. Then state the theorem that joins this roadmap to
the representation theory family: for open `H`, the topological coinduction of a discrete module
agrees with the algebraic coinduction of
[`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md),
by the named `TauCeti.topologicalCoindIsoAlgebraic`, with compatibility with the explicit and canonical
Shapiro maps stated by `TauCeti.topologicalCoindIsoAlgebraic_shapiro` (`Shapiro/Algebraic.lean`). For closed `H` of infinite index
only the coinduced form is asserted.

*Needs:* Mathlib `Rep.indCoindIso`; InductionRestriction, “What Mathlib already has (consume)” and Layer 0; `TauCeti.topologicalCoindIsoAlgebraic`.

### 7.4 Acyclicity and dimension shifting

`Coind_1^G A`, the locally constant maps `G → A`, has
vanishing `Hⁱ` for `i = 1, 2` (Shapiro at `H = 1`); every discrete `M` embeds in a discrete
acyclic module `M ↪ Coind_1^G M`; hence dimension shifting `Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)`
for `i ≥ 1`, through the connecting map. At `i = 0` the connecting map is only surjective, and
the endpoint is `coker(H⁰(G, Coind_1^G M) → H⁰(G, Coind_1^G M ⧸ M)) ≅ H¹(G, M)`. Tau Ceti
supplies all three in
`DimensionShifting/Basic.lean` and `Coinduced/Quotient.lean`:
`TauCeti.ContCohomology.subsingleton_H1_discreteCoind_bot`,
`subsingleton_H2_discreteCoind_bot`, the embedding, which is the unit `TauCeti.DiscreteCoind.unit`
of coinduction at the trivial subgroup (`Coinduced/Discrete.lean`, injective by
`TauCeti.DiscreteCoind.unit_injective`), with its quotient
`TauCeti.ContCohomology.CoindQuotient G ⊥ M` and short exact sequence
`TauCeti.ContCohomology.coindShortExact G ⊥ M`, and the shifts
`explicitDimensionShift0` (the cokernel form at `i = 0`) and `explicitDimensionShift1`. The
statement in all positive degrees, which Layer 11 runs its induction on, is a Layer 10 milestone.
**Checks.**

- `G = C₂`, `M = ℤ` with the sign action: `Coind_1^G M = ℤ²` with the swap action, the embedding
  is `m ↦ (m, −m)`, and the quotient is `ℤ` with trivial action, via `(a, b) ↦ a + b`. Then
  `H¹(C₂, ℤ_sign) = ℤ/2` while `H⁰(C₂, Coind_1^G M ⧸ M) = ℤ`, so an isomorphism at `i = 0` is false.
  The invariants `(a, a)` of `ℤ²` map onto `2ℤ`, and the cokernel `ℤ/2ℤ` is the correct `H¹`.

The API for `Coind_H^G A` includes:

- The constructors are the locally constant `H`-equivariant maps `G → A` with
the right-translation action.
- A worked example is `Coind_1^G A`, the locally constant maps `G → A`,
which is the acyclic module of the dimension-shifting argument.
- The morphisms are functoriality in `A`,
and the counit `Coind_H^G A → A` given by evaluation at `1`.
- Functoriality comprises exactness in `A`.
Comparison: with `Ind_H^G A` for open `H`, and with the algebraic coinduction of
`RepresentationTheory/InductionRestriction` for open `H`.
- The naturality requirements are of the Shapiro isomorphism
in `A`, and its compatibility with restriction and, for open intermediate subgroups,
corestriction.
- The boundary cases are `H = G`, where `TauCeti.coind` is the identity; `H = 1`, which is the
acyclicity case; and `A = 0`.
- The consumers are Layer 10's dimension shifting, Layer 11's dévissage.

The source for Shapiro's lemma is NSW (1.6.4), with the p. 61 footnote, since NSW writes `Ind` for
what is here the coinduced functor; Ribes-Zalesskii Thm. 6.10.5, which uses `TauCeti.coind` by that name;
Koch Thm. 3.9. The hypotheses are `G` profinite and `H` closed; openness is not needed, and the
trivial subgroup is the case the acyclicity argument runs on. The false neighbor is
`Ind_H^G A ≅ Coind_H^G A` for closed `H`: that isomorphism needs a finite transversal and fails
for a closed subgroup of infinite index, so only the coinduced form is asserted there.

*Needs:* Shapiro at the trivial subgroup; Layer 5 connecting maps; `TauCeti.ContCohomology.coindShortExact`.

**Checks.**

- For `G = 1`, coinduction at the trivial subgroup is the identity and its quotient by the unit is zero.
- For sign `ℤ` on `C₂`, the unit is `m ↦ (m,−m)`, its quotient is trivial `ℤ`, and the invariant image is `2ℤ`; the cokernel is `ℤ/2`.
- For the zero module both the acyclic module and quotient are zero, so both sides of every positive-degree shift are zero.

### Examples

For `H = G`, a coinduced function is determined by `f(1) = a`, with `f(g) = g • a`; evaluation and its inverse send `a` to `a`.

### Dependencies

Mathlib: `Representation.coind`, `Rep.indCoindIso`,
`groupCohomology.coindIso`, `IsLocallyConstant`. Tau Ceti:
`TauCeti.isOpen_rightTranslationStabilizer`
(`TauCeti/Topology/Algebra/Group/LocallyConstant.lean`) and the modules `Coinduced`,
`Coinduced/Discrete`, `Coinduced/Exact`, `Coinduced/Functor`, `Coinduced/PreservesExactness`,
`Shapiro` and `DimensionShifting/Basic` of
`TauCeti/RepresentationTheory/Homological/ContCohomology/`. This roadmap: Layers 0, 2 and 6. Other
roadmaps: `RepresentationTheory/InductionRestriction`, for the algebraic finite-index theory it
owns.

## Layer 8: cup products in low degrees

The inputs for this layer are Mathlib: `groupCohomology.IsCocycle₁`, `IsCocycle₂`, `AddMonoidHom`.
This roadmap: Layers 2, 5 and 6.

On the explicit model, relative to an equivariant pairing as fixed in Conventions. Discreteness of `M` and
`N` makes every cochain-level continuity automatic.


### 8.1 The six low-degree shapes

`⌣ : H^p(G, M) × H^q(G, N) → H^{p+q}(G, P)` for the six pairs
`(p, q)` of Conventions with `p + q ≤ 2`, each with: the cochain formula, cocycle cup cocycle is a cocycle,
descent through coboundaries, and biadditivity by construction. The family is closed: every
operation used in an associativity or commutativity statement below is one of these six. Each is
a declaration of its own, `TauCeti.ContCohomology.explicitCup00`, `TauCeti.ContCohomology.explicitCup01`, `TauCeti.ContCohomology.explicitCup10`, `TauCeti.ContCohomology.explicitCup02`,
`TauCeti.ContCohomology.explicitCup11` and `TauCeti.ContCohomology.explicitCup20`, so that a consumer names the shape it uses rather than a
bidegree of Layer 12's graded product. The six are Tau Ceti's, in
`ContCohomology/Cup/Product.lean`.

*Needs:* Layer 2 cochains; a continuous equivariant biadditive pairing.

**Checks.**

- For `G = 1`, the `(0,0)` multiplication pairing sends `(2,3)` to `6`.
- For trivial `𝔽₂` on `C₂`, the nonzero degree-one character has cup square evaluating to `1` at `(s,s)`, the nonzero degree-two class.
- For the zero coefficient pairing all six cups are zero; the preceding value `1` excludes that wrong model for multiplication.

### 8.2 Associativity

Typing both sides needs four `G`-equivariant biadditive pairings and one
coefficient identity. Given `μ₁ : A →+ B →+ D`, `μ₂ : D →+ C →+ E`, `ν₁ : B →+ C →+ F` and
`ν₂ : A →+ F →+ E` with `μ₂ (μ₁ a b) c = ν₂ a (ν₁ b c)` for all `a, b, c`, and classes of degrees
`p, q, r` with `p + q + r ≤ 2`:
```
(x ⌣[μ₁] y) ⌣[μ₂] z = x ⌣[ν₂] (y ⌣[ν₁] z)
```
already at the cochain level (Brown V (3.5)). The instances in range are `(0,0,0)`, `(0,0,1)`,
`(0,1,0)`, `(1,0,0)`, `(0,0,2)`, `(0,1,1)`, `(1,1,0)`, `(1,0,1)`, `(0,2,0)` and `(2,0,0)`.
The instance `(1,1,0)` needs the `(1,0)` cup on the right-hand side, which is why `(1,0)` and
`(0,0)` belong to the family. State also the specialization all applications use: a discrete
`G`-ring `R`, with all four pairings its multiplication.

*Needs:* The six cups and the stated identity of four coefficient pairings.

### 8.3 Graded commutativity

`a ⌣_μ b = (-1)^{pq} (b ⌣_{μᵒᵖ} a)` **in cohomology** (NSW (1.4.4),
Brown V (3.6)). For `(0,q)` against `(q,0)` the two cochains are literally equal, because the
degree-0 class is invariant, so state that case at cochain level. For `(1,1)` they are not: give
the explicit 1-cochain whose `d¹` is the difference, name it in the file docstring, and derive
the statement on classes from it. State the characteristic-2 symmetric specialization separately,
since that is the case the arithmetic applications use.
⚠ Signs are the usual source of error here, between the `(1,1)` homotopy and the
connecting-map formulas below. Fix the homotopy formula in the file docstring and refer to it.

*Needs:* The six cups and the opposite coefficient pairing; Layer 2 coboundaries.

### 8.4 Compatibilities

Four theorems, in the degrees where both sides are defined:
1. restriction: `res (a ⌣ b) = res a ⌣ res b` (NSW (1.5.3)(i));
2. inflation: `inf (a ⌣ b) = inf a ⌣ inf b`, over the quotient's pairing (NSW (1.5.3)(iii),
   Milne (0.1.6));
3. coefficient maps, that is naturality in `μ` (NSW (1.4.2));
4. the **projection formula** `cor (res a ⌣ b) = a ⌣ cor b` for open `U`, by the transversal
   argument (NSW (1.5.3)(iv), Ribes-Zalesskii 7.9.6 and 7.9.7, Brown V (3.8)).

*Needs:* Layer 2 restriction, inflation and coefficient maps; Layer 6 corestriction.

### 8.5 Connecting maps, as typed diagrams

The generic Leibniz identity for `δ` is not a statement
until the coefficient sequences are named, so state two separate theorems.
1. *First variable.* For a short exact sequence `0 → A' → A → A'' → 0` of discrete modules, a
   module `B`, and pairings `A × B → C`, `A' × B → C'`, `A'' × B → C''` compatible with a short
   exact sequence `0 → C' → C → C'' → 0`: for `a'' ∈ H^p(G, A'')` and `b ∈ H^q(G, B)`,
   ```
   δ (a'' ⌣ b) = δ(a'') ⌣ b   in Hⁿ(G, C'),   n = p + q + 1.
   ```
2. *Second variable.* For `0 → B' → B → B'' → 0` and pairings compatible with
   `0 → C' → C → C'' → 0`: for `a ∈ H^p(G, A)` and `b'' ∈ H^q(G, B'')`,
   ```
   δ (a ⌣ b'') = (-1)^p (a ⌣ δ(b''))   in Hⁿ(G, C'),   n = p + q + 1.
   ```

The coefficient diagrams are inputs of the theorems, not prose around an untyped equation. The
instances required downstream, all with target degree at most 2, are six lemmas, named by the
connecting map on the left and the cup shape, as in Tau Ceti, which proves all six in
`ContCohomology/Cup/ConnectingMap.lean`. In
the first variable: `TauCeti.ContCohomology.explicitDelta0_explicitCup00_left` (`δ⁰` of the class, `(p, q) = (0, 0)`),
`TauCeti.ContCohomology.explicitDelta1_explicitCup01_left` (`δ⁰` of the class, `(0, 1)`) and
`TauCeti.ContCohomology.explicitDelta1_explicitCup10_left` (`δ¹` of the class, `(1, 0)`). In the second variable:
`TauCeti.ContCohomology.explicitDelta0_explicitCup00_right` (`δ⁰`, `(0, 0)`), `TauCeti.ContCohomology.explicitDelta1_explicitCup10_right`
(`δ⁰`, `(1, 0)`, with the sign `-1`) and `TauCeti.ContCohomology.explicitDelta1_explicitCup01_right` (`δ¹`, `(0, 1)`).
Layer 13's index-two exact sequence reads its connecting map off
`TauCeti.ContCohomology.explicitDelta1_explicitCup10_right` at the class `1`.

*Needs:* Layer 5 connecting maps; the two displayed diagrams of pairings and exact sequences.

### 8.6 The Bockstein

The sum rule `δ(a ⌣ b) = δa ⌣ b + (-1)^p (a ⌣ δb)` is a statement about a
single derivation, and needs multiplicative short-exact-sequence data that the two theorems above
do not carry. Build it once, for the case the applications use: the Bockstein
`β : Hⁿ(G, 𝔽₂) → Hⁿ⁺¹(G, 𝔽₂)` attached to `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` with its ring structure,
with `β ∘ β = 0` and `β (x ⌣ y) = β x ⌣ y + x ⌣ β y` in the degrees where both sides are
defined. No generic derivation formula is stated without those hypotheses.

*Needs:* Layer 5 for the sequence `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; the six cups.

**Checks.**

- For the generator `x` of `H¹(C₂,𝔽₂)`, the Bockstein is `βx = x² ≠ 0`.
- The derivation rule gives `β(x²) = x³ + x³ = 0`, hence `β²x = 0`.
- For the unit in degree zero, `β(1) = 0`, since it lifts to the invariant `1` modulo `4`.

### 8.7 The duality pairings

For finite discrete `M`, the evaluation pairing `TauCeti.InternalHom.evalPairing` of
Layer 0, with its equivariance `TauCeti.InternalHom.evalPairing_equivariant` and the conjugation action `TauCeti.homAction`,
composed with the cups gives `Hⁱ(G, M →+ N) × H²⁻ⁱ(G, M) → H²(G, N)` for `i = 0, 1, 2`. These are
instances of the six-shape API above. Against the canonical object the same pairing is
`TauCeti.InternalHom.evalPairing` fed to `TauCeti.ofDiscreteModulePairing`, a `TauCeti.TopPairing`, with cup, cup_add_left and
cup_add_right for biadditivity. The Class Field Theory roadmap states local Tate duality for
its own named evaluation pairing on `ZMod n`-coefficient objects, a `TauCeti.TopPairing`, and takes from
here Layer 12's `TauCeti.TopPairing`, cup and `TauCeti.ContinuousCohomology.degreeCast`.
The API for the cup products includes:

- The constructors are the six cochain formulas of Conventions, one per shape. Worked
example: the `(1,1)` square on `C₂` with `𝔽₂` coefficients is the nontrivial class of
`H²(C₂, 𝔽₂)`, and its Galois form `[-1] ⌣ [-1] ≠ 0` in `H²(G_ℝ, 𝔽₂)`.
- The morphisms are biadditivity in each argument, by construction. Functoriality:
naturality in the pairing `μ`, and the restriction, inflation and projection compatibilities.
Comparison: with Layer 12's graded cup, under Layer 3.
- The naturality requirements are the connecting-map identities,
stated as typed diagrams with their coefficient sequences as inputs.
- The boundary cases are `(0,0)`, where
the cup is the pairing itself; a degenerate pairing, where every cup vanishes, which is what the
`C₂` example rules out.
- The consumers are Layer 9's mod-2 pairing and Layer 13's identity 1.

The source for graded commutativity is NSW (1.4.4); Brown, *Cohomology of Groups*, V (3.6). The
identity `a ⌣_μ b = (-1)^{pq} (b ⌣_{μᵒᵖ} a)` holds **on cohomology classes**. The false neighbor
is the same identity on cochains: it is true for `(0,q)` against `(q,0)`, because a degree-0 class
is invariant, and false for `(1,1)`, where the two cochains differ by the coboundary of an
explicit 1-cochain. State the `(0,q)` case at cochain level and the `(1,1)` case on classes.

*Needs:* Layer 0 internal hom and evaluation; the six cups.

**Checks.**

- For `M=N=𝔽₃` with trivial action, evaluation takes the degree-zero classes `(id,1)` to `1`.
- For source sign and target trivial, equivariance at `(id,1)` gives `(-id)(-1)=1`.
- For `M=0` the internal hom and every evaluation cup are zero, so no perfectness is inferred from existence.

### Examples

For `G = 1`, the `(0,0)` multiplication pairing sends `(2,3)` to `6`.

### Dependencies

Mathlib: `groupCohomology.IsCocycle₁`, `IsCocycle₂`, `AddMonoidHom`.
This roadmap: Layers 2, 5 and 6.

## Layer 9: the Galois interface: Hilbert 90 and Kummer theory

The inputs for this layer are Mathlib: `SeparableClosure`, `separableClosure.isGalois`,
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
restriction square in `Kummer.lean`, `Hilbert90.lean`, and `TauCeti.h2KummerToUnits` in
`BrauerTorsion.lean`), which supply the coefficient, Kummer, Hilbert 90 and norm-square contracts. This roadmap: Layers 3, 4, 5 and 8.

`K` a field, `Kˢ = SeparableClosure K`, and `G_K` its Galois group with the Krull topology. This
layer needs Layers 3, 4, 5 and 8. The transport of Layers 10, 12 and 13 to a finite separable
extension `L/K` is stated in Layer 13 (13.3), the first layer where all of its inputs exist.


### 9.1 The group, fixed once

`AbsoluteGaloisGroup K = Kˢ ≃ₐ[K] Kˢ`. This is the carrier, not one
of two options: every statement in this layer and every interface it exports names it.
Mathlib's `Field.absoluteGaloisGroup K` uses the algebraic closure, so a separate milestone
proves that restriction to `Kˢ` is a topological group isomorphism
`Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`, compatibly with the action on `Kˢ`.
Injectivity is `instSubsingletonAlgHomOfIsPurelyInseparable` together with
`separableClosure.isPurelyInseparable`; surjectivity is `AlgEquiv.restrictNormalHom_surjective`.
Tau Ceti's `TauCeti.AbsoluteGaloisGroup` and `absoluteGaloisGroupRestrictEquiv` are both.
`G_K` is profinite in the unbundled sense (`CompactSpace`, `TotallyDisconnectedSpace`), by
`separableClosure.isGalois` together with the pin's `[IsGalois k K] → CompactSpace Gal(K/k)`.

*Needs:* Mathlib `SeparableClosure`, Krull topology and restriction of automorphisms.

**Checks.**

- For `K = ℂ`, the absolute Galois group has one element.
- For `K = ℝ`, it has two elements, and the nonidentity sends `i` to `−i` in both closure models.
- For `K = 𝔽_p(t)`, automorphisms of the algebraic closure fix `t^(1/p)` as well as `t`; the fixed field in that closure is larger than `K`, explaining the separable-closure coefficient model.

### 9.2 The coefficient field and the invariant units

The coefficient modules are `(Kˢ)ˣ` and its
submodules. The module `(Kˢ)ˣ` is **discrete**, since every element lies in a finite
subextension and so has open stabilizer; so are `μₙ ⊆ (Kˢ)ˣ` and the finite subquotients.
`H⁰(G_K, (Kˢ)ˣ)` is the invariant subgroup `((Kˢ)ˣ)^{G_K}`, which is **not the same type** as
`Kˣ`. What exists is a canonical equivalence, written additively as Layer 2's `TauCeti.ContCohomology.H0`,
```
baseUnitsEquivInvariants : Additive Kˣ ≃+ H⁰(G_K, UnitsCoeff K),
```
induced by the algebra map and the fixed-field theorem (Tau Ceti's
`TauCeti.baseUnitsEquivInvariants`). Name it, prove it, and use that exact
map wherever `Kˣ` is the source of a cohomological construction; do not write the two as equal.
As a coefficient module `(Kˢ)ˣ` is fixed once, as `UnitsCoeff K = Additive (Kˢ)ˣ` with the
transported action, the discrete topology and continuity of the action installed as instances,
exactly as for `TauCeti.KummerCoeff`. This is the module Hilbert 90 and the cohomological Brauer group
are stated at, and a consumer that needs `H^i(G_K, (Kˢ)ˣ)` names it rather than building a
second one. Both coefficient modules, with their topologies, actions and continuity instances,
are Tau Ceti's `TauCeti.UnitsCoeff` and `TauCeti.KummerCoeff`.

*Needs:* Layer 0 smooth discrete coefficients; the fixed-field theorem and `TauCeti.UnitsCoeff`.

**Checks.**

- For `K=ℝ`, the fixed units in `ℂˣ` are `ℝˣ`, and the comparison sends `−1` to `−1`.
- For `K=ℂ`, all units are fixed and the comparison is the identity.
- For `K=𝔽_p(t)`, the separable-closure invariants are `Kˣ`; the algebraic-closure substitute would also contain `t^(1/p)`, which is not in `K`.

### 9.3 The Kummer coefficient module

`μₙ` carries the natural `G_K`-action, which is in general
nontrivial, and continuous cohomology depends on that action. So the coefficient object is fixed
once, as `KummerCoeff K n = Additive μₙ` with the transported action and the discrete topology,
and every Kummer statement below is against it. A consumer with its own model of `μₙ` reaches
the same theorem through a transport lemma whose hypothesis is a **continuous `G_K`-equivariant**
additive equivalence. An identification of `μₙ` as a bare group is not enough: the same abstract
cyclic group carrying the trivial action would satisfy it, and the Kummer isomorphism is false
there.

*Needs:* The natural action on roots of unity; Layer 0 discrete submodules.

**Checks.**

- For `K=ℝ`, `n=3`, conjugation sends a primitive cube root to its square, so the action is nontrivial.
- For `n=1`, the coefficient group has one element and `H¹=0`.
- For `K=𝔽₃`, `n=2`, the two roots `±1` are fixed; for `n=3`, the invertibility hypothesis fails and the characteristic-three Kummer sequence is not asserted.

### 9.4 The finite-level Galois dictionary

Finite Galois intermediate fields `K ⊆ L ⊆ Kˢ` correspond
to open normal subgroups of `G_K`; `G_K ⧸ U` is continuously isomorphic to `Gal(L/K)` for the
corresponding `L`; `(Kˢ)^U = L`; and these subgroups are cofinal in the system Layer 4 uses.
Most of this is Mathlib's infinite Galois correspondence
(`InfiniteGalois.isOpen_and_normal_iff_finite_and_isGalois`,
`InfiniteGalois.normalAutEquivQuotient`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`);
what has to be added is the identification of the quotient as a **topological** group and the
cofinality statement in the form Layer 4 consumes.

*Needs:* Mathlib infinite Galois correspondence; Layer 4 quotient system.

### 9.5 Hilbert 90, in two steps

First, for a specified Galois extension `L/K` with `Gal(L/K)`
profinite: `H¹(Gal(L/K), Lˣ) = 0` (NSW (6.2.1); multiplicative coefficients through `Additive`).
Prove it by Layer 4's colimit from the pin's finite-level `groupCohomology.hilbert90`
(`H1ofAutOnUnitsUnique`) through Layer 3's finite comparison and the dictionary above, citing the
named quotient and fixed-field equivalences rather than "by Layer 4". Then specialize to
`L = Kˢ`, which is the exported `TauCeti.hilbert90`, stated at `UnitsCoeff K` against the canonical
carrier: Tau Ceti's `TauCeti.subsingleton_H1_additive_units` and `TauCeti.hilbert90`. Layer 4
makes this proof possible. Write the proof so that a reader can see this.
⚠ The pin's `Rep` universe restriction (`k` and `G` in one universe)
touches exactly this comparison. Keep the profinite statement universe-clean and confine any
workaround to the finite-level step.

*Needs:* The finite-level Galois dictionary; Layer 4 colimit; Mathlib finite Hilbert 90.

### 9.6 The Kummer sequence and isomorphism

for `[NeZero n]` and `hn : IsUnit (n : K)`. Split into
successive constructions, in order. Tau Ceti implements all eight (`TauCeti.unitsCoeffPow_surjective`,
`TauCeti.kummerShortExact`, `TauCeti.powerSubgroup`, `TauCeti.kummerMap` with
`TauCeti.kummerMap_eq_kummerCocycleClass`, `TauCeti.kummerCocycleClass_congr`,
`TauCeti.ker_kummerMap` and `TauCeti.kummerMap_surjective`, `TauCeti.kummerIso` with
`TauCeti.kummerIsoTransport`, and `TauCeti.kummerMapCanonical` with
`TauCeti.explicitIso_kummerMap`), cited by those names below.
1. Surjectivity of the `n`-th power map on `(Kˢ)ˣ`: for `a ≠ 0`, `Xⁿ - a` is separable when `n`
   is invertible, and `Kˢ` is separably closed (`SeparableClosure.isSepClosed`).
2. The short exact sequence `1 → μₙ → (Kˢ)ˣ → (Kˢ)ˣ → 1` of discrete `G_K`-modules, with `μₙ` the
   `n`-torsion subgroup, as `TauCeti.kummerShortExact`, a `TauCeti.ContCohomology.DiscreteShortExact` whose two maps are pinned
   to the named `TauCeti.kummerCoeffIncl` and `TauCeti.unitsCoeffPow`. Its long exact sequence is what puts
   `H²(G_K, μₙ)` inside the cohomological Brauer group: `TauCeti.h2KummerToUnits` is injective by
   Hilbert 90, with image the `n`-torsion.
3. The subgroup of `n`-th powers `(Kˣ)ⁿ = (powMonoidHom n : Kˣ →* Kˣ).range` and the quotient
   type `Kˣ ⧸ (Kˣ)ⁿ`, again named.
4. The connecting map `δ⁰ : Kˣ → H¹(G_K, μₙ)` from Layer 5, and the explicit cocycle description:
   for a chosen `n`-th root `α` of `a` in `Kˢ`, `δ⁰(a)` is the class of `g ↦ g α / α`.
5. Independence of the choice of root: two roots differ by an element of `μₙ`, and the two
   cocycles differ by the corresponding coboundary.
6. Multiplicativity of `δ⁰`, its kernel `(Kˣ)ⁿ`, and its surjectivity (Hilbert 90); the class
   map itself is `TauCeti.kummerMap`.
7. The resulting isomorphism `kummerIso : Kˣ ⧸ (Kˣ)ⁿ ≅ H¹(G_K, μₙ)` (NSW, the display after
   (6.2.1), and (6.2.2) for the pairing form), with `TauCeti.kummerIsoTransport` for a consumer carrying
   its own model of `μₙ` through a continuous `G_K`-equivariant identification.
8. The same class map against the canonical object, `TauCeti.kummerMapCanonical`, and its agreement with
   the explicit one under Layer 3, `TauCeti.explicitIso_kummerMap`. Both maps are named, so a consumer
   that works in all degrees moves between the two by citing this theorem rather than by
   transporting the isomorphism itself.

*Needs:* Hilbert 90; Layer 5 connecting maps; invertibility of `n` and separable closedness.

**Checks.**

- For `K=ℝ`, `n=2`, the two square classes correspond to the zero and nonzero characters; the cocycle for `−1` takes conjugation to `−1` multiplicatively.
- For `K=ℂ`, `n=2`, every unit is a square and both sides are trivial.
- For `K=𝔽₃`, `n=2`, the unit square classes have order `2`; this excludes an unnecessary characteristic-zero restriction. For `n=1`, both sides have order `1`.

### 9.7 Functoriality in the field

stated as two commuting squares rather than as naturality in `K`,
which is not a statement without a chosen embedding of separable closures. For a **finite
separable** extension `L/K` together with a `K`-embedding `L ↪ Kˢ`, which makes `Kˢ` a separable
closure of `L` as well and `G_L = Gal(Kˢ/L)` an open subgroup of `G_K`:
- restriction `H¹(G_K, μₙ) → H¹(G_L, μₙ)` corresponds to `Kˣ ⧸ (Kˣ)ⁿ → Lˣ ⧸ (Lˣ)ⁿ`, that is
  `TauCeti.kummerIso_res` against `TauCeti.powerClassMap`, which is Tau Ceti's `TauCeti.kummerIso_res`;
- corestriction `H¹(G_L, μₙ) → H¹(G_K, μₙ)`, Tau Ceti's `TauCeti.kummerCor`, corresponds to
  the norm `N_{L/K}`, that is `TauCeti.kummerIso_norm` against `TauCeti.powerClassMap` of the
  norm on units.

Both squares include the finiteness and separability hypotheses and the chosen embedding
explicitly. These are the compatibilities that the Quadratic Form Invariants roadmap consumes,
`TauCeti.kummerIso_res` and `TauCeti.kummerIso_norm`. That roadmap also reads its Layer 9 Kummer characters
through `TauCeti.kummerMapCanonical`, `TauCeti.explicitIso_kummerMap` and Layer 3's `TauCeti.ContCohomology.explicitIso_coeffMap`.

*Needs:* The Kummer isomorphism; finite separable field norm; Layer 6 corestriction.

### 9.8 The mod-2 specialization

Under `h2 : IsUnit (2 : K)`, with `μ₂ = {±1} ⊆ K` carrying the
trivial action and `𝔽₂ = ZMod 2` written additively: the Kummer class `[a] ∈ H¹(G_K, 𝔽₂)` with
cocycle `g ↦ 0` if `g √a = √a` and `1` otherwise, the square-class isomorphism
`Kˣ ⧸ (Kˣ)² ≃ H¹(G_K, 𝔽₂)`, and the `𝔽₂`-valued pairing `[a] ⌣ [b]`. This is the specialization
of `TauCeti.kummerIso` at `n = 2` and the trivial action, and it is what the quadratic-form consumers
name.
⚠ Do not assume `CharZero`. The hypothesis is `IsUnit (n : K)` with `[NeZero n]`, so finite
fields of odd characteristic remain in scope for `n = 2`.

The API for `μₙ` and the power classes includes:

- The constructors are `μₙ` as the `n`-torsion subgroup of `(Kˢ)ˣ`,
`(Kˣ)ⁿ` as the range of `powMonoidHom n`, and `Kˣ ⧸ (Kˣ)ⁿ`.
- A worked example is `n = 2` over `ℚ`, where
`H¹(G_ℚ, 𝔽₂) ≅ ℚˣ ⧸ (ℚˣ)²` and `[a]` is the explicit square-root cocycle.
- The morphisms are the Kummer
map `Kˣ → H¹(G_K, μₙ)` and the isomorphism it induces.
- Functoriality comprises the two commuting squares in
the field, for a finite separable `L/K` with a chosen embedding, one for restriction and one for
the norm.
- The comparison is with Mathlib's `autEquivRootsOfUnity` at the finite level.
- The naturality requirements are of the
connecting map in the short exact sequence.
- The boundary cases are `n = 1`; `μₙ ⊆ K`, where the action is
trivial and the isomorphism is with `Hom_cont(G_K, μₙ)`; and `K` separably closed, where both sides
vanish.
- The consumers are the Class Field Theory and Quadratic Form Invariants roadmaps.

The source for the Kummer isomorphism is NSW (6.2.1) and the display after it, with (6.2.2) for the
pairing form. The hypotheses are `[NeZero n]` and `IsUnit (n : K)`. The false neighbor is the
same statement over the algebraic closure: for imperfect `K` the fixed field of `Aut(K̄/K)` is the
purely inseparable closure, so the invariants of `(K̄)ˣ` are not `Kˣ` and the left-hand term is
wrong. This is why the layer uses `SeparableClosure K` throughout. Separately, and not a false
statement but a needlessly narrow one, `CharZero K` in place of `IsUnit (n : K)` is true and
excludes the finite fields of odd characteristic that the `n = 2` applications run on; state the
hypothesis that is actually used.

*Needs:* The Kummer isomorphism at `n = 2`; Layer 8 cup product.

### Examples

For `K = ℂ`, the absolute Galois group has one element.

### Dependencies

Mathlib: `SeparableClosure`, `separableClosure.isGalois`,
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
restriction square in `Kummer.lean`, `Hilbert90.lean`, and `TauCeti.h2KummerToUnits` in
`BrauerTorsion.lean`), which supply the coefficient, Kummer, Hilbert 90 and norm-square contracts. This roadmap: Layers 3, 4, 5 and 8.

## Layer 10: continuous cohomology in all degrees

The inputs for this layer are Mathlib: `continuousCohomology`, `TopRep.resolutionX`,
`ContinuousCohomology.resolutionMap`, `ContinuousCohomology.cochainsMap`,
`ContinuousCohomology.map`, `HomologicalComplex.homologyMap`, `QuasiIso`,
`quasiIsoAt_iff_isIso_homologyMap`, `ProfiniteGrp.closedSubgroup_eq_sInf_open`. Tau Ceti:
`ContinuousMap.exists_extension_of_discrete`, `TauCeti.coindTopRep`, `TauCeti.coindCounit` and
`TauCeti.coindTraceHom` (`Coinduced/Functor.lean`), `TauCeti.ContinuousMonoidHom.subgroupSubtype`.
This roadmap: Layers 0, 1, 3, 4, 5, 6 and 7. Layer 0 is a prerequisite through its extension
lemma, which the descent from a closed subgroup below uses.

The explicit computations above are stated in degrees `0, 1, 2`, where their cochain formulas are
usable. Cohomological dimension, dévissage, the general torsion statements and the Evens norm are
all-degree statements, and they all rest on this layer. It is stated against the canonical object
of Layer 1 throughout.

- `Hⁿ(G, M)` for all `n`, for a profinite `G` and a discrete `G`-module `M`, as the canonical
  `continuousCohomology n` applied to the image of `M` under Layer 1's dictionary, with `ℤ` the
  default coefficient ring.
- Restriction, inflation, coefficient maps and conjugation in every degree, with their composition
  laws, and their agreement in degrees `0, 1, 2` with Layer 2's explicit maps under Layer 3.

### 10.1 The all-degree finite-quotient colimit

For every `n`, the functor
`continuousFiniteQuotientSystem n` on `(OpenNormalSubgroup G)ᵒᵖ` sends `U` to
`Hⁿ(G ⧸ U, M^U)` and `V ≤ U` to the compatible-pair pullback along `G ⧸ V → G ⧸ U` and
`M^U ↪ M^V`; the cocone `continuousFiniteQuotientCocone n` has point `Hⁿ(G, M)` and leg at `U`
the coefficient dictionary for `M^U` followed by inflation along `G → G ⧸ U`; and
`continuousFiniteQuotientColimit n` proves it a colimit for compact `G` and a discrete `M` with
continuous action. All three are Tau Ceti's, of the same names in `TauCeti.ContCohomology`
(`FiniteQuotient/Canonical.lean`, `FiniteQuotient/AllDegreeColimit.lean`), with the object,
arrow, point and leg equations `continuousFiniteQuotientSystem_obj`,
`continuousFiniteQuotientTransition_eq_map`, `continuousFiniteQuotientCocone_pt` and
`continuousFiniteQuotientComparisonApp_eq_map`. What remains here is naturality in coefficients
and agreement with every Layer 4 system in degrees `0, 1, 2`.

*Needs:* Layer 1 canonical cohomology; Layer 4 finite-quotient system and descent.

### 10.2 Filtered coefficient colimits

Restrict Layer 1's `continuousCohomologyFunctor R G n`
along `smoothDiscreteι R G` to smooth discrete coefficients and prove
`TauCeti.ContinuousCohomology.continuousCohomology_preservesFilteredColimits`. Layer 11 cites this theorem, not an unnamed
compactness argument.

*Needs:* Layer 1 smooth discrete coefficient functor; compactness and filtered colimits.

### 10.3 The long exact sequence in every degree

Convert a `TauCeti.ContCohomology.DiscreteShortExact` sequence into the
named short complex `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact`; prove it degreewise short exact by the
discrete cochain-lifting lemma, obtaining `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact_shortExact`. Apply
Mathlib's `HomologicalComplex.HomologySequence`/snake construction to define `TauCeti.ContCohomology.DiscreteShortExact.delta`, then state
longExact_exact at all three repeating nodes, `TauCeti.ContCohomology.DiscreteShortExact.delta_naturality` for a morphism of short exact
sequences, and the named compatibilities `TauCeti.ContCohomology.DiscreteShortExact.delta_res`, `TauCeti.ContCohomology.DiscreteShortExact.delta_infl`, and
`TauCeti.ContCohomology.DiscreteShortExact.delta_corestriction`. Finally prove agreement with Layer 5's `TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0` and
`TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1` (`TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1`). This construction is required
because the pinned continuous-cohomology `Basic.lean` deliberately does not construct long exact
sequences; the carrier alone does not supply them. Tau Ceti supplies it:
`TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact` (`ExactCochains.lean`),
`TauCeti.ContCohomology.DiscreteShortExact.delta`, `longExact_exact₁`, `longExact_exact₂`, `longExact_exact₃` and `TauCeti.ContCohomology.DiscreteShortExact.delta_res`
(`HomologySequence.lean`), `TauCeti.ContCohomology.DiscreteShortExact.delta_infl` (`Inflation/ConnectingMap.lean`), and
`TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta0`, `TauCeti.ContCohomology.DiscreteShortExact.explicitIso_delta1` (`ConnectingMapComparison.lean`), and
`TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact_shortExact` (`ExactCochains.lean`), which is short exactness after
forgetting topologies, for a locally compact `G` (so for every profinite `G`); its lifting step
uses continuity of evaluation. Short exactness in `CochainComplex (TopModuleCat ℤ) ℕ` is a
stronger statement and is not asserted here. `TauCeti.ContCohomology.DiscreteShortExact.delta_naturality` for a morphism of coefficient
short exact sequences (`HomologySequence.lean`) and
`TauCeti.ContCohomology.DiscreteShortExact.delta_corestriction` (`Corestriction/ConnectingMap.lean`)
are Tau Ceti's as well, so nothing of the connecting-map package remains to build here.

*Needs:* Layer 5 short exact sequences; Mathlib homology connecting maps.

### 10.4 All-degree Shapiro and dimension shifting

For a closed subgroup `H` and a smooth discrete
`A`, the compatible pair of the inclusion `H ↪ G` and the counit of coinduction, evaluation at
`1` (Tau Ceti's `TauCeti.coindCounit`), gives Mathlib's cochain map `TauCeti.ContinuousCohomology.shapiroCochainMap` from the
homogeneous cochains of `G` with coefficients `Coind_H^G A` to those of `H` with coefficients
`A`, and the map it induces on homology, the canonical Shapiro map `TauCeti.ContinuousCohomology.shapiroMap` (Mathlib's
`ContinuousCohomology.map` at that pair), which is restriction to `H` followed by the
coefficient map of evaluation at `1`. Shapiro's lemma in every degree is that this cochain map is
a quasi-isomorphism: `TauCeti.ContinuousCohomology.isIso_shapiroMap` in every degree, equivalently
`TauCeti.ContinuousCohomology.quasiIso_shapiroCochainMap`. `TauCeti.ContinuousCohomology.shapiroIso` is `TauCeti.ContinuousCohomology.shapiroMap` as an isomorphism (`TauCeti.ContinuousCohomology.shapiroIso_hom`),
so nothing about it depends on a choice. The proof is by induction on the degree. Degrees `0`
and `1` are `TauCeti.ContCohomology.explicitShapiro0` and `TauCeti.ContCohomology.explicitShapiro1` under Layer 3's comparisons. For `n ≥ 1`,
take the short exact sequence `0 → A → Coind_1^H A → Q → 0` (Tau Ceti's
`TauCeti.ContCohomology.coindShortExact H ⊥ A`)
and its coinduction to `G`, which is exact because `H` is closed (`TauCeti.coindFunctor_map_shortExact`).
The connecting maps of the two sequences commute with the Shapiro maps, the Shapiro map being
restriction followed by a coefficient map (`TauCeti.ContCohomology.DiscreteShortExact.delta_res`, `TauCeti.ContCohomology.DiscreteShortExact.delta_naturality`), and both are
isomorphisms in positive degree because both middle terms are acyclic: `Coind_1^H A` by
`TauCeti.ContCohomology.coindAcyclic` for `H`, and `Coind_H^G (Coind_1^H A)`, which transitivity of coinduction
identifies with `Coind_1^G A`, by `TauCeti.ContCohomology.coindAcyclic` for `G`. So degree `n + 1` for `A` is degree
`n` for `Q`. The argument runs over `ℤ`; over another coefficient ring the cohomology is that of
the underlying abelian groups, compatibly with the maps of compatible pairs. Tau Ceti has the case
`R = ℤ` on the image of the dictionary, proved by this route, as
`TauCeti.ContinuousCohomology.shapiroMap`, `TauCeti.ContinuousCohomology.isIso_shapiroMap` and `TauCeti.ContinuousCohomology.shapiroIso`
(`Shapiro/Canonical.lean`, `Shapiro/AllDegrees.lean`), with the transitivity
`TauCeti.DiscreteCoind.transIsoBot`, and it has the change of coefficient ring as
`TauCeti.ContCohomology.restrictScalarsIntIso` (`RestrictScalars.lean`); all of these are at the
pinned Tau Ceti, together with the `TopRep` forms `TauCeti.ContinuousCohomology.isIso_shapiroMapTopRep`
and `TauCeti.ContinuousCohomology.quasiIso_shapiroCochainMapTopRep` (`Shapiro/AllDegrees.lean`). ⚠ Do not ask for an isomorphism of the two homogeneous-cochain complexes: none exists.
A degree-0 homogeneous cochain is determined by its value at `1`
(`TauCeti.ContCohomology.cochainEquiv0`), so for `G = C₂`, `H = 1` and `A = 𝔽₂` the degree-0
terms are `Coind_1^{C₂} 𝔽₂ = 𝔽₂^{C₂}`, of order `4`, and `𝔽₂`, of order `2`; only the maps
induced on cohomology are isomorphisms. Prove that `TauCeti.ContinuousCohomology.shapiroMap` agrees in degrees `0, 1, 2` with
`explicitShapiro0/1/2`. Construct the embedding into the trivial-subgroup coinduced module and
its quotient (for a discrete module, Tau Ceti's unit `TauCeti.DiscreteCoind.unit` and quotient
`TauCeti.ContCohomology.CoindQuotient`, packaged as `TauCeti.ContCohomology.coindShortExact`),
prove `TauCeti.ContCohomology.coindAcyclic` in every positive degree (Tau Ceti's `TauCeti.ContCohomology.coindAcyclic`,
`Coinduced/Acyclic.lean`, at the pin), and derive the dimension-shifting isomorphism
`Hⁱ⁺¹(G, M) ≅ Hⁱ(G, Coind_1^G M ⧸ M)` for `i ≥ 1`, which is Tau Ceti's
`TauCeti.ContCohomology.dimensionShiftIso` (`DimensionShifting/Basic.lean`).

*Needs:* Layer 7 coinduction and its quotient; the all-degree Shapiro and dimension-shift contracts.

**Checks.**

- For `G=1`, `Hⁿ(1,A)=0` for `n>0` and the coinduced quotient is zero.
- For sign `ℤ` on `C₂`, dimension shifting identifies `H²(C₂,ℤ_sign)=0` with `H¹(C₂,ℤ)=0`.
- In the next degree, it identifies `H³(C₂,ℤ_sign)=ℤ/2` with `H²(C₂,ℤ)=ℤ/2`; the zero connecting map cannot be the shift.

### 10.5 Corestriction in every degree, through coinduction

Mathlib has no all-degree cohomological
transfer and Layer 6 builds one only in degrees `0, 1, 2`, so this layer supplies it, in five
milestones rather than one, each of which Tau Ceti has at the pin:
1. the **trace morphism** `tr_U^G : Coind_U^G (res_U M) → M` for open `U ≤ G`, given by
   `f ↦ ∑_{gU ∈ G ⧸ U} g • f (g⁻¹)`; the sum is finite because the index is, the value is
   independent of the coset representatives because `f` is `U`-equivariant, and the result is a
   morphism of discrete `G`-modules. Tau Ceti supplies it: the trace is `TauCeti.coindTrace`
   (`Coinduced.lean`), and the morphism is `TauCeti.coindTraceHom` (`Coinduced/Functor.lean`);
2. all-degree corestriction as the composite
   ```
   Hⁿ(U, res_U M) ≅ Hⁿ(G, Coind_U^G (res_U M)) → Hⁿ(G, M),
   ```
   the first map this layer's Shapiro isomorphism and the second the image of `tr_U^G`;
3. naturality in `M` (`TauCeti.ContinuousCohomology.corestriction_naturality`), transitivity `cor_V^G = cor_U^G ∘ cor_V^U`
   for open `V ≤ U ≤ G` (`TauCeti.ContinuousCohomology.corestriction_trans`, through the relative
   `TauCeti.ContinuousCohomology.corestrictionLe`; `Corestriction/AllDegreeTransitivity.lean`),
   `cor ∘ res = (G : U) • id` (`TauCeti.ContinuousCohomology.res_comp_corestriction`), and compatibility with the connecting
   maps of the long exact sequence
   (`TauCeti.ContCohomology.DiscreteShortExact.delta_corestriction`), each in every degree;
4. the Mackey double-coset formula in every degree (`TauCeti.ContinuousCohomology.mackeyTerm`,
   `TauCeti.ContinuousCohomology.corestriction_mackey`, with
   `TauCeti.ContinuousCohomology.mackeyTerm_eq_of_mk_eq` for the independence of the
   representative; `Corestriction/Mackey/AllDegrees.lean`);
5. agreement in degrees `0, 1, 2` with Layer 6's explicit transversal formulas, under Layer 3:
   `TauCeti.ContinuousCohomology.explicitH0Iso_corestriction`, `TauCeti.ContinuousCohomology.explicitH1AddEquivContinuousCohomology_corestriction`, `TauCeti.ContinuousCohomology.explicitH2AddEquivContinuousCohomology_corestriction`, one per degree.
⚠ The finite index is used in milestone 1 and nowhere else. Do not define the all-degree
corestriction by an all-degree cochain formula: the canonical model is built from homogeneous
cochains through a coinduction resolution and has no inhomogeneous cochains to write one on.

*Needs:* Layer 7 coinduced trace and Shapiro; Layer 6 for the explicit comparison.

### 10.6 Vanishing on a closed subgroup descends to an open one

(NSW (1.5.1), the injectivity half,
for a closed `H` as the inverse limit of the open subgroups containing it). For profinite `G`, a
closed subgroup `H` and a smooth discrete `X`, a class `x ∈ Hⁿ(G, X)` with `res_H x = 0` has
`res_U x = 0` for some open subgroup `U ⊇ H`, in every degree
(`TauCeti.ContinuousCohomology.exists_openSubgroup_le_res_eq_zero`). With `TauCeti.ContinuousCohomology.res_comp_corestriction` it carries
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
`TauCeti.ContinuousCohomology.res`, which is, like Layer 1's `TauCeti.ContinuousCohomology.res`, Mathlib's `map` along the
inclusion with the identity on coefficients, and it has facts 1 to 3 as
`TauCeti.ContinuousCohomology.resolutionMap_subgroupSubtype_eq_zero_iff`,
`TauCeti.ContinuousCohomology.exists_openSubgroup_le_resolutionMap_subgroupSubtype_eq_zero` and
`TauCeti.ContinuousCohomology.exists_mem_invariants_resolutionMap_subgroupSubtype_eq`, in
`TauCeti/RepresentationTheory/Homological/ContCohomology/ClosedSubgroup.lean`.

*Needs:* Layer 0 extension of locally constant functions; canonical cochains and open normal neighborhoods.

### 10.7 Annihilation and torsion

(NSW (1.6.1); Brown III (10.1) is the discrete model). For
profinite `G` and `i ≥ 1`: a class of `Hⁱ(G, M)` annihilated by restriction to an open `U` is
annihilated by `(G : U)`; every element of `Hⁱ(G, M)` is torsion; and `Hⁱ(G, M) = 0` when `M` is a
`ℚ`-vector space. The `p`-primary refinement for pro-`p` groups belongs to
the Profinite Pro-`p` Groups roadmap; state here the general
torsion statement and the finite-level annihilation the orders of the `G ⧸ U` provide.

The API for the all-degree package includes:

- The constructors are Layer 1's carrier, with the operations of this
layer.
- A worked example is `Hⁱ(Ẑ, -)` in every degree, which is where the torsion corollary is first
visible.
- The morphisms are restriction, inflation, coefficient maps, conjugation and corestriction, in
every degree.
- Functoriality comprises the composition laws for each, and the long exact sequence.
Comparison: agreement in degrees `0, 1, 2` with Layers 2, 4, 6 and 7, one lemma per operation.
Naturality: of the connecting maps and of the colimit isomorphism.
- The boundary cases are `n = 0`, which is
Layer 1's `ContinuousCohomology.zeroIso`; the trivial group; and `M` a `ℚ`-vector space, where
every positive degree vanishes.
- The consumers are Layer 11 in full, and Layer 12 for the graded product.

The source for the all-degree Shapiro lemma is NSW (1.6.4), with the p. 61 footnote on `Ind`;
Ribes-Zalesskii Thm. 6.10.5; NSW (1.3.7) for the dimension-shifting argument. The hypotheses are
`G` profinite and `H` closed; closedness is used for the explicit base cases and for exactness of
coinduction on the right. The false neighbor is an isomorphism of the homogeneous-cochain
complexes themselves, which fails already in degree `0` for `G = C₂`, `H = 1`, `A = 𝔽₂`: only
the comparison cochain map exists, and it is a quasi-isomorphism.

The source for the all-degree corestriction is Brown, *Cohomology of Groups*, III §9 gives five
constructions of the transfer, of which the one used here is the coinduced-module construction;
NSW (1.5.7) is the identity it has to satisfy. The hypothesis is that `U` is open. In a compact
group an open subgroup has finite index, and a closed subgroup is open exactly when it has finite
index; a finite-index subgroup need not be open (in `∏ₙ 𝔽₂`, the kernel of a nonzero linear form
vanishing on the dense subgroup `⊕ₙ 𝔽₂` has index two and is dense, hence not open). The narrow neighbor to avoid is defining it only where an
inhomogeneous cochain formula is available, which is degrees `0, 1, 2`; the point of this
construction is that it needs no cochains at all.

The source for the descent from a closed subgroup is NSW (1.5.1), for `H` the inverse limit of the
open `U ⊇ H`, and Serre, *Galois Cohomology* I §2.2 Prop. 8. Both prove it on inhomogeneous
cochains `Gⁿ → A`, a description of the canonical complex that the pinned Mathlib does not provide; the
route above needs none of it. The hypotheses are `G` profinite, `H` closed and `X` smooth
discrete, and closedness is used twice: `H` is compact in fact 2 and a closed subspace in fact 3.
The false neighbor is a levelwise shortcut through the finite-quotient colimit. At a level `V`
the classes of `HV` and of `H` lie over the same finite group `HV ⧸ V ≅ H ⧸ (H ⊓ V)`, but with
coefficients `X^V ⊆ X^{H ⊓ V}`, and that inclusion need not be injective on cohomology: for `C₂`
the diagonal `𝔽₂ ↪ 𝔽₂[C₂]` kills `H¹(C₂, 𝔽₂) = 𝔽₂`, since `H¹(C₂, 𝔽₂[C₂]) = 0`. So vanishing on
`H` at a level does not give vanishing on `HV` at that level.

The source for the torsion statement is NSW (1.6.1); Brown III (10.1) is the discrete model. The
hypotheses are `G` profinite and `i ≥ 1`. The false neighbor is the same statement in degree `0`,
where `H⁰(G, M) = M^G` is not torsion in general, and the `p`-primary refinement for pro-`p`
groups, which is the Profinite Pro-`p` Groups roadmap's and not this one's.

*Needs:* The all-degree colimit and finite-group annihilation by group order.

### Examples

For `G=1`, `Hⁿ(1,A)=0` for `n>0` and the coinduced quotient is zero.

### Dependencies

Mathlib: `continuousCohomology`, `TopRep.resolutionX`,
`ContinuousCohomology.resolutionMap`, `ContinuousCohomology.cochainsMap`,
`ContinuousCohomology.map`, `HomologicalComplex.homologyMap`, `QuasiIso`,
`quasiIsoAt_iff_isIso_homologyMap`, `ProfiniteGrp.closedSubgroup_eq_sInf_open`. Tau Ceti:
`ContinuousMap.exists_extension_of_discrete`, `TauCeti.coindTopRep`, `TauCeti.coindCounit` and
`TauCeti.coindTraceHom` (`Coinduced/Functor.lean`), `TauCeti.ContinuousMonoidHom.subgroupSubtype`.
This roadmap: Layers 0, 1, 3, 4, 5, 6 and 7. Layer 0 is a prerequisite through its extension
lemma, which the descent from a closed subgroup below uses.

## Layer 11: cohomological dimension

The inputs for this layer are Mathlib: `ENat`, `AddCommGroup.primaryComponent`,
`CategoryTheory.Simple`, `IsSimpleModule`; for the class-module theorem also
`TopologicalAbelianization`, `MonoidHom.transfer` with `MonoidHom.transfer_def`, and the finite
group theory of Exact supplier contracts's last bullet (`Sylow`, `Sylow.nonempty`, `Sylow.not_dvd_index`,
`Sylow.card_eq_multiplicity`, `IsPGroup.center_nontrivial`, `exists_prime_orderOf_dvd_card'`,
`Subgroup.normal_of_le_center`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
`QuotientGroup.quotientKerEquivRange`, `QuotientGroup.quotientQuotientEquivQuotient`,
`Subgroup.subgroupOfEquivOfLe`, `Subgroup.quotient_finite_of_isOpen`,
`Subgroup.finiteIndex_of_finite_quotient`, `Subgroup.isOpen_mono`, `Nat.factorization_def`).
Tau Ceti: the invariants and their theory in
`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean`
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
at arbitrary topological coefficients `TauCeti.ContCohomology.explicitRes1`, `TauCeti.ContCohomology.explicitRes2`,
`TauCeti.ContCohomology.explicitInfl1`, `TauCeti.ContCohomology.explicitInfl2`, `TauCeti.ContCohomology.explicitInfRes_exact`, `TauCeti.ContCohomology.explicitMap1`, `explicitMap2`,
`explicitMap2Equiv`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2`. This roadmap: Layer 10;
the class-module theorem also Layers 2, 3, 5, 6 and 7.

For profinite `G` and a prime `p`; NSW III §3 is the source of record. This layer rests on
Layer 10.


### 11.1 Types and definitions

The three invariants `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt` and `TauCeti.cohomologicalDimension` are valued in `ℕ∞`
(Mathlib's `ENat`). The first two are infima of `Prop`-valued predicates on `ℕ`, and each
predicate is named and stated in its own right rather than folded into the infimum. In the four
headers below `M` ranges over discrete `G`-modules with continuous action in the unbundled
classes of Conventions, and `Hⁱ(G, M)` is Mathlib's `continuousCohomology i (ofDiscreteModule G M)`;
`TauCeti.leastENatBound` sends a predicate on `ℕ` to the infimum in `ℕ∞` of the naturals satisfying it,
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
`Type (max u v)` for an extra universe `v`, the first universe parameter of each declaration.
Its theorems on subgroups and on strict dimension are stated at `v = u` for `G : Type u`
(for instance `TauCeti.strictCohomologicalDimensionAt_le_of_isClosed` and
`TauCeti.cohomologicalDimensionAt_eq_of_not_dvd_index`), whereas `v = 0` gives the same coefficient universe `Type u`.
These two instantiations motivate the universe comparison below; no arithmetic
cohomological-dimension theorem is assumed here. This roadmap reads its invariants at `v = u`,
so coefficients live in `Type u`, as in §3; this also fixes Mathlib's auxiliary cochain universe
to the convention used by Tau Ceti's pro-`p`, Sylow and Demushkin dimension theorems.
So `cd_p G ≤ n ↔ CohomologicalDimensionLE p G n` (`TauCeti.cohomologicalDimensionAt_le_iff`),
and `cd_p G = ⊤` exactly when no bound holds; likewise for `scd_p`
(`TauCeti.strictCohomologicalDimensionAt_le_iff`). Finally `cd G = ⨆ p, cd_p G` in `ℕ∞`, over
primes `p`. The definitions do not use that `p` is prime; they are meant for prime `p`, and the
theorems below that need primality carry the hypothesis `p.Prime`.

In the headers `M` ranges over **arbitrary** discrete `G`-modules in the unbundled classes of Conventions,
subject only to the stated primary-torsion condition. Restricting the ordinary predicate to
coefficients of bounded exponent would define a different invariant by fiat; that the two agree
is `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent` below, a theorem proved through Layer 10's compatibility with
filtered colimits.

The ordinary and the strict predicate differ in both places at once, and swapping either half
gives the wrong invariant. Ordinary dimension asks the whole of `Hⁱ` to vanish, but only for
`p`-primary torsion coefficients; strict dimension allows arbitrary discrete coefficients, but
asks only the `p`-primary part of `Hⁱ` to vanish. In particular `TauCeti.strictCohomologicalDimensionAt` still depends on `p`:
defining it by vanishing of all of `Hⁱ(G, M)` for all discrete `M` would drop `p` from the
statement. Here `p`-primary means every element is annihilated by a power of `p`
(`AddCommGroup.primaryComponent`, which also supplies `.primaryComponent p` above). Also state
and prove the equivalence of `TauCeti.CohomologicalDimensionLE` with the other common interface for
*ordinary* dimension, vanishing of the `p`-primary component of `Hⁱ(G, M)` for every discrete
**torsion** `M`, so that both may be used; NSW (3.3.1) states the latter and
`TauCeti.cohomologicalDimensionLE_iff_torsion` is the theorem. That second interface
is one torsion hypothesis away from the strict predicate, so keep the three statements apart.

*Needs:* Tau Ceti dimension predicates, `TauCeti.leastENatBound` and Mathlib `AddCommGroup.primaryComponent`.

**Checks.**

- For `G=1`, both invariants are `0`; both vanishing predicates hold at `n=0`.
- For `G=ℤ_p`, ordinary dimension is `1` and strict dimension is `2`, since the integral degree-two p-primary component is `ℚ_p/ℤ_p`.
- For `G=C_p`, both are `⊤`, and `⊤+1=⊤`; for the zero coefficient module every primary component is zero.

### 11.2 Independence of the extra coefficient universe

For a topological group `G : Type u`, the
invariants at `v = u` and at `v = 0` quantify over the same coefficient modules `M : Type u`
(since `max u u = max u 0 = u`), but the canonical cohomology objects
`continuousCohomology i (TauCeti.ofDiscreteModule ℤ G M)` inside them are formed with different
universe parameters of Mathlib's construction and are not definitionally equal. Prove that the
invariants agree:
`cohomologicalDimensionAt_universe_eq`, `cd_p` at `v = u` equals `cd_p` at `v = 0`, and
`strictCohomologicalDimensionAt_universe_eq`, the same for `scd_p`, for every topological group
`G`, with no profiniteness, size or `Type 0` hypothesis on `G`. The theorems compare exactly these
two parameters; they say nothing about coefficient modules in a strictly larger universe.
*Route.* Construct, for every discrete `G`-module `M : Type u`, a chain isomorphism between the
homogeneous cochain complexes `TopRep.homogeneousCochains` of `TauCeti.ofDiscreteModule ℤ G M`
at the two parameters. In resolution degree zero it is the identity of `M`; in degree `n + 1`,
where the term is `C(G, V)` for the degree-`n` term `V`, it is postcomposition with the degree-`n`
continuous linear equivalence, and its inverse postcomposes with the inverse. Check that it
commutes with the diagonal `G`-action, with the coinduction unit and with the recursion
`d_{n+1} = const − C(G, d_n)` that defines the differentials, and restrict to invariants. Its
homology classes, through the explicit kernel-modulo-image presentation
(`CategoryTheory.ShortComplex.moduleCatLeftHomologyData`) on both sides, give an additive
equivalence `Hⁱ_{v=u}(G, M) ≃+ Hⁱ_{v=0}(G, M)` in every degree `i`, natural in equivariant
coefficient maps; it is not an arbitrary equivalence, since it is required to send the class of
a cocycle to the class of its image. The two theorems follow, because an additive equivalence
preserves both triviality and `p`-primary components, and `TauCeti.leastENatBound` is applied
to equal predicates. *Needs:* Mathlib `TopRep.homogeneousCochains`, `continuousCohomology`,
`CategoryTheory.ShortComplex.moduleCatLeftHomologyData`; Tau Ceti `TauCeti.ofDiscreteModule`,
`TauCeti.CohomologicalDimensionLE`, `TauCeti.StrictCohomologicalDimensionLE`,
`TauCeti.leastENatBound`.
**Checks.**

- For the trivial group `G = 1`, `M = ℤ` and degree `0`, both cohomology groups are `ℤ` and the
  comparison sends the class of `1` to the class of `1`; the map `x ↦ −x`, also an additive
  equivalence, is excluded by the requirement on classes.
- For `G = C₂`, `M = 𝔽₂` with trivial action and degree `1`, both groups are `𝔽₂` and the
  comparison sends the nonzero class (the identity character `C₂ → 𝔽₂`) to the nonzero class;
  the zero map is excluded, as it is not injective.
- The naturality requirements are for the coefficient map `ℤ → ℤ`, `x ↦ 2x`, of trivial `G`-modules, in degree `0`
  both paths around the square send `1` to `2`.
- At `u = 0` the two parameters coincide and the comparison is the identity in every degree, so
  both theorems are equalities of a term with itself.

*Needs:* Mathlib `TopRep.homogeneousCochains`; `TauCeti.ofDiscreteModule` and the dimension predicates.

### 11.3 `p`-primary coefficients give `p`-primary cohomology

For profinite `G` and a discrete
`p`-primary torsion `G`-module `M`, `Hⁿ(G, M)` is `p`-primary torsion in every degree, `n = 0`
included (`TauCeti.isPPrimaryTorsion_continuousCohomology`, proved by Tau Ceti's theorem of the same
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
It is the step from the strict predicate to the ordinary one in `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`. The Profinite
Pro-`p` Groups roadmap consumes it for restriction to a `p`-Sylow subgroup, where it supplies the
power of `p` that a prime-to-`p` index is played against.

*Needs:* Compact-open cochains and `TauCeti.IsPPrimaryTorsion.continuousMap`.

### 11.4 Dévissage

(NSW (3.3.2)), in three reductions, each stated as an equivalence with
`cd_p p G ≤ n` so that it can be used in both directions:
1. `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`: it is enough to test the modules killed by a single power of
   `p`, because an arbitrary `p`-primary module is the filtered colimit of its `pᵏ`-torsion
   submodules and Layer 10's cohomology commutes with those colimits;
2. `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ`: it is enough to test the single degree `n + 1` on **finite**
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

*Needs:* Layer 10 coefficient colimits, exact sequence and dimension shifting.

**Checks.**

- With trivial group, the simple p-primary module `𝔽_p` has only the zero and whole
  submodule; `𝔽_p²` has the proper nonzero line spanned by `(1,0)` and is not simple.
- The zero module has one submodule but fails nontriviality; `ℤ/p²` has the proper subgroup
  `pℤ/p²` of order `p` and fails the elementary-abelian condition.
- For sign `𝔽₃` under `C₂`, the only submodules are `0` and `𝔽₃`; it is simple with
  nontrivial action. Inflating it to `C₄` changes neither its three elements nor its submodules,
  checking independence of the finite quotient and excluding a trivial-action-only test.

### 11.5 Subgroups

Three theorems:
1. `TauCeti.cohomologicalDimensionAt_le_of_isClosed`, that is `cd_p H ≤ cd_p G` for closed `H ≤ G`, by coinduction and
   Shapiro for the cofinal open case and then the limit argument (NSW (3.3.5), Ribes-Zalesskii
   Thm. 7.3.1);
2. `TauCeti.cohomologicalDimensionAt_eq_of_not_dvd_index`, equality when `H` is open of index prime to `p`, from Layer 10's
   `cor ∘ res`;
3. `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt` and `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, that is `cd_p G ≤ scd_p G ≤ cd_p G + 1`
   (NSW (3.3.3)). State all three as inequalities in `ℕ∞`,
   including the case `cd_p G = ⊤`, where `⊤ + 1 = ⊤`.

*Needs:* Layer 10 Shapiro, restriction and corestriction; the dimension definitions.

### 11.6 First values

`cd_p G = 0` if and only if `Hⁱ(G, M) = 0` in positive degrees for every
`p`-primary `M`; `cd_p Ẑ = 1` for every `p` (the worked example in Worked examples); and `H²(Ẑ, M) = 0` for
finite `M`.
⚠ Do not attempt values of `cd_p G_K` or `scd_p G_K` for local fields here. They are
the Class Field Theory roadmap's `cd_ℓ(G_K) = 2` and `scd_ℓ(G_K) = 2`, for `K/ℚ_p` finite and
every prime `ℓ`, which rest on its local duality and class formation, on the Profinite Pro-`p`
Groups roadmap's Sylow equality, and from this layer on `TauCeti.cohomologicalDimensionAt_le_of_isClosed`, `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`,
and the strict-dimension criterion `strictCriterion` at
`n = 2`. The `p`-Sylow equality
`cd_p G = cd_p G_p` (NSW (3.3.6)) belongs to the Profinite Pro-`p` Groups roadmap together with
the profinite Sylow theory it consumes; this layer supplies the definitions, the monotonicity,
the prime-to-`p` equality, and Layer 10's all-degree tools that the Sylow argument uses.

*Needs:* The dimension definitions and the profinite-integer cohomology contracts.

### 11.7 The strict dimension from the ordinary one

(NSW (3.3.4) and its proof). Two milestones.
`TauCeti.strictCohomologicalDimensionAt_le_of_isClosed`: `scd_p U ≤ scd_p G` for an open subgroup `U`
(NSW (3.3.5)), since `Hⁱ(U, A) ≅ Hⁱ(G, Coind_U^G A)` by Layer 10's Shapiro isomorphism. And
`strictCriterion`: `scd_p G ≤ n` if and only if
`cd_p G ≤ n` and the `p`-primary part of `H^{n+1}(U, ℤ)` vanishes for every open `U`, with `ℤ`
carrying the trivial action. The forward direction is `cd_p ≤ scd_p` with the first milestone.
For the converse, `scd_p G ≤ cd_p G + 1` (NSW (3.3.3)) disposes of the degrees above `n + 1`. In
degree `n + 1`, a discrete module finitely generated over `ℤ` is a quotient `B ⧸ C` with
`B = Coind_U^G (ℤ^m)` for an open `U` acting trivially on it; the `p`-primary parts of
`H^{n+1}(G, B) ≅ H^{n+1}(U, ℤ)^m` and of `H^{n+2}(G, C)` vanish, and passing to `p`-primary parts
is exact on torsion groups (Layer 10's torsion statement); Layer 10's filtered colimits then give
every discrete module. NSW states the criterion as "if `cd_p G = n` is finite, then `scd_p G = n`
if and only if …"; the `≤` form holds for every `n` and is the one stated.
*Needs:* Layer 10's Shapiro, torsion, exact sequence and filtered coefficient colimits;
the dimension bounds and open-subgroup monotonicity in the supplier contracts.
**Checks.**

- For the trivial group and `n = 0`, both dimensions are zero and `H¹(1, ℤ) = 0`;
  both sides of `strictCriterion` are true.
- For `G = ℤ_p` and `n = 1`, `cd_p = 1`, `scd_p = 2` and
  `H²(p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`; both sides are false.
- For `G = ℤ_p` and `n = 2`, `H³(p^rℤ_p, ℤ) = 0`; both sides are true.
  For `G = C_p` and every finite `n`, both dimension bounds fail, excluding finite p-torsion.

*Needs:* Layer 10 torsion, Shapiro, exact sequence and coefficient colimits; the dimension bounds.

### 11.8 The class module of a group of strict dimension two

(NSW (3.6.4), (i) ⇒ (iii), in
`p`-primary form). For open subgroups `V ◁ U` of `G`, `V^ab(p)` is the maximal pro-`p` quotient
of the topological abelianization of `V` (`TauCeti.maximalProPQuotient`: Tau Ceti's `maximalProPQuotient`
of Mathlib's `TopologicalAbelianization`), with the conjugation action of `U ⧸ V`
(`TauCeti.maximalProPQuotient.map`, carried from Tau Ceti's action on the topological abelianization),
and `u_{U/V}(p) ∈ H²(U ⧸ V, V^ab(p))` is the class of the extension
`1 → V^ab(p) → U ⧸ K → U ⧸ V → 1`, where `K` is the kernel of `V → V^ab(p)`: in Layer 2's
explicit `H²`, the class of the factor set `(σ, τ) ↦ σ.out * τ.out * (σ * τ).out⁻¹` read in
`V^ab(p)`, with representatives chosen by `Quotient.out` (`TauCeti.abelianizationProPFactorSet`,
`TauCeti.abelianizationProPClass`). Openness of `V` is what makes this factor set a continuous cocycle,
since `U ⧸ V` is then finite and discrete and every cochain on it is continuous; so
`TauCeti.abelianizationProPFactorSet_mem_Z2` and `TauCeti.abelianizationProPClass` take the proof that `V` is
open. The class is the class of the extension for every continuous section
(`TauCeti.GroupExtension.contCohomologyClass_factorSet_eq`). The theorem: if `scd_p G ≤ 2`, then
`H¹(U ⧸ V, V^ab(p)) = 0` and `H²(U ⧸ V, V^ab(p))` is cyclic of order the `p`-part of
`#(U ⧸ V)`, generated by `u_{U/V}(p)`. State it for `U = G`, on Tau Ceti's carrier
`TauCeti.abelianizationProP` with its action `TauCeti.abelianizationProPAction`, continuous by
`TauCeti.abelianizationProP_continuousSMul`, and Tau Ceti's class `TauCeti.abelianizationProPClass`:
`subsingleton_h1_abelianizationProP` (for prime `p`, profinite `G` with `scd_p G ≤ 2` at Tau
Ceti's universe `v = u`, and open normal `V`, `H¹(G ⧸ V, V^ab(p))` is trivial) and
`abelianizationProPClass_generates` (under the same hypotheses there is an additive
equivalence `H²(G ⧸ V, V^ab(p)) ≃+ ZMod (p ^ v_p(G : V))` sending `u_{G/V}(p)` to `1`, which says
at once that the group is cyclic of that order and that the class generates it). A pair `V ◁ U` is
the case of the group `U`, whose strict dimension is at most that of `G`
(`TauCeti.strictCohomologicalDimensionAt_le_of_isClosed`). The carrier, extension class and change-of-group equivalences are inputs.
Prove the cyclic case, the transfer and inflation results, and the passage to arbitrary
finite quotients by the five sub-milestones below; these are targets of this roadmap.
**Checks.**

- `G = ℤ_p`, `V = pℤ_p`, so `scd_p G = 2`: `V^ab(p) = pℤ_p` with trivial action of
  `G ⧸ V ≅ ℤ/p`, so `H¹ = Hom(ℤ/p, pℤ_p) = 0` and `H² = pℤ_p / p²ℤ_p`, of order `p`; with the
  representatives `0, 1, …, p − 1` the factor set is the carry cocycle, whose class is `p`, sent
  to `1 ∈ ZMod p`. At `p = 2` and `p = 3` the orders are `2` and `3`.
- `V = G`: the quotient is trivial, `H² = 0` and `ZMod (p ^ 0) = ZMod 1` is trivial, so the
  equivalence exists and sends the class to `1 = 0`.
- `p` not dividing `(G : V)`, for instance `G = ℤ_p × ℤ/ℓ` with `ℓ ≠ p` prime and `V = ℤ_p`: the
  order `ℓ` of the quotient acts invertibly on the pro-`p` module, so `H² = 0`, matching
  `ZMod (p ^ 0)`; a statement with the full index `ℓ` in place of its `p`-part would be false.
- A negative control for the hypothesis: `G = C_p`, `V = 1` gives `H²(C_p, 0) = 0`, not of order
  `p`; it is excluded because `scd_p C_p = ⊤`. The route has five
sub-milestones, each in the `p`-primary form that NSW leaves implicit. The first two are NSW's
proof of (i) ⇒ (ii). The last three prove (ii) ⇒ (iii) by direct statements about Layer 2's
explicit model in place of NSW's diagram (3.6.2) and its snake lemma, so that no group homology
and no Tate cohomology enters. All the finite-group cohomology below is the explicit `H¹` and `H²`
of a finite discrete quotient with the profinite coefficients `V^ab(p)`: every cochain on a
discrete group is continuous, and Layer 2's restriction, inflation and compatible-pair pullback
and Layer 6's corestriction need no discreteness of the coefficients. The maps of the route are
built from Tau Ceti's explicit operations, which carry none: restriction at these coefficients
(abelianizationProPRes1, abelianizationProPRes2) is `TauCeti.ContCohomology.explicitRes1` and
`TauCeti.ContCohomology.explicitRes2`, the map `i` of sub-milestone 4 is `TauCeti.ContCohomology.explicitMap1` and
`explicitMap2`, and the change of group of sub-milestone 4 is `TauCeti.ContCohomology.explicitMap1Equiv` and
`TauCeti.ContCohomology.explicitMap2Equiv`; `TauCeti.ContCohomology.explicitInfl1`, `TauCeti.ContCohomology.explicitInfl2`,
`TauCeti.ContCohomology.explicitInfRes_exact`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2` are Tau Ceti's
too.
1. **(3.3.11), corestriction in the top degree.** For `scd_p G ≤ n` and an open subgroup `V`,
   every `p`-primary class of `H^n(G, X)` is a corestriction of a `p`-primary class of
   `H^n(V, X)` (`TauCeti.corestriction_surjOn_primaryComponent_of_strictCohomologicalDimensionAt_le`); for `V` normal, a `p`-primary class
   of `H^n(V, X)` with trivial corestriction lies in the subgroup generated by the `(g)_* w - w`
   (the top-degree kernel target). Define conjNormalMap using the compatible pair
   `v ↦ g⁻¹vg`, `x ↦ g • x`; it acts on `H^n(V, X)` for normal `V` and descends to `G/V`
   because inner conjugation by `V` acts trivially. Prove that the kernel on the p-primary
   component is the subgroup generated by these differences with p-primary `w`;
   equivalently, corestriction identifies its coinvariants with `H^n(G,X)(p)`.
   The surjectivity half uses `CohomologicalDimension/Corestriction.lean`; the kernel and
   the action just specified are targets, not declarations of that file.
   Surjectivity: Layer 10's longExact_exact for `0 → B → Coind_V^G X → X → 0`, the last map
   `TauCeti.coindTraceHom`, with `TauCeti.ContinuousCohomology.shapiroIso` identifying the middle term with `H^n(V, X)` and the induced
   map with `TauCeti.ContinuousCohomology.corestriction`, and `H^{n+1}(G, B)(p) = 0`. Injectivity: the augmentation sequence
   `0 → I → ℤ[G/V] → ℤ → 0` tensored with `X`, whose middle term is `Coind_V^G X` and whose last
   map is the trace, and the cover `⊕_σ Coind_V^G X → I ⊗ X`, `e_σ ⊗ x ↦ (σ - 1) ⊗ x`; the
   vanishing of `H^{n+1}(G, -)(p)` makes `H^n(G, ⊕_σ Coind_V^G X)(p) → H^n(G, I ⊗ X)(p)`
   surjective, and under `TauCeti.ContinuousCohomology.shapiroIso` right multiplication by `σ - 1` on `Coind_V^G X` is
   `(σ)_* - 1`. Passing to `p`-primary parts is exact on these torsion groups (Layer 10's torsion
   statement), for `n > 0`. At `n = 0`, the bound `scd_p G = 0` implies that the finite
   quotient `G/V` has order prime to `p`; averaging on p-primary coefficients identifies
   invariants and coinvariants, and the trace is multiplication by that invertible order.
   *Needs:* Layer 10's trace exact sequence and Shapiro; the augmentation module and its
   finite coinduced cover; primary components of torsion groups; prime-to-p averaging at `n = 0`.
   **Checks.**
   - For `G = ℤ_p`, `V = pℤ_p`, `X = ℤ`, `n = 2`, corestriction on
     `H²(V,ℤ)(p) = ℚ_p/ℤ_p` is an isomorphism: a character of `V` is composed with
     `Ver(x)=px`. Its kernel and the conjugation-difference subgroup are both zero.
   - For `G=C₂`, `p=3`, `V=1`, `X=𝔽₃` trivial and `n=0`, corestriction is
     multiplication by `2`, a bijection; both kernels are zero.
   - For the sign `𝔽₃` in the preceding example, corestriction is zero and the invariant
     target is zero; `(s−1)𝔽₃ = 𝔽₃`, so the coinvariant source is zero as well.
2. **(1.5.9) and (i) ⇒ (ii): the transfer.** The transfer `Ver : G → V^ab(p)` is Mathlib's
   `MonoidHom.transfer` of the quotient map `TauCeti.abelianizationProPMk`
   (abelianizationProPTransfer, continuous by continuous_abelianizationProPTransfer), and it
   is the product of Layer 6's transversal words (abelianizationProPTransfer_eq_prod_lWord, by
   `MonoidHom.transfer_def`): Layer 6's degree-1 corestriction of a character `ψ` of `V^ab(p)`,
   with trivial coefficients, is `ψ ∘ Ver`, which is (1.5.9). For the Bockstein sequence
   `0 → ℤ → ℤ → ℤ/p^k → 0` of trivial discrete modules, Layer 10's `TauCeti.ContCohomology.DiscreteShortExact.delta` and longExact_exact
   make `δ_k : H¹(-, ℤ/p^k) → H²(-, ℤ)` injective, a continuous homomorphism from a profinite
   group to `ℤ` being zero, and put every `p`-primary class of `H²(-, ℤ)` in the image of some
   `δ_m`, compatibly in `m` (`TauCeti.ContCohomology.DiscreteShortExact.delta_naturality`); `H¹` with trivial coefficients is the group of
   continuous characters by Layer 2's trivial-action description through Layer 3. The connecting
   map commutes with corestriction (`TauCeti.ContCohomology.DiscreteShortExact.delta_corestriction`, with `TauCeti.ContinuousCohomology.explicitH1AddEquivContinuousCohomology_corestriction`) and with
   conjugation (delta_conjNormalMap, a target here). So sub-milestone 1 at `n = 2` and `X = ℤ` reads on characters
   as zmodChar_eq_one_of_transfer_eq_one (a character of `G` of `p`-power order dies on the
   kernel of `Ver`) and zmodChar_eq_one_of_comp_transfer_eq_one (a character of `V^ab(p)` that
   dies on the image of `Ver` dies on the `G ⧸ V`-invariants). The only duality used is
   `TauCeti.exists_continuous_zmodChar_of_notMem`: continuous characters into `ZMod (p ^ k)` separate a
   point of a pro-`p` abelian group from a closed subgroup (an open subgroup containing the one
   and missing the other, and a character of the finite abelian `p`-group quotient, from
   `AddCommGroup.equiv_directSum_zmod_of_finite`). Together these are (3.6.4)(ii) in `p`-primary
   form, `Ver : G^ab(p) ≅ V^ab(p)^{G/V}`: abelianizationProPTransfer_eq_one_iff (the kernel of
   `Ver` is that of `G → G^ab(p)`) and abelianizationProPTransfer_range (the image, compact and
   hence closed, is the invariants).
   *Needs:* Sub-milestone 1; Mathlib `MonoidHom.transfer`; Layer 6 transversal corestriction;
   Layer 5 Bockstein and its naturality; continuous finite characters separating closed
   subgroups of a pro-p abelian group.
3. **(ii) ⇒ (iii) for `G ⧸ V` of order `p`.** Three statements about the transfer and two about a
   finite cyclic group do the work of NSW's diagram (3.6.2). On `V` the transfer is the norm,
   `Ver v = ∏_q q • [v]` (abelianizationProPTransfer_apply_of_mem), and at a representative it
   is the sum of the factor set, `Ver σ.out = ∑_τ u(τ, σ)` (abelianizationProPTransfer_out,
   NSW's `ρ`). For `G ⧸ V` a cyclic `p`-group generated by the image of `s`, an element of `V`
   that dies in `G^ab(p)` has class `(s • b) / b` (exists_abelianizationProPMk_eq_smul_div_of_mk_eq_one:
   the quotient of `G` by the preimage of `(s - 1) V^ab(p)` is an extension of the cyclic `G ⧸ V`
   by a central subgroup, hence abelian, and pro-`p`, so `G` maps onto it through `G^ab(p)`; this
   is NSW's injectivity of `i` for cyclic `U/V`, without `H₂`). For a finite cyclic `Γ = ⟨σ⟩`, any
   coefficients `A` and the norm `TauCeti.groupNorm`: `H¹(Γ, A) = 0` as soon as the kernel of the norm is
   `(σ - 1) A` (`TauCeti.ContCohomology.subsingleton_H1_of_forall_mem_zpowers`), and `H²(Γ, A) ≅ A^Γ / N(A)` by
   `f ↦ ∑_τ f (τ, σ)` (`TauCeti.ContCohomology.explicitH2CyclicEquiv`,
   `TauCeti.ContCohomology.explicitH2CyclicEquiv_mk`, `FiniteCyclic.lean`, with
   sum_cocycle_mem_H0), both proved on explicit cochains, with Mathlib's
   `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` and `groupCohomologyIsoEven` as the discrete
   model. Then for `#(G ⧸ V) = p`: subsingleton_h1_abelianizationProP_of_card_eq_prime, since
   `N [v] = 0` makes `Ver v = 1`, so `v` dies in `G^ab(p)` and `[v] = (σ • b) / b`; and
   abelianizationProPClass_generates_of_card_eq_prime, since `u_{G/V}` goes to the class of
   `Ver σ.out`, every invariant is `Ver (σ.out ^ i v) = i • Ver σ.out + N [v]`, `p • Ver σ.out`
   is the norm `Ver (σ.out ^ p)`, and `Ver σ.out` is not a norm: `Ver σ.out = Ver v` would put
   `σ.out v⁻¹` in the kernel of `G → G^ab(p) → G ⧸ V`.
   *Needs:* Sub-milestone 2; the factor set and `TauCeti.ContCohomology.explicitH2CyclicEquiv`;
   the cyclic-kernel identity proved in this sub-milestone.
4. **(3.6.1), change of group and inflation.** Use the change-of-group equivalences
   of `ClassModule/ChangeOfGroup.lean`; construct the transfer-induced inflation maps and
   prove their exactness below. For `V ≤ W` open with `V`
   normal in `G`, the pair
   `V ◁ W` computed in the group `W` is the subgroup `W.map (mk' V)` of `G ⧸ V`:
   `TauCeti.quotientSubgroupOfEquivMap` (Mathlib's `QuotientGroup.quotientKerEquivRange`, a homeomorphism
   for open `V`, both groups being discrete) and `TauCeti.abelianizationProPSubgroupOfEquiv` (through
   Mathlib's `Subgroup.subgroupOfContinuousMulEquivOfLe`, an isomorphism of topological groups, so
   continuous in both directions, and intertwining the two conjugation actions:
   `TauCeti.abelianizationProPSubgroupOfEquiv_smul`)
   give `TauCeti.abelianizationProPSubgroupOfH1Equiv` and `TauCeti.abelianizationProPSubgroupOfH2Equiv`, the
   compatible-pair pullbacks along this pair, and the latter carries `u_{W/V}` to the
   restriction of `u_{G/V}` (`TauCeti.abelianizationProPSubgroupOfH2Equiv_class`, NSW (3.6.1)(i));
   restriction at these coefficients is abelianizationProPRes1 and abelianizationProPRes2.
   For `V ≤ W` both open and normal in `G`, the transfer
   `Ver_{W→V} : W^ab(p) → V^ab(p)` (abelianizationProPTransferLe) is injective with image the
   `W ⧸ V`-invariants (abelianizationProPTransferLe_injective,
   abelianizationProPTransferLe_range, both under `scd_p G ≤ 2`: sub-milestone 2 for the
   group `W`, whose strict dimension
   is at most that of `G` by `TauCeti.strictCohomologicalDimensionAt_le_of_isClosed`, transported), and
   it is continuous and equivariant along `G ⧸ V → G ⧸ W`
   (continuous_abelianizationProPTransferLe, abelianizationProPTransferLe_smul). NSW's
   map `i : Hⁱ(G ⧸ W, W^ab(p)) → Hⁱ(G ⧸ V, V^ab(p))`, the compatible pair of `G ⧸ V → G ⧸ W` and
   `Ver_{W→V}`, is abelianizationProPInfl1 and abelianizationProPInfl2.
   abelianizationProPInfl2_class is (3.6.1)(ii), `i (u_{G/W}) = (W : V) • u_{G/V}`, with no
   hypothesis on the dimension of `G`: the
   inflation of `u_{G/W}` to `G ⧸ V` and the push-forward of `u_{G/V}` along `V^ab(p) → W^ab(p)`
   are one class of `H²(G ⧸ V, W^ab(p))`, and `Ver_{W→V}` after `V^ab(p) → W^ab(p)` is the norm
   of `W ⧸ V`, which acts on `H²(G ⧸ V, V^ab(p))` as multiplication by `(W : V)` (it does so on
   invariants, and two dimension shifts through Layer 7's acyclic coinduced module, with Layer 5's
   connecting maps, carry this to degree 2).
   abelianizationProPInfl1_exact and abelianizationProPInfl2_exact are NSW (1.6.7) for this
   pair under `scd_p G ≤ 2`: `i` is injective with image the kernel of restriction to `W.map (mk' V)`, in degree 2
   when `H¹(W ⧸ V, V^ab(p)) = 0`. Their inputs are Layer 5's inflation-restriction sequence at the
   normal subgroup `W.map (mk' V)`, its extension to degree 2 under the vanishing of `H¹` (proved
   on explicit cochains: a 2-cocycle killed by restriction is cohomologous to one vanishing on
   pairs from `W ⧸ V`, and the vanishing of `H¹` then makes it inflated),
   `QuotientGroup.quotientQuotientEquivQuotient`, and `Ver_{W→V}` onto the invariants.
   *Needs:* Sub-milestone 2 for transfer onto invariants; the supplied change-of-group
   equivalences; Layer 2 compatible-pair maps and Layer 5 inflation-restriction, with
   vanishing `H¹` for the degree-two exactness assertion.
5. **(3.6.3), `p`-groups and then Sylow.** For `G ⧸ V` a `p`-group,
   subsingleton_h1_abelianizationProP_of_isPGroup and
   abelianizationProPClass_generates_of_isPGroup go by induction on `#(G ⧸ V)`, the trivial
   group being Layer 2's edge case. Otherwise the centre of the `p`-group `G ⧸ V` is nontrivial
   (`IsPGroup.center_nontrivial`) and has an element of order `p`
   (`exists_prime_orderOf_dvd_card'`), whose `zpowers` is normal (`Subgroup.normal_of_le_center`),
   with preimage `W` open (`Subgroup.isOpen_mono`), normal, and of index `p` over `V`.
   Sub-milestone 3 for the group `W`, carried by sub-milestone 4's change of group, makes
   `H¹(W ⧸ V, V^ab(p)) = 0` and `H²(W ⧸ V, V^ab(p))` of order `p`. The induction hypothesis for
   `W ◁ G` with abelianizationProPInfl1_exact and abelianizationProPInfl2_exact gives
   `H¹(G ⧸ V, V^ab(p)) = 0` and `#H²(G ⧸ V, V^ab(p)) ≤ #(G ⧸ W) · p = #(G ⧸ V)`; by
   abelianizationProPInfl2_class and the injectivity of `i`, `(W : V) • u_{G/V}` has order
   `#(G ⧸ W)`, so `u_{G/V}` has order `#(G ⧸ V)` and generates. For general `G ⧸ V`, a Sylow
   `p`-subgroup `P` of the finite group `G ⧸ V` (`Sylow`, nonempty by `Sylow.nonempty`) has index
   prime to `p` (`Sylow.not_dvd_index`) and order `p ^ v_p(#(G ⧸ V))`
   (`Sylow.card_eq_multiplicity` with `Nat.factorization_def`). Restriction to `P` is injective in
   degrees 1 and 2 (abelianizationProPRes1_injective, abelianizationProPRes2_injective, from
   `cor ∘ res = index`, the order of `G ⧸ V` killing both groups, and
   abelianizationProP_pow_bijective, `V^ab(p)` being pro-`p` because the open `V` is compact),
   and the `p`-group case for the
   preimage of `P`, carried by sub-milestone 4, makes `H¹(P, V^ab(p)) = 0` and the restriction of
   `u_{G/V}` a generator of a group of order `#P`. So restriction is an isomorphism carrying
   `u_{G/V}` to a generator. Only finite Sylow theory is used, and nothing from the Profinite
   Pro-`p` Groups roadmap.

The transfer and inflation route has the following API, with `p` prime, `G` profinite,
`V ≤ W` open normal, and `scd_p G ≤ 2` for the isomorphism and exactness assertions:

- The transfer `G → V^ab(p)` is continuous, has the transversal product formula and is
  independent of the transversal. Its restriction to `V` is the quotient-action norm.
- The induced map `W^ab(p) → V^ab(p)` is continuous and equivariant for `G/V → G/W`;
  under the strict bound it is injective with image the `W/V` invariants.
- The compatible-pair maps on `H¹` and `H²` preserve addition, compose in towers and have
  the exactness and factor-set normalization specified in sub-milestone 4. The class formula
  itself does not need the strict bound.

**Checks.**

- For `G = ℤ_p`, `V = pℤ_p`, the transfer sends `1` to `p` and `p` to `p²`;
  the identity `G → G` would send `1` to `1`, which is not even in `V`.
- For `V = G`, transfer and the induced cohomology maps are identities; for
  `G = C_p`, `V = 1`, transfer is zero and is not injective on `G^ab(p)`, as the strict bound fails.
- For `G = ℤ_p`, `W = pℤ_p`, `V = p²ℤ_p`, the transfer `W → V` sends `p` to `p²`.
  In `H²(C_{p²},p²ℤ_p) = p²ℤ_p/p⁴ℤ_p`, the full fundamental class is `p²`
  of order `p²`; the combined inflation/transfer map sends `u_{G/W}` to
  `p u_{G/V} = p³`, of order `p`. Using the coefficient transfer alone would wrongly
  return `p²`, so the inflation factor is essential.

*Needs:* Sub-milestones 1–4, Mathlib `MonoidHom.transfer`, Layer 2 compatible-pair maps,
Layer 5 inflation-restriction, and the finite-cyclic contracts of `FiniteCyclic.lean`.

The API for cohomological dimension includes:

- The constructors are the two predicates and the three invariants
above, through `TauCeti.leastENatBound`.
- A worked example is `cd_p Ẑ = 1` for every `p`, with `H²(Ẑ, M) = 0`
for finite `M`, in Worked examples.
- The morphisms are none; these are order-valued invariants, and the content is in
the inequalities.
- Functoriality comprises monotonicity in the closed subgroup, and equality for an open
subgroup of index prime to `p`.
- The comparison is the equivalence of `TauCeti.CohomologicalDimensionLE` with the
`p`-primary-component interface.
- The naturality requirements are not applicable.
- The boundary cases are `cd_p G = 0`, computed;
`cd_p G = ⊤`, where `⊤ + 1 = ⊤` and the inequality still has to hold; and `p` not dividing the
order of any `G ⧸ U`.
- The consumers are the Profinite Pro-`p` Groups roadmap, through `TauCeti.cohomologicalDimensionAt`,
`TauCeti.cohomologicalDimensionAt_le_iff`, `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ`, `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`,
`TauCeti.cohomologicalDimensionAt_le_of_isClosed`, `TauCeti.cohomologicalDimensionAt_eq_of_not_dvd_index`, `TauCeti.IsPPrimaryTorsion` and
`TauCeti.isPPrimaryTorsion_continuousCohomology`; the Class Field Theory roadmap, through `TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`,
`TauCeti.cohomologicalDimensionAt_le_of_isClosed`, `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt` and
`strictCriterion` at `n = 2`, for
`cd_ℓ(G_K) = scd_ℓ(G_K) = 2`; and the Local Galois Groups roadmap, through `TauCeti.cohomologicalDimensionAt`,
`TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` and `TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`, and through the class module at
`G = G_K` and `V = G_L` for a finite Galois `L/K`: `TauCeti.maximalProPQuotient`,
`TauCeti.abelianizationProPFactorSet`, `TauCeti.abelianizationProPClass` and the degree-two statement
`abelianizationProPClass_generates`. Its hypothesis `scd_p(G_K) ≤ 2` is the Class Field Theory
roadmap's `scd_p_absoluteGaloisGroup_eq_two`, which is a statement about the same invariant `TauCeti.strictCohomologicalDimensionAt`,
so no comparison enters. That roadmap also reads the carrier
`TauCeti.maximalProPQuotient`, with its conjugation action, and the class `TauCeti.abelianizationProPClass` at the
relation subgroup of a free profinite group, for Lyndon's theorem and the extension it lifts; it
uses the generation theorem only at `G_K`.

The source for the `p`-primary torsion of cohomology is The proof of NSW (3.3.2), (i) ⇔ (ii), uses it
in the form `Hq(G, A)(p) = Hq(G, A(p))` for torsion `A`. The hypothesis that cannot be dropped is
compactness of `G`: for the discrete group `⊕_ℕ ℤ` acting trivially,
`H¹(⊕_ℕ ℤ, ℚ_p/ℤ_p) = Hom(⊕_ℕ ℤ, ℚ_p/ℤ_p) = ∏_ℕ ℚ_p/ℤ_p`, and the element whose `k`-th
coordinate is `1/pᵏ` is killed by no power of `p`.

The source for dévissage is NSW (3.3.2); Koch Def. 5.1 takes the pro-`p` case as the definition. The
reduction is to **finite** discrete `p`-primary modules and then to the finite simple ones, and
the finiteness is what the colimit and dimension-shifting argument needs. The inequality
`cd_p G ≤ scd_p G ≤ cd_p G + 1` is NSW (3.3.3), and the false neighbor is equality of the two: for
`G = ℤ_p` one has `cd_p G = 1` and `scd_p G = 2`, so the upper bound is attained and `TauCeti.cohomologicalDimensionAt` alone
does not determine `TauCeti.strictCohomologicalDimensionAt`.

The source for the strict-dimension criterion and the class module is NSW (3.3.4) and (3.3.5) for the
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

*Needs:* Layers 2, 3, 5, 6, 7 and 10; the class-module carrier and change-of-group contracts; the five sub-milestones of this subsection.

### Examples

For `G=1`, both invariants are `0`; both vanishing predicates hold at `n=0`.

### Dependencies

Mathlib: `ENat`, `AddCommGroup.primaryComponent`,
`CategoryTheory.Simple`, `IsSimpleModule`; for the class-module theorem also
`TopologicalAbelianization`, `MonoidHom.transfer` with `MonoidHom.transfer_def`, and the finite
group theory of Exact supplier contracts's last bullet (`Sylow`, `Sylow.nonempty`, `Sylow.not_dvd_index`,
`Sylow.card_eq_multiplicity`, `IsPGroup.center_nontrivial`, `exists_prime_orderOf_dvd_card'`,
`Subgroup.normal_of_le_center`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
`QuotientGroup.quotientKerEquivRange`, `QuotientGroup.quotientQuotientEquivQuotient`,
`Subgroup.subgroupOfEquivOfLe`, `Subgroup.quotient_finite_of_isOpen`,
`Subgroup.finiteIndex_of_finite_quotient`, `Subgroup.isOpen_mono`, `Nat.factorization_def`).
Tau Ceti: the invariants and their theory in
`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean`
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
at arbitrary topological coefficients `TauCeti.ContCohomology.explicitRes1`, `TauCeti.ContCohomology.explicitRes2`,
`TauCeti.ContCohomology.explicitInfl1`, `TauCeti.ContCohomology.explicitInfl2`, `TauCeti.ContCohomology.explicitInfRes_exact`, `TauCeti.ContCohomology.explicitMap1`, `explicitMap2`,
`explicitMap2Equiv`, `explicitCor1_comp_res1` and `explicitCor2_comp_res2`. This roadmap: Layer 10;
the class-module theorem also Layers 2, 3, 5, 6 and 7.

## Layer 12: the graded cup product in all degrees

The inputs for this layer are Mathlib: `continuousCohomology`, `CochainComplex`. Tau Ceti: the graded cup
package of `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/`, listed below. This
roadmap: Layers 1 and 8, Layer 3 for the agreement with the explicit shapes, and Layer 10 for the
projection formula and for the connecting maps.

Layer 8's cups are the low-degree calculational interface; the Evens norm multiplies degrees and
so needs the product in every bidegree. Everything here is stated against Layer 1's carrier.

The pinned Tau Ceti proves the eleven milestones of the graded product. This roadmap consumes them
by these names and does not build a second pairing or product:

1. **The coefficient pairing** `TauCeti.TopPairing` (`Cup/Graded/Basic.lean`): for
   `X, Y, Z : TopRep R G`, an `R`-bilinear, jointly continuous and `G`-equivariant map
   `X.V →ₗ[R] Y.V →ₗ[R] Z.V`, with `TauCeti.ofDiscreteModulePairing` building one from a
   biadditive equivariant map of discrete modules and `TauCeti.TopPairing.flip` the opposite
   pairing.
2. **The pairing on the resolution**, the Alexander–Whitney recursion on Mathlib's iterated
   coinduction resolution: `TauCeti.TopPairing.resolutionCupPairing`, pinned by
   `TauCeti.TopPairing.resolutionCupPairing_apply_zero` and
   `TauCeti.TopPairing.resolutionCupPairing_apply_succ`, with
   `TauCeti.TopPairing.continuous_resolutionCupPairing` and
   `TauCeti.TopPairing.resolutionCupPairing_ρ`.
3. **The cochain product** `TauCeti.TopPairing.cupCochain`.
4. **The Leibniz identity** `TauCeti.TopPairing.cupCochain_leibniz`,
   `d (a ⌣ b) = da ⌣ b + (−1)^m (a ⌣ db)`, which fixes the sign convention of every later
   statement.
5. **Descent to cohomology**, `TauCeti.TopPairing.cup m n` (`Cup/Cohomology.lean`), an `R`-bilinear
   map `Hᵐ(G, X) → Hⁿ(G, Y) → H^{m+n}(G, Z)`.
6. **The unit**, `TauCeti.TopPairing.cup_one_left` and `TauCeti.TopPairing.cup_one_right`
   (`Cup/Unit.lean`).
7. **Associativity**, `TauCeti.TopPairing.cupCochain_assoc` on cochains and
   `TauCeti.TopPairing.cup_assoc` on classes (`Cup/Assoc.lean`).
8. **Graded commutativity**, through the homotopy `TauCeti.TopPairing.cupOne` and its coboundary
   formula `TauCeti.TopPairing.d_cupOne`, giving `TauCeti.TopPairing.cup_gradedComm`,
   `a ⌣_μ b = (−1)^{mn} (b ⌣_{μᵒᵖ} a)` after the degree transport
   `TauCeti.ContinuousCohomology.degreeCast` (`Cup/Graded/Comm.lean`).
9. **Restriction, inflation and coefficient compatibility**, `TauCeti.TopPairing.cup_res`,
   `TauCeti.TopPairing.cup_infl`, `TauCeti.TopPairing.cup_coeffMap` and the general
   `TauCeti.TopPairing.cup_map` (`Cup/Functoriality.lean`).
10. **The projection formula** `TauCeti.TopPairing.cup_projection`,
    `cor (res a ⌣ b) = a ⌣ cor b`, for open `U` and smooth discrete coefficients
    (`Cup/ProjectionFormula.lean`).
11. **Agreement with Layer 8's six explicit shapes** under Layer 3's comparison,
    `TauCeti.ContCohomology.explicitIso_cup00`, `explicitIso_cup01`, `explicitIso_cup10`,
    `explicitIso_cup02`, `TauCeti.ContCohomology.explicitIso_cup` (the `(1,1)` case) and
    `explicitIso_cup20` (`Cup/Comparison.lean`).

The characteristic-two specialization the norm consumes is Tau Ceti's too: the pairing
`TauCeti.trivialF2TopPairing` (`Cup/TrivialF2/Basic.lean`) and the graded-commutative `𝔽₂`-algebra
structure on `⨁ₙ Hⁿ(G, 𝔽₂)` (`TauCeti.cohomF2.instGCommRing`, `TauCeti.cohomF2.instGAlgebra`,
`Cup/TrivialF2/GradedAlgebra.lean`), in which the degree multiplication `q ↦ l q` of Layer 13 is
typeable.

What remains to build in this layer is the compatibility of the graded cup with the connecting maps
of a short exact sequence of coefficients in every bidegree (NSW (1.4.3) and (1.4.5)): for short
exact sequences `0 → A → B → C → 0` and `0 → A' → B' → C' → 0` of discrete modules and pairings
`B × Y → B'` restricting to `A × Y → A'` and inducing `C × Y → C'`, the connecting map `δ` of Layer
10 satisfies `δ(x ⌣ y) = δx ⌣ y` for `x ∈ Hᵐ(G, C)`, `y ∈ Hⁿ(G, Y)`, and, with the pairing in the
other variable, `δ(y ⌣ x) = (−1)^n (y ⌣ δx)`. Tau Ceti has the six instances of degree `≤ 2` on the
explicit model (Layer 8). *Needs:* Tau Ceti `TauCeti.TopPairing.cup`,
`TauCeti.TopPairing.cupCochain_leibniz`, `TauCeti.ContCohomology.DiscreteShortExact.delta`.
**Checks.**

- In bidegree `(0, 0)` the identity is the degree-zero case of Layer 8's
  `TauCeti.ContCohomology.explicitDelta0_explicitCup00_left` under Layer 3's comparison.
- The sign, against graded commutativity: from the first form and
  `TauCeti.TopPairing.cup_gradedComm`, `δ(y ⌣ x) = (−1)^{mn} δx ⌣ y = (−1)^{mn + (m+1)n} y ⌣ δx`,
  and `mn + (m + 1)n ≡ n (mod 2)`. At `(m, n) = (2, 1)` the sign is `−1`, which excludes the
  convention `(−1)^m` (value `+1`) and the convention `(−1)^{mn}` (value `+1`); at `(1, 2)` it is
  `+1`, which excludes the convention `−1` in all bidegrees.
- Bidegree `(m, 0)` with `Y` the trivial module `ℤ` and the unit class: both sides reduce to `δx`
  by `TauCeti.TopPairing.cup_one_right`, which excludes a convention with an extra factor `−1` in
  degree zero.

The source for the construction is Brown, *Cohomology of Groups*, V §3: (3.5) is cochain-level
associativity and (3.6) the commutativity homotopy. NSW I §4 states the identities the descended
product satisfies: (1.4.1) Leibniz, (1.4.2) naturality, (1.4.3) and (1.4.5) compatibility with
`δ`, (1.4.4) associativity and graded commutativity. The hypothesis carried throughout is joint
continuity of the pairing, which is automatic for discrete coefficients and is not automatic in
general. The false neighbor is graded commutativity at cochain level, which fails, and is why
milestone 8 is a homotopy and not an equality.

### Examples

- `H^•(C₂, 𝔽₂) = 𝔽₂[x]` with `x` in degree `1`: the square of the nonzero class of `H¹(C₂, 𝔽₂)` is
  the nonzero class of `H²(C₂, 𝔽₂)`, the first case being Layer 8's `(1,1)` cup.

### Dependencies

Tau Ceti's `Cup/` package as listed; Layers 1, 3, 8 and 10 of this roadmap.

## Layer 13: the Evens norm

The inputs for this layer are Mathlib: `RegularWreathProduct`, `DihedralGroup`, `Equiv.Perm`, `ZMod`,
`OpenSubgroup`. Tau Ceti: the index-two package of
`TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/` and
`Corestriction/IndexTwo/`, listed in 13.1; the permutation wreath products
`TauCeti.PermutationWreathProduct` and `TauCeti.WreathProduct` with the monomial homomorphism
`Subgroup.monomialHom` and `Subgroup.continuous_monomialHom`; tensor induction of representations
`Subgroup.tensorInductionFunctor` (`TauCeti/RepresentationTheory/Tensor/Induction.lean`); and the
graded cup of Layer 12. This roadmap: Layers 10 and 12.

Evens' multiplicative transfer, or norm, for an open subgroup `U` of finite index `l` in a profinite
group `G`: a function `H^{2q}(U, A) → H^{2lq}(G, A)` for a discrete commutative `G`-ring `A`, and in
characteristic two a function `H^q(U, A) → H^{lq}(G, A)` in every degree. Its index-two, degree-one
case with coefficients `𝔽₂` has an explicit graph-cocycle description, which the pinned Tau Ceti
proves with all its identities (13.1) and which the Quadratic Form Invariants roadmap consumes. The
general construction is built here (13.2).

### 13.1 The explicit index-two form

For an open subgroup `U` of index two (so `U` is normal and `G ⧸ U ≅ C₂`), an element `s ∉ U` and
a continuous homomorphism `α : U → 𝔽₂`, the Shapiro components are `b₁ γ = α γ` for `γ ∈ U` and
`b₁ γ = α (γ s)` otherwise, and `b_s γ = b₁ (s⁻¹ γ)`; the **two-point graph 2-cochain** is
```
ν_α (γ, η) = b₁ γ · b_s η                     if γ ∈ U,
ν_α (γ, η) = b₁ γ · b₁ η + b₁ η · b_s η       otherwise,
```
a continuous 2-cocycle whose class `N_Ev(α) ∈ H²(G, 𝔽₂)` does not depend on `s`. The pinned Tau
Ceti contracts for the graph construction and the exact sequence are listed below.
The descent from characters to arbitrary degree-one classes and the class-level pullback
identity are targets:

- the cochains and their cocycle identity, `TauCeti.ContCohomology.evensB1`,
  `TauCeti.ContCohomology.evensBs`, `TauCeti.ContCohomology.evensCorCochain`,
  `TauCeti.ContCohomology.evensGraphCochain` and
  `TauCeti.ContCohomology.evensGraphCochain_cocycle_identity` (`Evens/Cochain.lean`);
- Use `TauCeti.ContCohomology.graphClass`, identified with the cochain for every `s ∉ U` by
  `TauCeti.ContCohomology.graphClass_eq_cochainClass` (`Evens/Class.lean`). Define homClass as the
  canonical class of a continuous character `U → Multiplicative (ZMod 2)`, through
  `TauCeti.ContCohomology.evensHomCocycle` and the degree-one comparison. Its API consists of
  agreement with the cochain class, bijectivity (degree-one coboundaries for trivial coefficients
  are zero), and naturality under continuous group homomorphisms. Define evensNormIndexTwo on
  `H¹(U, 𝔽₂)` by its unique character representative and the graph class. Prove representative
  independence and the defining equality `N_Ev([α]) = graphClass(α)`; transport the identities below
  to arbitrary classes. These are constructions on the existing cohomology carriers, not supplied
  declarations. *Needs:* Layer 2's trivial-action character equivalence, Layer 3's degree-one
  comparison and `TauCeti.ContCohomology.graphClass`.
- the conjugation `OpenSubgroup.evensConj`, defined as `res ∘ cor − id` and therefore free of any
  choice of `s` (`Corestriction/IndexTwo/EvensConj.lean`);
- the identities: restriction, `res_U N_Ev(α) = [α] ⌣ evensConj [α]`
  (`TauCeti.ContCohomology.trivialF2ResMap_graphClass`); polarization,
  `N_Ev(α + β) − N_Ev(α) − N_Ev(β) = cor ([α] ⌣ evensConj [β])`
  (`TauCeti.ContCohomology.graphClass_polarization`, `Evens/Identities.lean`); the corestriction
  of `[α]` as the cocycle `b₁ + b_s` (`TauCeti.ContCohomology.explicitCor1_evensHomCocycleAmbient`,
  `Evens/Corestriction.lean`); compatibility with inflation
  (`TauCeti.ContCohomology.explicitInfl2_explicitGraphClassFixedPoints`, `Evens/Inflation.lean`);
  the norm of a restricted class, `N_Ev(res_U y) = y ⌣ y + χ_U ⌣ y` with `χ_U` the class
  `OpenSubgroup.indexTwoCharacterClass` of the character with kernel `U`
  (`TauCeti.ContCohomology.graphClass_comp_subtype`); and naturality in the group
  (`TauCeti.ContCohomology.trivialF2Map_graphClass`, `Evens/Naturality.lean`);
- the index-two exact sequence with coefficients `𝔽₂`,
  ```
  H⁰(G) →χ_U⌣ H¹(G) →res H¹(U) →cor H¹(G) →χ_U⌣ H²(G) →res H²(U) →cor H²(G),
  ```
  from the coefficient sequence `0 → 𝔽₂ → 𝔽₂[G ⧸ U] → 𝔽₂ → 0`:
  `TauCeti.ContinuousCohomology.exact_res_corestriction_of_index_two`,
  `TauCeti.ContinuousCohomology.exact_corestriction_delta_of_index_two`,
  `TauCeti.ContinuousCohomology.exact_delta_res_of_index_two` and
  `TauCeti.exact_trivialF2ResMap_trivialF2CorMap_of_index_two` (`Corestriction/IndexTwo/Exact.lean`),
  with the connecting map in degree one identified as the cup with `χ_U` by
  `OpenSubgroup.indexTwoDelta1_eq_cup_character` and the kernel of restriction in degree two by
  `OpenSubgroup.exact_cup_res2_of_index_two` (`Corestriction/IndexTwo/CupExact.lean`);
- the index-two norm as the pullback of the extension class of `D₁₆`: on `C₂ ≀ C₂`
  (`TauCeti.WreathC2`, read on coordinates `(a, b, c)` with base group `TauCeti.wreathBase`,
  tautological character `TauCeti.wreathTautological` and `s = TauCeti.wreathSwap`), the graph
  cochain of the tautological character is the factor set `TauCeti.wreathD16Cocycle` of the section
  `TauCeti.wreathSection` of `TauCeti.dihedralToWreath : D₁₆ → C₂ ≀ C₂` plus an explicit coboundary
  (`TauCeti.ContCohomology.evensGraphCochain_wreath`), and for every index-two `U` and `α`,
  `N_Ev(α) = (Ind α)^* [c_D₁₆]` along `TauCeti.ContCohomology.indexTwoInd : G → C₂ ≀ C₂`
  (the class-level pullback target). Its input is
  `TauCeti.ContCohomology.evensGraphCochain_eq_indexTwoInd_pullback` in
  `Evens/DihedralPullback.lean`, the cochain equation with an explicit coboundary; prove the
  equality on classes using Layer 3 and the descent just defined.

**Checks.** These pin the conventions a consumer relies on.
- For `H = 1 ⊂ C₂` and its trivial real line, induction is `1 ⊕ sign`, so
  `w = 1 + d`, `w₁ = d` and `w₂ = 0`. The rank-one formula `N(1 + 0) + d = 1 + d`
  agrees; omission of the quotient character would give the false value `w₁ = 0`.
- For `C₂ ⊂ C₄` and the nontrivial real character `α`, the induced plane is rotation
  by a quarter turn: its determinant is `1`, so `w₁ = 0 = cor α + d = d + d`,
  while `w₂` is the nonzero norm class. This also detects the missing quotient character.
- For the zero character on any index-two subgroup, homClass is zero and the graph cochain
  is zero, so `N_Ev(0) = 0`; adding a fixed nonzero degree-two class fails this normalization.
- For `C₂` with trivial `𝔽₂` coefficients the two characters give the two distinct `H¹` classes;
  there is no choice of representative to change the graph value. On `C₄ ⊇ C₂`, the nonzero
  character gives the nonzero graph class, so replacing the descended operation by zero fails.
- `b₁` and `b_s` are cochains and not cocycles: for `G = C₄ = ⟨σ⟩`, `U = ⟨σ²⟩`, `s = σ` and
  `α ≠ 0`, the values of `b₁` at `1, σ, σ², σ³` are `0, 1, 1, 0`, so `b₁(σ · σ) = 1` while
  `b₁(σ) + b₁(σ) = 0`; only the sum `b₁ + b_s` has a class.
- For `G = C₄ ⊇ U = C₂` and `α ≠ 0`, `N_Ev(α) ≠ 0` in `H²(C₄, 𝔽₂) ≅ 𝔽₂`
  (`TauCeti.ContCohomology.graphClass_cyclicFour_ne_zero`), and the central extension it classifies
  is `C₈`: a lift of a generator of `C₄` has fourth power the generator of the kernel.
- Index exactly two is needed for the exact sequence: for `S₃ ⊇ C₂` (index three), restriction
  and corestriction in degree one are both surjective, so the sequence fails at `H¹(U)`. The map
  `H²(G) → H²(U)` is restriction: for `C₄ ⊇ C₂` restriction in degree two is injective, while
  `χ_U ⌣ H¹(C₄, 𝔽₂) = 0`, matching `H^*(C₄, 𝔽₂) = 𝔽₂[χ, u]/(χ²)`.
- The extension is `D₁₆`, not `SD₁₆` or `Q₁₆`: for the same identification of the quotient their
  classes are `[ν_taut] + y²` and `[ν_taut] + x² + y²`, where `x` and `y` are the characters of
  `C₂ ≀ C₂` with kernels `U₀` and `⟨uv, s⟩`.
- The norm of a restricted class is not `y ⌣ y`: at `y = χ_U` on `C₂ ≀ C₂`, `res χ_U = 0` while
  `χ_U ⌣ χ_U ≠ 0`.

What the Quadratic Form Invariants roadmap's Evens-Kahn layer needs from here is the restriction,
polarization and restricted-class identities, the kernel of restriction in degree two and the
pullback formula, all at index exactly two and read on the `L/K` side through 13.3; its
total Stiefel-Whitney expansion in degrees `≤ 2` is the application. This roadmap owns the
cohomological operation; that one owns its application to transferred quadratic forms and the
reading of `[c_D₁₆]` as a Stiefel-Whitney class (Kahn 1984, th. I.4.2, at rank one).

### 13.2 The general construction

Evens 1963 builds the norm for a group `G`, a subgroup `H` of finite index `l` and a commutative
`G`-ring `k`, on even-degree classes (§5, pp. 59–60), and proves
transitivity (§6 Prop. 1), the double-coset formula (Prop. 2, pp. 61–62),
naturality under a homomorphism preserving the index (Prop. 3), multiplicativity
(Prop. 4) and the expansion of the norm of `1 + χ` (Thm. 1, p. 63). This
roadmap builds the continuous form for profinite `G`, an open subgroup `U` of index `l` and a
**discrete commutative `G`-ring** `A`: a commutative ring with the discrete topology on which `G`
acts continuously by ring automorphisms. The degree restriction is a sign: the `l`-fold external
product of a cochain of odd degree is equivariant for the permutation of the factors only up to the
sign of the permutation. When `2 = 0` in `A` the sign disappears and the same construction gives a
norm in every degree; the index-two graph class of 13.1 is the case `l = 2`, `q = 1`, `A = 𝔽₂`.
The milestones:

1. **The monomial embedding.** The permutation wreath product and the transversal-dependent
   continuous monomial homomorphism `G →* (G ⧸ U → U) ⋊ Perm (G ⧸ U)` are Tau Ceti's
   (`TauCeti.PermutationWreathProduct`, `TauCeti.WreathProduct`, `Subgroup.monomialHom`,
   `Subgroup.continuous_monomialHom`). Its permutation component is left translation `x ↦ γ x` on
   cosets and its base component at `x` is the Schreier factor `a(γ, x) = t(x)⁻¹ γ t(γ⁻¹ x)`.
   **Checks.**

   - `G = S₃`, `U = 1`, `t(x) = x`: the Schreier factors are all `1` and the permutation component
     is the left regular representation; with `a = (12)`, `b = (23)`, the inverse-translation
     convention sends `ab` to translation by `ba ≠ ab`, so only left translation is a homomorphism.
   - `U = G = ℤ_p`, one coset, `t = 1`: the base component of `γ` is `γ`, continuous and not
     locally constant.
   - Index two, `G = C₄ ⊇ U = ⟨s²⟩`, `t = {1, s}`: `a(s, U) = s²`, `a(s, sU) = 1`, and the
     permutation component of `s` swaps the two cosets.
2. **The tensor-induced ring and its multiplication.** For the discrete commutative `G`-ring `A`
   regarded as a `U`-ring, the tensor-induced module `⊗_{G ⧸ U} A` (Tau Ceti's
   `Subgroup.tensorInductionFunctor` on the underlying representation) is a discrete commutative
   `G`-ring, and the multiplication `a₁ ⊗ ⋯ ⊗ a_l ↦ t₁a₁ ⋯ t_l a_l` along the transversal is a
   homomorphism of `G`-rings to `A` (Evens §5, p. 60).
   Its API includes the unit, product, action on pure tensors, independence of the chosen
   transversal up to the canonical tensor reindexing, and the equivariance of the multiplication.
   *Needs:* `Subgroup.tensorInductionFunctor`, commutative tensor-product algebras and the
   monomial embedding of milestone 1.
   **Checks.**

   - With trivial action and two factors over `ℤ`, multiplication sends `2 ⊗ 3` and
     its swapped tensor `3 ⊗ 2` to `6`; a sum would give `5`.
   - With one coset and representative `1`, multiplication is `a ↦ a`; on the unit it is `1`.
   - For `A = ℤ[t]`, with `C₂` acting by `t ↦ −t` and `U = 1`, multiplication sends
     `t ⊗ 1` to `t` and `1 ⊗ t` to `−t`; swapping the factors agrees with the action on the
     target, whereas untwisted multiplication would give `t` in both cases.
3. **The norm on cochains.** For a continuous `2q`-cocycle `f` of `U` with values in `A`, the
   external tensor power is promoted to a `2lq`-cocycle on the wreath-product resolution
   using the permutation-group resolution and the tensor-product resolution of the base group
   (Evens §4 and §5, pp. 57–60), with values in the tensor-induced ring; pull it back along the monomial homomorphism and push it forward along the
   multiplication of milestone 2. *Needs:* Layer 12's cochain product
   `TauCeti.TopPairing.cupCochain` and its Leibniz rule; construct the wreath-product
   resolution and its external-power cocycle as part of this milestone, using tensor induction
   and free resolutions, rather than assuming an ordinary cup product supplies that cocycle.
4. **Classes.** Cocycles go to cocycles, cohomologous cocycles to cohomologous cocycles, and the
   class does not depend on the transversal (Evens §5, pp. 59–60).
5. **The public function** `N_U^G : H^{2q}(U, A) → H^{2lq}(G, A)`. It is a function, not an additive
   map: its Lean signature uses `→` between the underlying types.
6. **The laws.** For open `V ≤ U ≤ G`: transitivity `N_V^G = N_U^G ∘ N_V^U`; the double-coset
   formula for the restriction of `N_U^G x` to an open subgroup `K`, a cup product over the double
   cosets `K τ U` of norms from `K ∩ τUτ⁻¹` of conjugates of `x`; naturality along a continuous
   homomorphism `φ : G' → G` with `(G' : φ⁻¹ U) = (G : U)`, of which compatibility with inflation is
   the case of a quotient map; multiplicativity `N(x ⌣ y) = N x ⌣ N y`; the normalization
   `N_U^G 1 = 1`, and `N_G^G = id`; and the expansion: for `χ ∈ H^{2r}(U, A)`, the norm of
   `1 + χ` in the even cohomology ring is `∑_{i=0}^{l} N_i(χ)` with `N_i(χ) ∈ H^{2ri}(G, A)`,
   `N_0(χ) = 1`, `N_1(χ) = cor χ` (Layer 10's corestriction) and `N_l(χ) = N_U^G χ`.
7. **The characteristic-two form.** When `2 = 0` in `A`, the construction of milestones 3 to 6
   applies in every degree and gives `N_U^G : H^q(U, A) → H^{lq}(G, A)` with the same laws; on even
   degrees it agrees with milestone 5.
8. **Agreement with the index-two form.** For `(G : U) = 2`, `q = 1` and `A = 𝔽₂`, the norm of
   milestone 7 is evensNormIndexTwo. This identification turns the graph
   cocycle into a standard cohomological construction.

The norm API is the eight milestones above: its map has the displayed degree, depends only
on the cohomology class, is natural for index-preserving pullback, and obeys the unit,
transitivity, double-coset, multiplicativity and expansion identities. Each coefficient ring
carries the stated continuous action; none of these identities assumes that action trivial.
*Needs:* Milestones 1–4 for construction and descent; Layer 10 corestriction and finite-quotient
colimits; Layer 12 graded cups for the laws; 13.1 for the index-two comparison.

**Checks.**

- Index one: `N_G^G` is the identity in every degree and for every `A`; a construction that
  multiplied by `l` would give `id` too at index one, so this check pairs with the next.
- Odd characteristic: `G = C₃ × C₂`, `U = C₃` (index two), `A = 𝔽₃` with trivial action.
  Restriction `H^n(G, 𝔽₃) → H^n(U, 𝔽₃)` is an isomorphism in positive degree because `C₂` has
  order prime to `3`. For a generator `a` of `H²(C₃, 𝔽₃)`, the double-coset formula gives
  `res_U N(a) = a ⌣ a ≠ 0` in `H⁴(C₃, 𝔽₃)`, so `N(a) ≠ 0`; a norm defined only for `𝔽₂` cannot
  express this. Multiplicativity gives `N(2a) = N(2) ⌣ N(a) = 2² N(a) = N(a)`, whereas
  `2 N(a) ≠ N(a)`, so `N` is not additive.
- The expansion at `l = 2` in the same example: `res_U (1 + cor a + N a) = 1 + (a + a) + a² =
  (1 + a)²`, which is `res_U N(1 + a)` by the double-coset formula, since conjugation by the
  generator of `C₂` acts trivially on `H^*(C₃, 𝔽₃)`.
- Characteristic two in odd degree: `G = C₄ ⊇ U = C₂`, `A = 𝔽₂`, `q = 1`: milestone 7 gives the
  nonzero class of 13.1's Checks, which milestone 5 alone, being restricted to even degrees, does
  not define.

The construction follows Evens, Trans. AMS 108 (1963): §§2–5 for the wreath product, the monomial embedding and
the construction, §6 Props. 1–4 for transitivity, double cosets,
naturality and multiplicativity, Thm. 1 (p. 63) for the expansion, with the hypotheses that `k` is
a commutative `G`-ring and `χ` has even degree. Kozlowski, Proc. AMS 91 (1984), §2 (pp. 310–311) for the
characteristic-two homogeneous norm in every degree and its multiplicativity
(the unnumbered construction in Scope and ownership, pp. 310–311); his
Lemma 2.4 (p. 311) computes that norm only for the special double cover
`EΣ₂ × X → BΣ₂ × X`, as Steenrod squares, for instance `N(x) = x² + t x` for `x` of degree one, and
is not a source for the general index-two identities of 13.1, whose character-level forms follow directly from
the graph cocycle and descend to classes in 13.1.

*Needs:* Layer 2's character equivalence, Layer 3's comparison and the graph-cocycle
contracts for 13.1; tensor induction, monomial embedding, resolutions and Layer 12 for 13.2.

### 13.3 The field-extension form

The operations of Layers 1, 10 and 13 are indexed by a
**subgroup** of the ambient group, and a finite separable `L/K` supplies one only after an
embedding is chosen. Both halves of the passage are this roadmap's, not a consumer's work, and Tau
Ceti has them at the pin: `TauCeti.galoisSubgroup K L σ`, the open subgroup cut out by the
embedding, with `TauCeti.galoisSubgroup_index` saying its index is `[L : K]`, and
`TauCeti.galoisSubgroupEquiv`, the isomorphism of **topological** groups
`G_L ≃ₜ* galoisSubgroup K L σ` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean`),
from which `TauCeti.galoisF2Iso` transports `𝔽₂`-cohomology in every degree
(`TauCeti/FieldTheory/GaloisCohomology/Restriction.lean`).
On top of those, use `TauCeti.galoisRes` and `TauCeti.galoisCor`, the transports of
Layer 1's `TauCeti.ContinuousCohomology.res` and Layer 10's
`TauCeti.ContinuousCohomology.corestriction` (`Restriction.lean`, `Corestriction/Basic.lean`),
together with `TauCeti.galoisConj` for the
conjugate class of a quadratic extension and `TauCeti.galoisCharacter` (`Character.lean`), the class
`χ_{L/K} ∈ H¹(G_K, 𝔽₂)` of the character with kernel `G_L`, which is Layer 13's
`OpenSubgroup.indexTwoCharacterClass` at `TauCeti.galoisSubgroup`. Their laws, each by name:
`TauCeti.galoisRes_galoisCor`, `res (cor y) = y + galoisConj y` in every degree, which holds by the
definition of `galoisConj`; `TauCeti.galoisConj_evensConj`: at `[L : K] = 2`, `galoisConj` is the
transport of Layer 13's `OpenSubgroup.evensConj` through `galoisF2Iso`, which is what lets the
index-two identities be read on the `L/K` side. The two cup compatibilities:
`TauCeti.galoisRes_cup`, restriction preserves the mod-2 cup in every bidegree, an instance of
Layer 12's `TauCeti.TopPairing.cup_res` at `TauCeti.trivialF2TopPairing`; and `TauCeti.galoisCor_cup`,
the projection formula `cor (res x ⌣ y) = x ⌣ cor y` in bidegree `(1, 1)`, an instance of Layer 12's
`TauCeti.TopPairing.cup_projection`. The index-two exact sequence at the bridge:
`TauCeti.galoisRes_eq_zero_iff`, the kernel of `res : H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)` is
`χ_{L/K} ⌣ H¹(G_K, 𝔽₂)`, and `TauCeti.exact_galoisRes_galoisCor_of_finrank_eq_two`, restriction
then corestriction is exact at `Hⁿ(G_L, 𝔽₂)` in every degree `n` (`Corestriction/Exact.lean`); both
need `[L : K] = 2`. Functoriality in a tower is `TauCeti.galoisRes_comp`, and independence of the
embedding is `TauCeti.galoisRes_embedding_independent` with its companions
`TauCeti.galoisCor_embedding_independent`, `TauCeti.galoisConj_embedding_independent` and
`TauCeti.galoisCharacter_embedding_independent`, which is what makes every statement downstream a
statement about `L/K` rather than about a chosen `σ`. What remains to build here is the Evens
transport, for `[L : K] = 2`: define galoisEvens by conjugating the norm of 13.1
with `TauCeti.galoisF2Iso`, from `H¹(G_L, 𝔽₂)` to `H²(G_K, 𝔽₂)`, and prove its defining
subgroup-transport equality galoisEvens_galoisF2Iso_hom. Prove the three identities at the bridge, galoisRes_galoisEvens,
`res N_Ev(x) = x ⌣ galoisConj x`, the transport of
`TauCeti.ContCohomology.trivialF2ResMap_graphClass`; galoisEvens_add,
`N_Ev(x + y) = N_Ev x + N_Ev y + cor (x ⌣ galoisConj y)`, the transport of
`TauCeti.ContCohomology.graphClass_polarization`, with the **conjugate** class in the cross term; and
galoisEvens_galoisRes, `N_Ev(res y) = y ⌣ y + χ_{L/K} ⌣ y`, the transport of
`TauCeti.ContCohomology.graphClass_comp_subtype`; and galoisEvens_embedding_independent, that
`N_Ev` does not depend on the embedding, by the argument of its three companions. A consumer that
built these adapters itself would be building restriction, corestriction and the norm a second
time, with nothing saying that its copies agreed with these. The coefficients are the trivial
`𝔽₂` object, because that is where the Evens norm lives; at other coefficients a consumer uses
`TauCeti.ContinuousCohomology.res` and `TauCeti.ContinuousCohomology.corestriction` at `TauCeti.galoisSubgroup` directly, together with whatever coefficient
comparison its own modules need.
**Checks.**

- For `ℂ/ℝ`, `H¹(G_ℂ,𝔽₂) = 0`, and the transported norm sends zero to zero;
  restriction and corestriction in degree zero are respectively `id` and `0`.
- For `L = K`, restriction and corestriction are identities; the index-two norm is
  not defined at this index-one extension. The general norm of 13.2 is the identity there.
- For `K = 𝔽₃`, `L = 𝔽₉`, the subgroup inclusion is `2Ẑ → Ẑ`; its index is `2`,
  both degree-one groups are `𝔽₂`, and the norm has zero target `H²(Ẑ,𝔽₂) = 0`.
  Both embeddings give that same map, excluding dependence on the embedding.

*Needs:* Layer 9's Galois group and coefficients, Layer 10's corestriction, Layer 12's cup and
13.1.

### Examples

- `G = C₄ ⊇ U = C₂`, `α ≠ 0`: `N_Ev(α)` is the class of the extension `C₈`.
- `G = C₃ × C₂ ⊇ U = C₃`, `A = 𝔽₃`: `N(a)` restricts to `a²` for a generator `a` of `H²(C₃, 𝔽₃)`.
- The tautological character of `C₂ ≀ C₂`, whose norm is the extension class of `D₁₆`.

### Dependencies

Tau Ceti's index-two package, wreath products, monomial homomorphism and tensor induction as
listed; Layers 10 (corestriction) and 12 (the graded cup) of this roadmap.

---

## Worked examples

Discharge these alongside the layers. Each catches a specific classic mistake: a vacuous quotient,
a reversed transition map, a sign slip, a degenerate pairing, a cochain mistaken for a cocycle, an
impossible group.

- **`H¹(ℤ_p, ℤ/pᵏ)` and `H¹(ℤ_p, ℤ)`** (Layer 2). For the profinite additive
  group `ℤ_p`, evaluation at `1` is a bijection from the continuous additive homomorphisms
  `ℤ_p → ℤ/pᵏ` onto `ℤ/pᵏ`, so `H¹ ≅ ℤ/pᵏ` under the trivial-action characterization, while every
  continuous homomorphism `ℤ_p → ℤ` is zero, so `H¹(ℤ_p, ℤ) = 0`. Both computations hold for
  abstract homomorphisms as well: a map `ℤ_p → ℤ/pᵏ` kills `pᵏ ℤ_p`, and a map `ℤ_p → ℤ` is zero
  because every element of `ℤ_p` is divisible by every power of a prime `q ≠ p`. Continuity matters
  for discrete `ℚ`: the continuous homomorphisms `ℤ_p → ℚ` are zero, since their images are finite,
  so `H¹(ℤ_p, ℚ) = 0`, while the abstract homomorphisms form a `ℚ`-vector space isomorphic to the
  `ℚ`-linear dual of `ℚ_p`, which is nonzero.
- **`Hⁱ(Ẑ, -)` and `cd_p Ẑ = 1`** (Layers 4, 6, 10, 11; NSW (1.7.7) and the worked example at NSW
  III p. 173; Serre, *Local Fields* XIII §1 Props. 1-2): `H¹(Ẑ, ℤ/n) ≅ ℤ/n`, `H²(Ẑ, M) = 0` for
  torsion or divisible `M`, and, through the long exact sequence of `0 → ℤ → ℚ → ℚ/ℤ → 0` together
  with Layer 10's torsion corollary killing `Hⁱ(Ẑ, ℚ)`, `H²(Ẑ, ℤ) ≅ ℚ/ℤ`. The group is Tau Ceti's
  `TauCeti.zHat`, the profinite completion of `ℤ`, or a group given with an isomorphism of
  topological groups to it; do not hardcode a product over primes. Tau Ceti already proves the
  first three facts on that carrier (`TauCeti/Topology/Algebra/Group/Profinite/ZHat/CohomologicalDimension.lean`):
  `TauCeti.zHat.h1EquivZMod`, the vanishing of the canonical `H²(Ẑ, M)` for discrete torsion `M`
  (`TauCeti.zHat.subsingleton_continuousCohomology_two_of_isAddTorsion`), and
  `TauCeti.zHat.cohomologicalDimensionAt_eq_one`; `H²(Ẑ, ℤ) ≅ ℚ/ℤ` is the part built here. The
  computations do not hold for an arbitrary procyclic group: `H²(C_p, 𝔽_p) = 𝔽_p` and
  `cd_p C_p = ∞` for the finite cyclic group `C_p`, and for distinct primes `p ≠ q` the infinite
  procyclic `ℤ_q` has `H¹(ℤ_q, ℤ/p) = 0`, not `ℤ/p`. A procyclic generalization needs its own
  hypotheses on the prime, the coefficients and the order of the group.
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
  `H²(C₂, 𝔽₂)`. In Galois form: for
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
- **The index-2 Evens anchor** (Layer 13): for `G = C₄ ⊇ U = C₂` and `α ≠ 0`, `N_Ev(α)`
  restricts to the nontrivial class on `U`, so `N_Ev(α) ≠ 0` in `H²(C₄, 𝔽₂) ≅ 𝔽₂`. Read off the
  extension: a class in `H²(C₄, 𝔽₂)` with trivial coefficients classifies a **central** extension
  `1 → C₂ → E → C₄ → 1`, and a central extension whose quotient is cyclic is abelian, so `E` is
  `C₈` or `C₂ × C₄` and no nonabelian group of order 8 can occur. The nonzero class is `C₈`: a
  lift of a generator of `C₄` has fourth power equal to the generator of the kernel, hence order
  8. This computation is the convention anchor for the graph cocycle.
- **The `D₁₆` anchor** (Layer 13): on `C₂ ≀ C₂` with the base group `U₀`, `s = (0, 0, 1)` and the
  tautological character, `ν_taut = c_D₁₆ + δ 1[u, uv, s, vs]` as cochains, where `c_D₁₆` is
  the factor set of the section `(us)^i s^j ↦ r^i f^j` of `D₁₆ → C₂ ≀ C₂`. Tau Ceti proves
  this, the cocycle identity of `c_D₁₆`, the kernel `{1, r⁴}` and the section property by
  computation (`TauCeti.ContCohomology.evensGraphCochain_wreath`, `TauCeti.wreathD16Cocycle_isCocycle`,
  `TauCeti.dihedralToWreath_eq_one_iff`, `TauCeti.dihedralToWreath_wreathSection`). It fixes the index-two norm
  against a standard extension: with `SD₁₆` or `Q₁₆` in place of `D₁₆` the identity has no
  coboundary witness.
- **Identity 5 on cochains** (Layer 13): for `y` a homomorphism on `G`, both Shapiro components of
  `y|_U` are `b = y + y(s) · χ_U`, and the graph cochain is `b ⌣ b + χ_U ⌣ b`;
  Tau Ceti proves it as `TauCeti.ContCohomology.evensGraphCochain_comp_subtype`. The false neighbor
  `N(res y) = y ⌣ y` already fails at `y = χ_U` on `C₂ ≀ C₂`: there `res χ_U = 0`, while
  `χ_U ⌣ χ_U ≠ 0`.
- **The duality-pairing shapes** (Layers 0, 8): for finite discrete `M` and `n`-torsion
  coefficients, the three evaluation cup pairings
  `Hⁱ(G, Hom(M, μ)) × H²⁻ⁱ(G, M) → H²(G, μ)`, `i = 0, 1, 2`, exist with their biadditivity and
  naturality, as instances of the six-shape API. No perfectness statement is made here.

---

## Downstream consumers

ClassFieldTheory, Layer 6 (the local class formation and finite local reciprocity), consumes the strict criterion and
Layers 9–12; its arithmetic dimensions and local duality remain there. Completed/LocalGaloisGroups,
“Exact supplier contracts” and Layer 7 Step 3 (the class module), consumes Layer 11 for absolute Galois groups. Completed/ProfiniteProPGroups,
Layers 5–7, consumes the five-term sequence, dimension theory and cup pairing for presentations,
free pro-p groups and Demushkin groups. QuadraticFormInvariants, Layer 9 (transfer and the relative Stiefel–Whitney formula), consumes
Layer 13's index-two norm and Galois transport and owns their Stiefel–Whitney application.
No arrow in these consumer contracts is an input to the present roadmap.

## References

Locators refer to the editions listed.

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
  (1963), 54-65: §§2-5 the monomial and wreath-product norm; §6 Prop. 1 (transitivity), Prop. 2
  (the double-coset rule, pp. 61-62), Prop. 3 (naturality under a homomorphism preserving the
  index), Prop. 4 (multiplicativity); Thm. 1 (p. 63), for `(G : H) = l` and `χ ∈ H^{2r}(H, k)` with `k` a
  commutative `G`-ring, `𝒩(1 + χ) = 1 + tr(χ) + ⋯ + 𝒩(χ)`, whose lowest terms are `1` and the
  ordinary transfer.
- A. Kozlowski, "The Evens-Kahn formula for the total Stiefel-Whitney class", Proc. AMS 91 (1984),
  309-313: Thm. 1.1 (p. 309, the transfer on the total-class group commuting with `w`), §2
  (pp. 310–311, the characteristic-two norm `H^i → H^{ni}` for `n`-fold coverings and its
  multiplicativity), and Lemma 2.4 (p. 311), which computes the multiplicative transfers only for
  the double cover `EΣ₂ × X → BΣ₂ × X`, in terms of Steenrod squares (for `x` of degree one,
  `N(x) = x² + t x`); it is not a statement of the general index-two identities of Layer 13.1.
- B. Kahn, "Classes de Stiefel-Whitney de formes quadratiques et de représentations galoisiennes
  réelles", Invent. Math. 78 (1984): th. I.4.2 (p. 239), the total Stiefel-Whitney class of a
  representation induced from a subgroup of index two through the norm,
  `w(Ind ρ) = ∑_j N(w^{(j)}(ρ)) · d^j`, whose rank-one case (formula (6′), pp. 239–240) is
  `w(Ind α) = N(1 + α) + d`, with `d` the character of `G/H`. Evens' expansion gives
  `w₁(Ind α) = cor α + d` and `w₂(Ind α) = N_Ev(α)`; and Remarque II.2.3 (pp. 242–243), the warning that the field-theoretic formula of
  Kahn's Theorem 1 does not hold for an arbitrary group, with the dihedral group of order `8` and
  a character of its Klein four-subgroup as the counterexample, which is why Layer 13.1 takes its
  pullback formula from a direct cocycle computation and not from that theorem. The rank-one
  reading, and the relative Stiefel-Whitney identity that consumes Layer 13, are owned by
  `../QuadraticFormInvariants/`.
- H. Koch, *Galois Theory of p-Extensions*, Springer (2002), Ch. 3 "Cohomology of Profinite
  Groups", built directly on continuous **inhomogeneous** cochains (§3.1, the textbook model of
  Layer 2): Thm. 3.9 (Shapiro), Thm. 3.10 (`cor ∘ res = (G : H)`), Thm. 3.14
  (inflation-restriction-transgression in degree `n`), Thm. 3.16 (inductive limits), §3.9 (cup
  products); Ch. 5 (cd of pro-`p` groups through `Hⁿ(G, 𝔽_p)`, Def. 5.1) and Ch. 6 (generator and
  relation ranks through `H¹` and `H²`), which is the `../../Completed/ProfiniteProPGroups/` interface.
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed. (2006), Ch. I §0: the continuous-cochain
  conventions (p. 2), cup-product properties (0.1.1)-(0.1.6), Remark 0.11 (Shapiro for `M_*`),
  Remark 0.10 (`Ext` colimits), Prop. 0.15 (conjugation acts trivially), the reference point for
  the duality-pairing shapes.
- K. S. Brown, *Cohomology of Groups*, Springer GTM 87 (1982), discrete background: Ch. III §9
  (the transfer, five constructions), III §10 ((10.1) annihilation by the index), Ch. V §3 (cup
  products; (3.5) associativity at the cochain level, (3.6) commutativity, (3.8) the transfer
  formula `cor (res u ⌣ v) = u ⌣ cor v`).
