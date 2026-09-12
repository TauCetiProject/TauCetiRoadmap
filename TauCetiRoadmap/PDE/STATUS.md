<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"bc61e7b32c7365b0385fec726d9d4bc2ec787dea","ts":"2026-09-07T11:04:50+10:00"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `bc61e7b` (2026-09-07T11:04:50+10:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D, linear elliptic existence by the energy method, is complete through the spectrum: the Dirichlet problem has a unique weak solution, the Fredholm alternative holds, and the Dirichlet eigenfunctions form an orthonormal basis of `L²(Ω)`. Lane A is done for the zero-boundary spaces `W^{k,p}_0(Ω)` and thin for `W^{k,p}(Ω)`, which has no density theorem, trace or extension. Lane C is still partly planar and has no Green's function; Lane B stops at the maximal function; Lanes E and F are untouched.

### Named results

- **Existence and uniqueness for the Dirichlet problem** — for a divergence-form `L` whose energy form is bounded and coercive on `H¹₀(Ω)`, exactly one `u ∈ H¹₀(Ω)` satisfies `a(u, v) = ∫_Ω f v` for every test `v` ([`existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)). Gårding plus Poincaré discharge coercivity concretely for `-Δ`, and for uniformly elliptic operators with small drift, on domains inside a ball or slab.
- **The Dirichlet eigenfunction basis** — on a bounded domain with symmetric energy form, `L²(Ω)` has an orthonormal basis of Dirichlet eigenfunctions at positive eigenvalues ([`exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)), and the first eigenvalue is both the minimum of the Rayleigh quotient and the optimal Poincaré constant of the form ([`isLeast_rayleighQuotient_firstDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.isLeast_rayleighQuotient_firstDirichletEigenvalue)).
- **Rellich-Kondrachov** — for bounded `Ω` and `1 ≤ p < ∞`, the value map `W^{1,p}_0(Ω) → Lᵖ(Ω)` is compact ([`isCompactOperator_valueL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/RellichKondrachov.html#TauCeti.W1p0.isCompactOperator_valueL)), by a Fréchet-Kolmogorov criterion. This is the compactness that powers everything spectral; the `W^{1,p}(Ω)` statement, which needs boundary regularity, is not available.
- **The weak maximum principle for second-order elliptic operators** — a `C²` function on a compact set with `c u ≤ Δu + b·∇u`, `c ≥ 0` and `b` bounded inside, is bounded by any nonnegative bound it respects on the frontier ([`le_of_mul_le_laplacian_add_fderiv_le_frontier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Laplacian/LowerOrderMaximumPrinciple.html#TauCeti.le_of_mul_le_laplacian_add_fderiv_le_frontier)), with a counterexample showing `c ≥ 0` cannot be dropped.
- **The Hardy-Littlewood maximal inequality** — the weak `(1,1)` bound, and by Marcinkiewicz interpolation against `L^∞` the strong `(p, p)` bound for `1 < p < ∞` ([`eLpNorm_maximalFunction_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/MeasureTheory/Integral/MaximalFunction.html#TauCeti.eLpNorm_maximalFunction_le)).

### Notable definitions and infrastructure

- [`Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) is `W^{k,p}(Ω)` built from weak derivatives, as an iterated closed graph space over the value-gradient jet, complete at every order, with `W^{k,p}_0(Ω)` the closure of the embedded test functions. The weak derivatives underneath have almost-everywhere uniqueness, agreement with `fderiv`, and a Leibniz rule against smooth cutoffs.
- [`IsWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.IsWeakSolutionDirichlet) names the solution concept, and [`dirichletSolutionOperator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.dirichletSolutionOperator) turns it into a compact, positive, self-adjoint map on `L²(Ω)`, off which everything spectral is read.
- [`newtonianKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/FundamentalSolution/Euclidean/Basic.html#TauCeti.newtonianKernel) is the fundamental solution of `-Δ` in every dimension: harmonic off its pole, radial, with the classical normal derivative on spheres and outward flux `-1`.

### Roadmap coverage

Lane A has weak derivatives, `W^{k,p}(Ω)` with completeness, `W^{k,p}_0`, Poincaré on domains inside a ball or slab, the subcritical Gagliardo-Nirenberg-Sobolev embedding on `W^{1,p}_0(Ω)`, zero-extension as an isometry, and Rellich; missing are Meyers-Serrin `H = W` density (only mollification lemmas exist), Poincaré-Wirtinger, trace and extension, the Morrey and borderline embeddings, agreement with Mathlib's Bessel-potential scale, and the Hölder spaces, of which only the norm is defined. Lane D is done, from the weak formulation and Gårding through to the spectrum. Lane C has the weak maximum principle in any dimension but keeps Harnack and the strong principle planar, and has the Newtonian kernel without `-ΔG = δ`, Green's function, Poisson kernel or Perron. Lane B has Marcinkiewicz interpolation only in the diagonal `(1, ∞)` case, and no Riesz-Thorin, Calderón-Zygmund or BMO. Lanes E and F, and the stretch goals, are untouched.

## The frontier

- **Meyers-Serrin and the density gap.** Convolution with a smooth compactly supported kernel is known to commute with the weak derivative; what remains is `C^∞ ∩ W^{k,p}` density, which needs no boundary regularity and would let `W^{k,p}(Ω)` statements be checked on smooth functions alone.
- **Trace and extension on `W^{1,p}(Ω)`.** Only zero-extension out of `W^{1,p}_0(Ω)` exists. A trace with kernel `W^{1,p}_0` and an extension into `W^{1,p}(ℝⁿ)` for Lipschitz `∂Ω` would carry Rellich, and the spectral package with it, to the full space.
- **The mean-value property on `ℝⁿ`.** Harnack and the strong maximum principle are still planar, resting on Mathlib's complex harmonic theory; the `n`-dimensional mean-value characterisation is the single result that would lift both.
- **`-ΔG = δ`.** The kernel and its sphere flux are done; the distributional identity, then Green's function, Poisson kernel and Perron's method, are the rest of Lane C.
- **Interior `H²` regularity.** The first step of Lane E, by difference quotients, and what would upgrade the weak solutions now in hand. Schauder and De Giorgi-Nash-Moser beyond it wait on Lane B.
