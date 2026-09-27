<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2","ts":"2026-09-26T20:53:39+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"Meyers–Serrin density, trace and extension, full-space Rellich, and agreement with Bessel-potential spaces","state":"partial"},{"id":"Lane B","remaining":"general interpolation, Calderón–Zygmund theory, and BMO","state":"partial"},{"id":"Lane C","remaining":"higher-dimensional Harnack and strong principle, distributional fundamental solution, Green and Poisson theory, and Perron's method","state":"partial"},{"id":"Lane D","state":"done"},{"id":"Lane E","state":"untouched"},{"id":"Lane F","state":"untouched"}],"readme_sha":"ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa","roadmap":"PDE","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `759eb3e` (2026-09-26T20:53:39+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D's energy-method Dirichlet existence and spectral theory are complete. Function spaces, harmonic-analysis estimates, and maximum principles with potential theory remain partial; elliptic regularity and parabolic equations have not begun in the supplied record.

### Named results

- **Dirichlet existence and uniqueness** — a bounded, coercive divergence-form energy form on `H¹₀(Ω)` gives exactly one weak solution for each `L²` right-hand side ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)); Gårding and Poincaré supply concrete coercive cases, including `−Δ` on a domain inside a ball.
- **The Dirichlet eigenfunction basis** — for a symmetric energy form on a bounded domain, positive Dirichlet eigenvalues admit an orthonormal basis of `L²(Ω)` ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)).
- **Rellich–Kondrachov for zero boundary values** — on bounded `Ω`, the map `W¹,ᵖ₀(Ω) → Lᵖ(Ω)` is compact for `1 ≤ p < ∞` ([`isCompactOperator_valueL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL)); compactness for the full `W¹,ᵖ(Ω)` remains open here.
- **The weak elliptic maximum principle** — a `C²` subsolution on a compact set is bounded by a nonnegative frontier bound when the zeroth-order coefficient has the required sign and the drift is bounded inside ([`le_of_mul_le_laplacian_add_fderiv_le_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/LowerOrderMaximumPrinciple.html#TauCeti.le_of_mul_le_laplacian_add_fderiv_le_frontier)).
- **The Hardy–Littlewood maximal inequality** — the maximal operator has weak `(1,1)` and strong `(p,p)` bounds for `1 < p < ∞` ([`eLpNorm_maximalFunction_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Integral/MaximalFunction.html#TauCeti.eLpNorm_maximalFunction_le)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) supplies complete weak-derivative spaces on a domain, making the energy formulation and zero-boundary Sobolev theory possible.
- The [`newtonianKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/FundamentalSolution/Euclidean/Basic.html#TauCeti.newtonianKernel) gives a dimension-independent starting point for potential theory, with harmonicity away from the pole and sphere flux established.

### Roadmap coverage

Lane D is done through the Fredholm alternative and Dirichlet spectrum. Lane A is partial: weak-derivative spaces, zero-boundary compactness and embeddings are available, while smooth density, trace and extension, full-space Rellich, and agreement with the Bessel-potential scale are missing. Lane B is partial at the maximal inequality and a restricted Marcinkiewicz interpolation theorem; Calderón–Zygmund theory and the other interpolation targets remain. Lane C is partial: the weak maximum principle and Newtonian kernel are available, but Harnack and the strong principle are only established in the plane, and the distributional fundamental-solution identity, Green and Poisson theory, and Perron's method remain. Lanes E and F are untouched in the supplied evidence.

## The frontier

- **Smooth Sobolev density.** Prove Meyers–Serrin density in `Wᵏ,ᵖ(Ω)` from the existing mollification and weak-derivative results.
- **Trace and extension.** Build the trace on Lipschitz domains with kernel `W¹,ᵖ₀(Ω)` and an extension into `W¹,ᵖ(ℝⁿ)`; these are needed for the roadmap's full-space compactness claim.
- **Higher-dimensional harmonic theory.** Establish the mean-value characterization on `ℝⁿ`, then extend planar Harnack and the strong maximum principle beyond dimension two.
- **Distributional fundamental solution.** Prove `−ΔG = δ` for the Newtonian kernel before building Green's functions, Poisson kernels, and Perron's method.
- **Interior elliptic regularity.** Prove the first `H²` estimate for weak solutions via difference quotients; the Schauder and De Giorgi–Nash–Moser targets remain beyond it.
