<!--tauceti-status:v1 {"roadmap":"BordismFormalGroups","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: BordismFormalGroups

This file documents the status of the BordismFormalGroups roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the formal-group algebra of F1 has begun. Its multiplication series, invariant differential and rational logarithm were already in place; the Lazard ring with its universal property, the integral Lazard cocycle and the formal inverse have now been added. Lazard's polynomial theorem, strict coordinate changes, the characteristic-two logarithm and height are open, and nothing from F2 (Quillen's theorem) onward has started.

### Named results

- **The universal property of the Lazard ring** — ring homomorphisms L → R correspond naturally to commutative formal group laws over R, by base change of the universal law ([`LazardRing.lift`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing.html#TauCeti.LazardRing.lift), with naturality in [`LazardRing.lift_map`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing.html#TauCeti.LazardRing.lift_map)).
- **Faithfulness of the Lazard cocycle** — for n ≥ 2, r • Cₙ = 0 only when r = 0, over every commutative ring including those with torsion ([`smul_lazardCocycle_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/SymmetricCocycle.html#TauCeti.smul_lazardCocycle_eq_zero_iff)); it rests on dₙ being p for n = pᵏ and 1 otherwise ([`lazardGcd_eq_minFac_of_isPrimePow`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/SymmetricCocycle.html#TauCeti.lazardGcd_eq_minFac_of_isPrimePow)).
- **Multiplication by n scales the invariant differential** — P([n]_F(T)) · [n]_F′(T) = n · P(T) for a commutative formal group law, Silverman IV.4.3 ([`subst_nsmulSeries_invariantDifferential_mul_derivative`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/NSMul/Basic.html#FormalGroup.subst_nsmulSeries_invariantDifferential_mul_derivative)).
- **The formal inverse** — each formal group law has a unique series i(X) with F(i(X), X) = 0 = F(X, i(X)), and i is an involution ([`subst_addInvX_X_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/AddInv.html#FormalGroup.subst_addInvX_X_eq_zero), [`eq_addInvX_iff_subst_left_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/AddInv.html#FormalGroup.eq_addInvX_iff_subst_left_eq_zero)).
- **The logarithm of the multiplicative group** — over a ℚ-algebra the logarithm of X + Y + XY is log(1 + T) and its exponential is eᵀ − 1 ([`log_𝔾ₘ`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Logarithm.html#FormalGroup.log_𝔾ₘ), [`exp_𝔾ₘ`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Logarithm.html#FormalGroup.exp_𝔾ₘ)).

### Notable definitions and infrastructure

- **The Lazard ring** [`LazardRing`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing.html#TauCeti.LazardRing) and its [universal formal group law](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing.html#TauCeti.LazardRing.formalGroup), as ℤ[aᵢⱼ] modulo the associativity and commutativity relations. Everything in F2 is phrased as a map out of this ring.
- **The Lazard 2-cocycle** [`lazardCocycle`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/SymmetricCocycle.html#TauCeti.lazardCocycle) Cₙ = ((X+Y)ⁿ − Xⁿ − Yⁿ)/dₙ, an integral symmetric homogeneous cocycle stable under change of coefficients. The README uses it in two places: the polynomial theorem and the characteristic-two logarithm.
- **The group of points** of a formal group law, with negation given by the formal inverse [`addInvX`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/AddInv.html#FormalGroup.addInvX). For now this covers only power-series points; the topologically nilpotent carrier the README asks for is not yet built.

### Roadmap coverage

F1 is partial. Done: the multiplication series and its base change; the invariant differential; the ℚ-algebra logarithm and exponential, with the 𝔾ₐ and 𝔾ₘ examples; the formal inverse; base change of formal group laws; the ungraded Lazard ring with its universal property; and the definition and divisibility facts of Cₙ. Not done: the uniqueness half of the cocycle lemma; the graded Lazard ring and L ≅ ℤ[x₁, x₂, …]; formal-group morphisms, isomorphisms and strict coordinate changes with the L[b₁, b₂, …] Hopf algebroid; the characteristic-two exponent-two logarithm; points over topologically nilpotent elements; height and its classification. F2 through F6, which cover Quillen's theorem, p-typical and Brown–Peterson theories, the comodule and Adams–Novikov machinery, Landweber exactness, chromatic localization and torus Euler cancellation, are untouched in the source.

## The frontier

- **Symmetric cocycle lemma** — prove that every normalized symmetric additive 2-cocycle of degree n ≥ 2 over any commutative ring is a unique multiple of Cₙ. The existence and faithfulness halves are in place.
- **Lazard's polynomial theorem** — grade L, construct explicit generators xₙ in degree 2n and prove L ≅ ℤ[x₁, x₂, …] by the cocycle lemma and an integral independence argument.
- **Formal-group morphisms and strict isomorphisms** — build `FormalGroupHom`/`FormalGroupIso` in the shape of the cited Mathlib designs, then the bundled strict isomorphism of a ℚ-algebra formal group with 𝔾ₐ via its logarithm, and the representing ring L[b₁, b₂, …] for strict coordinate changes.
- **Characteristic-two logarithm** — for 2 = 0 and [2]_F = 0, construct the normalized strict logarithm with a_(2ᵏ−1) = 0. This needs the cocycle lemma and the description of additive series as Σ bⱼ X^(2ʲ).
- **Height** — define height from the p-series over characteristic-p fields, prove it does not depend on coordinates, and classify formal groups over separably closed fields by height. Formal-group morphisms come first.
