<!--tauceti-status:v1 {"roadmap":"OperatorTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"}],"readme_sha":"3001b7842e6620e10c943db9d389a2e692968513a062407e9fd969cb9f185ca9","roadmap":"OperatorTheory/Majorization","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"the fixed-threshold spectral projector onto [c, inf) and its random-matrix form","state":"partial"},{"id":"Part C","state":"done"}],"readme_sha":"ac606964292274c6eed2df8f266b10d6518b046e29b642aee8b9b62f831f0c20","roadmap":"OperatorTheory/MatrixSpectralStatistics","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"OI-A37, the closed-unit-ball form of the tail norm","state":"partial"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"c769dcb3789a0071faf7f2ad61e7af4d7eb3b8ad6800c40cf1af044756121570","roadmap":"OperatorTheory/OperatorIdeals","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"7600b6b99c73d1143bf498f1a7ad8b7e20bd0dcc33ecb4d8aa0e9b75cc40d58b","roadmap":"OperatorTheory/PolarDecomposition","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","state":"done"},{"id":"Part C","state":"done"}],"readme_sha":"e2cea1b8ee24c71694a2eaf94139f328751ac7f01bb604934a069c05b490ca79","roadmap":"OperatorTheory/PrincipalAngles","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"the difference-quotient generator comparison with Stone's theorem","state":"partial"},{"id":"Part B","remaining":"multiplication-operator models and multiplicity","state":"partial"},{"id":"Part C","remaining":"domain relations, pullbacks, graph norms and graph cores","state":"partial"},{"id":"Part D","state":"done"},{"id":"Part E","remaining":"the unbounded spectral PVM, resolvent formula, generated group and Stone uniqueness","state":"partial"}],"readme_sha":"0b5b1896d40129b351afcfcb4f96627c2b01ecfaf8601c07eb5831b9598f03ee","roadmap":"OperatorTheory/SelfAdjointSpectralTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","state":"done"},{"id":"Part B","remaining":"the domain-aware pi/2 bound, Rosenblum's theorem and the bounded/partial bridge","state":"partial"},{"id":"Part C","state":"done"},{"id":"Part D","remaining":"the dilation pairwise-gap bound","state":"partial"}],"readme_sha":"cfe7c0bbbb51be4ed807a773c6956a3a492417d79c41bc9d80181f8e20065b7d","roadmap":"OperatorTheory/SpectralSubspacePerturbation","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: OperatorTheory

This file documents the status of the OperatorTheory roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Polar decomposition, majorization and principal angles are finished, and so are two of the four parts of spectral-subspace perturbation. Self-adjoint spectral theory now has the bounded spectral theorem, but the spectral measure of an unbounded self-adjoint operator has not been built. Operator ideals and matrix spectral statistics each lack only a few small statements.

### Named results

