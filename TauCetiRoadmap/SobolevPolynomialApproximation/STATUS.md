<!--tauceti-status:v1 {"roadmap":"SobolevPolynomialApproximation","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"contractions, seminorms, change of exponent, bundled directional derivative, polynomial classes and Poincare lemma, top-seminorm kernel, quotient","state":"partial"},{"id":"Layer 2","remaining":"the p = infinity case of 2.1, affine scaling of seminorms (2.2) and the geometric bounds (2.3)","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"Bramble-Hilbert with explicit constants, its sublinear and bilinear forms, and Deny-Lions","state":"partial"},{"id":"Layer 5","remaining":"the embedding with explicit constants on star-shaped domains; Lipschitz-domain analogues exist","state":"untouched"}],"readme_sha":"6aab4b8fa997d7ca84e266e23f927f49566295c70db5fbd8199c1d171cabe6b5","roadmap":"SobolevPolynomialApproximation","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: SobolevPolynomialApproximation

This file documents the status of the SobolevPolynomialApproximation roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. Of its own milestones only the bounded-degree polynomial space of Layer 1 (§1.2) is in place. Two milestones in later layers are already met by existing Tau Ceti results under other names: the order-`k` change of variables for `p < ∞` and Rellich–Kondrachov in `W^{k,p}` on bounded Lipschitz domains. The averaged Taylor polynomial, Bramble–Hilbert, Deny–Lions and the star-shaped embedding have not begun.

### Named results

- **The dimension of polynomials of bounded degree.** The real polynomial functions of total degree at most `m` in `n` variables form a space of dimension `(m + n).choose n` ([`finrank_polynomialsDegLE`](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.finrank_polynomialsDegLE)). This is the finite-dimensionality that the quotient of §1.8 and the compactness argument behind Deny–Lions will rely on.
- **Change of variables in `W^{k,p}`.** Existing Tau Ceti work already shows that, for `p < ∞`, precomposition with a `Cᵏ` map that has bounded derivatives and Jacobian bounded below is a bounded operator on `W^{k,p}` with an explicit norm bound (`TauCeti.Wkp.compL`). This is the finite-exponent case of §2.1, with a Jacobian hypothesis in place of the README's inverse map.
- **Rellich–Kondrachov in every order.** On a bounded Lipschitz domain, dropping the top derivative is a compact operator `W^{k+1,p} → W^{k,p}` for every `k` and every `1 ≤ p ≤ ∞` (`TauCeti.Wkp.isCompactOperator_lowerOrderL_of_isLipschitzDomainWith`). This is the content of §4.3, for domains presented in the `ℝ × E` chart form.

### Notable definitions and infrastructure

- **The polynomial function space** [`polynomialsDegLE`](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.polynomialsDegLE), the image of the formal bounded-degree polynomials under [evaluation](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.polynomialEvalₗ). The averaged Taylor polynomial will take its values here, and polynomial approximation will be measured against it.
- **The identification with formal polynomials**, [`restrictTotalDegreeEquivPolynomialsDegLE`](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.restrictTotalDegreeEquivPolynomialsDegLE). It follows from injectivity of evaluation and lets the purely algebraic polynomial Poincaré lemma of §1.6 be transferred to functions.

### Roadmap coverage

Layer 1 is partial. §1.2 is done, for any finite coordinate type. Contractions, truncation and seminorms, change of exponent, the bundled directional derivative, the Sobolev classes of polynomials, the polynomial Poincaré lemma, the kernel of the top seminorm and the quotient are all missing. Layer 2 is partial. §2.1 holds for `p < ∞` through the existing `W^{k,p}` change of variables, but `p = ∞`, affine scaling (§2.2) and the geometric bounds (§2.3) are missing. Layer 3 is untouched. Layer 4 is partial: higher-order Rellich (§4.3) is available, but Bramble–Hilbert, its functional forms and Deny–Lions are not. Layer 5 is untouched for the star-shaped domains it concerns. Tau Ceti already has a Morrey embedding and density of functions smooth up to the boundary on bounded Lipschitz domains, but neither gives the explicit constants in `diam Ω / ρ` that §5.1 asks for.

## The frontier

- **Sobolev classes of polynomials and the polynomial Poincaré lemma (§1.6).** The map from polynomials into `W^{k,p}(Ω)` on bounded `Ω` is needed, along with the algebraic lemma that a closed family of polynomials of degree at most `m` has a degree-`m+1` potential, via homogeneous components and Euler's identity. Both now have their target space.
- **Truncation, seminorms and the bundled directional derivative (§1.3, §1.5).** These are the API every later layer is stated in. Tau Ceti already supplies the directional weak derivatives and their symmetry, so this is bundling and bookkeeping.
- **Kernel of the top seminorm (§1.7).** On a preconnected domain, `|u|_{m+1,p} = 0` exactly for polynomials of degree at most `m`. This is an induction from the constant-on-connected lemma once §1.5 and §1.6 exist.
- **Affine scaling (§2.2–§2.3).** This specialises the existing change of variables to affine maps order by order, with the `p = ∞` case still to be handled.
- **The averaged Taylor polynomial (§3.3).** It opens Layer 3 and, through the representation formula, Bramble–Hilbert. It needs §1.2, now done, and the star-shaped preliminaries of §3.1.
