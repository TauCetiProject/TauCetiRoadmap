<!--tauceti-status:v1 {"roadmap":"Hyperfunctions","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: Hyperfunctions

This file documents the status of the Hyperfunctions roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations exist. HF0 has a working theory of closed-support cohomology for sheaves of abelian groups. HF1 has the one-dimensional hyperfunction quotient as a separated presheaf with surjective restrictions, but no gluing yet. Purity, flabbiness, compact duality, analytic operations, microfunctions, the distribution embedding and extension (HF2 through HF5) have not begun.

### Named results

- **Excision for cohomology with supports**: if W' ⊆ W and S ∩ W ⊆ W', restriction is an isomorphism H_Sⁿ(W, F) ≃ H_Sⁿ(W', F) in every degree. It is proved by showing that the map of relative free sheaves is already an isomorphism ([`supportedHExcisionEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedHExcisionEquiv)).
- **The long exact sequence of a pair**: for an inclusion U ⊆ V, relative cohomology sits in the exact sequence ⋯ → Hⁿ(V, U; F) → Hⁿ(V, F) → Hⁿ(U, F) → Hⁿ⁺¹(V, U; F) → ⋯. With U = W ∖ S this is the support sequence (`exact_toH'_cohomologyPresheaf_map`, `exact_δ_toH'`).
- **Flasque sheaves have no relative cohomology**: a flasque sheaf has vanishing relative cohomology in positive degrees for every inclusion of opens, so supported cohomology can be computed by flasque resolutions (`subsingleton_succ_of_isFlasque`).
- **One-dimensional hyperfunctions form a separated presheaf**: a class in O(ℂ ∖ ℝ)/O(W(U)) that vanishes on each member of an open cover vanishes ([`oneDimBoundaryPresheaf_isSeparated`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.oneDimBoundaryPresheaf_isSeparated)). The input is that a function on ℂ ∖ ℝ extends holomorphically across a union of real opens exactly when it extends across each one ([`throughReal_iSup`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.throughReal_iSup)).

### Notable definitions and infrastructure

- **Cohomology with closed supports** [`supportedH`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedH) is defined as Ext out of the relative free sheaf ℤ_{W, W ∖ S}, following the roadmap's Q_S recipe. In degree zero it is the supported sections, and it is functorial in W through [`supportedHPresheaf`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedHPresheaf). Sheafifying that presheaf gives the local cohomology sheaves 𝓗_Sⁿ.
- **Sheaf cohomology as Ext from free sheaves** (`H'AddEquivExt`) identifies Mathlib's Hⁿ(U, F) with Ext from the free abelian sheaf on U. This is what lets relative and supported cohomology be compared with the ordinary groups.
- **The one-dimensional boundary quotient** [`OneDimBoundaryQuotient`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.OneDimBoundaryQuotient) is O(ℂ ∖ ℝ)/O(W(U)) with W(U) = ℂ ∖ (ℝ ∖ U), the explicit dimension-one model the roadmap asks for. Holomorphic functions are encoded by extension by zero.

### Roadmap coverage

HF0 is partial. It has the supported-section functor, supported cohomology as Ext from the relative free sheaf, the support sequence, excision and flasque acyclicity, all for abelian-group coefficients. Still missing from HF0 are the `ModuleCat ℂ` version, the sheaves 𝓗_S^q, the comparison with derived functors, the edge and support-truncation comparisons, the sequences for open triples, the Dolbeault relative cone, the orientation sheaf and FlasqueLocality. HF1 is partial only in its dimension-one part: the quotient presheaf is separated, but gluing, the comparison with the native holomorphic structure sheaf and every higher-dimensional and bundle construction are absent. HF2 (including its analytic preparation, HF2.1, HF2.2 and HF2.3), HF3, HF3a, HF4 and HF5 are untouched.

## The frontier

- **Gluing for one-dimensional hyperfunctions**: prove the existence half of the sheaf condition for `oneDimBoundaryPresheaf`. This needs H¹(U, O) = 0 for open U ⊆ ℂ (a Cousin problem), which the roadmap assigns to GlobalHolomorphicFunctions GH0.
- **Local cohomology sheaves**: sheafify the supported-cohomology presheaf to get 𝓗_S^q(F), then prove the support-truncation implication and the degenerate edge comparison that purity will use.
- **Complex-module coefficients**: build the same supported theory for `TopCat.Sheaf (ModuleCat ℂ)` and compare it with the underlying abelian groups, as the roadmap requires for both coefficient categories.
- **FlasqueLocality**: show that local surjectivity of restrictions implies global surjectivity, by a Zorn argument on extensions of a section. This is self-contained and HF2.2 needs it.
- **Orientation sheaf and relative Dolbeault cone**: define or_(M/X) = 𝓗_Mⁿ(ℤ_X) and the signed cone of Dolbeault resolutions. Both depend on the sheaves above, and the cone also needs K2's Dolbeault resolution.
