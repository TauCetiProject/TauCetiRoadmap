<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"Meyers-Serrin on a general domain, trace and extension for Lipschitz boundary, the p = n embedding, agreement with Bessel-potential spaces","state":"partial"},{"id":"Lane B","remaining":"Riesz-Thorin, the Calderon-Zygmund decomposition and singular integrals, Mihlin-Hormander, BMO and John-Nirenberg","state":"partial"},{"id":"Lane C","remaining":"Harnack for general elliptic L, Poisson-integral solution on the n-ball, Perron's method with barriers","state":"partial"},{"id":"Lane D","state":"done"},{"id":"Lane E","remaining":"the De Giorgi Hoelder-continuity statement and weak Harnack, H^k bootstrapping for variable coefficients, W^{2,p} and Schauder estimates","state":"partial"},{"id":"Lane F","state":"untouched"}],"readme_sha":"ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa","roadmap":"PDE","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D is complete, from the weak formulation through to the Dirichlet spectrum. Lane E has most of De Giorgi's theorem: local boundedness and the interior oscillation estimate are proved for `n ≥ 3`, though the Hölder-continuity statement has not yet been extracted. Lanes A, B and C are partial, and Lane F has not begun.

### Named results

- **Existence and uniqueness for the Dirichlet problem.** Take a divergence-form `L` whose energy form is bounded and coercive on `H¹₀(Ω)`. Then exactly one `u ∈ H¹₀(Ω)` satisfies `a(u, v) = ∫_Ω f v` for every test `v` ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)).
- **The Dirichlet eigenfunction basis.** On a bounded domain with a symmetric energy form, `L²(Ω)` has an orthonormal basis of Dirichlet eigenfunctions with positive eigenvalues ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)).
- **De Giorgi's interior oscillation estimate.** Let `u` be a weak solution of `-div(a∇u) = 0` with `a` measurable and uniformly elliptic. Its oscillation on `B(x₀, r)` is at most `C (r/R)^α` times its normalised `L²` mass on `B(x₀, R)` ([`exists_ae_value_mem_Icc_add_mul_rpow_mul_rpow_mul_sqrt_setIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Regularity/Oscillation.html#TauCeti.PDE.exists_ae_value_mem_Icc_add_mul_rpow_mul_rpow_mul_sqrt_setIntegral)). It rests on [local boundedness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Regularity/LocalBoundedness.html#TauCeti.PDE.exists_ae_abs_value_le_mul_rpow_mul_sqrt_setIntegral). Both results need `n ≥ 3` and exclude lower-order terms.
- **Strong maximum principle and Hopf's lemma.** For `-Δ - b·∇ + c` with `c ≥ 0`, an interior maximum on a preconnected open set forces constancy ([`eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.html#TauCeti.eqOn_const_of_mul_le_laplacian_add_fderiv_of_isMaxOn)). A boundary maximum on a ball has a strictly positive outward derivative ([`fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/HopfLemma.html#TauCeti.fderiv_pos_of_mul_le_laplacian_add_fderiv_of_lt_ball_of_le_sphere)). Harnack's inequality holds for nonnegative harmonic functions ([`harnack_inequality`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/Basic.html#IsCompact.harnack_inequality)).
- **Rellich-Kondrachov.** For bounded `Ω`, the value map `W^{1,p}_0(Ω) → Lᵖ(Ω)` is compact ([`isCompactOperator_valueL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL)). The statement for all of `W^{1,p}(Ω)` would need boundary regularity.

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)`, built from weak derivatives and complete at every order. On `ℝⁿ`, smooth functions are now [dense in the full Sobolev norm](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/SmoothDensity.html#TauCeti.Wkp.dense_contDiff_representatives). This is the whole-space case of Meyers-Serrin.
- [`ballGreenKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/GreenFunction/Ball.html#TauCeti.ballGreenKernel) is the Dirichlet Green's function of the unit ball in any dimension. For `n ≥ 3` it satisfies `-ΔG = δ` distributionally, and its normal derivative is the Poisson kernel. In the plane, the [Poisson integral](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Poisson/Integral.html#TauCeti.planarPoissonIntegral) now solves the Dirichlet problem on a disk for continuous data.
- [`HolderSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Holder/Normed.html#TauCeti.HolderSpace) and its higher-order counterparts are the `C^{k,α}` Banach spaces. Morrey's embedding maps into them, and Schauder theory will be stated there.

### Roadmap coverage

**Lane D** is done, and **Lane F** is untouched.

**Lane A** has:

- `W^{k,p}` and `W^{k,p}_0`;
- Gagliardo-Nirenberg-Sobolev and Morrey;
- Poincaré, together with the acceptance check that it [fails on `ℝⁿ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Poincare/WholeSpace.html#TauCeti.not_exists_eLpNorm_le_const_mul_eLpNorm_fderiv_euclideanSpace);
- Poincaré-Wirtinger on convex domains;
- Rellich for `W^{1,p}_0`;
- smooth density on `ℝⁿ`.

It lacks Meyers-Serrin on a general domain, trace, extension for `W^{1,p}(Ω)`, the borderline `p = n`, and agreement with the Bessel-potential scale.

**Lane B** has the Hardy-Littlewood maximal inequality and Marcinkiewicz interpolation. It has nothing of Riesz-Thorin, Calderón-Zygmund or BMO.

**Lane C** has:

- the `n`-dimensional mean-value property;
- the weak and strong maximum principles, and Hopf's lemma;
- harmonic Harnack;
- the Newtonian, ball and half-space kernels for `n ≥ 3`;
- the planar Poisson-integral solution on a disk.

It lacks Harnack for general `L`, the Poisson-integral solution on the `n`-ball, and Perron's method.

**Lane E** has:

- Caccioppoli;
- De Giorgi's local boundedness and oscillation estimate;
- interior `H²` for constant principal coefficients.

It lacks the Hölder-continuity statement, `Hᵏ` bootstrapping, `W^{2,p}` and Schauder.

## The frontier

- **De Giorgi Hölder continuity.** The oscillation estimate is proved. What remains is turning it into a locally Hölder-continuous representative on compact subsets, and proving the weak Harnack inequality. Lower-order terms and `n = 2` have yet to be admitted.
- **The Dirichlet problem on the `n`-ball by Poisson integral.** The planar case is done. In higher dimensions the Green kernel and the vanishing of its far-field mass are in place, but harmonicity and boundary attainment of the Poisson integral are not. Perron's method with barriers comes after that.
- **Higher interior regularity.** `H²_loc` is known for constant principal coefficients. Variable Lipschitz coefficients and the `Hᵏ` bootstrap to `C^∞` remain.
- **Meyers-Serrin, trace and extension.** Density is known on `ℝⁿ`. On a general domain it needs no boundary regularity. Trace and extension need Lipschitz `∂Ω`.
- **Calderón-Zygmund.** The decomposition, singular integrals and BMO have not begun. They are prerequisites for `W^{2,p}` and Schauder estimates.
