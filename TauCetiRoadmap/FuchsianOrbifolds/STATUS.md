<!--tauceti-status:v1 {"roadmap":"FuchsianOrbifolds","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"meromorphic descent to the coarse quotient with the local order formula ord_z f = m * ord_[z] of the descent","state":"partial"},{"id":"Layer 2","remaining":"volume comparison and Gauss-Bonnet, hyperbolic polygons and side pairings, Poincaré and Dirichlet polygon theorems, presentations, triangle groups","state":"partial"},{"id":"Layer 3","remaining":"compactness of the complement of the cusp horodiscs in a finite-area fundamental polygon, which needs Layer 2","state":"partial"},{"id":"Layer 4","remaining":"compactness for general cofinite groups, conjugation functoriality, cusp-fibre and total degree formulas, orbifold signature and area formula","state":"partial"},{"id":"Layer 5","remaining":"degree-one biholomorphism, divisor pullback, genus, Riemann-Hurwitz, meromorphic descent and extension over cusps, Fuchsian Riemann-Hurwitz","state":"partial"},{"id":"Layer 6","remaining":"signature of X(1), descent and extension of j, degree one, and the biholomorphism X(1) ≃ P^1","state":"partial"}],"readme_sha":"d2d6ae0fc37a4ac7b44bb3bf879bd1a1e8b9d04b8fdc0bef7577376d60553571","roadmap":"FuchsianOrbifolds","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: FuchsianOrbifolds

This file documents the status of the FuchsianOrbifolds roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. For every discrete Γ ≤ PSL(2, ℝ), the coarse quotient and its cusp compactification are Riemann surfaces, but compactness is proved only at level one. Degree theory has begun on the generic side and in its application to finite-index maps. Hyperbolic polygons are barely started, and the `j`-function half of Layer 6 has not begun.

### Named results

- **The compactified quotient is a Riemann surface** — adjoining one point per cusp orbit to Γ\ℍ, with the q-coordinate `exp(2πiσ(z)/w)` as the chart there, gives a Hausdorff, second-countable Riemann surface in which Γ\ℍ is open and dense ([`Subgroup.CompactifiedQuotient.instIsManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Manifold.html#Subgroup.CompactifiedQuotient.instIsManifold)).
- **Compactness of X(1)** — the effective level-one group is cofinite with a single cusp orbit, and its compactified quotient is compact ([`TauCeti.ModularGroup.compactSpace_compactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/LevelOne.html#TauCeti.ModularGroup.compactSpace_compactifiedQuotient)).
- **Ramification of the orbit projection** — the local multiplicity of ℍ → Γ\ℍ at z is the order of the stabilizer of z, so the projection ramifies exactly at elliptic points ([`Subgroup.localMultiplicity_quotientMk`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Ramification.html#Subgroup.localMultiplicity_quotientMk)).
- **Fibre independence of the degree** — for a finite holomorphic map from a compact connected Riemann surface, every fibre has the same number of points counted with multiplicity ([`TauCeti.RiemannSurface.degree_eq_fiber_sum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.degree_eq_fiber_sum)).
- **Interior fibres of finite-index maps** — for Δ ≤ Γ of finite index, local multiplicities over any interior point of the compactified quotient sum to [Γ : Δ] ([`Subgroup.sum_localMultiplicity_compactifiedQuotientMap_fiber_ofQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/InteriorDegree.html#Subgroup.sum_localMultiplicity_compactifiedQuotientMap_fiber_ofQuotient)).

### Notable definitions and infrastructure

- **Normalized cusp data and width index** — [`Subgroup.CuspDatum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.html#Subgroup.CuspDatum) records a scaling that sends the cusp to ∞, a generator of the full stabilizer, and its width. [`widthIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/Tower.html#TauCeti.Subgroup.CuspDatum.widthIndex) is the integer ratio of widths under an inclusion. It is the local multiplicity at a cusp of the induced map, and it is multiplicative in towers.
- **The compactification and its maps** — [`Subgroup.CompactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.html#Subgroup.CompactifiedQuotient) is the explicit sum of Γ\ℍ and the cusp orbits. [`compactSpace_of_compact_truncations`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Compactness.html#Subgroup.CompactifiedQuotient.compactSpace_of_compact_truncations) reduces its compactness to compact truncated fundamental sets. An inclusion Δ ≤ Γ induces a holomorphic [`compactifiedQuotientMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Map.html#Subgroup.compactifiedQuotientMap).
- **Finite holomorphic maps** — [`TauCeti.RiemannSurface.FiniteHolomorphicMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.FiniteHolomorphicMap) is the carrier the roadmap pins for the degree API. The degree is derived from fibre sums of [`localMultiplicity`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/LocalMultiplicity.html#TauCeti.RiemannSurface.localMultiplicity) rather than stored as a field.

### Roadmap coverage

Layer 0 is done. Layers 1 to 6 are partial.

- **Layer 1** lacks only meromorphic descent to Γ\ℍ with the order formula. Holomorphic descent, ramification at elliptic orbits and the independence of the elliptic charts from all choices are proved.
- **Layer 3** lacks only compactness of the complement of the cusp horodiscs in a finite-area fundamental polygon.
- **Layer 4** now has finite-index maps with their cusp and elliptic ramification, finite fibres and interior fibre counts. It lacks compactness beyond level one, functoriality under conjugation, the cusp-fibre and total degree formulas, and the orbifold signature and area formula.
- **Layer 5** has local multiplicity, degree, fibre independence, positivity and composition, and identifies the local multiplicities of finite-index quotient maps. It lacks the degree-one theorem, divisor pullback, genus, Riemann-Hurwitz, and meromorphic descent and extension over cusps.
- **Layer 2** has only fundamental domains, covolume, cofiniteness, geodesic lines and the half-planes they bound.
- **Layer 6** has the compact X(1) with its single cusp, but not its signature, the descended `j`, or `X(1) ≃ P¹`.

## The frontier

- **The degree-one biholomorphism theorem** — turn a finite holomorphic map of degree one into a biholomorphism whose forward function is that map. Its prerequisites are in place.
- **Degree of finite-index quotient maps** — sum the width indices over cusp fibres to get [Γ : Δ], matching the interior result, and conclude that the degree is the index. The generic theorem also needs compact, connected quotients, unproved beyond level one.
- **Compactness for every cofinite group** — feed compact truncated fundamental sets to `compactSpace_of_compact_truncations`. The README's route is through the finite-sided Dirichlet polygon of Layer 2, where only geodesic half-planes exist so far. The same truncation closes Layer 3.
- **Meromorphic descent and extension** — descend invariant meromorphic functions to Γ\ℍ with `ord_z f = m · ord_[z] f̄`, then extend them across cusps using the existing Laurent q-expansion criterion.
- **`X(1) ≃ P¹`** — the modular-forms `JInputs` module now supplies `j`, its invariance and its orders at the elliptic points. What remains is the signature of X(1), the descent and extension of `j`, degree one, and the degree-one theorem. Genus and Riemann-Hurwitz separately wait on the finite-CW Euler characteristic from the AlgebraicTopology roadmap, which does not yet appear in Tau Ceti.
