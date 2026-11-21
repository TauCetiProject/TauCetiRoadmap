<!--tauceti-status:v1 {"roadmap":"AmenableTracesOnCStarAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"trace kernel, unitization and ideal extensions, GNS data, matrix trace and 2-norm, finite-dimensional approximation, norming sets (sections 1.2-1.7)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"a608ca2e324214b44690ef366adca2a60f7429019b3c3bb0c6bc98b06bb36cc7","roadmap":"AmenableTracesOnCStarAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AmenableTracesOnCStarAlgebras

This file documents the status of the AmenableTracesOnCStarAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening section of Layer 1 is in place: tracial states and the tracial state space `T(A)`, with their basic characterizations and functoriality. The rest of Layer 1 (trace kernel, extensions, GNS data, matrix 2-norm, finite-dimensional approximation) and every later layer, through Connes–Kirchberg and the AF-embedding results, have not begun.

### Named results

- **The polarization criterion for traciality** — a positive functional is a tracial state exactly when it has norm one and `τ(a*a) = τ(aa*)` for every `a`; [`isTracialState_iff_map_star_mul_self`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#PositiveContinuousLinearMap.isTracialState_iff_map_star_mul_self).
- **The unitary criterion** — on a unital C*-algebra a positive functional with `τ(1) = 1` is tracial exactly when it is invariant under every inner automorphism `a ↦ uau*`; [`isTracialState_iff_map_unitary_conj`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#PositiveContinuousLinearMap.isTracialState_iff_map_unitary_conj).
- **Weak-* compactness of the tracial state space** — for unital `A`, `T(A)` is a weak-* compact convex set, inherited from the KMS theory; [`isCompact_tracialStates`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#TauCeti.isCompact_tracialStates).
- **Pullback of tracial states** — composing with a unital star homomorphism, or with any surjective one, maps `T(B)` into `T(A)`, so tracial states restrict to unital C*-subalgebras; [`IsTracialState.comp`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#PositiveContinuousLinearMap.IsTracialState.comp).
- **No trace in the presence of two complementary isometries** — a unital C*-algebra with isometries `s, t` satisfying `ss* + tt* = 1` has no tracial state, the standard reason `B(ℓ²)` has none; [`not_isTracialState_of_mul_star_add_mul_star_eq_one`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#PositiveContinuousLinearMap.not_isTracialState_of_mul_star_add_mul_star_eq_one).

### Notable definitions and infrastructure

- **Tracial states as `0`-KMS states** — [`IsTracialState`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#PositiveContinuousLinearMap.IsTracialState) is defined as the `0`-KMS condition for the trivial dynamics, on unital and nonunital algebras alike, and [`tracialStates_eq_kmsStates`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#TauCeti.tracialStates_eq_kmsStates) identifies `T(A)` with the KMS state space at every inverse temperature. This is what lets convexity, closure and compactness of `T(A)` come from the existing KMS library rather than be reproved.
- **The tracial state space** — [`tracialStates`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Tracial.html#TauCeti.tracialStates) is `T(A)` as a subset of the weak-* dual, which equals the whole state space on commutative algebras; it is the ambient set inside which Layer 3's amenable, quasidiagonal and uniform amenable traces will live.

### Roadmap coverage

Layer 1 is partial: §1.1 is done, including the polarization and unitary criteria, unital pullback and the norm-one facts, while §1.2–§1.7 (trace kernel and faithfulness, unitization and ideal extensions, the GNS von Neumann algebra and its vector trace, the normalized matrix trace and 2-norm, finite-dimensional trace approximation, norming sets of states) are untouched. Layers 2–8 are untouched: no completely positive matrix toolkit, no definitions of amenable, quasidiagonal or uniform amenable traces, and none of the end theorems.

## The frontier

- **The trace kernel and faithfulness (§1.2)** — prove that `N_τ = {a : τ(a*a) = 0}` is a closed two-sided ideal equal to `ker π_τ`, define `IsFaithfulTrace`, and show tracial states of simple algebras are faithful; for unital `A` the ideal is Tau Ceti's algebraic trace radical, so much of the algebra is already supplied.
- **The normalized matrix trace and 2-norm (§1.5)** — `tr_k` and `‖·‖₂` on `M_k` with the operator-norm comparisons; this needs only §1.1 and the Frobenius inner product, and it is the norm in which Layer 3's definitions are stated.
- **Unitization and ideal extension (§1.3)** — the unique tracial extension to `Ã` and from a closed ideal along an approximate unit, which the nonunital GNS data of §1.4 depend on.
- **The GNS data of a tracial state (§1.4)** — the GNS von Neumann algebra with its faithful normal vector trace, the right representation and `J`; this leans on the standard-form layer of VonNeumannAlgebras.
- **Layer 3's definitions** — amenable, quasidiagonal and uniform amenable traces can be stated once §1.2 and §1.5 exist, but their nontrivial properties wait on the Layer 2 toolkit of completely positive contractions into matrices.
