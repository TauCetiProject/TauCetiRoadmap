<!--tauceti-status:v1 {"roadmap":"PDE","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane A","remaining":"Meyers–Serrin density, trace and extension, Bessel-scale agreement, borderline embedding and full-space Rellich","state":"partial"},{"id":"Lane B","remaining":"Riesz–Thorin, Calderón–Zygmund singular integrals and BMO","state":"partial"},{"id":"Lane C","remaining":"general elliptic Harnack, general-domain Green functions and Perron's method","state":"partial"},{"id":"Lane D","state":"done"},{"id":"Lane E","remaining":"higher-order and variable-coefficient regularity, Schauder estimates and De Giorgi–Nash–Moser","state":"partial"},{"id":"Lane F","remaining":"Bochner evolution spaces, Galerkin existence and heat semigroup theory","state":"untouched"}],"readme_sha":"ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa","roadmap":"PDE","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: PDE

This file documents the status of the PDE roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane D's weak Dirichlet existence and spectral program is complete. Lanes A, B, C and E have substantial results but miss their stated end points; Lane F has not begun.

### Named results

- **Harnack's inequality** — nonnegative harmonic functions have comparable values on compact subsets of a preconnected open set in finite dimensions ([`IsCompact.harnack_inequality`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Harnack/Basic.html#IsCompact.harnack_inequality)). This is for harmonic functions, not general measurable-coefficient weak solutions.
- **The Newtonian fundamental-solution identity** — for dimension at least three, integrating a compactly supported `C²` test function's Laplacian against the Newtonian kernel gives minus its value at the pole ([`TauCeti.integral_laplacian_mul_newtonianKernel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/FundamentalSolution/Euclidean/DistributionalLaplacian.html#TauCeti.integral_laplacian_mul_newtonianKernel)).
- **Morrey's embedding** — when finite `p` exceeds the dimension, whole-space `W^{1,p}` embeds continuously into the Hölder space of exponent `1-n/p` ([`TauCeti.W1p.morreyEmbedding`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/W1p/HolderEmbedding.html#TauCeti.W1p.morreyEmbedding)).
- **Interior `H²` regularity** — an `H¹` weak solution with `L²` forcing has a second-order weak derivative locally when its uniformly elliptic principal matrix is constant and its lower-order coefficients are bounded ([`TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Regularity/Interior.html#TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL)).
- **Weak Dirichlet existence and uniqueness** — a bounded coercive energy form on `H¹₀(Ω)` yields exactly one weak solution for each `L²` forcing ([`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/DirichletProblem.html#TauCeti.PDE.existsUnique_isWeakSolutionDirichlet)). The compact solution operator also gives a Dirichlet eigenfunction basis for symmetric forms ([`TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/Spectrum.html#TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue)).

### Notable definitions and infrastructure

- [`TauCeti.Wkp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Sobolev/Wkp/Basic.html#TauCeti.Wkp) supplies complete, weak-derivative Sobolev spaces of arbitrary order on open domains, so energy forms and local regularity can use actual domain spaces.
- [`TauCeti.C2HolderSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Holder/Two.html#TauCeti.C2HolderSpace) packages bounded global `C^{2,α}` maps as a Banach space, a target for later Schauder theory.
- [`TauCeti.planarGreenKernelDisk`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/GreenFunction/Disk.html#TauCeti.planarGreenKernelDisk) gives the disk kernel its harmonicity away from the pole and zero boundary values; its normal derivative is related to the Poisson kernel ([`TauCeti.fderiv_planarGreenKernelDisk_normal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PDE/GreenFunction/Poisson.html#TauCeti.fderiv_planarGreenKernelDisk_normal)).

### Roadmap coverage

Lane A is partial: weak Sobolev spaces, zero-boundary density on the whole space, zero-boundary Rellich, local compactness, global Morrey embedding and global Hölder Banach spaces are present; Meyers–Serrin density on domains, trace and extension, Bessel-scale agreement, the borderline embedding and full-space Rellich remain. Lane B is partial: maximal bounds and Marcinkiewicz interpolation are present, but Riesz–Thorin, Calderón–Zygmund and BMO are not established here. Lane C is partial: mean values, classical maximum principles, harmonic Harnack, Hopf's ball lemma, the Newtonian identity in dimensions at least three and planar disk Green kernels are present; general elliptic Harnack, general Green functions and Perron's method remain. Lane D is done through weak existence, the Fredholm alternative and Dirichlet spectral theory. Lane E is partial: constant-principal-part interior `H²` and measurable-coefficient Caccioppoli estimates are present; higher regularity, Schauder and De Giorgi–Nash–Moser remain. Lane F is untouched.

## The frontier

- **Meyers–Serrin density.** Turn local mollification convergence for Sobolev jets into smooth approximation throughout `W^{k,p}(Ω)`; the present approximation statements stop on interior subdomains.
- **Trace and extension.** Construct a trace with kernel `W^{1,p}_0(Ω)` and an extension operator under an explicit Lipschitz boundary condition, then extend compactness beyond the zero-boundary or local forms.
- **Measurable-coefficient regularity.** Build iteration from the truncation Caccioppoli bounds to local boundedness and Hölder continuity of weak solutions; current interior `H²` uses a constant principal matrix.
- **Calderón–Zygmund estimates.** Add the decomposition and singular-integral bounds needed for `W^{2,p}` theory, together with the remaining interpolation and BMO endpoints.
- **Potential theory beyond model domains.** Generalize the disk Green-kernel construction and prove the barrier and boundary-attainment statements needed for Perron's method; harmonic Harnack does not yet give the elliptic-operator version.
