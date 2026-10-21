<!--tauceti-status:v1 {"roadmap":"ComplexCurveModuli","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: ComplexCurveModuli

This file documents the status of the ComplexCurveModuli roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has only its first foundations: the topology of finite gluings, the branch-pair node ring of D1 and the boundary-circle Sobolev spaces of D3.1. There is still no nodal curve, analytic family, deformation complex or moduli groupoid. Most of D1 and D3, and all of D0, D2 and D4–D8, have not been established here.

### Named results

- **Rellich's theorem on the circle**: for `t < s` the inclusion of the Fourier-defined Sobolev space `H^s` into `H^t` is a compact operator, for finite-dimensional coefficients ([`CircleSobolev.isCompactOperator_inclusion`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle.html#TauCeti.CircleSobolev.isCompactOperator_inclusion)).
- **The Sobolev embedding into continuous functions**: for `s > 1/2` an element of `H^s` has a uniformly convergent Fourier series, whose sum is a continuous function with those Fourier coefficients ([`CircleSobolev.hasSum_toContinuousMap`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle.html#TauCeti.CircleSobolev.hasSum_toContinuousMap)).
- **Units of the node ring**: a germ at a node is invertible exactly when its value at the node is nonzero. So the node ring is local, with maximal ideal the germs vanishing at the node and residue field `ℂ` ([`nodeLocalRing.isUnit_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/NodeLocalRing.html#TauCeti.holomorphicStructureSheaf.nodeLocalRing.isUnit_iff)).
- **The node equation from branches**: on curves, the two branch coordinates multiply to zero and generate the maximal ideal. This is the relation `xy = 0` of the plane node, derived from the branch description ([`nodeLocalRing.maximalIdeal_eq_span_coordinate`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/NodeLocalRing.html#TauCeti.holomorphicStructureSheaf.nodeLocalRing.maximalIdeal_eq_span_coordinate)).
- **Finite gluings are Hausdorff**: gluing finitely many points of a Hausdorff space gives a Hausdorff quotient, and the quotient map is an open embedding off the glued points ([`Setoid.t2Space_quotient`](https://taucetiproject.org/docs/TauCeti/Topology/Constructions/FiniteGluing.html#Setoid.t2Space_quotient), [`Setoid.isOpenEmbedding_domRestrict_quotient_mk`](https://taucetiproject.org/docs/TauCeti/Topology/Constructions/FiniteGluing.html#Setoid.isOpenEmbedding_domRestrict_quotient_mk)).

### Notable definitions and infrastructure

- [`CircleSobolev`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle.html#TauCeti.CircleSobolev) is the Hilbert space of coefficient sequences with norm² `Σ(1+|n|)^(2s)‖a_n‖²` for real `s`, isometric to `ℓ²(ℤ)`. It is the carrier the Hardy decomposition of D4 will use for boundary maps and Laurent subspaces.
- [`nodeLocalRing`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/NodeLocalRing.html#TauCeti.holomorphicStructureSheaf.nodeLocalRing) is the ring of pairs of holomorphic branch germs with equal values, with its fibre-product universal property. It is built before any hypersurface chart, as D1 requires, and is the object D2 must compare with `ℂ{x,y}/(xy)`.

### Roadmap coverage

D1 is partial. The node ring is defined, and so is the general topology of the normalization quotient (closed relation, Hausdorffness, open complement), but only for an abstract finite gluing. The nodal-curve carrier, the smooth-locus sheaf glued to the node rings, local biholomorphy off the nodes, the graph genus formula, isomorphism descent and lifting, automorphism groups, and the auxiliary and partitioned permutation groupoids are all absent. D3 is partial only in D3.1's boundary-circle part: completeness, density, compact inclusions and continuous evaluation for `s > 1/2` are in, but coordinate invariance, finite disjoint unions, product estimates, Nemytskii maps, multipliers, circle-diffeomorphism actions and integer `H^k` sections on components are not. D3.2–D3.6 have not started. Nothing has been established here for D0 (normal forms, the index formula, genus-zero and genus-one classification, uniformization, properness of the Diff action), for D2 (the native-manifold analytic-space instance, `N_s` charts, flatness, base change), or for D4–D8.

## The frontier

- **The nodal-curve carrier (D1)**: assemble normalization components, flag pairing and marks into a curve. Then specialize the finite-gluing quotient to it, show the complement of the nodes is locally biholomorphic to the normalization, and glue the smooth-locus sheaf to the node rings.
- **Node ring versus `ℂ{x,y}/(xy)` (D2.1)**: the relations `xy = 0` and `𝔪 = (x,y)` are proved, but the isomorphism with the analytic quotient ring is not. It needs the ComplexComparisonPartII C−1.1 convergent-germ carrier.
- **The rest of the circle `H^s` package (D3.1)**: for `s > 1/2` this means algebra and product estimates, Nemytskii maps, bounded isomorphisms from circle diffeomorphisms, coordinate invariance and Hilbert manifolds of boundary maps. Rellich is now available for the later closed-range arguments.
- **The native-manifold analytic-space instance (D2.0)**: `nativeComplexManifoldAnalyticSpace` and the holomorphic-map/local-ringed-morphism equivalence. All of D2's `N_s` charts sit on top of it.
- **The arrow groupoids of D1**: automorphism groups and the unordered and partitioned auxiliary-mark groupoids are pure finite bookkeeping over actual biholomorphisms. They can proceed once the carrier exists.
