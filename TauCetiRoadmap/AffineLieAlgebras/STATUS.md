<!--tauceti-status:v1 {"roadmap":"AffineLieAlgebras","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: AffineLieAlgebras

This file documents the status of the AffineLieAlgebras roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only foundations exist so far. The finite-dimensional inputs to the A1 classification are proved: the Whitehead lemmas, the fact that invariant forms are multiples of the Killing form, and the polynomial mode recurrence. So are the first carriers for formal currents, the residue pairing and smooth modules. Nothing from the affine extension ĝκ onward has begun, and neither headline theorem has been started: the scalar center away from critical level and Feigin–Frenkel.

### Named results

- **Whitehead's second lemma**: over a field of characteristic zero, for a finite-dimensional Lie algebra with nondegenerate Killing form, every 2-cocycle valued in a finite-dimensional module is a coboundary ([`twoCocycle_eq_range_d₁₂`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Whitehead.html#LieModule.Cohomology.twoCocycle_eq_range_d₁₂)). It is proved through Levi's theorem for an abelian ideal.
- **Whitehead's first lemma**: under the same hypotheses every Lie derivation into a finite-dimensional module is inner ([`IsKilling.exists_eq_inner`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Whitehead.html#LieDerivation.IsKilling.exists_eq_inner)). It is proved by Weyl's theorem applied to a sheared module.
- **Uniqueness of invariant forms**: on a finite-dimensional Lie algebra over an algebraically closed field with irreducible adjoint module and nondegenerate Killing form, every invariant bilinear form is a multiple of the Killing form ([`exists_eq_smul_killingForm`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Killing/InvariantForm.html#TauCeti.LieAlgebra.exists_eq_smul_killingForm)). The intrinsic h∨ and the identity Killing = 2h∨κ0 are not yet there.
- **Residue cocycles on polynomial loops**: for such a Lie algebra, a trivial-coefficient 2-cocycle on the polynomial loop algebra is a multiple of the Killing residue cocycle exactly when it vanishes on constant loops ([`exists_eq_smul_twoCocycleOfBilinear_killingForm_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Loop/Cocycle.html#TauCeti.LieAlgebra.LoopAlgebra.exists_eq_smul_twoCocycleOfBilinear_killingForm_iff)).

### Notable definitions and infrastructure

- **Formal currents** ([`currentAlgebra`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Basic.html#TauCeti.currentAlgebra)): the base change 𝕜((t)) ⊗ L. It has coefficient extensionality over free L, an order filtration with [a_M, a_N] ⊆ a_(M+N), truncation, and an injective polynomial embedding. These are the carriers for every later current statement. It has no topology yet, so completeness and continuity of the bracket remain open.
- **The Laurent residue pairing** ([`residuePairing`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/ResiduePairing.html#LaurentSeries.residuePairing)): Res(f dg), proved alternating and jointly continuous for the valuation topology, with integration by parts and the cyclic identity behind the cocycle law. Coordinate invariance is still missing.
- **Smooth and discrete modules** ([`smoothModules`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Smooth/Basic.html#TauCeti.smoothModules)): these are object properties on `ModuleCat A`. The smooth ones are equal to the discrete ones when the ideals form a neighbourhood basis, and they are closed under subobjects, quotients, colimits, finite limits and suitable restriction of scalars. This is the start of A5's category adapters.

### Roadmap coverage

A1 is partial. Its finite-dimensional inputs are proved: the Whitehead lemmas in degrees one and two, uniqueness of invariant forms, and the polynomial mode recurrence. The carriers for currents and the residue pairing are in place. Still missing are the current topology, continuous cochains and their cohomology, the mode-block adapters, the normalising coboundary, and the classification H²_cont(g((t)), Z) ≃ Z itself. A2 has only its "invariant forms are multiples of Killing" input. The extension ĝκ, perfectness, universality, h∨ and the loop lifts are untouched. A5 has its first adapter layer, the smooth and discrete object properties and their closure facts. Smooth parts, coinduction, enough injectives, central-character quotients, the completed center and field calculus are all absent. A3, A4, A6, A7 and A8 are untouched.

## The frontier

- **Polynomial H² classification**: build the mode-block coefficient modules so the Whitehead lemmas normalise an arbitrary loop cocycle to vanish on constant loops. Combined with the mode recurrence, this classifies central extensions of the polynomial loop algebra.
- **Current topology**: give formal currents the t-adic linear topology. Prove Hausdorffness, completeness, continuity of the bracket and density of polynomial currents, which is the prerequisite for every continuous statement in A1.
- **Continuous cohomology and the residue cocycle on currents**: define continuous cochains with discrete coefficients and prove the joint-continuity criterion. Extend the residue pairing to a continuous cocycle cκ on g((t)), and add the coordinate invariance the scalar pairing still lacks.
- **The extension ĝκ and h∨**: construct the central extension with its continuous section and prove perfectness exactly when κ ≠ 0. Define h∨ intrinsically and prove Killing = 2h∨κ0 using the invariant-form uniqueness already proved.
- **Smooth-part coreflection and coinduction**: give the smooth-vector right adjoint and continuous coinduction, which yield `EnoughInjectives` and Ext for the smooth module category.
