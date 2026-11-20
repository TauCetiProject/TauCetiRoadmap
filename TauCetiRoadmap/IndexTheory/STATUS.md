<!--tauceti-status:v1 {"roadmap":"IndexTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"I1.1 normal form and transverse subspaces, I1.3 compatibility conditions, I1.4 Calkin quotient, the unitary logarithm, and the image of the index","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"6d6328ad701d5bb0381a70b127d692b20848a43ec7c45f23ce6a4ee5a47853d4","roadmap":"IndexTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: IndexTheory

This file documents the status of the IndexTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two of Layer 1's Hilbert-space connectors are proved: the norm-path classification of Fredholm maps by their index, and the snake sequence with additivity of the index. The rest of Layer 1 is open. Nothing has begun on Layers 2–8, the symbol classes, the two index maps and the theorem `ind_a = ind_t` with its applications.

### Named results

- **Norm-path classification of Fredholm maps** — two Fredholm operators between complete complex inner-product spaces are joined by a norm-continuous path of Fredholm operators exactly when their indices agree. The spaces may differ and need not be separable. This is Freed's display (3.13) and the I1.6 milestone `normPath_iff_index_eq` ([`nonempty_path_iff_index_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/PathConnected.html#ContinuousLinearMap.nonempty_path_iff_index_eq), with the path itself in [`exists_path_of_index_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/PathConnected.html#ContinuousLinearMap.IsFredholm.exists_path_of_index_eq)).
- **Additivity of the index on short exact sequences** — for a map of short exact sequences of complete spaces, if two vertical maps are Fredholm then so is the third, and the middle index is the sum of the outer ones ([`index_eq_add_of_exact`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/Snake.html#ContinuousLinearMap.IsFredholm.index_eq_add_of_exact); the two-out-of-three statements include [`isFredholm₂_of_exact`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/Snake.html#ContinuousLinearMap.IsFredholm.isFredholm₂_of_exact)).
- **Path connectedness of `GL(H)`** — every invertible operator on a complex Hilbert space is joined to the identity through invertible operators ([`exists_path_to_id`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitaryPath.html#ContinuousLinearMap.IsInvertible.exists_path_to_id)). The unitary group is handled first ([`Unitary.joined_one`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitaryPath.html#Unitary.joined_one)) by a reflection argument, and then the polar decomposition finishes the proof.

### Notable definitions and infrastructure

- **The snake connecting map for modules** — [`Function.Exact.snakeδ`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/SnakeLemma.html#Function.Exact.snakeδ), the map `ker i₃ → coker i₁`, with exactness of the full six-term kernel/cokernel sequence and a proof that it agrees with Mathlib's `SnakeLemma.δ'`. It gives the finite-dimensionality transfers that drive two-out-of-three, and the module-level [index additivity](https://taucetiproject.org/docs/TauCeti/Algebra/Module/SnakeLemma.html#LinearMap.index_eq_add_of_exact).
- **Compact perturbation to an invertible** — an index-zero Fredholm operator becomes invertible after subtracting a compact operator ([`exists_isInvertible_sub_isCompactOperator_of_index_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/CompactPerturbation.html#ContinuousLinearMap.IsFredholm.exists_isInvertible_sub_isCompactOperator_of_index_eq_zero)). This is the step that reduces the path classification to `GL(H)`.

### Roadmap coverage

Layer 1 is partial. I1.2 (snake sequences) is proved for complete normed spaces with algebraically exact rows. The roadmap's statements about split Hilbert sequences and independence of the splitting are not stated separately. I1.6 has its main milestone, the path classification, but neither the image of the index (every integer, for infinite-dimensional spaces of equal Hilbert dimension) nor the criterion for the Fredholm locus to be nonempty. I1.5 has path connectedness of `GL(H)`, but not the unitary logarithm `U = exp(iA)` with `‖A‖ ≤ π`, since the reflection proof avoids it. For I1.1 (orthogonal package comparison, triangular normal form, transverse-subspace lemma), I1.3 (compatibility functionals and the index-zero alternative) and I1.4 (the Calkin quotient), I found nothing matching the README's milestones in the library. Layers 2–8 are untouched.

## The frontier

- **Image of the Fredholm index (I1.6)** — show that every integer is the index of a Fredholm map between unitarily equivalent infinite-dimensional spaces, using shifts on a countable orthogonal summand, and that the locus is nonempty exactly in the finite or equal-Hilbert-dimension cases. The second part needs BanachSpaceTheory B5's Hilbert dimension.
- **Unitary logarithm (I1.5)** — every unitary is `exp(iA)` with `A` self-adjoint and `‖A‖ ≤ π`, through the bounded Borel argument function. This depends on SelfAdjointSpectralTheory Part B.
- **Triangular normal form and transverse subspaces (I1.1)** — the norm-continuous reduction of a nearby `T` to `diag(A, D − C₁A⁻¹B)`, and the transverse-subspace lemma with its three dimension relations. OperatorKTheory K4.1's rectangular Atkinson theorem is a stated prerequisite.
- **Compatibility conditions (I1.3)** — `range T` as the common zero set of `dim coker T` functionals from `ker T*`, the minimality bound, and the separable-kernel integral equations.
- **Analytic index on `K_c(T*M)` (Layer 2)** — the first step past Layer 1. It needs PseudodifferentialOperators P1–P7 and TopologicalKTheory's compactly supported K-theory.
