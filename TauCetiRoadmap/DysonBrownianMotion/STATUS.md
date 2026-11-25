<!--tauceti-status:v1 {"roadmap":"DysonBrownianMotion","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"mutual bracket of linear functionals of vector Brownian motion; matrix-noise integrand classes; waits on StochasticCalculus","state":"untouched"},{"id":"Layer 1","remaining":"existence and noncollision for n at least 2, closed-chamber entrance, uniqueness in law, invariant Gaussian beta law","state":"partial"},{"id":"Layer 2","remaining":"bracket formula for matrix Brownian motion; Dyson's theorem and eigenvalue noncollision","state":"partial"},{"id":"Layer 3","remaining":"convergence of empirical measure process; identification of the limit with free convolution","state":"partial"}],"readme_sha":"44321941645a2e99d7961896f271bfce2d31413a679be283de67ba59a126bfd6","roadmap":"DysonBrownianMotion","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: DysonBrownianMotion

This file documents the status of the DysonBrownianMotion roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** None of the three headline theorems is proved yet. Layers 1–3 are partial. The particle system has pathwise uniqueness, stability and comparison but no existence beyond one particle. Matrix Brownian motion has its basic laws and invariances, but Dyson's theorem is not proved. The hydrodynamic limit has a unique limit flow but no convergence theorem. Layer 0 has not begun.

### Named results

- **Uniqueness of Burgers flows** — a family of probability measures whose transforms solve the integrated Burgers equation is determined by its initial measure ([`IsBurgersFlow.eq`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Burgers.html#TauCeti.Probability.IsBurgersFlow.eq)). This is the uniqueness half of the hydrodynamic limit.
- **The Pastur equation along a Burgers flow** — every flow satisfies `m_t(w) = m_0(w + t m_t(w))` on the upper half-plane ([`IsBurgersFlow.resolventTransform_eq_resolventTransform_add_mul`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Burgers.html#TauCeti.Probability.IsBurgersFlow.resolventTransform_eq_resolventTransform_add_mul)). The flow from `δ_a` is the semicircle family ([`IsBurgersFlow.eq_semicircleReal`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Burgers.html#TauCeti.Probability.IsBurgersFlow.eq_semicircleReal)).
- **The comparison principle for Dyson trajectories** — ordered starts driven by the same path stay ordered coordinatewise, as in AGZ Lemma 4.3.6 ([`IsDysonPath.le_of_le`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Basic.html#TauCeti.Probability.IsDysonPath.le_of_le)).
- **Pathwise uniqueness and stability of the Dyson system** — two trajectories driven by the same path coincide if they start together ([`IsDysonPath.eq`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Basic.html#TauCeti.Probability.IsDysonPath.eq)). Their `ℓ²` distance never exceeds its initial value ([`IsDysonPath.sum_sub_sq_le`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Basic.html#TauCeti.Probability.IsDysonPath.sum_sub_sq_le)). Both hold for every `n` and from coincident starts.
- **Hadamard's first variation formula** — a simple ordered eigenvalue of a differentiable Hermitian family has derivative `Re ⟪u, M′ u⟫` for a unit eigenvector `u` ([`Matrix.hasFDerivAt_eigenvalues₀`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Eigenvalues/Smooth.html#Matrix.hasFDerivAt_eigenvalues₀)). This is the first-order step of the eigenvalue equation.

### Notable definitions and infrastructure

- **Truncated Dyson trajectories** ([`truncatedDysonPath`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Truncation.html#TauCeti.Probability.truncatedDysonPath)) solve the globally Lipschitz truncated system for any continuous forcing. They paste into a genuine solution once they stay away from the chamber walls ([`exists_isDysonSolution_of_ae_le_truncatedDysonPath_sub`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Truncation.html#TauCeti.Probability.exists_isDysonSolution_of_ae_le_truncatedDysonPath_sub)). They are also bounded uniformly in the cutoff ([`exists_forall_norm_truncatedDysonPath_le`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Nonexplosion.html#TauCeti.Probability.exists_forall_norm_truncatedDysonPath_le)). Existence now reduces to noncollision.
- **The Lyapunov function** `∑ xᵢ² − ∑_{i<j} log(xᵢ − xⱼ)` ([`dysonLyapunov`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/Lyapunov.html#TauCeti.Probability.dysonLyapunov)) has generator at most `n − 1 + 2/β` for `β ≥ 1`. Its sublevel sets lie in the truncation regions, which is what the noncollision argument needs.
- **The exponential time change** ([`ouTimeChange`](https://taucetiproject.org/docs/TauCeti/Probability/DysonBrownianMotion/OrnsteinUhlenbeck.html#TauCeti.Probability.ouTimeChange)) identifies Dyson trajectories with Ornstein–Uhlenbeck ones in both directions. This is the deterministic reduction that §3.2 uses for the Ornstein–Uhlenbeck limit.

### Roadmap coverage

Solutions are pathwise (`IsDysonSolution`, as in `Suggested.lean`), not StochasticCalculus' filtered strong solutions.

- **Layer 0** is untouched. Nothing from StochasticCalculus' filtered Brownian or strong-solution API appears in the library.
- **Layer 1** is partial. §1.1 has pathwise uniqueness, `ℓ²` stability, the comparison principle, the entrance bound and the truncation machinery. It lacks existence for `n ≥ 2`, noncollision, the closed-chamber entrance and uniqueness in law. §1.2 has pathwise uniqueness and the time change but not the invariant law.
- **Layer 2** is partial. §2.1 has matrix Brownian motion with continuity, measurability, increment laws, independent increments, scaling and conjugation invariance, but not the bracket formula. In §2.2 only Hadamard's formula has landed.
- **Layer 3** is partial. §3.1 has the limit equation and its uniqueness, but no convergence of empirical measures. In §3.2, the Pastur equation and the time change are present, but the identification with `ν ⊞ SC_t` is not.

## The frontier

- **Noncollision and existence for `n ≥ 2`** — the remaining step is to show that truncated trajectories driven by Brownian motion almost surely stay inside some truncation region on each horizon, by the logarithmic-gap argument. The Lyapunov bound and pasting are ready, but the step needs Itô's formula from StochasticCalculus.
- **Closed-chamber entrance** — passing from open-chamber starts to coincident ones by approximation, using the `ℓ²` stability and the Rogers–Shi bound. It needs existence from open starts first.
- **The bracket formula and Dyson's theorem** — this needs the bracket formula for matrix Brownian motion, the second-order eigenvalue expansion, Itô's formula and Lévy's characterization. It is blocked on Layer 0 and StochasticCalculus.
- **Convergence of the empirical measure process** — this needs the `C_c²` evolution, the martingale estimate and tightness. Uniqueness of the limit is already available through Burgers-flow uniqueness.
- **The invariant Gaussian beta law** — the Ornstein–Uhlenbeck system of §1.2 still needs stationarity of the RandomMatrices §5.3 density, with its boundary terms.
