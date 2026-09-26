<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f","ts":"2026-09-26T11:19:17+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the instance chain and directed-family compactness lemma","state":"partial"},{"id":"Layer 1","remaining":"worked supernatural orders of ℤ_p and ℤ̂","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"open-subgroup countability and profinite Gaschütz lifting","state":"partial"},{"id":"Layer 4","remaining":"the final module-rank statement for the pro-p completion of ℤ","state":"partial"},{"id":"Layer 5","remaining":"the coefficient cup pairing, extension dictionary, and H¹/H² rank interpretations","state":"partial"},{"id":"Layer 6","remaining":"the Euler formulas and open-subgroup cohomological-dimension theorems","state":"partial"},{"id":"Layer 7","remaining":"the Demushkin predicate, canonical character, and duality","state":"partial"},{"id":"Layer 8","remaining":"the relator comparison application and abstract finite-quotient corollary","state":"partial"},{"id":"Layer 9 prerequisites","remaining":"Labute's relation module and relator criteria","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"8917e380c8f99602af5f80be9fde0cb7d66cd32a4c97c758d7a48763ebf4baa0","roadmap":"ProfiniteProPGroups","to_sha":"de52a34770e6b94396f1feed7c1d5a562572096f"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `de52a34` (2026-09-26T11:19:17+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Profinite Sylow theory has its existence, conjugacy, containment and functoriality theorems. The supernatural index, free pro-`p` groups and cohomological freeness have substantial results, while the Demushkin classification and free groups on profinite spaces have not begun.

### Named results

- **Serre’s theorem, finite-rank form** — a topologically finitely generated pro-`p` group with `cd_p ≤ 1` is a finite-rank free pro-`p` group ([`TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Serre.html#TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one)).
- **Profinite Sylow theorems** — every profinite group has a pro-`p` Sylow subgroup, and any two are conjugate ([existence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Sylow/Existence.html#TauCeti.exists_isProPSylow), [conjugacy](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Sylow/Conjugacy.html#TauCeti.IsProPSylow.exists_map_conj_eq)).
- **Burnside’s basis theorem, cardinal form** — the topological generator rank of a profinite pro-`p` group equals the dimension of its continuous `𝔽_p`-dual ([`TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/DualRank.html#TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual)).
- **Finite-quotient determinacy** — a topologically finitely generated profinite group is determined up to topological isomorphism by its continuous finite quotients ([`TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/FiniteQuotients.html#TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff)).
- **Structure theorem for finitely generated abelian pro-`p` groups** — such a group is topologically a finite power of `ℤ_p` times a finite product of cyclic `p`-groups ([`TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/StructureTheorem.html#TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod)).

### Notable definitions and infrastructure

- **Supernatural index** — [the index of a subgroup](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Index/Basic.html#Subgroup.profiniteIndex) supports the profinite Lagrange formula and the prime-to-`p` Sylow criterion.
- **Free pro-`p` group** — [its universal property](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/ProP.html#TauCeti.freeProP.existsUnique_lift) supplies the finite-rank presentations and splitting arguments.
- **Completed group algebra** — [power-series coordinates](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/PowerSeries.html#TauCeti.completedGroupAlgebra.powerSeriesCoordinate) for an infinite procyclic pro-`p` group prepare the orientation-image calculations.

### Roadmap coverage

Layer 2 is done, including the `ℤ_p` model for Sylow subgroups of `ℤ̂`. Layers 0 and 1 remain partial: the profinite quotient and completion results and the main supernatural order/index laws are present, but the directed-closed-set compactness lemma, instance chain and worked supernatural orders are not established. Layers 3 and 4 have rank, Frattini, free-object and abelian structure results; Layer 3 still lacks its subgroup-countability and profinite Gaschütz milestones, and Layer 4’s final module-rank statement is not established. Layers 5 and 6 have presentations, embedding problems, projectivity, dévissage and finite-rank Serre, but lack the cup pairing and rank interpretations, and the Euler and open-subgroup theorems. Layers 7 and 8 have orientation-image and lower-series comparison groundwork; the Demushkin predicate and duality, and the relator comparison application remain. Layer 9 prerequisites have bilinear normal forms and completed algebras but no Labute relation module. Layer 9 classification and Layer 10 are untouched.

## The frontier

- **Profinite compactness** — prove the directed-family intersection lemma and finish the Layer 0 instance chain; the former is a stated input to inverse-limit arguments.
- **The coefficient cup pairing** — construct `fpPairing` and `cupFp` on the imported cohomology carrier; Layer 7’s Demushkin predicate needs this pairing.
- **Rank interpretations and cohomological formulas** — identify relation rank through `H²`, then establish the missing Euler and open-subgroup formulas; finite-rank presentations and projectivity are available.
- **Demushkin duality and comparison** — establish the predicate, canonical character and duality, then apply the lower-series comparison schema to relators; the present orientation and graded tools supply only prerequisites.
- **Labute’s relation module** — construct the abelianization of the character kernel with its completed-algebra action and prove the relator criteria before the classification normal forms.
