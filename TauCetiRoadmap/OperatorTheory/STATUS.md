<!--tauceti-status:v1 {"roadmap":"OperatorTheory","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"}],"readme_sha":"3001b7842e6620e10c943db9d389a2e692968513a062407e9fd969cb9f185ca9","roadmap":"OperatorTheory/Majorization","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"a named spectral projection onto [c, inf) and random-matrix forms of the spectral measurability results","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"ac606964292274c6eed2df8f266b10d6518b046e29b642aee8b9b62f831f0c20","roadmap":"OperatorTheory/MatrixSpectralStatistics","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"modulus invariance of approximation numbers for bounded maps; closed-ball form of the tail norm","state":"partial"},{"id":"Part B","remaining":"trace-class and Hilbert-Schmidt families, ENNReal Minkowski, Ky Fan dominance property, Schatten endpoints and inclusions, block-sum gauges","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"c769dcb3789a0071faf7f2ad61e7af4d7eb3b8ad6800c40cf1af044756121570","roadmap":"OperatorTheory/OperatorIdeals","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"7600b6b99c73d1143bf498f1a7ad8b7e20bd0dcc33ecb4d8aa0e9b75cc40d58b","roadmap":"OperatorTheory/PolarDecomposition","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"e2cea1b8ee24c71694a2eaf94139f328751ac7f01bb604934a069c05b490ca79","roadmap":"OperatorTheory/PrincipalAngles","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"the unitary-group generator by difference quotients and its comparison with the existing Stone theorem","state":"partial"},{"id":"Part B","remaining":"projection-valued measures and their integral, the Borel calculus, the bounded spectral theorem","state":"partial"},{"id":"Part C","remaining":"domain relations, pullbacks, direct sums, graph norms and cores, spectral separation and partial-operator Sylvester equations","state":"partial"},{"id":"Part D","remaining":"Borel measurability of the real spectrum; norm bound iff spectrum in an interval","state":"partial"},{"id":"Part E","state":"untouched"}],"readme_sha":"0b5b1896d40129b351afcfcb4f96627c2b01ecfaf8601c07eb5831b9598f03ee","roadmap":"OperatorTheory/SelfAdjointSpectralTheory","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"exponential decay as little-o of powers and Cauchy-kernel Poisson summation as standalone lemmas","state":"partial"},{"id":"Part B","remaining":"the pairwise pi/2 Sylvester bounds, Rosenblum's theorem, the bounded/partial bridge","state":"partial"},{"id":"Part C","remaining":"pairwise pi/2 sin-theta, matrix sin 2-theta, tan-theta, reduced extensions and canonical spectral-set forms","state":"partial"},{"id":"Part D","state":"untouched"}],"readme_sha":"cfe7c0bbbb51be4ed807a773c6956a3a492417d79c41bc9d80181f8e20065b7d","roadmap":"OperatorTheory/SpectralSubspacePerturbation","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: OperatorTheory

This file documents the status of the OperatorTheory roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Polar decomposition, majorization and principal angles are finished, and matrix spectral statistics lacks only two small items. Operator ideals and spectral-subspace perturbation are well advanced. Self-adjoint spectral theory has its partial-operator layers but no projection-valued measures, and its unbounded spectral measure and the Yu–Wang–Samworth variant have not begun.

### Named results

