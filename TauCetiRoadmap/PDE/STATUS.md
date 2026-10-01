<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"Meyers-Serrin on a general domain, trace and extension for Lipschitz boundary, the p = n embedding, agreement with Bessel-potential spaces","state":"partial"},{"id":"Lane B","remaining":"Riesz-Thorin, the Calderon-Zygmund decomposition and singular integrals, Mihlin-Hormander, BMO and John-Nirenberg","state":"partial"},{"id":"Lane C","remaining":"Harnack for general elliptic L, Poisson-integral solution on the ball, Perron's method with barriers","state":"partial"},{"id":"Lane D","state":"done"},{"id":"Lane E","remaining":"De Giorgi Hoelder continuity, H^k bootstrapping for variable coefficients, W^{2,p} and Schauder estimates","state":"partial"},{"id":"Lane F","state":"untouched"}],"readme_sha":"ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa","roadmap":"PDE","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D is complete, from the weak formulation through to the Dirichlet spectrum. Lane E has started on its deepest theorem: De Giorgi's local boundedness is proved, and so is interior `H²` regularity for constant principal coefficients. Lane C has maximum principles, Hopf's lemma and Harnack in every dimension, plus Green's functions of the ball and the half-space, but not Perron's method. Lanes A and B are partial, and Lane F has not begun.

### Named results

- **Existence and uniqueness for the Dirichlet problem.** Take a divergence-form `L` whose energy form is bounded and coercive on `H¹₀(Ω)`. Then exactly one `u ∈ H¹₀(Ω)` satisfies `a(u, v) = ∫_Ω f v` for every test `v` ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)).
- **The Dirichlet eigenfunction basis.** On a bounded domain with a symmetric energy form, `L²(Ω)` has an orthonormal basis of Dirichlet eigenfunctions with positive eigenvalues ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)).
- **De Giorgi's local boundedness.** A weak subsolution of `-div(a∇u) ≤ 0`, with `a` bounded, measurable and uniformly elliptic, is bounded on a half ball by its `L²` mass on the full ball ([`exists_ae_value_le_mul_rpow_mul_sqrt_setIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Regularity/LocalBoundedness.html#TauCeti.PDE.exists_ae_value_le_mul_rpow_mul_sqrt_setIntegral)). This needs a Sobolev inequality, which holds unconditionally for `n ≥ 3`, and the operator may not have lower-order terms.
- **Strong maximum principle and Hopf's lemma.** For `-Δ - b·∇ + c` with `c ≥ 0`, an interior maximum on a preconnected open set forces constancy ([`eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.html#TauCeti.eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn)). A boundary maximum on a ball has a strictly positive outward derivative ([`fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/HopfLemma.html#TauCeti.fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere)). Harnack's inequality holds for nonnegative harmonic functions ([`harnack_inequality`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/Basic.html#IsCompact.harnack_inequality)).
- **Rellich-Kondrachov.** For bounded `Ω`, the value map `W^{1,p}_0(Ω) → Lᵖ(Ω)` is compact ([`isCompactOperator_valueL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL)). The statement for all of `W^{1,p}(Ω)` would need boundary regularity.

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)`, built from weak derivatives and complete at every order. On `ℝⁿ` it now carries translation and a [mollifier converging to the identity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.html#TauCeti.Wkp.tendsto_normedBumpL), which gives density of smooth functions on the whole space.
- [`ballGreenKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/GreenFunction/Ball.html#TauCeti.ballGreenKernel) is the Dirichlet Green's function of the unit ball in any dimension. For `n ≥ 3` it satisfies `-ΔG = δ` distributionally, and its normal derivative is the Poisson kernel. It is the starting point for solving the Dirichlet problem on the ball by potential theory.
- [`HolderSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Holder/Normed.html#TauCeti.HolderSpace) and its higher-order counterparts are the `C^{k,α}` Banach spaces, now a normed algebra at order zero. Morrey's embedding maps into them, and Schauder theory will be stated there.

### Roadmap coverage

**Lane A** has:

- weak derivatives, `W^{k,p}` with completeness, and `W^{k,p}_0`;
- the Gagliardo-Nirenberg-Sobolev embedding, and Morrey's for `p > n`;
- Poincaré, and Poincaré-Wirtinger on convex bounded domains;
- extension by zero from `W^{1,p}_0`;
- truncation calculus, Rellich for `W^{1,p}_0`, and the Hölder spaces.

It lacks Meyers-Serrin density on a general domain, trace, extension for `W^{1,p}(Ω)`, the borderline `p = n`, and agreement with the Bessel-potential scale.

**Lane B** has the Hardy-Littlewood maximal inequality and Marcinkiewicz interpolation, and nothing of Riesz-Thorin, Calderón-Zygmund or BMO.

**Lane C** has the `n`-dimensional mean-value property, the weak and strong maximum principles, Hopf's lemma and harmonic Harnack. For `n ≥ 3` it has `-Δ = δ` for the Newtonian kernel, and the ball and half-space Green and Poisson kernels. It lacks Harnack for general `L`, Perron's method, and a Poisson-integral solution of the ball's Dirichlet problem.

**Lane D** is done.

**Lane E** has Caccioppoli and De Giorgi's local boundedness. It also has interior `H²` regularity for constant principal coefficients with bounded lower-order terms, which is in the source but not linked here. It lacks Hölder continuity, `Hᵏ` bootstrapping, `W^{2,p}` and Schauder.

**Lane F** is untouched.

## The frontier

- **De Giorgi Hölder continuity.** Local boundedness and the isoperimetric level-set inequality are in place. What remains is oscillation decay, and with it Hölder continuity and the weak Harnack inequality. Lower-order terms have yet to be admitted.
- **The Dirichlet problem on the ball by Poisson integral.** The kernel's far-field mass is shown to vanish at a boundary point. It remains to show that the Poisson integral of continuous data is harmonic and attains its boundary values. After that comes Perron's method with barriers.
- **Higher interior regularity.** `H²_loc` is known for constant principal coefficients. Variable Lipschitz coefficients and the `Hᵏ` bootstrap to `C^∞` remain.
- **Meyers-Serrin, trace and extension.** Density is now known on `ℝⁿ` at every order. On a general domain it needs no boundary regularity. Trace and extension for `W^{1,p}(Ω)` need Lipschitz `∂Ω`.
- **Calderón-Zygmund.** The decomposition, singular integrals and BMO have not begun. They are prerequisites for `W^{2,p}` and Schauder estimates.
