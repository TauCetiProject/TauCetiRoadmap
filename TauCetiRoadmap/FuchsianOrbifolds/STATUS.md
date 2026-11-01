<!--tauceti-status:v1 {"roadmap":"FuchsianOrbifolds","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"converse Poincare polygon theorem (discreteness from angle conditions), finite-sided Dirichlet polygons for cofinite groups, triangle groups","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"compactness for a general cofinite group via a bounded Dirichlet truncation; orbifold signature and Euler characteristic","state":"partial"},{"id":"Layer 5","remaining":"genus via finite CW Euler characteristic, branched-cover Euler-characteristic formula, Riemann-Hurwitz and its Fuchsian form","state":"partial"},{"id":"Layer 6","remaining":"the orbifold signature of X(1) as a stated theorem","state":"partial"}],"readme_sha":"2e84c074124bb13c448176b33ec430d1dc7ef89f5ea62fefb389229a4784e121","roadmap":"FuchsianOrbifolds","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: FuchsianOrbifolds

This file documents the status of the FuchsianOrbifolds roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1 and 3 are done, and the level-one application has reached X(1) ≃ P¹ through the descended `j` and its degree. Poincaré's presentation theorem and the orbifold area formula now hold for locally finite fundamental polygons. The converse half of Poincaré's theorem is still missing, and so is compactness of the compactified quotient for a general cofinite group. Genus and Riemann–Hurwitz have not begun.

### Named results

- **X(1) is the Riemann sphere** — the normalized modular invariant, descended to the compactified level-one quotient, is a biholomorphism onto P¹ that sends the elliptic orbits of orders two and three to 1728 and 0. The proof goes through degree one ([`TauCeti.ModularGroup.jBiholomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/LevelOne/Sphere.html#TauCeti.ModularGroup.jBiholomorph)).
- **Poincaré's presentation theorem** — the group of a locally finite fundamental polygon is presented by the side-pairing maps, subject to the side relations and the finite-vertex cycle relations ([`relatorQuotientTo_bijective`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/SidePairing/Presentation.html#TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.relatorQuotientTo_bijective)). In particular every cocompact group is [presented by its Dirichlet polygon](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/DirichletDomain/SidePairing.html#Subgroup.exists_sidePairing_relatorQuotientTo_bijective_of_compactSpace).
- **The orbifold area formula** — for a locally finite fundamental polygon, the covolume is 2π times a count of side pairs and finite vertex cycles plus the sum of 1 − 1/mₑ over the elliptic orbits ([`covolume_eq_two_pi_mul`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/Polygon/Area.html#TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul)). The cusp orbits are counted by [the ideal vertex cycles](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/Cusp/VertexCycle.html#TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.natCard_cuspOrbit).
- **The degree-one biholomorphism theorem** — a finite holomorphic map of degree one between compact connected Riemann surfaces is a biholomorphism whose forward function is that map ([`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/RiemannSurface/Degree.html#TauCeti.RiemannSurface.biholomorphOfDegreeEqOne)). For discrete Δ ≤ Γ of finite index, the map X(Δ) → X(Γ) [has degree [Γ : Δ]](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Degree.html#Subgroup.degree_compactifiedQuotientMap).
- **Jørgensen's inequality** — for lifts A, B of elements of a discrete group, |tr²A − 4| + |tr[A, B] − 2| ≥ 1 unless B conjugates A to itself or its inverse ([`one_le_abs_trace_sq_sub_four_add_abs_trace_commutatorElement_sub_two`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/Jorgensen.html#Subgroup.one_le_abs_trace_sq_sub_four_add_abs_trace_commutatorElement_sub_two)). It yields [a pairwise Margulis lemma](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/Margulis.html#Subgroup.conj_eq_or_conj_eq_inv_of_dist_le).

### Notable definitions and infrastructure

- **The compactification** — [`Subgroup.CompactifiedQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.html#Subgroup.CompactifiedQuotient) is the explicit sum of Γ\ℍ and the cusp orbits, with q-coordinate charts at the cusps. It is compact whenever some Dirichlet domain [becomes bounded after removing finitely many cusp horodiscs](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/DirichletDomain/Polygon.html#Subgroup.compactSpace_compactifiedQuotient_of_isBounded_truncation).
- **Thick parts** — the [ε-thick part](https://taucetiproject.org/docs/TauCeti/Topology/MetricSpace/ThickPart.html#TauCeti.thickPart) of a cofinite group's quotient [is compact](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Fuchsian/DirichletDomain/Thick.html#Subgroup.IsCofinite.isCompact_image_thickPart), and short displacements come only from elliptic or parabolic elements. These are the pieces from which a bounded truncation should be assembled.
- **Local tilings** — [`IsLocalTiling`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupAction/LocalTiling.html#TauCeti.IsLocalTiling) packages a tile with its local neighbours. With uniform charts, the translates cover the space and are locally finite. This is the generic engine for the discreteness half of Poincaré's theorem.

### Roadmap coverage

Layers 0, 1 and 3 are done. Layers 2, 4, 5 and 6 are partial.

- **Layer 2** has covolume, Gauss–Bonnet with ideal vertices, side pairings, Dirichlet polygons with their side pairings, and the presentation and area formula for locally finite fundamental polygons. It lacks the converse direction of Poincaré's theorem, finite-sided Dirichlet polygons for every cofinite group, and triangle groups. The doubled triangle is set up for them.
- **Layer 4** has compactness given a bounded cusp truncation or a cuspidal polygon meeting every orbit, and the area formula from a polygon. It lacks compactness for a general cofinite group and the orbifold signature with its Euler characteristic.
- **Layer 5** has degree theory, the local power-map normal form, the degree-one theorem, divisor pullback, the ramification divisor, and meromorphic descent and extension. It lacks genus, the branched-cover Euler-characteristic formula, and Riemann–Hurwitz with its Fuchsian form.
- **Layer 6** lacks only the signature of X(1) as a stated theorem.

## The frontier

- **Compactness for every cofinite group** — combine the compact thick part, the cusp ends of a Dirichlet domain and the elliptic thin parts to show that some Dirichlet domain of a cofinite group is bounded after cusp truncation. The compactness theorem above then applies, and Dirichlet polygons become finite-sided.
- **The converse Poincaré theorem** — from side-pairing, angle and parabolic-cycle hypotheses, prove that the generated group is discrete with the polygon as fundamental domain. Local no-overlap at finite and ideal cycles and the generic local-tiling theorems are in place.
- **Triangle groups** — apply Poincaré's theorem to the doubled triangle with angles π/p, π/q, π/r, using the typed finite-or-cusp parameter. This waits on the converse theorem.
- **Genus and Riemann–Hurwitz** — the README defines genus through the finite-CW Euler characteristic of a compact surface. `compactManifoldFiniteCWType` does not appear in Tau Ceti's source, so this waits on the AlgebraicTopology roadmap.
- **Orbifold signatures** — the polygon area formula has no genus term yet. Signatures, including that of X(1), wait on genus.