- **The spectral theorem for bounded normal operators**: a normal operator is the integral `a = ∫ z dP(z)` of the coordinate function against a unique projection-valued measure on its spectrum, which has full support and the same commutant as `a`. See [`ContinuousLinearMap.borelCalculus_restrict_id`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/BorelCalculus/Basic.html#ContinuousLinearMap.borelCalculus_restrict_id).
- **Polar decomposition for bounded operators**: every bounded operator between complete Hilbert spaces factors as `T = U|T|`, where `U` is the unique partial isometry vanishing on `ker T`, with no restriction on dimension. See [`ContinuousLinearMap.polarFactor_comp_modulus`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Polar/Bounded.html#ContinuousLinearMap.polarFactor_comp_modulus).
- **The pairwise `π/2` Davis–Kahan `sin Θ` theorem**: if the selected spectra of symmetric `A` and `B` are `δ` apart, the directed sine between their invariant subspaces satisfies `δ·N(sin Θ) ≤ (π/2)·N(B − A)` in every unitarily invariant norm. It is proved in finite dimension, from the Bhatia–Davis–McIntosh Sylvester bound. See [`TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Pairwise.html#TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub).
- **The Kato–Rellich theorem**: a symmetric perturbation that is relatively bounded with bound below one preserves self-adjointness. See [`IsSelfAdjoint.add_of_isRelativelyBounded`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.html#IsSelfAdjoint.add_of_isRelativelyBounded).
- **The Brown–Halmos theorem**: a bounded operator `T` on Hardy space is a Toeplitz operator, with a unique bounded symbol, exactly when `S†TS = T` for the forward shift `S`. See [`TauCeti.existsUnique_toeplitz_eq_iff_adjoint_comp_comp_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/Hardy/BrownHalmos.html#TauCeti.existsUnique_toeplitz_eq_iff_adjoint_comp_comp_eq).

### Notable definitions and infrastructure

- **Projection-valued measures of representations**: every unital ⋆-representation of the continuous functions on a compact space has a projection-valued measure, [unique among those with regular diagonal measures](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Representation/OfRepresentation.html#TauCeti.ProjValMeasure.eq_ofRepresentation_iff). The bounded spectral theorem is the special case of the continuous functional calculus, and unitary conjugation transports the whole construction.
- **Yosida approximants of a self-adjoint operator**: the symmetrized approximants are bounded, self-adjoint and commuting, and they [converge to the operator on its domain](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/Yosida.html#IsSelfAdjoint.tendsto_symmetricYosidaApproximation_apply). Their exponentials are uniformly Cauchy on compact time intervals, the route to the generated unitary group.
- **Schatten classes as operator-ideal families**: the [trace class](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/TraceClass.html#TauCeti.OperatorIdealFamily.traceClass) and Hilbert–Schmidt families sit at `p = 1, 2`, all built on approximation numbers. A symmetric gauge is now [recovered from the family it induces](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/SymmetricGauge/Faithfulness.html#TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq) on antitone sequences.

### Roadmap coverage

**Done:** Polar decomposition A–C; Majorization A–B; Principal angles A–C; Operator ideals B–C; Matrix spectral statistics A and C; Spectral-subspace perturbation A and C, including the `sin 2Θ`, Ritz-residual `tan Θ` and `π/4` theorems; Self-adjoint spectral theory D.

**Partial:**
- Operator ideals A lacks only the closed-unit-ball form of the tail norm.
- Matrix spectral statistics B lacks the fixed-threshold spectral projector and its random-matrix form.
- Spectral-subspace perturbation B now has coercive invertibility. It lacks the domain-aware `π/2` bound, Rosenblum's theorem and the bounded/partial bridge.
- Spectral-subspace perturbation D lacks only the dilation pairwise-gap bound.
- Self-adjoint spectral theory:
  - Part A lacks the difference-quotient generator comparison.
  - Part B has the Borel calculus and spectral measure of a normal operator. Multiplication-operator models are not established.
  - Part C has the compact normal decomposition, but not domain relations, pullbacks, graph norms or cores.
  - Part E has the Yosida approximants and the spectral grid cells, but not the spectral measure itself, the generated group or Stone uniqueness.

Toeplitz operators, which the plan does not track layer by layer, now has the Brown–Halmos theorem, the index of monomial symbols, Hankel product identities and the finite-section method.

## The frontier

- **The dilation pairwise-gap bound**: this applies the pairwise `π/2` `sin Θ` theorem to Hermitian dilations. Both are in place, along with the spectral transfer between a dilation and the singular values.
- **The spectral measure of an unbounded self-adjoint operator**: the Cayley transform is unitary and the bounded spectral theorem now applies to it. What remains is to transport its spectral measure to `ℝ`, which needs the Cayley singular point to have zero mass, and then derive the resolvent formula and the spectral projections. All of Part E waits on this.
- **The generated group and Stone uniqueness**: the Yosida exponentials are Cauchy, so the remaining work is the strong limit group and the proof that its generator is the original operator.
- **Rosenblum's theorem**: the domain-aware Sylvester equation and coercive invertibility exist. What remains is the domain-aware `π/2` bound, the uniqueness argument for intertwiners and the bounded specialization.
- **Domain geometry for partial operators**: same-domain and extension relations, pullbacks, graph norms and graph cores.
