<!--tauceti-status:v1 {"roadmap":"CFSGStatement","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: CFSGStatement

This file documents the status of the CFSGStatement roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The index layer and the whole sporadic lane are done in Lean: all twenty-six sporadic groups have cited, count-checked finite presentations assembled into one total function. The Lie-type lane has the full recipe only for type A, plus root-datum shadows of every Steinberg map; the final assembly (`CFSGIndex.Group`, `ClassificationStatement`) has not begun.

### Named results

- **The sporadic presentation table** — every sporadic name is attached to an explicit, sourced finite presentation, and its group is Mathlib's `PresentedGroup` on the compiled relators ([`TauCeti.SporadicName.presentation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.html#TauCeti.SporadicName.presentation)).
- **The Y₄₄₃ presentation of the Monster** — twelve involutions, seventy-eight Coxeter relators, the spider relator and Ivanov's central relator, with counts and total length proved ([`TauCeti.Sporadic.Monster.presentation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Monster.html#TauCeti.Sporadic.Monster.presentation)).
- **The type-A candidates** — for validated `A_r(q)` and `²A_r(q)`, the derived subgroup of the Steinberg fixed points of an explicit type-A Chevalley carrier, modulo its centre, the Steinberg map acting on simple-root subgroups as `x_i(u) ↦ x_{γ i}(u^q)` ([`TauCeti.TypeALieIndex.Group`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/TypeA.html#TauCeti.TypeALieIndex.Group)).
- **The root-datum Steinberg map of every valid index** — `γ ∘ Frob_q` on the thirteen ordinary and graph-twisted constructors, the odd half-Frobenius power on the Suzuki, Ree and Tits ones, with the twist-order and square relations proved on the pinned root datum ([`TauCeti.ValidLieTypeIndex.datumSteinberg`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Datum/Assembly.html#TauCeti.ValidLieTypeIndex.datumSteinberg)).
- **Universe lowering for classifications** — a classification of finite simple groups by a fixed `Type`-valued family in universe zero holds in every universe ([`TauCeti.exists_mulEquiv_of_forall_finite_isSimpleGroup_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SimpleGroupUniverse.html#TauCeti.exists_mulEquiv_of_forall_finite_isSimpleGroup_zero)).

### Notable definitions and infrastructure

- **Auditable presentations** — relator expressions built from generators, inverses, products, powers, commutators, conjugates and equations compile to signed words, and the compiled word is proved to denote the expression, so review reads the readable form while the group uses the flat one ([`TauCeti.Relator.toWord_toFreeGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Presentation/Relator.html#TauCeti.Relator.toWord_toFreeGroup)); Coxeter relator lists are identified with Mathlib's Coxeter groups.
- **The classification index** — `PrimePower`, the seventeen-constructor `LieTypeIndex` with its range, duplicate and validity predicates, the graph-twisted and half-Frobenius subtypes, the twenty-six sporadic names, and the four-way `CFSGIndex`, so no invalid rank can reach a carrier ([`TauCeti.CFSGIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Index.html#TauCeti.CFSGIndex)).
- **The fixed-point recipe** — the fixed subgroup of an endomorphism, its derived subgroup modulo centre, transport along intertwining isomorphisms, and Grün's lemma that the result is centreless when the derived subgroup is perfect ([`TauCeti.FixedPointCandidate`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/FixedPointCandidate.html#TauCeti.FixedPointCandidate)).

### Roadmap coverage

- **I0 done**: indices, `dynkinType_valid`, characteristic and field order, the algebraic closure, the 26-name check, the six pinned permutations with Cartan-matrix proofs, and the Suzuki–Ree exponent and length conventions proved against the upstream long-root predicate.
- **S0 done; S1 done in Lean**: all twenty-six rows transcribed, count-checked, and assembled. Every row has letter-count and cyclic-reduction checks (the HN, Ly, Ru and Th words are cyclically reduced only after free reduction). Source read-throughs are recorded for every row except the Monster; the FiniteSimpleGroups comparison is recorded for all fourteen names it covers. Fi24' is a Reidemeister–Schreier rewrite of the Fi24':2 presentation rather than a direct transcription.
- **L0, L1, L3 partial**: complete for type A only, on an explicit type-A carrier rather than the upstream Chevalley–Demazure scheme. Generic Steinberg endomorphisms of Kostant elementary groups exist with their root-subgroup equation. No `ValidLieTypeIndex.AmbientGroup`, `steinberg` or `Group` exists; the E₈, F₄, G₂ pull request shows no declarations in the digest.
- **L2 partial**: conventions done; the odd half-Frobenius power and its square relation exist only on the root datum, not on a group.
- **L4 untouched. A0 untouched** apart from the abstract universe-lowering theorem.

## The frontier

- **Ambient groups for the remaining families (L0)** — pinned carriers with root subgroups for every family other than type A. Type A bypassed the dependency with an explicit carrier; every other family waits on the pinned Chevalley–Demazure constructions of the reductive-groups roadmap's Layer 9, or on building further explicit carriers.
- **Group-level Suzuki–Ree maps (L2)** — selecting the upstream special isogeny for a `SuzukiReeIndex` and taking its odd power on an actual group. The isogeny `τ_X` is a Layer 9 target and does not yet exist in Tau Ceti.
- **The uniform `ValidLieTypeIndex.steinberg` and `.Group` (L3)** — the type-A branch and the generic recipe are ready; the other sixteen constructors need their L0 carriers and L1 or L2 maps first.
- **Assembly (A0)** — `CFSGIndex.Group` by cases, `ClassificationStatement`, and `classificationStatement_of_zero`. The cyclic, alternating and sporadic branches have carriers and the universe step is proved abstractly, so this is blocked only on L3.
- **The Mathlib Suzuki identification (L4)** — `²B₂(2^(2m+1)) ≃* suzukiGroup m` for `m ≥ 1`; nothing has begun, and it needs the group-level Suzuki branch of L3.
