<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"invariance of the trace-dual different under completion at places with inseparable residue field (8.8-8.9)","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","remaining":"the characteristic-zero finite-map comparison and finite-model descent of 12B.0d, including the Cartier ramification divisor","state":"partial"}],"readme_sha":"3db5385b34eae9ebb98accdb3ada9ff226541b72de3fd365fab43c0d7543fb40","roadmap":"AlgebraicCurves","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The function-field theory through Riemann–Roch and Riemann–Hurwitz is complete. So are the model classes, the automorphism theory, the residue theory and the curve–function-field anti-equivalence. Two things are still partial: the behaviour of the different under completion at inseparable residue fields, and the characteristic-zero finite-map contracts of the scheme dictionary. No layer is untouched.

### Named results

- **The Riemann–Roch theorem** — Over any exact constant field, `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for a canonical divisor `W` ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula** — For finite separable extensions, `[k′ : k](2g′ − 2) = [F′ : F](2g − 2) + [k′ : k] deg Diff` ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The curve–function-field anti-equivalence** — Regular projective curves over any field, with dominant morphisms, are contravariantly equivalent to one-variable function fields with embeddings ([`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.html#TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat)).
- **Riemann–Roch on the regular model** — On the two-chart model `X_F`, `χ(𝒪(D)) = deg D + 1 − g` ([`TauCeti.AlgebraicGeometry.twoChartModel.eulerCharBelow_sheaf_eq_degree_add_one_sub_genus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/Cohomology.html#TauCeti.AlgebraicGeometry.twoChartModel.eulerCharBelow_sheaf_eq_degree_add_one_sub_genus)). It comes with `Pic(X_F) ≃ Cl(F)`, and with the dual of `H¹(𝒪(D))` identified with the Weil differentials bounded by `D` ([`TauCeti.AlgebraicGeometry.twoChartModel.cohomologyOneDualEquivWeilDifferentialFiltration`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/Cohomology.html#TauCeti.AlgebraicGeometry.twoChartModel.cohomologyOneDualEquivWeilDifferentialFiltration)).
- **The genus-change formula** — Under a finite linearly disjoint constant extension with exact constants on both sides, the genus drops by the sum of the local singularity degrees, which vanish at almost every place ([`TauCeti.genus_eq_genus_add_finsum_singularityDegree`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Change.html#TauCeti.genus_eq_genus_add_finsum_singularityDegree)).

### Notable definitions and infrastructure

- **Local degrees in extensions** — The completion of `F′` at `P′ ∣ P` has degree `e · f` over the completion of `F` at `P` ([`TauCeti.Place.finrank_completion`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Place/Completion/LocalDegree.html#TauCeti.Place.finrank_completion)). The local degrees add up to `[F′ : F]` with no separability hypothesis, and the global trace is the sum of the local ones. This is the ground on which the completion behaviour of the different has to be settled.
- **Singularity degrees** — `δ_P = dim (𝒪′_P / 𝒪_P ⊗ k′)` measures how far the base-changed local ring is from normal. It locates an inseparable genus drop at finitely many places ([`TauCeti.Place.singularityDegree`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Change.html#TauCeti.Place.singularityDegree)).
- **Smoothness of regular curves over perfect fields** — A curve whose codimension-one local rings are discrete valuation rings is smooth of relative dimension one over a perfect field ([`AlgebraicGeometry.Scheme.IsCurveOver.smoothOfRelativeDimension_one_of_perfectField`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/Smooth.html#AlgebraicGeometry.Scheme.IsCurveOver.smoothOfRelativeDimension_one_of_perfectField)). This connects the regular model to the smooth-model branch of constant extension.

### Roadmap coverage

Layers **0–7 and 9–11 are done**, and Layers **8 and 12 are partial**. Layer 9 counts as done under the current README, which requires expansions and residues only at places with separable residue field. The source proves that the coefficient field over `k` genuinely fails without that hypothesis. In Layer 8, the fierce biquadratic regression is proved. So are the discriminant formula `v(det T) = f · d` with the full residue degree and the survival of ramification groups and residue degrees under completion. Not proved here is that the trace-dual different itself is unchanged by completion without residue separability (§§8.8–8.9). Layer 12 has projectivity, the anti-equivalence, smoothness over perfect fields and the 12E cohomology comparison. The characteristic-zero finite-map comparison and finite-model descent of 12B.0d are not established here.

## The frontier

- **The different under completion** — Show that the trace-dual different and its length formula are unchanged on passing to the completion at a place with inseparable residue field. The local-degree, trace and residue-degree compatibilities it needs are now in place.
- **Characteristic-zero finite maps and descent** — Compare the Cartier ramification divisor of the cotangent map with the trace-dual different, and descend finite models to a finitely generated field, as the BelyiMaps consumer requires.
- **Genus change beyond the linearly disjoint case** — The singularity-degree formula assumes a finite `k′/k`, exact constants in `F·k′` and `[F·k′ : F] = [k′ : k]`. Algebraic extensions in which the constants grow are not covered by it.
