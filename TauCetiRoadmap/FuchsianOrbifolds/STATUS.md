<!--tauceti-status:v1 {"roadmap":"FuchsianOrbifolds","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"meromorphic descent to the coarse quotient with the local order formula ord_z f = m * ord_[z] of the descent","state":"partial"},{"id":"Layer 2","remaining":"Riemannian-volume comparison, Gauss-Bonnet for general polygons, side pairings and cycles, Poincaré and Dirichlet polygon theorems, presentations, triangle groups","state":"partial"},{"id":"Layer 3","remaining":"compactness of the complement of the cusp horodiscs in a finite-area fundamental polygon, which needs Layer 2","state":"partial"},{"id":"Layer 4","remaining":"compactness for general cofinite groups, conjugation functoriality, orbifold signature with its Euler-characteristic and area formula","state":"partial"},{"id":"Layer 5","remaining":"degree-one biholomorphism, ramification divisor, genus, Riemann-Hurwitz, meromorphic descent and extension over cusps, Fuchsian Riemann-Hurwitz","state":"partial"},{"id":"Layer 6","remaining":"signature of X(1), descent and extension of j, degree one, and the biholomorphism X(1) ≃ P^1","state":"partial"}],"readme_sha":"2e84c074124bb13c448176b33ec430d1dc7ef89f5ea62fefb389229a4784e121","roadmap":"FuchsianOrbifolds","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: FuchsianOrbifolds

This file documents the status of the FuchsianOrbifolds roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. For every discrete Γ ≤ PSL(2, ℝ) the coarse quotient and its cusp compactification are Riemann surfaces, and finite-index inclusions induce maps of degree equal to the index, but compactness is proved only at level one. Hyperbolic geometry has reached Gauss–Bonnet for triangles, not polygons; degree theory lacks the degree-one theorem, genus and Riemann–Hurwitz; the `j`-function half of Layer 6 has not begun.

### Named results

- **The compactified quotient is a Riemann surface** — adjoining one point per cusp orbit to Γ\ℍ, with the q-coordinate `exp(2πiσ(z)/w)` as the chart there, gives a Hausdorff, second-countable Riemann surface in which Γ\ℍ is open and dense ([`Subgroup.CompactifiedQuotient.instIsManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Manifold.html#Subgroup.CompactifiedQuotient.instIsManifold)).
- **Compactness of X(1)** — the effective level-one group is cofinite with a single cusp orbit, and its compactified quotient is compact ([`TauCeti.ModularGroup.compactSpace_compactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/LevelOne.html#TauCeti.ModularGroup.compactSpace_compactifiedQuotient)).
- **The degree of a finite-index quotient map is the index** — for discrete Δ ≤ Γ of finite index, every fibre of X(Δ) → X(Γ), over interior points and cusps alike, has [Γ : Δ] points counted with multiplicity ([`Subgroup.degree_compactifiedQuotientMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Degree.html#Subgroup.degree_compactifiedQuotientMap)).
- **Fibre independence of the degree** — for a finite holomorphic map from a compact connected Riemann surface, all fibres have equal size counted with multiplicity ([`TauCeti.RiemannSurface.degree_eq_fiber_sum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.degree_eq_fiber_sum)).
- **Gauss–Bonnet for hyperbolic triangles** — the invariant area of a nondegenerate triangle in ℍ is its angular defect π − α − β − γ ([`TauCeti.UpperHalfPlane.volume_triangle`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Triangle.html#TauCeti.UpperHalfPlane.volume_triangle)).

### Notable definitions and infrastructure

- **Normalized cusp data** — [`Subgroup.CuspDatum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.html#Subgroup.CuspDatum) records a scaling that sends the cusp to ∞, a generator of the full stabilizer, and its width. Under an inclusion the width ratio is the index of the cusp stabilizers ([`widthIndex_eq_relIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/Tower.html#TauCeti.Subgroup.CuspDatum.widthIndex_eq_relIndex)), and it is the local multiplicity at a cusp of the induced map.
- **The compactification and its maps** — [`Subgroup.CompactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.html#Subgroup.CompactifiedQuotient) is the explicit sum of Γ\ℍ and the cusp orbits. [`compactSpace_of_compact_truncations`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Compactness.html#Subgroup.CompactifiedQuotient.compactSpace_of_compact_truncations) reduces its compactness to compact truncated fundamental sets, and an inclusion Δ ≤ Γ induces a holomorphic [`compactifiedQuotientMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Map.html#Subgroup.compactifiedQuotientMap).
- **Finite holomorphic maps and divisor pullback** — on [`TauCeti.RiemannSurface.FiniteHolomorphicMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.FiniteHolomorphicMap) the degree is a fibre sum of local multiplicities rather than a stored field, and [`divisorPullback`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Divisor.html#TauCeti.RiemannSurface.divisorPullback) weights each preimage by its multiplicity, multiplying divisor degree by the degree of the map.

### Roadmap coverage

Layer 0 is done. Layers 1 to 6 are partial.

- **Layer 1** lacks only meromorphic descent to Γ\ℍ with the order formula `ord_z f = m · ord_[z] f̄`.
- **Layer 3** lacks only compactness of the complement of the cusp horodiscs in a finite-area fundamental polygon.
- **Layer 4** has finite-index maps with their cusp and elliptic ramification, multiplicativity in towers, and the fibre-count and degree formulas. It lacks compactness beyond level one, functoriality under conjugation, and the orbifold signature with its Euler-characteristic and area formula.
- **Layer 5** has local multiplicity, degree, fibre independence, positivity, composition, divisor pullback, and its application to finite-index quotient maps. It lacks the degree-one theorem, the ramification divisor, genus, the branched-cover Euler-characteristic formula and Riemann–Hurwitz, and meromorphic descent and extension over cusps.
- **Layer 2** has fundamental domains, covolume and cofiniteness, geodesic lines, segments, half-planes and angles, and triangles with Gauss–Bonnet, including one ideal vertex. It lacks the comparison with Riemannian volume, Gauss–Bonnet for general polygons, side pairings and cycles, the Poincaré and Dirichlet polygon theorems, presentations and triangle groups.
- **Layer 6** has the compact X(1) with its single cusp, but not its signature, the descended `j`, or `X(1) ≃ P¹`.

## The frontier

- **The degree-one biholomorphism theorem** — turn a finite holomorphic map of degree one into a biholomorphism whose forward function is that map. Its prerequisites are in place.
- **Hyperbolic polygons** — extend Gauss–Bonnet from triangles to convex polygons with ideal vertices, then build side pairings and vertex cycles for the Poincaré polygon theorem.
- **Compactness for every cofinite group** — feed compact truncated fundamental sets to `compactSpace_of_compact_truncations`. The README's route is the Dirichlet polygon, which needs the polygon theory above; the same truncation closes Layer 3.
- **Meromorphic descent and extension** — descend invariant meromorphic functions to Γ\ℍ with the elliptic order formula, then extend them across cusps using the existing Laurent q-expansion criterion.
- **`X(1) ≃ P¹`** — `j` and its elliptic orders are supplied by the modular-forms roadmap; what remains is the signature of X(1), the descent and extension of `j`, degree one, and the degree-one theorem. Genus and Riemann–Hurwitz separately wait on the finite-CW Euler characteristic from the AlgebraicTopology roadmap, not yet available in Tau Ceti.
