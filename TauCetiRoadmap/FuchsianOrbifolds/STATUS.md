<!--tauceti-status:v1 {"roadmap":"FuchsianOrbifolds","to_sha":"a6b14527398558b7ba0ed9b5f45267918bbbf569","ts":"2026-10-15T11:39:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"Poincare polygon theorem with presentation, finite-sided Dirichlet polygons for cofinite groups, triangle groups from polygon reflections","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"a cuspidal fundamental polygon for a general cofinite group; orbifold signature with Euler-characteristic and area formula","state":"partial"},{"id":"Layer 5","remaining":"genus via finite CW Euler characteristic, branched-cover Euler-characteristic formula, Riemann-Hurwitz and its Fuchsian form","state":"partial"},{"id":"Layer 6","remaining":"the orbifold signature of X(1) as a stated theorem","state":"partial"}],"readme_sha":"2e84c074124bb13c448176b33ec430d1dc7ef89f5ea62fefb389229a4784e121","roadmap":"FuchsianOrbifolds","to_sha":"a6b14527398558b7ba0ed9b5f45267918bbbf569"}-->
# Status: FuchsianOrbifolds

This file documents the status of the FuchsianOrbifolds roadmap up until `a6b1452` (2026-10-15T11:39:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1 and 3 are done, and the level-one application has reached X(1) ≃ P¹ through the descended `j` and its degree. For every discrete Γ the compactified quotient is a Riemann surface, and it is now compact whenever a cuspidal polygon meets every orbit, but no such polygon is yet built for a general cofinite group. Much of the Poincaré polygon theorem is in place without the theorem itself. Genus and Riemann–Hurwitz have not begun.

### Named results

- **X(1) is the Riemann sphere** — the normalized modular invariant, descended to the compactified level-one quotient, is a biholomorphism onto P¹ sending the elliptic orbits of orders two and three to 1728 and 0 ([`TauCeti.ModularGroup.jBiholomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/LevelOne/Sphere.html#TauCeti.ModularGroup.jBiholomorph)). The proof goes through degree one.
- **The degree-one biholomorphism theorem** — a finite holomorphic map of degree one between compact connected Riemann surfaces is a biholomorphism with that map as its forward function ([`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.biholomorphOfDegreeEqOne)).
- **The degree of a finite-index quotient map is the index** — for discrete Δ ≤ Γ of finite index, every fibre of X(Δ) → X(Γ) has [Γ : Δ] points counted with multiplicity ([`Subgroup.degree_compactifiedQuotientMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Degree.html#Subgroup.degree_compactifiedQuotientMap)).
- **Compactness from a cuspidal polygon** — if a discrete group has finitely many cusp orbits and a finite-sided convex polygon whose ideal vertices are cusps meets every orbit, its compactified quotient is compact ([`ConvexPolygon.compactSpace_compactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Polygon.html#TauCeti.UpperHalfPlane.ConvexPolygon.compactSpace_compactifiedQuotient)). The core is that the quotient minus any family of cusp horodiscs [is compact](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Polygon.html#TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc).
- **Gauss–Bonnet for convex polygons with ideal vertices** — a convex hyperbolic n-gon with vertices in ℍ ∪ ∂ℍ has area (n − 2)π minus its angle sum, ideal angles counting as zero ([`TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/GaussBonnet.html#TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier)).

### Notable definitions and infrastructure

- **The compactification** — [`Subgroup.CompactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.html#Subgroup.CompactifiedQuotient) is the explicit sum of Γ\ℍ and the cusp orbits, with q-coordinate charts from [normalized cusp data](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.html#Subgroup.CuspDatum). Invariant meromorphic functions [descend](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/MeromorphicDescent.html#Subgroup.existsUnique_meromorphicAt_quotientMk) to it and extend across the cusps under growth bounds.
- **Side pairings and the pieces of Poincaré's theorem** — [side pairings](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/SidePairing/Basic.html#TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing) of polygons with ideal vertices carry cycles, angle sums and side and cycle relators. In the source, locally finite translates of a side-paired polygon cover ℍ, its ideal cycle transformations are parabolic, and the side-pairing maps generate the group of a locally finite fundamental polygon. The local tiling holds at parabolic ideal cycles, and at finite vertices through [vertex sectors](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/VertexSector.html#TauCeti.UpperHalfPlane.ConvexPolygon.vertexSector).
- **The ramification divisor** — [`ramificationDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Ramification.html#TauCeti.RiemannSurface.ramificationDivisor) gives each point weight e − 1, and a map with its branch values removed is a covering. This sets up the excision proof of Riemann–Hurwitz.

### Roadmap coverage

Layers 0, 1 and 3 are done; Layer 3's horodisc-complement compactness holds relative to a given cuspidal polygon, as the README states it. Layers 2, 4, 5 and 6 are partial.

- **Layer 6** lacks only the signature of X(1) as a stated theorem.
- **Layer 4** has compactness for any group with a cuspidal polygon meeting every orbit, or a locally finite side-paired polygon. It lacks such a polygon for a general cofinite group, and the orbifold signature with its Euler-characteristic and area formula.
- **Layer 5** has degree theory, the degree-one theorem, divisor pullback, the ramification divisor, and meromorphic descent and extension. It lacks genus, the branched-cover Euler-characteristic formula, Riemann–Hurwitz and its Fuchsian form.
- **Layer 2** has covolume, Gauss–Bonnet with ideal vertices, side pairings, Dirichlet domains and most local inputs to the Poincaré theorem. It lacks the theorem with its presentation, finite-sided Dirichlet polygons for cofinite groups, and triangle groups from polygon reflections.

## The frontier

- **Finite-sided Dirichlet polygons** — bounded Dirichlet domains are finite intersections of half-planes, and finitely many constraints describe the domain high in each cusp. What remains is to assemble these into a finite-sided convex polygon for every cofinite group, with its sides and vertices enumerated.
- **Compactness for every cofinite group** — feed that polygon to the cuspidal-polygon compactness theorem.
- **The Poincaré polygon theorem** — covering, generation and the local tilings are in the source. What remains is that the side and cycle relators generate the whole kernel, and assembling the theorem from its separate hypotheses.
- **Triangle groups** — after Poincaré's theorem, build the (p, q, r) groups from polygon reflections using the typed finite-or-cusp parameter.
- **Genus and Riemann–Hurwitz** — the README defines genus through the finite-CW Euler characteristic of a compact surface. `compactManifoldFiniteCWType` does not appear in Tau Ceti's source, so this waits on the AlgebraicTopology roadmap. The orbifold signatures, including that of X(1), wait on genus.
