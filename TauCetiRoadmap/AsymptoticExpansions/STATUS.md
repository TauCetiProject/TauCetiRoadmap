<!--tauceti-status:v1 {"roadmap":"AsymptoticExpansions","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2","ts":"2026-11-25T12:15:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"order-symbol examples 1.2, Poincare expansions 1.3, asymptotic power series 1.4, integration rules of 1.5, the checks of 1.1","state":"partial"},{"id":"Layer 2","remaining":"the resubstitution example 2.2 and Lagrange's reversion 2.3","state":"partial"},{"id":"Layer 3","remaining":"integration by parts 3.1, the logarithmic variant 3.4 and general kernels 3.5","state":"partial"},{"id":"Layer 4","remaining":"Watson's lemma in sectors, rotation of the path, inverse Laplace transforms and Haar's method","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"the cubic normal form of Chester, Friedman and Ursell (7.3)","state":"partial"},{"id":"Layer 8","remaining":"oscillatory tails of 8.3, Handelsman-Lew 8.4, Laplace transforms with a small parameter 8.5, exponential Mellin inversion 8.7","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"the logarithmic solution and Wronskian of 10.3 and the rank-one irregular singularity 10.4","state":"partial"},{"id":"Layer 11","remaining":"the left-end solution of 11.1, recessive and dominant solutions 11.2 and the Case I expansion 11.4","state":"partial"},{"id":"Layer 12","remaining":"actual solutions in the distinct and coincident characteristic-root cases 12.1-12.2","state":"partial"},{"id":"Layer 13","remaining":"Abel-Plana, the Euler-Maclaurin examples 2.10.3-2.10.7, entire power series 13.5 and Darboux's exceptional-point form 2.10.30","state":"partial"}],"readme_sha":"c81515f9055777eaa618c7bd9ce5871226fb86c58c7499514d09daab824b5051","roadmap":"AsymptoticExpansions","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2"}-->
# Status: AsymptoticExpansions

This file documents the status of the AsymptoticExpansions roadmap up until `58174b5` (2026-11-25T12:15:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Ten of the thirteen layers have results and none is complete. Watson's lemma on the real line, the full Volterra theorem, Borel–Ritt, Bleistein's uniform expansion and Euler–Maclaurin are proved. Laplace's method, stationary phase and the distributional methods (Layers 5, 6 and 9) have not begun.

### Named results

- **Watson's lemma** — DLMF 2.3.7–2.3.8 for a general sequence of exponents: if `q(t) − ∑_{s<N} c_s t^{α_s−1} = O(t^{Re α_N−1})` at `0+`, then `∫₀^∞ e^{−xt} q(t) dt ∼ ∑ Γ(α_s) c_s x^{−α_s}` as `x → +∞` ([`Asymptotics.hasAsymptoticExpansion_laplace`](https://taucetiproject.org/docs/TauCeti/Analysis/LaplaceTransform/Watson.html#Asymptotics.hasAsymptoticExpansion_laplace)). The sector version is still open.
- **The Volterra theorem** — Olver's integral equation `h(x) = ∫_x^∞ K(x, v)(J(v) + ψ(v)h(v)) dv` has exactly one `O(P)` solution, with the bound `PΦe^Ψ`, a derivative bound and the sharper `e^{P₀Φ} − 1` estimate ([`TauCeti.existsUnique_volterra_solution`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Volterra.html#TauCeti.existsUnique_volterra_solution)); the Liouville–Green theorem and the rank-one theory reduce to it.
- **The Liouville–Green theorem** — on `(a, ∞)`, `w″ = (f + g)w` has a solution `f^{−1/4} e^{−ξ}(1 + ε)` with `|ε|` and `½f^{−1/2}|ε′|` at most `exp(½V) − 1` ([`TauCeti.exists_liouvilleGreen_atTop`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Liouville/Green.html#TauCeti.exists_liouvilleGreen_atTop)). Only this end and this solution are covered.
- **Bleistein's uniform expansion** — DLMF 2.3.32 with an explicit remainder, for a Laplace integral whose minimum coalesces with the endpoint ([`TauCeti.norm_exp_smul_integral_bleistein_sub_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/UniformBound.html#TauCeti.norm_exp_smul_integral_bleistein_sub_le)).
- **The Borel–Ritt theorem** — every sequence is the expansion `∑ a_s z^{−s}` of a function holomorphic in a sector, and of more than one ([`Asymptotics.exists_hasAsymptoticExpansion_sector`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/BorelRitt.html#Asymptotics.exists_hasAsymptoticExpansion_sector)).

### Notable definitions and infrastructure

- **Asymptotic scales and expansions** ([`Asymptotics.HasAsymptoticExpansion`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/AsymptoticExpansion.html#Asymptotics.HasAsymptoticExpansion)) — the pinned notion, now the conclusion of Watson's lemma, the Fourier endpoint expansions, Borel–Ritt and the harmonic-sum expansion.
- **Continued Mellin transforms** ([`TauCeti.mellinContAtZero`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/Continued.html#TauCeti.mellinContAtZero)) — continue `mellin f` past the strip of convergence through an expansion of `f` at `0+` (and at `+∞`), with the principal parts identified. Handelsman–Lew and the small-parameter Laplace transforms of 8.4–8.5 are built on them.
- **Ordinary-point Taylor coefficients** ([`TauCeti.ordinaryPointCoeff`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Complex/OrdinaryPoint.html#TauCeti.ordinaryPointCoeff)) — the recursion for the solution of `w″ + fw′ + gw = 0`, with a Cauchy majorant giving convergence on the whole disc; the Frobenius series at a regular singularity uses the same method.

### Roadmap coverage

Layers 5, 6 and 9 are untouched; every other layer is partial:

- Layer 1 has 1.1, Ritt's theorem and termwise differentiation (1.5) and Borel–Ritt (1.6). It lacks the order-symbol checks 1.2, the Poincaré-expansion lemmas 1.3, the asymptotic power series of 1.4 (only finite-order expansions that add and multiply exist), and the integration rules of 1.5.
- Layer 2 has 2.1 only.
- Layer 3 has the Fourier endpoint expansions 3.2 and Watson's lemma 3.3, but not 3.1, 3.4 or 3.5.
- Layer 4 has the complex Gamma integral 4.1 only.
- Layer 7 lacks only the cubic normal form 7.3.
- Layer 8 has Parseval 8.1, the line shift 8.2, the continued transforms of 8.3 (not the oscillatory tails) and the Gamma bound 8.6; 8.4, 8.5 and 8.7 remain.
- Layer 10 has the Volterra theorem 10.1, ordinary points 10.2 and Fabry's transformation 10.5. Of 10.3 only the non-logarithmic Frobenius solution exists, and 10.4 is not begun.
- Layer 11 has the Liouville transformation 11.3 and the `(a, ∞)` half of 11.1.
- Layer 12 has the discrete Volterra estimates and the formal solutions of 12.1, but no solutions.
- Layer 13 has Euler–Maclaurin, the harmonic sums 2.10.8, summation by parts 13.4 and Darboux's method 2.10.29 and 2.10.31.

## The frontier

- **Watson's lemma in a sector (4.2)** — extend the real case to `|ph z| ≤ π/2 − δ`; the complex Gamma integral it needs is proved.
- **Laplace's method (5.1–5.2)** — the coefficients `b_s` and the real-line expansion. Watson's lemma, its main input, is now available.
- **Solutions of the difference equation (12.1)** — the formal solutions and the discrete Volterra estimates both exist; turning the formal series into actual solutions with the stated remainders is what remains.
- **The rest of the Liouville–Green theory (11.1–11.2, 11.4)** — the solution controlled at the left end on a general interval, recessive and dominant solutions, and the Case I expansion. All reduce to the now complete Volterra theorem.
- **Poincaré expansions and asymptotic power series (1.3–1.4)** — the characterization 2.1.15, convergent series as expansions, and reciprocals, composition and inversion in the expansion form. Lagrange's reversion 2.3 waits on these.
