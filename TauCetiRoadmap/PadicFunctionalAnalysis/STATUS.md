<!--tauceti-status:v1 {"roadmap":"PadicFunctionalAnalysis","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"logarithmic gauge, adapted norm for non-contractive actions, residue module M0/piM0, ring-norm power comparisons","state":"partial"},{"id":"Layer 1","remaining":"finite Banach modules over Noetherian Tate rings (1.4) and discretely valued orthogonal bases (1.3)","state":"partial"},{"id":"Layer 2","remaining":"Serre's theorem, countable-type splitting and complements, finite-coordinate detection exists_finset_norm_le","state":"partial"},{"id":"Layer 3","remaining":"Mahler coefficients of characters, Stirling formulas, van der Put to Mahler change of coordinates, convolution compatibility","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"25034d7df4c77b5b6a301186aac79e1740adcc642a8042befdba23e1bb91017f","roadmap":"PadicFunctionalAnalysis","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: PadicFunctionalAnalysis

This file documents the status of the PadicFunctionalAnalysis roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Banach–Tate operator theory of Layer 1 and most of the model-space and basis theory of Layer 2 are in place, and Layer 3 has Mahler duality, van der Put coordinates and the `φ, ψ` operators on measures. Layers 0 to 3 are each partial: Serre's theorem, countable-type splitting and finite Banach modules are still missing. Layers 4 and 5, analytic stages and characters, have not begun.

### Named results

- **The quantitative open mapping theorem over Tate rings** — a continuous surjection between complete ultrametric modules over a Banach–Tate ring lifts each vector with norm at most a fixed constant times its own; the bounded inverse, closed graph and Banach–Steinhaus theorems are proved alongside it ([`ContinuousLinearMap.exists_preimage_norm_le_of_isTate`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/RingOpNorm/OpenMapping.html#ContinuousLinearMap.exists_preimage_norm_le_of_isTate)).
- **Orthonormal bases are model isometries** — over a complete ring, a complete ultrametric module with contractive action has an orthonormal basis indexed by `I` exactly when it is linearly isometric to `C₀(I, R)` ([`TauCeti.exists_isOrthonormalBasis_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/Orthonormal.html#TauCeti.exists_isOrthonormalBasis_iff)).
- **`t`-orthogonal bases for spaces of countable type** — over any complete nontrivially normed field, a space with a dense countable spanning set has a `t`-orthogonal basis for every `t < 1`, with no discrete-valuation hypothesis ([`TauCeti.exists_isTOrthogonalBasis_of_dense_span`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/CountableType.html#TauCeti.exists_isTOrthogonalBasis_of_dense_span)).
- **Van der Put's theorem** — continuous functions on `ℤ_p` with values in a complete ultrametric group are isometric to null sequences through their van der Put coefficients ([`PadicInt.vanDerPutEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/VanDerPut.html#PadicInt.vanDerPutEquiv)).
- **Mahler duality for bounded measures** — over a complete `ℚ_p`-field, the norm of a measure on `ℤ_p` is the supremum of its Amice coefficients, and the Amice transforms are exactly the series with bounded coefficients ([`AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff), [`AbstractMeasure.mem_range_amiceTransform_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.mem_range_amiceTransform_iff)).

### Notable definitions and infrastructure

- **Multiplicative pseudo-uniformisers** ([`TauCeti.NormedRing.PseudoUniformizer`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Ring/PseudoUniformizer.html#TauCeti.NormedRing.PseudoUniformizer)) supply the exact scaling and shell arguments behind every quantitative estimate, and an instance shows that a ring with one is a Tate ring in the topological Huber sense.
- **The operator norm over ring scalars** ([`ContinuousLinearMap.ringOpNorm`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/RingOpNorm.html#ContinuousLinearMap.ringOpNorm)) agrees with Mathlib's norm over fields and makes the endomorphisms a complete Banach ring with Neumann inversion, so operator theory works over Banach–Tate coefficient rings.
- **The universal property of `C₀(I, R)`** ([`ZeroAtInftyContinuousMap.linearCombinationEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/ContinuousMap/ZeroAtInfty/LinearCombination.html#ZeroAtInftyContinuousMap.linearCombinationEquiv)) identifies bounded families with continuous maps out of the model space, isometrically. The matrix calculus, the duality with `ℓ∞` and property (Pr) are built on it.

### Roadmap coverage

Layer 0 is partial: null-family estimates, bilinear Cauchy products, the unit ball and its open-ball ideal with the Neumann estimates, rounding to `c^ℤ`, and the Tate gauge with its scaling, topology and base-change laws are done. The logarithmic gauge, the adapted norm for non-contractive actions, the residue module `M⁰/πM⁰` and the ring-norm power comparisons are not. Layer 1 is partial: operator norms and the mapping theorems (§1.1–1.2) are done, but finite Banach modules over Noetherian Tate rings (§1.4) and the discretely valued orthogonal bases of §1.3 are not. Layer 2 has the model space, `t`-orthogonal and orthonormal bases, (Pr), `ℓ∞` duality, matrices and triangular perturbations. Serre's theorem (§2.3), countable-type splitting (§2.4) and finite-coordinate detection (§2.6) are missing. Layer 3 has the scalar-linear Mahler isometry, van der Put coordinates, Mahler duality, the integral dual unit ball and `φ, ψ`. Mahler coefficients of characters, Stirling formulas, the van der Put to Mahler change of coordinates and convolution compatibility remain. Layers 4 and 5 are untouched.

## The frontier

- **Serre's orthonormalisation theorem** (§2.3): lifts of a residue basis form an orthonormal basis. Rounding of norms and exact pseudo-uniformiser scaling are ready; the residue module `M⁰/πM⁰` from §0.3 has to come first.
- **Countable-type splitting** (§2.4): `exists_continuousLinearEquiv_prod_of_countableType` still needs countable type for closed subspaces and quotients, and continuous complements, on top of the existing `t`-orthogonal bases. AdicSpacesPartIII consumes this result.
- **Finite Banach modules and finite-coordinate detection** (§1.4, §2.6): the canonical topology on finite modules over a Noetherian Banach–Tate ring, then `exists_finset_norm_le` for closed finite submodules of `C₀(I, R)`.
- **The rest of Layer 3**: Mahler coefficients `(χ(1) − 1)^n` of additive characters and the converse `x ↦ (1+t)^x`, bounded changes between van der Put and Mahler coordinates, and compatibility of the integral Amice equivalence with convolution.
- **Analytic stages and Amice's basis theorem** (Layer 4): the triangular perturbation lemma it relies on is in place. The stage carriers rest on the RestrictedPowerSeries supplier.
