<!--tauceti-status:v1 {"roadmap":"OperatorKTheory","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
# Status: OperatorKTheory

This file documents the status of the OperatorKTheory roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The projection side of K1 is in place: the Murray–von Neumann calculus of matrix projections, their homotopy theory, and K₀ of a unital algebra. Atkinson's theorem from K4 is also proved. Nonunital K₀, the comparisons with modules and bundles, and the trace pairing are still open. Nothing has begun on K₁, Bott periodicity, KK-theory or anything later.

### Named results

- **Atkinson's theorem** — an operator between Banach spaces is Fredholm exactly when it is invertible modulo compact operators. This is the parametrix form of 4.1, in more generality than the Hilbert-space statement the roadmap asks for ([`isFredholm_iff_exists_isCompactOperator_comp_sub_one`](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/CompactPerturbation.html#TauCeti.isFredholm_iff_exists_isCompactOperator_comp_sub_one)).
- **Nearby projections are unitarily equivalent** — projections p and q of a unital C*-algebra with ‖p − q‖ < 1 are conjugate by a unitary u with ‖u − 1‖ ≤ √2‖p − q‖. That unitary [lies in the identity component](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Projection/Perturbation.html#IsStarProjection.exists_joined_one_mul_mul_star_eq_of_norm_sub_lt_one) of the unitary group ([`exists_mem_unitary_mul_mul_star_eq_of_norm_sub_lt_one`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Projection/Perturbation.html#IsStarProjection.exists_mem_unitary_mul_mul_star_eq_of_norm_sub_lt_one)).
- **Homotopy versus equivalence of projections** — projections joined by a continuous path are Murray–von Neumann equivalent, with or without a unit. Conversely, equivalent projections p and q are joined by a path of projections from p ⊕ 0 to 0 ⊕ q ([`Continuous.isMurrayVonNeumannEquivalent`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Projection/Perturbation.html#Continuous.isMurrayVonNeumannEquivalent), [`exists_path_fromBlocks`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Projection/Perturbation.html#Matrix.IsMurrayVonNeumannEquivalent.exists_path_fromBlocks)).
- **The equality criterion in K₀** — [p] − [q] = [p′] − [q′] exactly when p ⊕ q′ ⊕ r is equivalent to p′ ⊕ q ⊕ r for some projection r. Cancellation in V(A) is never assumed ([`of_mk_sub_of_mk_eq_of_mk_sub_of_mk_iff`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/ProjectionMonoid/KZero.html#TauCeti.ProjectionKZero.of_mk_sub_of_mk_eq_of_mk_sub_of_mk_iff)).
- **Rank classifies complex matrix projections** — over ℝ or ℂ, projections of any sizes are equivalent exactly when they have the same rank. This is the computation behind K₀(Mₙ(ℂ)) = ℤ, which is not yet packaged as an isomorphism ([`isMurrayVonNeumannEquivalent_iff_rank_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/MurrayVonNeumann.html#Matrix.isMurrayVonNeumannEquivalent_iff_rank_eq)).

### Notable definitions and infrastructure

- **The projection monoid and K₀** — [`ProjectionMonoid`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/ProjectionMonoid/Basic.html#TauCeti.ProjectionMonoid) is V(R), matrix projections of all sizes modulo equivalence. [`ProjectionKZero`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/ProjectionMonoid/KZero.html#TauCeti.ProjectionKZero) is its Grothendieck group, functorial for nonunital star homomorphisms. For a unital algebra it is the K₀ of 1.2. For a nonunital one it is not yet the unitization-based K₀ of 1.3.
- **Rectangular Murray–von Neumann equivalence** — [`Matrix.IsMurrayVonNeumannEquivalent`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/MurrayVonNeumann.html#Matrix.IsMurrayVonNeumannEquivalent) compares projections of different sizes through a rectangular partial isometry. This is what lets [1] = [diag(1,0)] hold without casting between matrix sizes. A second formulation exists for `CStarMatrix`.
- **Range projections of idempotents** — [`idempotentRangeProjection`](https://taucetiproject.org/docs/TauCeti/Algebra/Star/Projection/Idempotent.html#TauCeti.idempotentRangeProjection) gives, by a norm-continuous formula, the [unique projection with the same right ideal](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Idempotent.html#IsIdempotentElem.existsUnique_isStarProjection_mul_eq_right) as an idempotent. The [similarity unit](https://taucetiproject.org/docs/TauCeti/Algebra/Ring/Idempotent/Units.html#TauCeti.idempotentConjUnit) 1 + e − p conjugates the idempotent to that projection. This is the first step of the module comparison in 1.4.

### Roadmap coverage

K1 is partial:

- **1.1 and 1.2 are done.** This covers the equivalence calculus, nearby and homotopic projections, V(A), and unital K₀ with functoriality, generation by differences and both equality criteria.
- **1.3 (nonunital K₀ through the unitization) has not started.**
- **1.4 and 1.5 have one step each.** In 1.4, only the idempotent-to-projection step exists, not the isomorphism with the split Grothendieck group of projective modules. In 1.5, only [positive tracial functionals](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/TracialFunctional.html#TauCeti.PositiveTracialFunctional) are defined. The positive cone, scale, order unit and trace pairing are missing.
- **1.6 (vector bundles) is untouched.**

K4 is partial: Atkinson's theorem is proved, but its reading in the Calkin algebra and the identification of the index with the K-theoretic boundary are open, and 4.2–4.5 are untouched. K2, K3 and K5–K9 are untouched. The two Brown–Douglas–Fillmore statements in `Suggested.lean`, and the essentially normal predicate they need, are not in the library.

## The frontier

- **Nonunital K₀ (1.3)** — define K₀(A) as the kernel of K₀(A⁺) → K₀(ℂ), and prove the split decomposition K₀(A⁺) ≅ K₀(A) ⊕ ℤ and agreement with the existing group for unital A. Every later layer uses the nonunital groups.
- **K₀ of matrix algebras and compacts** — K₀(ℂ) ≅ ℤ and K₀(Mₙ(ℂ)) ≅ ℤ with [1] ↦ n follow almost directly from the rank classification. K₀(K) ≅ ℤ needs 1.3 first.
- **Order and trace pairing (1.5)** — the positive cone, scale and order unit of K₀, and the pairing τ_* built from the unnormalized matrix trace, which is natural under pullback. The tracial-functional carrier is ready.
- **Projective-module comparison (1.4)** — prove V(A) is isomorphic to the idempotent monoid using the range projection and the polar argument, then compare with `TauCeti.SplitK0`.
- **K₁ (K2.1)** — unitaries of matrix algebras modulo homotopy. The nearby-projection and unitary-path results supply the needed tools. Nothing has started here yet.
