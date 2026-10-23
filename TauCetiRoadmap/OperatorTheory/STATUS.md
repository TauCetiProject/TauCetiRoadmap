<!--tauceti-status:v1 {"roadmap":"OperatorTheory","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"}],"readme_sha":"3001b7842e6620e10c943db9d389a2e692968513a062407e9fd969cb9f185ca9","roadmap":"OperatorTheory/Majorization","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"a named spectral projection onto [c, inf) and random-matrix forms of the spectral measurability results","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"ac606964292274c6eed2df8f266b10d6518b046e29b642aee8b9b62f831f0c20","roadmap":"OperatorTheory/MatrixSpectralStatistics","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"modulus invariance of approximation numbers for bounded maps; closed-ball form of the tail norm","state":"partial"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"c769dcb3789a0071faf7f2ad61e7af4d7eb3b8ad6800c40cf1af044756121570","roadmap":"OperatorTheory/OperatorIdeals","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"7600b6b99c73d1143bf498f1a7ad8b7e20bd0dcc33ecb4d8aa0e9b75cc40d58b","roadmap":"OperatorTheory/PolarDecomposition","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"e2cea1b8ee24c71694a2eaf94139f328751ac7f01bb604934a069c05b490ca79","roadmap":"OperatorTheory/PrincipalAngles","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"the unitary-group generator by difference quotients and its comparison with the existing Stone theorem","state":"partial"},{"id":"Part B","remaining":"the PVM operator integral, the Borel functional calculus, the bounded spectral theorem and representation PVMs","state":"partial"},{"id":"Part C","remaining":"domain relations, pullbacks, direct sums, graph norms and cores","state":"partial"},{"id":"Part D","remaining":"the norm/spectrum interval characterization","state":"partial"},{"id":"Part E","state":"untouched"}],"readme_sha":"0b5b1896d40129b351afcfcb4f96627c2b01ecfaf8601c07eb5831b9598f03ee","roadmap":"OperatorTheory/SelfAdjointSpectralTheory","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"exponential decay as little-o of powers and Cauchy-kernel Poisson summation as standalone lemmas","state":"partial"},{"id":"Part B","remaining":"the domain-aware pairwise pi/2 bound, Rosenblum's theorem, the bounded/partial bridge","state":"partial"},{"id":"Part C","remaining":"pairwise pi/2 sin-theta, matrix sin 2-theta and the Ritz-residual tan-theta theorems","state":"partial"},{"id":"Part D","remaining":"residual columns, complement identity and sandwich bounds, dilation spectral transfer, the population-gap sin-theta theorem","state":"partial"}],"readme_sha":"cfe7c0bbbb51be4ed807a773c6956a3a492417d79c41bc9d80181f8e20065b7d","roadmap":"OperatorTheory/SpectralSubspacePerturbation","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: OperatorTheory

This file documents the status of the OperatorTheory roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Polar decomposition, majorization and principal angles are finished. Operator ideals lack only two Part A items, and matrix spectral statistics lacks two small items. Spectral-subspace perturbation has the pairwise `π/2` Sylvester bound and has started the Yu–Wang–Samworth layer. It still lacks Rosenblum's theorem and the double-angle and tangent theory. Self-adjoint spectral theory has projection-valued measures but cannot yet integrate against them. Its unbounded spectral measure has not begun.

### Named results

