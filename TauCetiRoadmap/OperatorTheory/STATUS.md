<!--tauceti-status:v1 {"roadmap":"OperatorTheory","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"}],"readme_sha":"3001b7842e6620e10c943db9d389a2e692968513a062407e9fd969cb9f185ca9","roadmap":"OperatorTheory/Majorization","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"a named spectral projector onto [c, inf) and random-matrix forms of the spectral measurability results","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"ac606964292274c6eed2df8f266b10d6518b046e29b642aee8b9b62f831f0c20","roadmap":"OperatorTheory/MatrixSpectralStatistics","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"OI-A37, the closed-unit-ball form of the tail norm","state":"partial"},{"id":"Part B","remaining":"OI-B72, injectivity of induced families on antitone sequences","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"c769dcb3789a0071faf7f2ad61e7af4d7eb3b8ad6800c40cf1af044756121570","roadmap":"OperatorTheory/OperatorIdeals","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"7600b6b99c73d1143bf498f1a7ad8b7e20bd0dcc33ecb4d8aa0e9b75cc40d58b","roadmap":"OperatorTheory/PolarDecomposition","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"e2cea1b8ee24c71694a2eaf94139f328751ac7f01bb604934a069c05b490ca79","roadmap":"OperatorTheory/PrincipalAngles","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"the difference-quotient unitary-group generator and its comparison with Stone's theorem","state":"partial"},{"id":"Part B","remaining":"Borel calculus of a normal operator, representation PVMs, the bounded spectral theorem, multiplication models","state":"partial"},{"id":"Part C","remaining":"domain relations, pullbacks, graph norms and cores, compact normal decomposition","state":"partial"},{"id":"Part D","remaining":"norm bound iff spectrum in an interval, and the C* spectral-gap inverse","state":"partial"},{"id":"Part E","state":"untouched"}],"readme_sha":"0b5b1896d40129b351afcfcb4f96627c2b01ecfaf8601c07eb5831b9598f03ee","roadmap":"OperatorTheory/SelfAdjointSpectralTheory","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"exponential decay as little-o of powers and Cauchy-kernel Poisson summation as standalone lemmas","state":"partial"},{"id":"Part B","remaining":"coercive invertibility, the domain-aware pi/2 bound, Rosenblum's theorem, the bounded/partial bridge","state":"partial"},{"id":"Part C","remaining":"pairwise pi/2 sin-theta, matrix sin 2-theta and tan-theta, the pi/4 angle bound","state":"partial"},{"id":"Part D","remaining":"Frobenius sin-theta form for corresponding eigenblocks, dilation transfer and pairwise-gap bound, left singular vectors","state":"partial"}],"readme_sha":"cfe7c0bbbb51be4ed807a773c6956a3a492417d79c41bc9d80181f8e20065b7d","roadmap":"OperatorTheory/SpectralSubspacePerturbation","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: OperatorTheory

This file documents the status of the OperatorTheory roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Polar decomposition, majorization and principal angles are finished. Operator ideals each lack one small statement, and matrix spectral statistics lacks two. Spectral-subspace perturbation has the sharp `π/2` Sylvester bound but not its `sin Θ` consequence or Rosenblum's theorem. Self-adjoint spectral theory has abstract projection-valued measures and their integral but no spectral theorem, and its unbounded spectral measure has not begun.

### Named results

