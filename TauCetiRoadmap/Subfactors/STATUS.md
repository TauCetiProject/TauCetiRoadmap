<!--tauceti-status:v1 {"roadmap":"Subfactors","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"the Catalan bound of 3.2; ker of the path model, the matrix decomposition and the C*-tower of 3.3; the tower action and index restriction of 3.4-3.5","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"397eda2ec1fbb757c06d6995b4533fb32e507c2ba404b963dbe9fd02237fd410","roadmap":"Subfactors","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: Subfactors

This file documents the status of the Subfactors roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Jones's positivity theorem for the Temperley–Lieb trace is proved, along with its first-bad-level refinement and the pullback criterion that the index restriction will consume. So sections 3.1 and 3.2 of Layer 3 are essentially done. The C*-tower of 3.3 is only partly built, and nothing that needs von Neumann algebras has begun: the Jones tower, the index restriction itself, commuting squares, planar algebras and the classification results.

### Named results

- **Jones's positivity theorem** — for δ > 0, the forms tr_n(x†y) of the Markov trace are positive semidefinite on every number of strands exactly when δ = 2cos(π/m) with m ≥ 3 or δ ≥ 2 ([`forall_map_star_mul_self_nonneg_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Positivity.html#TauCeti.TemperleyLieb.IsMarkovTrace.forall_map_star_mul_self_nonneg_iff); the roadmap's spin-model statement is [`markovTrace_nonneg_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Positivity.html#TauCeti.TemperleyLieb.markovTrace_nonneg_iff)).
- **The first bad level** — at an inadmissible δ > 0, positivity holds on n strands exactly when n < ⌊π/arccos(δ/2)⌋, and the witness beyond it is a Jones–Wenzl projection of negative trace ([`forall_map_star_mul_self_nonneg_iff_lt_floor`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Positivity.html#TauCeti.TemperleyLieb.IsMarkovTrace.forall_map_star_mul_self_nonneg_iff_lt_floor)).
- **The pullback criterion** — if compatible star-maps from the Temperley–Lieb algebras into algebras with positive functionals pull those functionals back to positive multiples of the Markov trace, then δ is admissible. Injectivity is not needed. This is the algebraic core of Jones's index restriction ([`mem_jonesLoopParameters_of_pullback`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Positivity.html#TauCeti.TemperleyLieb.IsMarkovTrace.mem_jonesLoopParameters_of_pullback)).
- **Positivity from a path model** — on any finite graph whose squared vertex weights form an adjacency eigenvector with eigenvalue δ, the weighted trace on walks is a positive Markov trace. The Dynkin graph A_(m−1) with weights √[t+1] gives sufficiency at δ = 2cos(π/m) ([`map_star_mul_self_nonneg_of_graph`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/PathModel.html#TauCeti.TemperleyLieb.IsMarkovTrace.map_star_mul_self_nonneg_of_graph)).
- **Uniqueness of the Markov trace** — over every commutative semiring, at most one Markov trace exists at each loop value, so every model's trace is the closure trace ([`unique`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Trace/Basic.html#TauCeti.TemperleyLieb.IsMarkovTrace.unique)). A [truncated version up to N strands](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Trace/Basic.html#TauCeti.TemperleyLieb.IsMarkovTraceUpTo.unique) drives the below-the-bad-level argument.

### Notable definitions and infrastructure

- **The analytic adjoint** ([`instStarRing`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Star.html#TauCeti.TemperleyLieb.instStarRing)) is the unique conjugate-linear, product-reversing involution fixing the generators. It is what makes the Hermitian forms, the self-adjoint Jones–Wenzl projections and the star-preserving models possible.
- **The path representation** ([`pathRep`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/PathModel.html#TauCeti.TemperleyLieb.pathRep)) of 3.3, on walks in a weighted graph, carries the adjoint to the conjugate transpose. Its weighted [trace](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/PathModel.html#TauCeti.TemperleyLieb.pathTrace) is tracial, Markov and positive.
- **Positive Jones quotients and the finite-dimensional C*-lemma.** At admissible δ, the quotient by the trace radical carries a [faithful positive trace](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/Positivity.html#TauCeti.TemperleyLieb.IsMarkovTrace.quotientStarPositiveFunctional). Separately, a finite-dimensional star algebra with a faithful positive functional is a [C*-algebra](https://taucetiproject.org/docs/TauCeti/Analysis/StarAlgebra/GNS/FiniteDimensional.html#TauCeti.StarPositiveFunctional.cstarAlgebra) under the operator norm of left multiplication. Together they put the C*-structure on each quotient Q_n within reach.

### Roadmap coverage

Layer 3 is partial. Section 3.1 is done. Section 3.2 is done except for the dimension bound dim TL_n ≤ catalan n, which is not established here; the normal form behind it is proved. Section 3.3 is partial. The path representation, its positive trace and its identification with the closure trace are proved. For δ ≥ 2 a positive spin model stands in for the half-line graph. The quotient strand maps are injective, and at δ = √2 the quotient is identified with an even Clifford algebra of dimension 2^(m−1). The rest of 3.3 is missing: the identification ker π_n = R_n, the matrix-algebra decomposition of Q_n, the expectations and their Markov formula, and the C*-inductive limit with its GNS closure. Sections 3.4 and 3.5 are untouched. Layers 1, 2 and 4–10 are untouched.

## The frontier

- **Kernel and image of the path model (3.3)** — prove ker π_n = R_n from faithfulness of the weighted trace, and identify Q_n with the direct sum of matrix algebras over path endpoints. Everything needed is now in the library.
- **The C*-tower of Jones quotients (3.3)** — apply the C*-lemma to each Q_n, show that the strand maps are isometric, build the scaled-closure expectations, then form the inductive limit B_δ. The limit needs CStarAlgebras C5, and its weak closure needs VonNeumannAlgebras V4 and V6.
- **The Catalan dimension bound (3.2)** — derive dim TL_n ≤ catalan n from the existing normal form. This bound is also what proves injectivity at δ ≥ 2 in 3.3.
- **Jones's index restriction (3.4–3.5)** — the pullback criterion is ready. What is missing is the Temperley–Lieb action in the Jones tower, which needs Layer 2's basic construction and the Markov relation of 2.3, and through them VonNeumannAlgebras V5–V7.
- **Layers 1–2** — correspondences, Connes fusion and the basic construction still wait on the VonNeumannAlgebras supply: standard form, normality and coupling dimension.
