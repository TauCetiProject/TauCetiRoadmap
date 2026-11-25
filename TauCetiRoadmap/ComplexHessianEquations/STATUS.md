<!--tauceti-status:v1 {"roadmap":"ComplexHessianEquations","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c","ts":"2026-11-25T06:54:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the C1 clause of Lewis's theorem and the trace inequality Re tr(AB) at least n(det A det B)^(1/n) with equality case","state":"partial"},{"id":"Layer 2","remaining":"generalized Newton-Maclaurin, hyperbolic polynomials and Garding's theorem, Hessian quotient concavity, admissible pairs and structural constants","state":"partial"},{"id":"Layer 3","remaining":"form identities and formPowIntegral, admissible functions and the equation, degenerating backgrounds, energy and entropy","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"0430375874cb73e3afe3aba8830f132f9155a85c290249b7bfab8d8d93a77a1b","roadmap":"ComplexHessianEquations","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c"}-->
# Status: ComplexHessianEquations

This file documents the status of the ComplexHessianEquations roadmap up until `0253c4f` (2026-11-25T06:54:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The pointwise spectral calculus of Layer 1 is essentially done, with only the `C¹` clause of Lewis's theorem and one trace inequality outstanding. Layers 2 and 3 have started: the inequalities for elementary symmetric functions, and the eigenvalue vector of `χ + i∂∂̄φ` relative to a Hermitian metric. Nothing has landed for the comparison principle, Yau's theorem, exponential integrability or the `L^∞` estimates (Layers 4–8).

### Named results

- **Lewis's theorem** — a spectral function `A ↦ f(λ(A))` of a symmetric `f` is differentiable at a Hermitian matrix exactly when `f` is differentiable at its sorted eigenvalue vector, with the gradient `U·diag(∂_i f(λ(A)))·U*` ([`differentiableAt_spectralFunction_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Eigenvalues/SpectralFunction.html#Matrix.differentiableAt_spectralFunction_iff), [`hasFDerivAt_spectralFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Eigenvalues/SpectralFunction.html#Matrix.hasFDerivAt_spectralFunction)).
- **Concavity of spectral functions** — a concave symmetric `f` on a convex permutation-invariant set gives a concave spectral function, proved by majorization through Ky Fan sums, with no differentiability or openness assumed ([`concaveOn_spectralFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SpectralFunction.html#Matrix.concaveOn_spectralFunction)); the tangent-plane form for `C¹` `f` is [`sub_le_fderiv_spectralFunction`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SpectralFunction/Tangent.html#Matrix.sub_le_fderiv_spectralFunction).
- **Differentiability of Ky Fan sums at a spectral gap** — the sum of the `m` largest eigenvalues is differentiable where `λ_m > λ_{m+1}`, with gradient the spectral projection ([`hasFDerivAt_prefixSum_eigenvalues₀`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Eigenvalues/KyFan.html#Matrix.hasFDerivAt_prefixSum_eigenvalues₀)).
- **The Newton and Maclaurin inequalities** — `S_{k−1}S_{k+1} ≤ S_k²` for the normalized elementary symmetric means, via polynomial Rolle, and `S_l^{1/l} ≤ S_k^{1/k}` when `σ_1, …, σ_l > 0` ([`esymm_div_choose_mul_esymm_div_choose_le_sq`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/Symmetric/NewtonMaclaurin.html#Multiset.esymm_div_choose_mul_esymm_div_choose_le_sq), [`esymm_div_choose_rpow_le_rpow`](https://taucetiproject.org/docs/TauCeti/Analysis/MeanInequalities.html#Multiset.esymm_div_choose_rpow_le_rpow)).
- **Monotonicity of spectral functions** — on an open `Γ` with `Γ + Γ_n ⊆ Γ`, spectral domains are upward closed in the Loewner order and elliptic spectral functions increase along it, strictly when the partial derivatives are positive ([`apply_eigenvalues_le_of_re_inner_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/SpectralFunction/Monotone.html#LinearMap.IsSymmetric.apply_eigenvalues_le_of_re_inner_le)).

### Notable definitions and infrastructure

- **The spectral gradient** [`spectralGradient`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Eigenvalues/SpectralGradient.html#Matrix.IsHermitian.spectralGradient) carries the identities Layer 2 and the `L^∞` estimates consume: its determinant is `∏ ∂_i f(λ)`, it is positive definite for elliptic `f`, and Euler's identity holds for homogeneous `f`.
- **The real (1,1)-form `i∂∂̄u`** [`ddbarForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/DdbarForm/Basic.html#TauCeti.ddbarForm), built from the Levi form, is continuous for `C²` `u` and agrees with `(1/2) d dᶜ u`, so the equation can be written for merely `C²` potentials.
- **Relative eigenvalue vectors** [`IsRelEigenvalueVector`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/RelativeEigenvalues/Vector.html#TauCeti.IsRelEigenvalueVector), with [`ddbarHermitianForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/DdbarHermitianForm.html#TauCeti.ddbarHermitianForm), give `λ_ω[χ + i∂∂̄φ]` at every point where `φ` is `C²`. This is the carrier on which `Suggested.lean` states the global theorems.

### Roadmap coverage

Layer 1 is partial. Relative eigenvalues (§1.1), Ky Fan sums (§1.2), Lewis's differentiability and gradient formula (§1.3), convexity, concavity, ellipticity and monotonicity (§1.4) are proved, as are the determinant and Euler identities of §1.5. The `C¹` clause of §1.3 is missing, and so is §1.5's trace inequality `Re tr(AB) ≥ n(det A·det B)^{1/n}` with its equality case. Layer 2 is partial: §2.1 is done except the generalized Newton–Maclaurin inequality, and §§2.2–2.5 (hyperbolic polynomials, Gårding cones, Hessian quotients, admissible pairs) are untouched. Layer 3 is partial: §3.1's `i∂∂̄`, pointwise relative eigenvalues and the trace identity are in, while the form identities, admissible functions and the equation itself (§§3.2–3.4) are not. Layers 4–8 are untouched.

## The frontier

- **The `C¹` clause of Lewis's theorem** — `F_f` is `C¹` on `Sym_Ω` exactly when `f` is `C¹` on `Ω`. What remains is the continuity of spectral projections onto eigenvalue clusters.
- **Gårding's theorem and `Γ(σ_k, e) = Γ_k`** — the definition of hyperbolic polynomials and their cones, then convexity of the cone and concavity of `p^{1/m}`. The polynomial Rolle and shift-expansion inputs are now in place. This unlocks the concavity of `σ_k^{1/k}` and of Hessian quotients.
- **Admissible pairs and structural constants** (§§2.4–2.5) — the `AdmissiblePair` structure and the Hessian constant `(binom(n, k)^{1/k}/n)^n`. These need Gårding's theorem and the §2.3 tangent inequality.
- **Form identities and the equation** (§§3.2–3.3) — `α^k ∧ ω^{n−k} = (k!(n−k)!/n!)·σ_k(λ[α])·ω^n`, the integral `formPowIntegral`, and the definition of normalized solutions.
- **The comparison principle and uniqueness** (Layer 4) — the monotonicity half of §1.4 is now available. The remaining prerequisite is the formulation of the equation from §3.3.
