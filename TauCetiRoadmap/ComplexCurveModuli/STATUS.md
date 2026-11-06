<!--tauceti-status:v1 {"roadmap":"ComplexCurveModuli","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: ComplexCurveModuli

This file documents the status of the ComplexCurveModuli roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** D1 is well advanced. The nodal curve exists as a Hausdorff glued space with a structure sheaf whose stalks are the normalization's at smooth points and the branch-pair node ring at nodes. It also has its isomorphisms, automorphism group and both auxiliary-mark groupoids. D3.1's circle `H^s` package is mostly in place. There is still no analytic family, deformation complex or chart groupoid: D0, D2, D3.2–D3.6 and D4–D8 have not started.

### Named results

- **Wiener's lemma for `H^s`, `s > 1/2`** — an element of the circle Sobolev algebra is invertible exactly when its continuous representative takes invertible values everywhere ([`CircleSobolev.isUnit_iff_forall_isUnit`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle/Spectrum.html#TauCeti.CircleSobolev.isUnit_iff_forall_isUnit)). It rests on the product estimate making `H^s` a Banach algebra ([`CircleSobolev.norm_mul_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle/Algebra.html#TauCeti.CircleSobolev.norm_mul_le)).
- **Rellich's theorem on the circle** — for `t < s` the inclusion `H^s → H^t` is compact, for finite-dimensional coefficients (`CircleSobolev.isCompactOperator_inclusion`).
- **Analyticity of the holomorphic Nemytskii map** — composition with a function holomorphic on an open `U` is an analytic map on the open set of `u ∈ H^s` with values in `U` ([`CircleSobolev.analyticOnNhd_nemytskii`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle/Nemytskii.html#TauCeti.CircleSobolev.analyticOnNhd_nemytskii)).
- **Stalks of a glued nodal curve** — at a node, restriction to the two branches identifies the stalk of the glued curve with the branch-pair node ring ([`NodalGluing.quotientStalkToNode_bijective`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/StructureSheaf.html#TauCeti.NodalGluing.quotientStalkToNode_bijective)). Away from the nodes it is the holomorphic stalk of the normalization ([`NodalGluing.quotientStalkBranch_bijective`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/StructureSheaf.html#TauCeti.NodalGluing.quotientStalkBranch_bijective)).
- **Genus under smoothing** — smoothing any set of nodes preserves arithmetic genus, the lost first Betti number reappearing in the component genera ([`DualGraph.arithmeticGenus_smoothing`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/DualGraph/Smoothing.html#TauCeti.DualGraph.arithmeticGenus_smoothing)). The matching count for cutting is [`DualGraph.sum_arithmeticGenus_cutComponent_add_card`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/DualGraph/Cutting.html#TauCeti.DualGraph.sum_arithmeticGenus_cutComponent_add_card).

### Notable definitions and infrastructure

- [`NodalGluing.GluedCurve`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/Basic.html#TauCeti.NodalGluing.GluedCurve) is the quotient of the normalization components by flag pairs. It comes with Hausdorffness, a closed finite node set, an open embedding off the nodes and the quotient structure sheaf [`holomorphicStructureSheaf.quotientSheaf`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/Quotient.html#TauCeti.holomorphicStructureSheaf.quotientSheaf). This is the curve carrier every later layer builds on.
- [`NodalGluing.Iso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/Iso.html#TauCeti.NodalGluing.Iso) and [`NodalGluing.Aut`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/Iso.html#TauCeti.NodalGluing.Aut) are the actual arrows: biholomorphisms of normalizations respecting flag pairs, with induced branch, node and component maps and faithful descent to the glued curve. The [unordered](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/AuxiliaryMarks.html#TauCeti.NodalGluing.AuxiliaryMarkedCurve.unorderedAuxiliaryIsomorphismGroupoid) and [partitioned](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/NodalGluing/PartitionedAuxiliaryMarks.html#TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid) auxiliary-mark groupoids are built on them, and are what D4.7 and D6 will need.
- [`CircleSobolev.mulFourierSeriesEquiv`](https://taucetiproject.org/docs/TauCeti/Analysis/Sobolev/Circle/Multiplier.html#TauCeti.CircleSobolev.mulFourierSeriesEquiv) makes multiplication by a nowhere-vanishing smooth function an automorphism of `H^s` for every real `s`. This is the multiplier statement D3.1 asks for, and it is used in the boundary analysis of D3.2 and D4.

### Roadmap coverage

D1 is partial but substantial. Done: the glued topology and node ring, the quotient sheaf and its stalks, genus compatibility with smoothing and cutting, isomorphisms with descent, the automorphism group with its branch action, and both auxiliary groupoids with finiteness of arrows. Missing: lifting of isomorphisms from glued curves, a bundled compact connected curve type with the genus formula tied to an actual curve, ineffective actions on deformation bases, and stability iff finite automorphisms, which waits on D0. D3.1 is partial. Done: completeness, density, Rellich, continuous evaluation, the algebra and product estimates, Wiener's lemma, holomorphic Nemytskii maps, smooth multipliers, rotations and differentiation. Missing: smooth Nemytskii maps, general circle diffeomorphisms, coordinate invariance, finite disjoint unions, Hilbert manifolds of boundary maps and integer `H^k` on components. D0, D2, D3.2–D3.6 and D4–D8 have not started.

## The frontier

- **Finish D1's carrier**: bundle compact connected normalization components into a nodal-curve type, prove lifting of homeomorphisms that preserve nodes, and relate the graph genus to the curve.
- **Circle diffeomorphisms on `H^s` (D3.1)**: rotations act, but bounded isomorphisms for general fixed diffeomorphisms and the derivative offsets for variable reparametrizations do not. Coordinate invariance and Hilbert manifolds of boundary maps follow from these.
- **Node ring versus `ℂ{x,y}/(xy)` (D2.1)**: the branch relations are proved, but the isomorphism needs the ComplexComparisonPartII C−1.1 convergent-germ carrier.
- **The native-manifold analytic-space instance (D2.0)**: `nativeComplexManifoldAnalyticSpace` and the holomorphic-map/local-ringed-morphism equivalence, on which all `N_s` charts sit.
- **D0's classification floor**: genus-zero and genus-one normal forms and uniformization. These are needed to derive stability iff finite automorphisms in D1.
