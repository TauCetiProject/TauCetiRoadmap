<!--tauceti-status:v1 {"roadmap":"StableReduction","to_sha":"d406259a890e9a86ec475a6713071e36e0355114","ts":"2026-11-06T01:27:37Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the normalization exact sequence for the structure sheaf on schemes","state":"partial"},{"id":"Layer 1","remaining":"full etale chart onto uv = pi^n, normalization of nodal curves, dual graph of an actual curve and its genus formula","state":"partial"},{"id":"Layer 2","remaining":"coherent cohomology and base change, arithmetic genus in families, dualizing sheaf, the ampleness criterion and openness, polarized etale descent","state":"partial"},{"id":"Layer 3","remaining":"semistable and stable families with their criteria, automorphism finiteness, scheme clutching, single-marking contraction","state":"partial"},{"id":"Layer 4","remaining":"node blowup on schemes with termination, negative semidefinite intersection matrix, resolution by normalized blowups, contraction","state":"partial"},{"id":"Layer 5","remaining":"existence of regular and minimal models, intersection relations, adjunction and the genus formula, the prestable-model criterion","state":"partial"},{"id":"Layer 6","remaining":"numerical type of a regular model, line-bundle specialization, the l-torsion splitting extension, the nodal conclusion","state":"partial"},{"id":"Layer 7","remaining":"genus one, genus at least two with the uniform degree bound, and the simultaneous form","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"disjoint smooth extended sections, pointed stabilization in families, stable pointed reduction and uniqueness","state":"partial"},{"id":"Layer 10","remaining":"IsStableMap and its invariance, openness for projective targets, the automorphism and ampleness characterizations","state":"partial"},{"id":"Layer 11","remaining":"nonnegativity, additivity and local constancy of degree, single-marking contraction, gluing of stable maps, map-aware stabilization in families","state":"partial"}],"readme_sha":"d8f8e2a2c95f747972cf653ebeccf856a04c9f86fb3cb8acfd0e64dbeee1d1a7","roadmap":"StableReduction","to_sha":"d406259a890e9a86ec475a6713071e36e0355114"}-->
# Status: StableReduction

This file documents the status of the StableReduction roadmap up until `d406259` (2026-11-06T01:27:37Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. Genus-zero nodal reduction is now proved, and the combinatorics of numerical types are finished. Nodal families, blowups of schemes and the first intersection numbers are in place. Still open: regular and minimal models, nodal reduction in genus at least one, and stability of curves or maps. Layer 8 has not begun.

### Named results

- **Genus-zero nodal reduction**: a smooth proper geometrically integral curve of genus zero over K becomes ℙ¹ after a separable extension of degree at most two, so it has nodal reduction there ([`HasNodalReduction.exists_finrank_le_two_of_genus_eq_zero`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/GenusZero.html#TauCeti.HasNodalReduction.exists_finrank_le_two_of_genus_eq_zero)).
- **The classification of minimal genus-one types**: this is Stacks Lemma 55.6.2. A minimal numerical type of genus one is one of 34 configurations, sorted into fifteen families ([`IsMinimal.isGenusOneMinimalShape`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Genus/One/Classification.html#TauCeti.NumericalType.IsMinimal.isGenusOneMinimalShape)).
- **The prime-torsion bound for numerical types**: this is Stacks Proposition 55.7.4 for every prime ℓ > 768g − 768. A numerical type of genus g ≥ 2 has dim Pic(T)[ℓ] ≤ g (`NumericalType.finrank_torsion_le_arithmeticGenus`).
- **The fibrewise criterion for nodal curves**: a morphism is at worst nodal of relative dimension one exactly when it is flat and locally finitely presented with at-worst-nodal fibres ([`atWorstNodalOfRelativeDimensionOne_iff_flat_and_fiberToSpecResidueField`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/Node/Fiber.html#TauCeti.AlgebraicGeometry.atWorstNodalOfRelativeDimensionOne_iff_flat_and_fiberToSpecResidueField)).
- **The universal property of the blowup**: a morphism along which the centre pulls back to an effective Cartier divisor factors uniquely through the blowup ([`existsUnique_comp_blowupToBase_eq_of_isEffectiveCartier`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Blowup/UniversalProperty.html#AlgebraicGeometry.Scheme.IdealSheafData.existsUnique_comp_blowupToBase_eq_of_isEffectiveCartier)).

### Notable definitions and infrastructure

- **Nodal families**: being at worst nodal means being syntomic of relative dimension one with unramified singular locus ([`AtWorstNodalOfRelativeDimensionOne`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/Node/Relative.html#TauCeti.AlgebraicGeometry.AtWorstNodalOfRelativeDimensionOne)). The property is stable under base change and satisfies fpqc descent. Over a DVR it can be checked on the generic and special fibres.
- **Blowups of schemes**: the blowup along an ideal sheaf is the relative Proj of its Rees algebra ([`IdealSheafData.blowup`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Blowup/IdealSheaf.html#AlgebraicGeometry.Scheme.IdealSheafData.blowup)). It is proper and an isomorphism away from its centre, commutes with flat base change, and has a Cartier exceptional divisor and strict transforms.
- **Intersection numbers**: the degree of a line bundle restricted to a curve ([`intersectionNumber`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.html#TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber)). It is additive and compatible with pullback, and it is symmetric for effective Cartier divisors that meet properly. On a regular model, prime divisors are Cartier and the special fibre is the sum of its components.

### Roadmap coverage

- **Layer 7 is partial.** Genus zero is done. Genus one, genus at least two, and the simultaneous form are missing.
- **Layers 0, 1, 2, 4, 5 and 6 are partial.**
  - Layer 0 lacks the scheme-level normalization exact sequence; only the split node's branch sequence exists.
  - Layer 1 has the nodal predicate, the fibrewise criterion, node splitting, and the étale-local form of the singular locus. It lacks the full étale chart uv = πⁿ, normalization of nodal curves, and dual graphs of actual curves.
  - Layer 2 has relative Proj, ampleness, the degree of 𝒪(D) and contraction descent. It has no cohomology in families and no dualizing sheaf.
  - Layer 4 has the ideal-sheaf blowup with its standard properties and intersection numbers. It has no intersection matrix, no resolution and no contraction.
  - Layer 5 has the special-fibre decomposition but no regular or minimal models.
  - Layer 6's combinatorics are finished, but its geometric half has not started.
- **Layers 3, 9, 10 and 11 have begun.**
  - Layer 3 has prestable and pointed families but no stability.
  - Layer 9 has sections of proper models matching rational points of the generic fibre, plus the graph combinatorics of forgetting a marking.
  - Layer 10 has prestable maps with automorphisms and contracted components, but no `IsStableMap`.
  - Layer 11 has evaluation maps, a degree that is invariant under field extension, and order-independent stabilization of decorated graphs.
- **Untouched:** Layer 8.

## The frontier

- **Vertical intersection matrix (Layers 4–6)**: show that the intersection matrix of special-fibre components is negative semidefinite. Then attach a numerical type to a regular model, so the finished combinatorics apply to geometry.
- **Resolution (Layers 4–5)**: iterate the node blowup on schemes, then prove resolution by normalized blowups and the contraction of exceptional curves. With these, regular and minimal models exist.
- **The étale local normal form (Layer 1)**: extend the étale-local description of the singular locus to an étale chart onto uv = πⁿ.
- **Cohomology in families (Layer 2)**: cohomology and base change, arithmetic genus, and the relative dualizing sheaf. These block stability, the single-marking contraction, and all of Layers 8–9.
- **Stability of curves and maps (Layers 3 and 10)**: `StableFamily` and `IsStableMap` as fibrewise positivity of log-canonical degree. These need dual graphs of actual geometric fibres.
