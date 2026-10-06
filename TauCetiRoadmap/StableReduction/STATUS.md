<!--tauceti-status:v1 {"roadmap":"StableReduction","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the module operations behind conductors and normalization exact sequences","state":"partial"},{"id":"Layer 1","remaining":"syntomic morphisms of schemes, unramified Sing(f), AtWorstNodalOfRelativeDimensionOne with fibrewise criterion and local normal form, normalization, dual graphs","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"blowups of quasi-coherent ideals on schemes, exceptional divisor and strict transform, intersection theory on regular surfaces, resolution, contraction","state":"partial"},{"id":"Layer 5","remaining":"regular and minimal models, the equality div(π) = Σ mᵢ[Cᵢ], intersection relations, adjunction and the genus formula","state":"partial"},{"id":"Layer 6","remaining":"tree-shaped genus-one minimal types; numerical type of a regular model; line-bundle specialization; the l-torsion splitting extension; the nodal conclusion","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"bba0dac4b46eddafe48fa25fdd78b4816147698d0fb8223050d3ea3fb4cdaf73","roadmap":"StableReduction","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: StableReduction

This file documents the status of the StableReduction roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete. The combinatorial half of Layer 6 is largely proved, including the prime-torsion bound that drives the Artin–Winters argument, but no actual model has a numerical type yet. Layers 0, 1 and 4 have their local foundations: the node, its singular locus and its blowup. Layer 5 has only a description of the special fibre's components. Layers 2, 3 and 7 to 11 have not begun.

### Named results

- **The prime-torsion bound for numerical types**: Stacks Proposition 55.7.4 for every prime ℓ > 768g − 768. A numerical type of genus g ≥ 2 has dim Pic(T)[ℓ] ≤ g ([`NumericalType.finrank_torsion_le_arithmeticGenus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/Picard/Torsion/Genus.html#TauCeti.NumericalType.finrank_torsion_le_arithmeticGenus)). It rests on the multiplicity bound mᵢ|aᵢⱼ| ≤ 768g − 768 for minimal types.
- **The classification of (−2)-configurations**: Stacks Proposition 55.5.17. A connected proper set of components with aᵢᵢ = −2wᵢ is a chain, a fork, or of type E₆, E₇ or E₈ ([`NumericalType.exists_chain_or_fork_or_exceptional`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Classification.html#TauCeti.NumericalType.exists_chain_or_fork_or_exceptional)).
- **Minimal numerical types of low genus**: in genus zero the only minimal type is one component with trivial data ([`NumericalType.isMinimal_and_arithmeticGenus_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Genus/Zero.html#TauCeti.NumericalType.isMinimal_and_arithmeticGenus_eq_zero_iff)). In genus one, a type with several components is minimal exactly when every component is a (−2)-index, and it is the cycle I_n when its graph is not a tree.
- **One blowup resolves a thin node**: over a DVR, the blowup of xy = πⁿ⁺² at its origin has a chart that is xy = πⁿ again, and all its local rings are regular exactly when n ≤ 1 ([`NodeAlgebra.isRegularLocalRing_stalk_blowup_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Blowup/Node.html#TauCeti.NodeAlgebra.isRegularLocalRing_stalk_blowup_iff)). The node xy = πⁿ is itself regular exactly when n ≤ 1.
- **The singular locus of the node**: for the chart xy = a, the relative singular subscheme is Spec R/(a) ([`NodeAlgebra.singularLocusIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/Node/SingularLocus.html#TauCeti.NodeAlgebra.singularLocusIso)). Smooth relative curves have empty singular locus.

### Notable definitions and infrastructure

- **Numerical types and their weighted Picard group**: the data of Stacks Tag 0C6Z, with signed genus in ℤ ([`NumericalType`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Basic.html#TauCeti.NumericalType)), and `Pic(T)` taken as the cokernel of the weighted relations ([`NumericalType.Pic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/StableReduction/Picard/Basic.html#TauCeti.NumericalType.Pic)).
- **The relative singular locus**: Sing is defined as the first Fitting ideal sheaf of the relative differentials, for flat, finitely presented curves over an affine base ([`Scheme.singularLocus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Curves/SingularLocus.html#AlgebraicGeometry.Scheme.singularLocus)). The nodal predicate is meant to be built on it.
- **Blowup charts**: the affine blowup algebra A[I/a] is identified with the standard chart of Proj of the Rees algebra ([`reesAlgebra.awayEquivAffineBlowup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/ReesAlgebra/AffineBlowup.html#reesAlgebra.awayEquivAffineBlowup)). This makes blowups of affine schemes computable chart by chart.

### Roadmap coverage

- **Layer 6 is partial.** The abstract theory is proved: the weighted Picard group, contraction of (−1)-indices, the (−2)-classification, both 768g bounds, and minimal types of genus zero and, in the non-tree case, genus one. Nothing geometric is there yet: no regular model has a numerical type, and the line-bundle comparisons, the ℓ-torsion extension and the nodal conclusion are all missing.
- **Layers 0, 1 and 4 are partial.** Layer 0 has DVR extensions with common refinements, models and their base change, fibres, relative dimension, families of curves, and quasi-coherent differentials with Fitting ideal sheaves. Conductors and normalization sequences are still missing. Layer 1 has the node chart, Sing, and standard syntomic algebras, but no syntomic morphisms of schemes, nodal predicate, normalization or dual graphs. Layer 4 has the node blowup computation and local lengths, but no blowup of schemes or intersection theory.
- **Layer 5 is partial.** It has only the special fibre as the zero scheme of π, with components given by the support of div(π).
- **Untouched:** Layers 2, 3 and 7 to 11.

## The frontier

- **Nodal families (Layer 1)**: syntomic morphisms of schemes, Sing over a general base and its unramifiedness, then `AtWorstNodalOfRelativeDimensionOne` with its fibrewise criterion and étale local normal form.
- **Blowups of schemes (Layer 4)**: the blowup of a quasi-coherent ideal as relative Proj, with its universal property, exceptional divisor and strict transform. Then the node computation can be iterated to a regular total space. Relative Proj is a Layer 2 prerequisite.
- **Genus-one minimal types with tree-shaped graphs**: the rest of the Stacks §55.6 classification. It is purely combinatorial and is the numerical input for genus-one reduction in Layer 7.
- **Multiplicities of the special fibre (Layers 4–5)**: the equality div(π) = Σ mᵢ[Cᵢ] and intersection numbers of vertical divisors, built from the component description and the local lengths.
- **Full ℓ-torsion after a finite extension (Layer 6)**: a finite separable extension with a rational point and Pic[ℓ] ≅ (ℤ/ℓ)^{2g}, with a degree bound. This consumes the Jacobian roadmap's J-D and J-E contracts.
