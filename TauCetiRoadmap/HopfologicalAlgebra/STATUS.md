<!--tauceti-status:v1 {"roadmap":"HopfologicalAlgebra","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of a nonzero cointegral, hMod_abelian_isFrobenius, the modular character and Nakayama formula, the symmetric criterion","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"3148da6b92c1e53956d9f4c32d467fc6aae516aebcd048aae338d0e8b0f2d2e5","roadmap":"HopfologicalAlgebra","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: HopfologicalAlgebra

This file documents the status of the HopfologicalAlgebra roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the start of Layer 1 is in place. Integrals and cointegrals are defined, and the Larson–Sweedler consequences are proved *given* a nonzero cointegral, but no general theorem yet says that such a cointegral exists. Layers 2 through 8 have not begun: Hopf-module stable categories, smash products, the relative hopfological category, its derived localization, Grothendieck groups and the differential and cyclotomic examples.

### Named results

- **Invariant functionals are Frobenius** — on a finite-dimensional Hopf algebra over a field, a nonzero right (or left) invariant functional, that is, a right cointegral, is a Frobenius functional (`LinearMap.IsRightInvariantIntegral.isFrobeniusFunctional`). This is the conditional form of the roadmap's `isFrobeniusFunctional_of_isRightCointegral`.
- **Bijectivity of the antipode, conditionally** — the same hypothesis makes the antipode bijective, through the reconstruction formula from the normalized left integral (`LinearMap.IsRightInvariantIntegral.antipode_bijective`).
- **Integrals form a line** — whenever a Frobenius functional exists, the left and right integral spaces are each one-dimensional (`LinearMap.IsFrobeniusFunctional.finrank_leftIntegral`). The roadmap's unconditional `finrank_leftIntegral` still waits on the existence of a cointegral.
- **The antipode exchanges the two integral lines** — the antipode sends left integrals to right integrals and back with no hypothesis, and a [bijective antipode identifies the two submodules](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.integralAntipodeEquiv).
- **Group algebras are unimodular** — integrals of a group algebra are the elements with constant coefficients, so [left and right integrals coincide](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/MonoidAlgebra.html#MonoidAlgebra.leftIntegral_eq_rightIntegral) even for a noncommutative group. A finite group algebra has [nonzero integrals](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/MonoidAlgebra.html#MonoidAlgebra.leftIntegral_ne_bot) even when the group order vanishes in the coefficients.

### Notable definitions and infrastructure

- **Integral submodules** — the [left](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.leftIntegral) and [right](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#TauCeti.rightIntegral) integrals of a bialgebra over any commutative semiring. They include zero and impose no counit normalization, so the characteristic-two example `1 + g` in `k[C₂]` is admitted. [Bialgebra isomorphisms restrict to them](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/Integral/Basic.html#BialgEquiv.leftIntegralEquiv), which lets results proved for one presentation transfer to another.
- **Cointegrals** — the predicates `IsRightCointegral` and `IsLeftCointegral`, with their submodules. On a projective module they agree with the integral equations of the convolution algebra, as §1.1 asks.

### Roadmap coverage

Layer 1 is partial. Most of §1.1 is done: the definitions, transport along isomorphisms, the antipode comparison and cointegrals as convolution integrals. Its one-dimensionality result, and the Frobenius theorem and antipode bijectivity of §1.2, are proved only under the hypothesis that a nonzero cointegral exists. The Frobenius property of the category of all `H`-modules (`hMod_abelian_isFrobenius`), the modular character and Nakayama formula of §1.3, and the symmetric criterion of §1.4 are absent. Layers 2–8 are untouched.

## The frontier

- **Existence of a nonzero cointegral** — prove that every finite-dimensional Hopf algebra over a field has a nonzero right cointegral, the Larson–Sweedler input. With it, the existing conditional theorems become the roadmap's unconditional `finrank_leftIntegral`, `isFrobeniusFunctional_of_isRightCointegral` and `antipode_bijective`.
- **`hMod_abelian_isFrobenius`** — show that projective and injective modules coincide for *all* left `H`-modules, not only finitely generated ones. This is the input Layer 2's stable category needs.
- **Modular character and Nakayama automorphism** — define `α` from a nonzero left integral and prove `nakayamaAut_symm_eq_winding`. This needs a nonzero integral, so it sits behind the first item.
- **Symmetric criterion** — `symmetric_iff_unimodular_and_antipodeSquare_inner`. The group-algebra unimodularity above supplies one of its Checks.
- **Layer 2, the monoidal category of all `H`-modules** — extend the existing finite-dimensional `FiniteHopfModuleCat` to all modules and descend it to `H-StMod`. It depends on the Frobenius property above.