- **Polar decomposition for bounded operators** — every bounded operator between complete Hilbert spaces factors as `T = U|T|` in any dimension, where `U` is the unique partial isometry vanishing on `ker T`: [`ContinuousLinearMap.polarFactor_comp_modulus`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Polar/Bounded.html#ContinuousLinearMap.polarFactor_comp_modulus).
- **Fan dominance** — if every Ky Fan sum of `A` is at most the matching sum of `C`, then `N(A) ≤ N(C)` for every unitarily invariant norm `N`, for finite-dimensional rectangular maps: [`TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/FanDominance.html#TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le).
- **The Davis–Kahan `sin Θ` theorem** — in finite dimension, an interval–exterior spectral gap `g` gives `g · N(P_{V⊥} P_U) ≤ N(B − A)` in every unitarily invariant norm, with constant one. A dimension-free operator-norm form is also proved: [`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub).
- **The pairwise `π/2` Sylvester bound** — let symmetric `A` and `B` act in finite dimension, with eigenvalues pairwise at least `δ` apart. Then every solution of `AX − XB = C` satisfies `δ N(X) ≤ (π/2) N(C)` in every unitarily invariant norm. The constant comes from the Haagerup–Zsidó kernel: [`TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Sylvester/Pairwise.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply).
- **The Kato–Rellich theorem** — a symmetric perturbation that is relatively bounded with bound below one preserves self-adjointness of an unbounded operator: [`IsSelfAdjoint.add_of_isRelativelyBounded`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.html#IsSelfAdjoint.add_of_isRelativelyBounded).

### Notable definitions and infrastructure

- **Approximation numbers and the ideals they define** — [`ContinuousLinearMap.singularValue`](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.html#ContinuousLinearMap.singularValue) carries singular values to bounded operators. Symmetric gauges of them now give the trace-class, Hilbert–Schmidt and Schatten ideals, with their endpoints and [inclusions](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/Schatten.html#TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le).
- **Unitarily invariant seminorms on rectangular maps** — [`TauCeti.UnitarilyInvariantSeminorm`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Basic.html#TauCeti.UnitarilyInvariantSeminorm) is the family's shared language. The Fan, Sylvester and `sin Θ` bounds are all stated in it.
- **Projection-valued measures** — [`TauCeti.ProjValMeasure`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.html#TauCeti.ProjValMeasure) comes with diagonal and polarized measures, pushforward and a null filter. The [C*-algebra of bounded Borel functions](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/BoundedBorel.html#TauCeti.BoundedBorelFunction.instCommCStarAlgebra) sits alongside it. These are the inputs for the PVM integral, the Borel calculus and the unbounded spectral measure.

### Roadmap coverage

**Done:** polar decomposition (Parts A–C), majorization (A–B) and principal angles (A–C). Also done are Parts A and C of matrix spectral statistics, and Parts B and C of operator ideals. Operator ideals Part B is newly complete.

**Partial:**
- Operator ideals Part A lacks modulus invariance of approximation numbers for bounded maps and the closed-unit-ball form of the tail norm.
- Matrix spectral statistics Part B lacks a named spectral projection onto `[c, ∞)` and random-matrix forms of two measurability results.
- Spectral-subspace perturbation:
  - Part A lacks only two auxiliary Fourier lemmas.
  - Part B lacks the domain-aware pairwise bound, Rosenblum's theorem and the bounded/partial bridge.
  - Part C lacks the pairwise `π/2` `sin Θ` theorem, the matrix `sin 2Θ` theorem and the `tan Θ` theorems.
  - Part D has its definitions and the singular-subspace transfer, but not the residual sandwich or the population-gap theorem.
- Self-adjoint spectral theory:
  - Part A lacks the roadmap's own unitary-group generator and its comparison with Stone's theorem.
  - Part B has PVMs and Borel symbols but no PVM integral, Borel calculus or bounded spectral theorem.
  - Part C now has spectral separation and Sylvester equations but lacks graph norms, cores and direct sums.
  - Part D lacks the norm/spectrum interval characterization.

**Untouched:** self-adjoint spectral theory Part E.

## The frontier

- **The PVM integral and the Borel calculus:** projection-valued measures, their null filter and polarized measures are in, and simple Borel functions are dense. The operator integral against a PVM comes next. The Borel calculus, the bounded spectral theorem and all of Part E wait on it.
- **The pairwise `π/2` `sin Θ` theorem:** apply the new pairwise Sylvester bound to projection blocks.
- **The Yu–Wang–Samworth theorem:** corresponding eigenblocks, the Frobenius sine, singular subspaces and the Hermitian dilation exist. Still needed are the residual columns, the complement identity, the two residual sandwiches, and then the population-gap bound itself.
- **Rosenblum's theorem:** the domain-aware Sylvester equation and spectral-set separation it was waiting on have landed. The theorem itself, the domain-aware pairwise bound and the bounded/partial bridge remain.
- **Double-angle and tangent theory:** the matrix `sin 2Θ` theorem and the Ritz-residual `tan Θ` theorems have not been stated.
