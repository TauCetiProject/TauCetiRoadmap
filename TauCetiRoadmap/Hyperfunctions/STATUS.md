<!--tauceti-status:v1 {"roadmap":"Hyperfunctions","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: Hyperfunctions

This file documents the status of the Hyperfunctions roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** HF0's closed-support cohomology works for sheaves of abelian groups. It has local cohomology sheaves, support truncation and FlasqueLocality, but no complex-module version, edge comparison, orientation sheaf or Dolbeault cone. HF1 has only the separated one-dimensional quotient presheaf. HF2's analytic preparation has its first geometric lemmas. Purity, flabbiness, duality and HF3 through HF5 have not begun.

### Named results

- **Support truncation**: if the local cohomology sheaves 𝓗_S^q(F) vanish for every q < n, then H_S^q(W, F) = 0 for every q < n and every open W. Purity will feed into this step to give global vanishing ([`subsingleton_supportedH_of_isZero_supportedHSheaf`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology.html#CategoryTheory.Sheaf.subsingleton_supportedH_of_isZero_supportedHSheaf)).
- **FlasqueLocality**: if each point has a neighbourhood inside which all restrictions are surjective, then every restriction map is surjective. This is proved by Zorn's lemma, for sheaves of sets and for sheaves of modules or abelian groups ([`map_surjective_of_locally_flasque`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/Flasque/Locality.html#TopCat.Sheaf.map_surjective_of_locally_flasque)).
- **Excision for cohomology with supports**: if W′ ⊆ W and S ∩ W ⊆ W′, then restriction gives H_Sⁿ(W, F) ≃ H_Sⁿ(W′, F) in every degree ([`supportedHExcisionEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedHExcisionEquiv)).
- **Real compacts are polynomially convex**: every compact K ⊆ ℝⁿ ⊆ ℂⁿ equals its polynomial hull ([`isPolynomiallyConvex_of_forall_im_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PolynomialHull.html#IsCompact.isPolynomiallyConvex_of_forall_im_eq_zero)). Consequently K lies in the interior of a polynomial polyhedron inside any given neighbourhood ([`exists_subset_interior_polynomialPolyhedron`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/PolynomialHull.html#TauCeti.IsPolynomiallyConvex.exists_subset_interior_polynomialPolyhedron)).
- **One-dimensional hyperfunctions form a separated presheaf**: a class in O(ℂ ∖ ℝ)/O(W(U)) that vanishes on each member of an open cover is zero ([`oneDimBoundaryPresheaf_isSeparated`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.oneDimBoundaryPresheaf_isSeparated)).

### Notable definitions and infrastructure

- **Cohomology with closed supports** [`supportedH`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedH) is Ext out of the relative free sheaf, following the roadmap's Q_S recipe. It is functorial in the open set and in enlarging the support, and it has long exact sequences for pairs, triples and supports Z ⊆ S.
- **Local cohomology sheaves** [`supportedHSheaf`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/LocalCohomology.html#CategoryTheory.Sheaf.supportedHSheaf) sheafify W ↦ H_Sⁿ(W, F). They are supported in S, equal Γ_S(F) in degree zero and vanish for flasque F in positive degrees. These are the objects that purity and the orientation sheaf 𝓗_Mⁿ(ℤ_X) will be stated with.
- **The one-dimensional boundary quotient** [`OneDimBoundaryQuotient`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.OneDimBoundaryQuotient) is O(ℂ ∖ ℝ)/O(W(U)), the explicit dimension-one model the roadmap prescribes.

### Roadmap coverage

**HF0 is partial.** Already proved:
- the supported-section functor (left exact)
- supported cohomology and its sequences for pairs, triples and supports
- excision and flasque acyclicity
- the sheaves 𝓗_S^q, with support truncation
- FlasqueLocality

All of this is for abelian-group coefficients. Still missing from HF0:
- the `ModuleCat ℂ` theory and its coefficient comparisons
- the derived-functor comparison
- the degenerate edge comparison
- the Dolbeault relative cone
- the orientation sheaf
- the finite-product and twist corollaries of FlasqueLocality

**HF1 is partial only in dimension one.** The quotient presheaf is separated, but gluing and all higher-dimensional and bundle constructions are absent. **HF2's analytic preparation has begun only at its edges.** The filled compact exhaustion for Malgrange top vanishing ([`exists_isFilledIn_compact_exhaustion`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Exhaustion.html#IsOpen.exists_isFilledIn_compact_exhaustion)) is there, and so are HF2.1a's polynomial convexity and polyhedron neighbourhoods. Still missing from that layer are the harmonic Runge lemma, Malgrange's theorem itself, the FS/DFS duality, current regularization and Stein duality. **HF2.1 through HF2.3, HF3, HF3a, HF4 and HF5 are untouched.**

## The frontier

- **Degenerate edge comparison**: prove H_Z^(n+j)(W, F) ≃ H_Z^j(S, 𝓗_Sⁿ(F)) when 𝓗_S^q(F) = 0 for q ≠ n. This is the companion to support truncation and needs the local hypercohomology filtration. Flabbiness and the identification of B(U) with relative cohomology both use it.
- **Complex-module coefficients**: rebuild the supported theory and 𝓗_S^q for `TopCat.Sheaf (ModuleCat ℂ)`, then compare it with the underlying abelian groups, as the roadmap requires.
- **Gluing for one-dimensional hyperfunctions**: prove the existence half of the sheaf condition for the quotient presheaf. This needs H¹(U, O) = 0 for open U ⊆ ℂ, which GlobalHolomorphicFunctions GH0 supplies.
- **Stein interiors of polynomial polyhedra**: the exact description of int P and the plurisubharmonic exhaustion that makes it Stein are still missing. They need R3.1's strictly psh criterion, and HF2.1a's compact-acyclicity argument depends on them.
- **Harmonic Runge and Malgrange top vanishing**: with the filled exhaustion in hand, the remaining steps are the Newton potential, the multipole expansion and the Runge density argument. That argument depends on K5a's compact-distribution dual.
