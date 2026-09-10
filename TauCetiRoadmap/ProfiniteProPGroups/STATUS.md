<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations have begun. Layer 0 is partial: the quotient, correspondence, limit-description and profinite-completion milestones have their main statements, while the instance chain and the compactness lemma have not landed. Layer 3 has the `IsProP` predicate with a covariant API and nothing else. Layers 1, 2 and 4 through 10 are untouched, and of the frozen exported surface only `IsProP` exists.

### Named results

- **Limit description of a profinite group** — a compatible family of elements of the finite quotients of `G` comes from a unique element of `G`, stated outside the category so that later layers can consume it ([`TauCeti.existsUnique_forall_mk_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Limit.html#TauCeti.existsUnique_forall_mk_eq)).
- **Correspondence theorem for open normal subgroups** — the open normal subgroups of `G ⧸ N` correspond, as lattices, to the open normal subgroups of `G` containing `N` ([`TauCeti.QuotientGroup.comapMk'OpenNormalOrderIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Quotient.html#TauCeti.QuotientGroup.comapMk'OpenNormalOrderIso)).
- **Universal property of the profinite completion** — continuous homomorphisms from the completion of `G` to a profinite group correspond to abstract homomorphisms from `G`, with the unit bijective when `G` is finite ([`TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Completion.html#TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv)).
- **Quotients by closed normal subgroups are totally disconnected** — the ingredient the README singles out as missing for `G ⧸ N` to be profinite, proved by the clopen-image argument ([`TauCeti.QuotientGroup.instTotallyDisconnectedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Basic.html#TauCeti.QuotientGroup.instTotallyDisconnectedSpace)).
- **Open normal subgroups separate points** — in a profinite group the intersection of the open normal subgroups is trivial ([`Subgroup.iInf_openNormalSubgroup_eq_bot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Basic.html#Subgroup.iInf_openNormalSubgroup_eq_bot)).

### Notable definitions and infrastructure

- **The pro-`p` predicate** — `IsProP` says every quotient by an open normal subgroup is a `p`-group; it is the carrier that Layer 2's Sylow predicate, the maximal pro-`p` quotient and the free pro-`p` groups will be stated against, and it already transports along continuous surjections, quotients and topological isomorphisms ([`TauCeti.IsProP`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP.html#TauCeti.IsProP)).
- **Cofinality of open normal subgroups** — a closed subgroup is the infimum of its joins with the open normal subgroups, which lets arguments over open subgroups above a closed subgroup be run over normal ones ([`Subgroup.eq_iInf_sup_openNormalSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Basic.html#Subgroup.eq_iInf_sup_openNormalSubgroup)).
- **Clopen images in quotients** — the image of an open subgroup in `G ⧸ N` is clopen, the lemma behind the totally-disconnected instance ([`TauCeti.QuotientGroup.isClopen_image_mk`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Quotient.html#TauCeti.QuotientGroup.isClopen_image_mk)).

### Roadmap coverage

- **Layer 0 (profinite foundations): partial.** Done: the totally-disconnected quotient instance, the correspondence theorem, triviality of the intersection of open normal subgroups, the limit description, and the completion's universal property with bijectivity of the unit on finite groups. Not landed: the instance chain (no declaration removes `[T2Space G]` hypotheses), the assembly of a closed subgroup as a profinite group, "open if and only if closed of finite index", and the compactness lemma for directed families of nonempty closed subsets.
- **Layer 3 (pro-`p` groups, generation): partial, barely.** The `IsProP` definition and its covariant API only. Nothing on closed subgroups, finite products, inverse limits or the limit-of-finite-`p`-groups equivalence; nothing on `proPKernel`, `maximalProPQuotient`, topological generation and rank, the Schreier bound, the Hopf property, Gaschütz lifting, Frattini theory or Burnside.
- **Layers 1, 2, 4, 5, 6, 7, 8, 9, 10: untouched.** No supernatural numbers, no Sylow theory, no free objects, no presentations or embedding problems, no cohomological dimension, no Demushkin theory, no lower `p`-series, no completed group algebras, no classification.

## The frontier

- **The rest of Layer 0** — the instance chain, "open if and only if closed of finite index", and above all the compactness lemma for directed families of nonempty closed subsets, which Layer 2 existence, the projectivity argument of Layer 5 and the comparison schema of Layer 8 all consume. No blocker; the README names the Mathlib inputs.
- **The `IsProP` API** — closed subgroups, finite products, inverse limits, and the equivalence between being pro-`p` and being a limit of finite `p`-groups; the README names `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor` as the Mathlib input. Depends only on what has landed.
- **The maximal pro-`p` quotient** — `proPKernel` and `maximalProPQuotient` with the universal property and idempotence; the Layer 0 quotient and correspondence results it needs are now available.
- **Supernatural order and index (Layer 1)** — independent of the rest, and a prerequisite for the Sylow predicate of Layer 2 and for the comparison "pro-`p` if and only if the order is supported at `p`".
- **Profinite Sylow theory (Layer 2)** — blocked on the Layer 1 index and the Layer 0 compactness lemma, neither of which exists yet.
