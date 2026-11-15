<!--tauceti-status:v1 {"roadmap":"ConformalMappingPartII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the local initial-value theorem, continuation of solutions, global solutions, meromorphic local bases and pole clearing (0.2-0.6)","state":"partial"},{"id":"Layer 1","remaining":"surface uniformization of the analytic universal cover, pointed covers and the conformal radius","state":"untouched"},{"id":"Layer 2","remaining":"the Schwarzian ODE, Hempel's accessory parameters and the roots-cover Schwarzian and linear equation (2.4-2.9)","state":"partial"},{"id":"Layer 3","remaining":"the Herglotz formulas, the quotient phase, radial smoothing and Nevanlinna's quotient representation (3.3-3.8)","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"8a0597ed3a54f07a93226e8754a0069e82418373da6d2649a1b2d74757f36809","roadmap":"ConformalMappingPartII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ConformalMappingPartII

This file documents the status of the ConformalMappingPartII roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has only begun. Its opening definitions are in place: the Schwarzian derivative with its transformation rules, finite Blaschke products, and the setting of complex linear differential equations. Neither summit is close (the Gamma formula for the conformal radius of the roots-of-unity cover, and the uniform circle-mean bound). Nothing has landed for analytic universal covers or for Layers 4 to 9.

### Named results

- **The Schwarzian chain rule** — S(f∘g) = (S(f)∘g)·g′² + S(g) wherever g is holomorphic and f is locally univalent at g(x): [`TauCeti.schwarzian_comp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Schwarzian.html#TauCeti.schwarzian_comp).
- **Möbius invariance of the Schwarzian** — postcomposing with a Möbius map of nonzero determinant leaves the Schwarzian unchanged wherever the denominator is nonzero. This is why branches of an inverse covering will share one Schwarzian: [`TauCeti.schwarzian_moebius`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Schwarzian.html#TauCeti.schwarzian_moebius).
- **The disc-mapping criterion for Blaschke products** — a finite Blaschke product sends the open disc strictly inside itself exactly when some interior zero has positive multiplicity, and it has modulus one on the circle: [`TauCeti.norm_blaschkeProduct_lt_one_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/BlaschkeProduct.html#TauCeti.norm_blaschkeProduct_lt_one_iff).
- **Scalar equations and companion systems** — a holomorphic function solves a monic order-n equation exactly when its vector of unscaled derivatives solves the companion first-order system: [`TauCeti.LinearEquation.isSolution_iff_isCompanionSolution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/Complex/LinearEquation.html#TauCeti.LinearEquation.isSolution_iff_isCompanionSolution).

### Notable definitions and infrastructure

- [`TauCeti.schwarzian`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Schwarzian.html#TauCeti.schwarzian) is defined everywhere, with value zero at critical points. It comes with the pre-Schwarzian form and explicit values for affine maps and integer powers. These give the sign and factor checks the inverse-covering equation will need.
- [`TauCeti.blaschkeFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/BlaschkeProduct.html#TauCeti.blaschkeFactor) follows the roadmap's convention that a parameter on the unit circle gives the constant −a. This lets boundary zeros be divided out before the Herglotz formula is applied. On the disc it agrees with the existing disc automorphisms.
- [`TauCeti.LinearEquation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/Complex/LinearEquation.html#TauCeti.LinearEquation) packages an equation with its solution subspace of holomorphic functions and its unscaled initial-jet map. This is the carrier on which the initial-value and continuation theorems are to be built.

### Roadmap coverage

Three layers are partial. Each has its first one or two milestones done. In Layer 0, the equation, solution predicate, initial jets and companion correspondence (0.1) are done. The local initial-value theorem, continuation, global solutions and meromorphic local bases (0.2–0.6) are open. In Layer 2, the Schwarzian, its chain rule and Möbius invariance (2.1–2.3) are done. The Schwarzian differential equation, Hempel's accessory parameters and the roots-cover equation (2.4–2.9) are open. In Layer 3, boundary-compatible Blaschke factors and finite products (3.1–3.2) are done. The Herglotz formulas and Nevanlinna's quotient representation (3.3–3.8) are open. Layer 1 (universal covers and the pointed radius) and Layers 4 through 9 are untouched.

## The frontier

- **The analytic linear initial-value theorem (0.2)** — show that the initial-jet map on solution germs is a linear equivalence with ℂⁿ, consuming the supplied local disc existence theorem. Continuation (0.3) and global solutions on simply connected domains (0.4) come after it.
- **The Schwarzian differential equation (2.4)** — w is a quotient of solutions of y″ + ½S(w)y = 0, and conversely. This needs 0.2 and an analytic square root of w′.
- **The Herglotz representation of a normalized logarithm (3.3)** — the first step toward Nevanlinna's quotient representation (3.7). It needs only the existing Herglotz–Riesz circle-average results and the supplied logarithm branches.
- **Hyperbolic uniformization of the cover (1.1)** — the largest prerequisite in the roadmap. It needs surface Perron, Dirichlet and Green-function theory, and everything from 1.2 onward, Hempel's formula (2.5) and Layers 4–9 depend on it.
- **Optimality of the quotient bound (3.8)** — independent of the rest of Layer 3, resting only on Mathlib's proximity function and the circle-average of log-norms.
