<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"trace and extension for Lipschitz boundary, the p = n embedding, Meyers-Serrin at higher order on a domain, W^{1,2} into H^{1,2} on the whole space","state":"partial"},{"id":"Lane B","remaining":"Riesz-Thorin, the Calderon-Zygmund decomposition and singular integrals, Mihlin-Hormander, BMO and John-Nirenberg","state":"partial"},{"id":"Lane C","remaining":"Harnack for general elliptic L, Perron's method with barriers","state":"partial"},{"id":"Lane D","state":"done"},{"id":"Lane E","remaining":"weak Harnack and Moser's Harnack, lower-order terms and n = 2 in De Giorgi, H^k bootstrapping, W^{2,p} and Schauder estimates","state":"partial"},{"id":"Lane F","remaining":"Bochner spaces and the Gelfand triple, Galerkin existence, parabolic maximum principle, the heat semigroup and kernel","state":"partial"}],"readme_sha":"ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa","roadmap":"PDE","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D is complete, from the weak formulation through to the Dirichlet spectrum. De Giorgi's Hölder-continuity theorem is now proved for `n ≥ 3` without lower-order terms, but the rest of Lane E has not begun. Lanes A, B and C are substantially partial. Lane F has only the abstract Hille-Yosida theorem.

### Named results

- **Existence and uniqueness for the Dirichlet problem.** Suppose the energy form of a divergence-form `L` is bounded and coercive on `H¹₀(Ω)`. Then `L u = f` has exactly one weak solution in `H¹₀(Ω)` ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)).
- **The Dirichlet eigenfunction basis.** On a bounded domain with a symmetric energy form, `L²(Ω)` has an orthonormal basis of Dirichlet eigenfunctions, and their eigenvalues are positive ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)).
- **De Giorgi's theorem.** Let `u` be a weak solution of `-div(a∇u) = 0` whose coefficients `a` are only measurable and uniformly elliptic. Its precise representative is Hölder continuous on compact subsets, with exponent depending only on `λ`, `Λ` and `n` ([`exists_holderOnWith_preciseRepresentative`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Regularity/HolderContinuity.html#TauCeti.PDE.exists_holderOnWith_preciseRepresentative)). The result needs `n ≥ 3`.
- **The Dirichlet problem on a ball.** For continuous data on a sphere in any dimension, the Poisson integral is harmonic inside the ball and continuous up to the boundary, where it equals the data ([`exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/PoissonIntegral/Ball.html#TauCeti.exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere)).
- **Strong maximum principle and Hopf's lemma.** Take `-Δ - b·∇ + c` with `c ≥ 0`. An interior maximum on a preconnected open set forces the function to be constant ([`eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.html#TauCeti.eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn)). A boundary maximum on a ball has a strictly positive outward derivative ([`fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/HopfLemma.html#TauCeti.fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)`, built from weak derivatives and complete at every order. Smooth functions are [dense in `W^{1,p}(Ω)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/W1p/MeyersSerrin.html#TauCeti.W1p.dense_contDiffOn_representatives) on any open `Ω` (Meyers-Serrin). [Rellich-Kondrachov](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL) holds for `W^{1,p}_0` on bounded domains, and it drives the spectral theory.
- The [precise representative](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Function/PreciseRepresentative.html#TauCeti.MeasureTheory.preciseRepresentative) of a function is the limit of its averages over shrinking balls. It turns oscillation decay into a pointwise Hölder statement, which is how De Giorgi's estimate becomes a regularity theorem.
- [`HolderSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Holder/Normed.html#TauCeti.HolderSpace) and its higher-order counterparts are the `C^{k,α}` Banach spaces. Morrey's embedding maps into them, and Schauder theory will be stated there.

### Roadmap coverage

**Lane D** is done.

**Lane A** has:

- `W^{k,p}` and `W^{k,p}_0`;
- first-order Meyers-Serrin;
- Gagliardo-Nirenberg-Sobolev and Morrey;
- Poincaré, with its failure on `ℝⁿ`, and Poincaré-Wirtinger on convex domains;
- Rellich for `W^{1,p}_0`;
- the inclusion `H^{1,2}(ℝⁿ) ⊆ W^{1,2}(ℝⁿ)`.

It lacks the trace, the extension operator, the borderline `p = n`, and the reverse inclusion with the rest of the Calderón agreement.

**Lane B** has the maximal inequality and Marcinkiewicz, and nothing else.

**Lane C** has:

- the mean-value property and its converse;
- the weak and strong maximum principles, and Hopf;
- harmonic Harnack;
- the Newtonian, ball and half-space kernels;
- the Poisson solution of the Dirichlet problem on balls.

It lacks Harnack for general `L` and Perron's method.

**Lane E** has Caccioppoli, De Giorgi's Hölder theorem and interior `H²` for constant principal coefficients. It lacks the Moser and Harnack half of De Giorgi-Nash-Moser, the `Hᵏ` bootstrap, `W^{2,p}` estimates and Schauder estimates.

**Lane F** has nothing specific to PDE. Its only milestone in place is the abstract Hille-Yosida theorem, which lives in the library's semigroup theory.

## The frontier

- **De Giorgi-Nash-Moser in full.** Hölder continuity is proved for the homogeneous principal-part equation. What remains:
  - the weak Harnack inequality and the elliptic Harnack inequality;
  - admitting lower-order terms and a right-hand side;
  - the case `n = 2`, where `2* = ∞` breaks the present Sobolev input.
- **Perron's method.** The ball Dirichlet problem, the converse mean-value property and the sub-mean-value maximum principles are all in place. Next come Perron's method and boundary attainment at regular points via barriers.
- **Trace and extension.** These need Lipschitz `∂Ω`. Alongside them sit Meyers-Serrin at order `k ≥ 2` on a domain, and the inclusion `W^{1,2}(ℝⁿ) ⊆ H^{1,2}(ℝⁿ)`.
- **Higher interior regularity.** Two steps remain: `H²_loc` for variable Lipschitz coefficients, and the `Hᵏ` bootstrap to `C^∞`.
- **Calderón-Zygmund theory.** The decomposition, singular integrals, Riesz-Thorin and BMO have not begun. They are prerequisites for the `W^{2,p}` and Schauder estimates.
