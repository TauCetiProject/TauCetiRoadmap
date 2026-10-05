<!--tauceti-status:v1 {"roadmap":"ProfiniteArithmetic","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the unit-exponent identity closedZpowers (x ^[l] u) = closedZpowers x","state":"partial"},{"id":"Layer 2","remaining":"the pro-p automorphism theorem of 2.4, the action on closed subgroups up to conjugacy, and the outer action of an extension","state":"partial"},{"id":"Layer 3","remaining":"LieRing and LieAlgebra Z_p on the graded sum, the graded map to the lower p-series, and finite generation of the pieces","state":"partial"}],"readme_sha":"40b35091ae14fe4526f5a9a9af67374955e9e77cf838dc3d6738cab947c2bbc0","roadmap":"ProfiniteArithmetic","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: ProfiniteArithmetic

This file documents the status of the ProfiniteArithmetic roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the ring `ẑ` with its decomposition and units, is done, and Layer 1 is done apart from one unit-exponent identity. In Layers 2 and 3 the hardest named targets are in: the profinite congruence topology, the finite Frattini theorem and the degree-one basis of a free pro-`p` group. What remains there is the pro-`p` automorphism theorem, two actions, and the assembly of the graded pieces into a Lie algebra.

### Named results

- **The degree-one basis of a free pro-`p` group** — for the free pro-`p` group on finitely many generators, the brackets `[x̄_i, x̄_j]`, `i < j`, form a `ℤ_p`-basis of `gr_1` of the closed lower central series ([`lcsGradedPiece_one_freeProP_bijective`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/LowerCentralSeries.html#TauCeti.lcsGradedPiece_one_freeProP_bijective)). The generators likewise form a [basis of `gr_0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/LowerCentralSeries.html#TauCeti.lcsGradedPiece_zero_freeProP_bijective).
- **The product decomposition of `ẑ`** — the `ℓ`-adic components give an isomorphism of topological rings `ẑ ≃ ∏_ℓ ℤ_ℓ` ([`zHat.ringEquivPiPadicInt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.html#TauCeti.zHat.ringEquivPiPadicInt)), and on units `ẑˣ ≃ ∏_ℓ ℤ_ℓˣ` ([`zHat.unitsEquivPiPadicInt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Units.html#TauCeti.zHat.unitsEquivPiPadicInt)).
- **The `ℓ`-adic comparison of powers** — on a pro-`ℓ` group, raising to a profinite integer `a` is raising to its `ℓ`-adic component ([`zpowHat_eq_padicPow_component`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Pow.html#TauCeti.zpowHat_eq_padicPow_component)).
- **The finite Frattini theorem** — the automorphisms of a finite `p`-group that act trivially on its Frattini quotient form a `p`-group ([`IsPGroup.isPGroup_ker_mapQuotient_frattini`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Frattini.html#IsPGroup.isPGroup_ker_mapQuotient_frattini)). In the free pro-`p` case, every automorphism of the Frattini quotient [lifts](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.html#TauCeti.freeProP.mapQuotient_proPFrattini_surjective).
- **Trivial intersection of the closed lower central series** — in a pro-`p` group the terms `γ_n(G)` intersect in the trivial subgroup ([`IsProP.iInf_closedLowerCentralSeries_eq_bot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/LowerCentralSeries.html#TauCeti.IsProP.iInf_closedLowerCentralSeries_eq_bot)).

### Notable definitions and infrastructure

- **The profinite power** — [`zpowHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Pow.html#TauCeti.zpowHat), `x ^ᶻ a`, is defined for a profinite group in any universe. It is natural, jointly continuous and multiplicative against the ring product of `ẑ`. With the idempotents [`ω_ℓ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.html#TauCeti.zHat.idem) it splits an element of a [closed procyclic subgroup](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Subgroup.html#TauCeti.closedZpowers) into its `ℓ`-parts.
- **The congruence topology on `ContinuousAut`** — for a topologically finitely generated profinite group it is [compact](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/ContinuousAut/Profinite.html#TauCeti.ContinuousAut.compactSpace), Hausdorff and totally disconnected. The inner automorphisms are closed, so `ContinuousOut` is profinite too. This is the setting the pro-`p` automorphism theorem needs.
- **Assembly of characters** — [`zHat.unitsLift`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Units.html#TauCeti.zHat.unitsLift) glues compatible characters into `(ZMod n)ˣ` into one continuous character into `ẑˣ`. This is the form a cyclotomic character takes.

### Roadmap coverage

**Layer 0** is done: the ring, the inverse-limit property, the components, `ẑ ≃ ∏ ℤ_ℓ`, the idempotents with their reductions, the unit criterion and character assembly. **Layer 1** is partial only by a hair. The power `x ^ᶻ a`, closed procyclic subgroups, `ℓ`-parts and the `ℓ`-adic comparison are proved. The unit-exponent identity `closedZpowers (x ^[ℓ] u) = closedZpowers x` was not found. **Layer 2** is partial. 2.1 and 2.2 are done, including profiniteness and closedness of the conjugacy conditions. 2.3 has the conjugacy-class actions and functoriality along characteristic quotients, but not the action on closed subgroups up to conjugacy or the outer action of an extension. 2.4 has the finite theorem and the free case, but not the pro-`p` theorem. **Layer 3** is partial. 3.1 and 3.4 are done. In 3.2, the `LieRing` and `LieAlgebra ℤ_[p]` structures on `⨁ gr_n` and the graded comparison with the lower `p`-series are missing. 3.3 lacks finite generation of the pieces.

## The frontier

- **The `ℓ`-unit identity for closed procyclic subgroups** — prove `closedZpowers (x ^[ℓ] u) = closedZpowers x` for `u ∈ ℤ_ℓˣ`, which closes Layer 1.
- **The pro-`p` automorphism theorem** — for topologically finitely generated pro-`p` `G`, the kernel to `MulAut (G ⧸ proPFrattini p G)` is open and pro-`p`. The finite theorem and profiniteness of `ContinuousAut G` are both in place.
- **The graded Lie algebra** — assemble `⨁ gr_n` into a `LieRing` and, for pro-`p` groups, a `LieAlgebra ℤ_[p]`. Alternation, Jacobi and `ℤ_p`-bilinearity are already proved degreewise.
- **The remaining actions of 2.3** — the action of `ContinuousOut G` on closed subgroups up to conjugacy, and the outer action `E ⧸ N →* ContinuousOut N` of an extension with its continuity.
- **Finite generation of the graded pieces** — each `gr_n` of a topologically finitely generated pro-`p` group is a finitely generated `ℤ_p`-module, by induction from the one-term spanning theorem. The graded map to the lower `p`-series is the other missing piece of 3.2.
