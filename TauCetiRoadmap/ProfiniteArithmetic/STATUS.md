<!--tauceti-status:v1 {"roadmap":"ProfiniteArithmetic","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the decomposition of the profinite integers into the product of the l-adic integers, the idempotents, the unit group and character assembly","state":"partial"},{"id":"Layer 1","remaining":"zpowHat and closedZpowers, the l-parts, and the comparison of profinite powers with l-adic powers","state":"partial"},{"id":"Layer 2","remaining":"the congruence topology and profiniteness, the actions and functoriality of 2.3, and the pro-p automorphism theorems of 2.4","state":"partial"},{"id":"Layer 3","remaining":"the Lie ring and Z_p-Lie algebra on the graded sum, finite generation of the pieces, and the degree-one basis of a free pro-p group","state":"partial"}],"readme_sha":"40b35091ae14fe4526f5a9a9af67374955e9e77cf838dc3d6738cab947c2bbc0","roadmap":"ProfiniteArithmetic","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: ProfiniteArithmetic

This file documents the status of the ProfiniteArithmetic roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer has begun and none is finished. The closed lower central series (Layer 3) is furthest along: the series, its graded pieces and the spanning theorem are in place, but the graded Lie algebra itself and the degree-one basis for free pro-`p` groups are missing. `ẑ` has its ring structure and its description as an inverse limit, but not its decomposition into `∏ ℤ_ℓ` or its units. The automorphism groups exist, but have no topology yet.

### Named results

- **Trivial intersection of the closed lower central series** — in a pro-`p` group, the terms `γ_n(G)` intersect in the trivial subgroup ([`IsProP.iInf_closedLowerCentralSeries_eq_bot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/LowerCentralSeries.html#TauCeti.IsProP.iInf_closedLowerCentralSeries_eq_bot)).
- **The spanning theorem for the closed series** — brackets of a topological generating set with `gr_n` topologically generate `gr_{n+1}`. For a finite generating set with compact `gr_n`, each element of `gr_{n+1}` is a single sum with one bracket per generator (`topologicalClosure_closure_gradedBracket_eq_top`, `exists_sum_gradedBracket_eq`).
- **`ẑ` as the inverse limit of the `ZMod n`** — a compatible family of residues comes from exactly one profinite integer ([`zHat.existsUnique_forall_toZMod_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/ZMod.html#TauCeti.zHat.existsUnique_forall_toZMod_eq)), with the matching universal property for ring homomorphisms, [`zHat.ringLift`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/ZMod.html#TauCeti.zHat.ringLift).
- **`ℤ_p`-bilinearity of the graded bracket** — in a pro-`p` group, taking `p`-adic powers commutes with the bracket in each argument, so the graded pieces are `ℤ_p`-modules and the bracket is bilinear over them ([`IsProP.gradedBracket_smul_left`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/PadicModule.html#TauCeti.IsProP.gradedBracket_smul_left)).
- **Closedness of conjugacy** — in a compact Hausdorff group, the set of conjugate pairs is closed in `G × G` ([`isClosed_isConj_pair`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Conjugacy.html#TauCeti.isClosed_isConj_pair)).

### Notable definitions and infrastructure

- **Continuous automorphisms and outer automorphisms** — [`ContinuousAut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/ContinuousAut/Basic.html#TauCeti.ContinuousAut) and [`ContinuousOut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/ContinuousAut/Basic.html#TauCeti.ContinuousOut) are groups under composition, with inner automorphisms and trivial outer group in the abelian case.
- **Topologically characteristic subgroups** — [`IsTopCharacteristic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/ContinuousAut/Characteristic.html#TauCeti.IsTopCharacteristic) is proved for the pro-`p` kernel, the pro-`p` Frattini subgroup and every term of the lower `p`-series.
- **The degree-zero identification** — [`lcsGradedPieceZeroEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/Abelianization.html#TauCeti.lcsGradedPieceZeroEquiv) is a topological isomorphism between `gr_0(G)` and Mathlib's topological abelianization.

### Roadmap coverage

**Layer 0** is partial. 0.1 and 0.2 are done: the commutative topological ring on `Additive zHat`, the reductions `toZMod`, and the inverse-limit property. In 0.3, the [`ℓ`-adic components](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ZHat/Component.html#TauCeti.zHat.component) and their agreement with the maximal pro-`ℓ` quotient are proved, but the product decomposition and the idempotents `ω_ℓ` are not. 0.4, on units and character assembly, is untouched.

**Layer 1** is partial. The universal property of `zHat.lift` already holds for targets in any universe, and its naturality and continuity lemmas carry the calculus of `x ^ᶻ a`. There is no `zpowHat`, no `closedZpowers` and no `ℓ`-parts, and the comparison with `ℤ_ℓ`-powers is missing. In 1.3, unit exponents, including [injectivity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.html#TauCeti.IsProP.padicPow_left_injective), and passage to quotients are done.

**Layer 2** is partial. 2.1 is done. 2.2 has the characteristic subgroups, the quotient coordinates and closedness of conjugacy, but no topology on `ContinuousAut`, and so no profiniteness. 2.3 is untouched. So is 2.4, although a lemma on free pro-`p` groups already realizes every generating family as the image of the basis under a continuous automorphism.

**Layer 3** is partial. 3.1 is done. In 3.2 the pieces, bracket, conjugation invariance and `ℤ_p`-bilinearity are done, but the `LieRing` and `LieAlgebra ℤ_[p]` structure on `⨁ gr_n` and the graded comparison with the lower `p`-series are missing. 3.3 has the spanning theorem in both forms but not finite generation of the pieces. In 3.4, the Heisenberg group over `ℤ_p` is now [pro-`p`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Heisenberg.html#TauCeti.HeisenbergGroup.isProP_padicInt), and `F^{ab} ≅ ℤ_p^X` gives degree zero in substance. The stated degree-zero bijection, the detecting homomorphisms and the degree-one basis are missing.

## The frontier

- **The decomposition `ẑ ≃ ∏ ℤ_ℓ` and the idempotents `ω_ℓ`** — this is what remains of 0.3, by the Chinese remainder theorem at each level. The idempotents then unlock the `ℓ`-parts of 1.2 and the units of 0.4.
- **The congruence topology on `ContinuousAut`** — the initial topology through [`mapQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/ContinuousAut/Quotient.html#TauCeti.ContinuousAut.mapQuotient) into discrete targets, then profiniteness for topologically finitely generated `G`. The actions of 2.3 and the pro-`p` theorems of 2.4 all wait on this.
- **The graded Lie algebra** — assemble `⨁ gr_n` into a `LieRing` and, for pro-`p` groups, a `LieAlgebra ℤ_[p]`. Alternation, Jacobi and bilinearity are already proved degreewise, so this is assembly work.
- **The degree-one basis of a free pro-`p` group** — build the Heisenberg detecting homomorphisms, then use them with the one-term spanning theorem to prove the `ℤ_p`-basis `[x̄_i, x̄_j]`.
- **The profinite power and its `ℓ`-adic comparison** — name `x ^ᶻ a` and `closedZpowers`, and prove `x ^ᶻ a = x ^[ℓ] (component ℓ a)` on pro-`ℓ` groups through the maximal pro-`ℓ` quotient of `ẑ`.