- **Polar decomposition for bounded operators** — every bounded operator between complete Hilbert spaces factors as `T = U|T|` through its modulus, with no dimension restriction. Here `U` is the unique partial isometry vanishing on `ker T`: [`ContinuousLinearMap.polarFactor_comp_modulus`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Polar/Bounded.html#ContinuousLinearMap.polarFactor_comp_modulus).
- **Fan dominance** — if every Ky Fan sum of `A` is at most the matching sum of `C`, then `N(A) ≤ N(C)` for every unitarily invariant norm `N`. It holds for finite-dimensional rectangular maps: [`TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/FanDominance.html#TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le).
- **The Hoffman–Wielandt inequality** — the squared Euclidean distance between the sorted spectra of two symmetric operators is bounded by the squared Frobenius distance between the operators. It is finite-dimensional: [`LinearMap.IsSymmetric.sum_sq_eigenvalues_sub_le_sum_sq_norm_apply`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/HoffmanWielandt.html#LinearMap.IsSymmetric.sum_sq_eigenvalues_sub_le_sum_sq_norm_apply).
- **The Davis–Kahan `sin Θ` theorem** — under an interval–exterior spectral gap `g`, `g · N(P_{V⊥} P_U)` is at most `N(B − A)` in every unitarily invariant norm, in finite dimension and with constant one: [`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub). A dimension-free operator-norm form for the projector gap is also proved.
- **The Kato–Rellich theorem** — a symmetric perturbation that is relatively bounded with bound below one preserves self-adjointness of an unbounded operator: [`IsSelfAdjoint.add_of_isRelativelyBounded`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.html#IsSelfAdjoint.add_of_isRelativelyBounded).

### Notable definitions and infrastructure

- **Approximation numbers** — [`ContinuousLinearMap.singularValue`](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.html#ContinuousLinearMap.singularValue) carries singular values to bounded operators. With them, [compactness becomes `aₙ → 0`](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Compact.html#ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue) and Ky Fan gauges become subadditive, which is the base of the symmetric-ideal and Schatten layer.
- **Unitarily invariant seminorms on rectangular maps** — [`TauCeti.UnitarilyInvariantSeminorm`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Basic.html#TauCeti.UnitarilyInvariantSeminorm) is the shared vocabulary for the whole family. It comes with a symmetric-gauge representation and the Frobenius, Ky Fan, nuclear and Schatten norms.
- **The Haagerup–Zsidó kernel** — its [exact `π/2` mass](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/HaagerupZsido/Mass.html#TauCeti.HaagerupZsido.integral_norm_reciprocalKernel) and its exterior Fourier identity are the analytic input for the sharp-constant Sylvester and `sin Θ` bounds.

### Roadmap coverage

**Done:**
- Polar decomposition, Parts A–C: the functional calculus, square root and modulus; polar decomposition and partial isometries; singular systems and Moore–Penrose.
- Majorization, Parts A–B.
- Principal angles, Parts A–C.
- Matrix spectral statistics, Parts A and C.
- Operator ideals, Part C: Hilbert–Schmidt operators as `ℓ²` columns.

**Partial:**
- Matrix spectral statistics, Part B: the spectral projection onto `[c, ∞)` has no named definition, and the random-matrix forms of two measurability results are not stated.
- Operator ideals, Part A lacks modulus invariance of approximation numbers for bounded maps.
- Operator ideals, Part B lacks the trace-class and Hilbert–Schmidt families, the Ky Fan dominance property, and the Schatten endpoints and inclusions.
- Spectral-subspace perturbation, Part A is complete except two auxiliary Fourier lemmas, which the proof went around.
- Spectral-subspace perturbation, Parts B–C lack the pairwise `π/2` bounds, Rosenblum's theorem, and the matrix `sin 2Θ` and `tan Θ` theorems.
- Self-adjoint spectral theory, Part A: the Stone generator is shown self-adjoint, but the roadmap's own unitary-group generator and its comparison with the existing Stone theorem are missing.
- Self-adjoint spectral theory, Part B has only bounded Borel functions and a diagonal measure.
- Self-adjoint spectral theory, Part C has restrictions, relative boundedness and Kato–Rellich, but not graph norms, cores or direct sums.
- Self-adjoint spectral theory, Part D has resolvents and the Cayley transform but lacks two small lemmas.

**Untouched:**
- Self-adjoint spectral theory, Part E.
- Spectral-subspace perturbation, Part D.

## The frontier

- **Projection-valued measures** — the PVM structure and its integral (SA-B14 onward) are the main blocker: the Borel calculus, the bounded spectral theorem and all of Part E wait on them.
- **The pairwise `π/2` Sylvester bound** — integrate `e^{itA} C e^{-itB}` against the Haagerup–Zsidó kernel, whose mass bound has landed. In finite dimension this needs a bridge from the functional calculus to `e^{itA}`, plus a unitarily-invariant-norm bound on the Bochner integral. The pairwise `sin Θ` theorem follows from it.
- **Trace-class and Hilbert–Schmidt ideal families** — the gauge laws exist, so this is mostly packaging. Hilbert–Schmidt subadditivity still needs Minkowski for `ℝ≥0∞` sums, and the Schatten endpoints wait on these families.
- **The Yu–Wang–Samworth variant** — it needs eigenblock correspondence and the Frobenius sine distance as definitions. After that the argument is eigenbasis sums plus Weyl's inequality, both already available.
- **Rosenblum's theorem** — it is blocked on the domain-aware Sylvester equation and the partial-operator spectral separation in self-adjoint spectral theory Part C. Neither exists yet.
