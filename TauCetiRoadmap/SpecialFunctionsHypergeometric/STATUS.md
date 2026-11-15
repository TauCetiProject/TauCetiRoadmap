<!--tauceti-status:v1 {"roadmap":"SpecialFunctionsHypergeometric","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"joint holomorphy in b and c, Euler integral equals the series on the disk, and all of 1.2-1.4 (definition, uniqueness, existence, analytic properties)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"2224246999dc740152d153b044e42e631bda3a2b5c863b95003a37b6f17200a7","roadmap":"SpecialFunctionsHypergeometric","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: SpecialFunctionsHypergeometric

This file documents the status of the SpecialFunctionsHypergeometric roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has only just begun: Euler's integral, the object that will define the principal branch of `𝐅`, is defined and its first analytic properties are proved. The Gauss function on the cut plane is not yet defined, and Layers 2–9 have not started.

### Notable definitions and infrastructure

- **Euler's normalized integral** — [`eulerIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.eulerIntegral) is `(Γ(b) Γ(c − b))⁻¹ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt` (DLMF 15.6.1). It is the base case of the planned contiguous-shift construction and the function that the definition of `𝐅` will extend.
- **Joint holomorphy in `(a, z)`** — [`analyticOnNhd_eulerIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.analyticOnNhd_eulerIntegral) proves the integral is holomorphic on `{1 − z ∈ slitPlane}` in `a` and `z` together, for fixed `0 < Re b < Re c`. With [integrability of the integrand](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.intervalIntegrable_eulerIntegrand) on the same region, this is the analytic half of 1.1.
- **The value at the origin** — [`eulerIntegral_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.eulerIntegral_zero) gives `Γ(c)⁻¹` at `z = 0` through the Beta integral, the first check that the normalization matches `𝐅`.

### Roadmap coverage

Layer 1 is partial. Its 1.1 is about half done: integrability and holomorphy in `(a, z)` are proved, but holomorphy in `b` and `c` and the agreement with Mathlib's `regularizedGaussHGFun` on the unit disk are not. Of 1.2–1.4, nothing has landed: the definition of `regularizedGaussHypergeometric`, uniqueness, the shift relations, the fixed-count construction and existence, the series and polynomial cases, and the analytic properties are all still open. Layers 2 through 9 are untouched. Every later layer reaches the cut plane through the definition in 1.2 and the identity principle in 1.4.

## The frontier

- **Holomorphy in all four variables (1.1)** — extend [`analyticOnNhd_eulerIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.analyticOnNhd_eulerIntegral) from `(a, z)` to `(a, b, c, z)` on `{0 < Re b < Re c} × {1 − z ∈ slitPlane}`. This needs a domination of `t^{b−1}(1 − t)^{c−b−1}` that is locally uniform in `b` and `c` near the endpoints.
- **Euler's integral equals the series on the disk (1.1)** — prove `eulerIntegral a b c z = regularizedGaussHGFun a b c z` for `‖z‖ < 1` by the binomial series and termwise Beta integrals. Everything proved from the series later depends on this.
- **The shift relations for `E` and the fixed-count construction (1.2)** — prove that Euler's integral satisfies the shift relations in `c` and `b`, then build `S_{p,q}` and prove that it is holomorphic and that different counts agree.
- **Uniqueness and the definition of `𝐅` (1.2)** — `IsEulerContinuation.eq`, which is two applications of the identity theorem in one variable, then `exists_isEulerContinuation` and `regularizedGaussHypergeometric_eq_eulerIntegral`.
- **The identity principle on the cut plane (1.4)** — the star-shapedness argument that carries identities from the disk to the cut plane. It does not depend on the definition of `𝐅`, so it can be done in parallel and is needed by Layers 2 and 3.