- **Polar decomposition for bounded operators** — every bounded operator between complete Hilbert spaces factors as `T = U|T|`, where `U` is the unique partial isometry vanishing on `ker T`, with no dimension restriction: [`ContinuousLinearMap.polarFactor_comp_modulus`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Polar/Bounded.html#ContinuousLinearMap.polarFactor_comp_modulus).
- **The Bhatia–Davis–McIntosh `π/2` bound** — if the spectra of symmetric `A` and `B` are `δ` apart, then `δ·N(X) ≤ (π/2)·N(AX − XB)` in every unitarily invariant norm. It is proved in finite dimension: [`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Pairwise.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply).
- **The Davis–Kahan `sin Θ` theorem** — under an interval–exterior gap `g`, `g · N(P_{V⊥} P_U) ≤ N(B − A)` in every unitarily invariant norm, in finite dimension with constant one: [`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub). Projector-difference and singular-subspace forms are also proved.
- **Fan dominance** — if every Ky Fan sum of `A` is at most the matching sum of `C`, then `N(A) ≤ N(C)` for every unitarily invariant norm, for finite-dimensional rectangular maps: [`TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/FanDominance.html#TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le).
- **The Kato–Rellich theorem** — a symmetric perturbation that is relatively bounded with bound below one preserves self-adjointness: [`IsSelfAdjoint.add_of_isRelativelyBounded`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.html#IsSelfAdjoint.add_of_isRelativelyBounded).

### Notable definitions and infrastructure

- **Projection-valued measures and their integral** — a [`TauCeti.ProjValMeasure`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.html#TauCeti.ProjValMeasure) integrates bounded Borel functions by a [unital ⋆-homomorphism](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Integral.html#TauCeti.ProjValMeasure.integral) that satisfies dominated convergence. This is the target that the bounded and unbounded spectral theorems must produce.
- **Schatten classes as operator-ideal families** — the families induced by symmetric gauges are all Ky Fan dominant. The [trace class](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/TraceClass.html#TauCeti.OperatorIdealFamily.traceClass) and [Hilbert–Schmidt](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/HilbertSchmidt.html#TauCeti.OperatorIdealFamily.hilbertSchmidt) families sit at `p = 1, 2` and the operator norm at `∞`, all built on [approximation numbers](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.html#ContinuousLinearMap.singularValue).
- **The Haagerup–Zsidó kernel** — its [exact `π/2` mass](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/HaagerupZsido/Mass.html#TauCeti.HaagerupZsido.integral_norm_reciprocalKernel) is where the sharp constant in the Sylvester bound comes from.

### Roadmap coverage

**Done:** Polar decomposition A–C; Majorization A–B; Principal angles A–C; Matrix spectral statistics A and C; Operator ideals C.

**Partial:**
- Operator ideals A lacks only the closed-unit-ball form of the tail norm, a one-line consequence of a Mathlib lemma.
- Operator ideals B lacks only injectivity of induced families on antitone sequences.
- Matrix spectral statistics B lacks a named projector onto `[c, ∞)` and the random-matrix forms of two measurability results.
- Spectral-subspace perturbation:
  - Part A lacks two auxiliary Fourier lemmas that the proof went around.
  - Part B lacks coercive invertibility, the domain-aware `π/2` bound, Rosenblum's theorem and the bounded/partial bridge.
  - Part C lacks the pairwise `π/2` `sin Θ`, matrix `sin 2Θ` and `tan Θ` theorems.
  - Part D has the eigenvector and right-singular-vector Yu–Wang–Samworth overlap bounds, but not the `‖sin Θ‖_F` form, the dilation transfer or the left-singular half.
- Self-adjoint spectral theory:
  - Part A lacks the difference-quotient generator and its comparison with Stone's theorem.
  - Part B has abstract PVMs and their integral, but no Borel calculus of an operator, representation PVMs or bounded spectral theorem.
  - Part C lacks domain relations, pullbacks, graph norms and cores.
  - Part D lacks two C⋆ spectral-interval lemmas.

**Untouched:** Self-adjoint spectral theory E.

Toeplitz operators, which the plan does not track layer by layer, now has the symbol-norm identity, compact Hankel operators for continuous symbols and compact semicommutators.

## The frontier

- **The pairwise `π/2` `sin Θ` theorem** — the Sylvester bound it needs has landed, so this should be a short application. The dilation pairwise-gap bound in Part D waits on it.
- **The bounded spectral theorem** — attach a PVM to a bounded normal operator, through representation PVMs on compact spaces, and define its Borel calculus. Every PVM-level tool this needs is now in place. All of Part E waits on this.
- **Rosenblum's theorem** — the domain-aware Sylvester equation and spectral separation now exist as vocabulary. What remains is the solvability argument and the bounded/partial uniqueness bridge.
- **The Yu–Wang–Samworth `‖sin Θ‖_F` form** — it needs the identity relating the Frobenius sine to the cross-block overlap, which turns the existing overlap bounds into the stated theorem.
- **Matrix `sin 2Θ` and `tan Θ`** — only per-vector double-angle bounds and tangent vocabulary exist.
