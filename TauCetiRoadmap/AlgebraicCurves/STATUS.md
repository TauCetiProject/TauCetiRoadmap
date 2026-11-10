<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the trace-Gram computation of the different at inseparable residue fields, with the fierce biquadratic example's d = 2","state":"partial"},{"id":"Layer 9","remaining":"revise the base-compatible expansion target at inseparable residue fields; the unrestricted form is obstructed","state":"partial"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","remaining":"the characteristic-zero finite-map comparison and finite-model descent of 12B.0d, including the Cartier ramification divisor","state":"partial"}],"readme_sha":"989ae37955c78155b60c594b5a92ed60e48490d6231eecbe4e0184b17bdd2967","roadmap":"AlgebraicCurves","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The function-field theory through Riemann–Roch and Riemann–Hurwitz is complete. So are the model classes, the automorphism theory and the curve–function-field anti-equivalence in its projective form. What remains partial is narrower: the different at inseparable residue fields, the residue comparison beyond separable residues, and the characteristic-zero finite-map contracts of the scheme dictionary. No layer is untouched.

### Named results

- **The Riemann–Roch theorem** — Over any exact constant field, `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for a canonical divisor `W` ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula** — For finite separable extensions, `[k′ : k](2g′ − 2) = [F′ : F](2g − 2) + [k′ : k] deg Diff` ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The curve–function-field anti-equivalence** — Regular projective curves over any field, with dominant morphisms, are contravariantly equivalent to one-variable function fields with embeddings ([`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.html#TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat)).
- **The genus-change formula** — Under a finite linearly disjoint constant extension with exact constants on both sides, the genus drops by the sum of the local singularity degrees, which vanish at almost every place ([`TauCeti.genus_eq_genus_add_finsum_singularityDegree`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Change.html#TauCeti.genus_eq_genus_add_finsum_singularityDegree)).
- **The genus of a smooth plane curve** — The projective curve of a nonsingular homogeneous equation of degree `d` has genus `dim H¹(C, 𝒪_C) = (d − 1)(d − 2)/2` ([`TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_eq`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/PlaneCurve/Genus.html#TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_eq)).

### Notable definitions and infrastructure

- **Singularity degrees** — `δ_P = dim (𝒪′_P / 𝒪_P ⊗ k′)` measures how far the base-changed local ring is from normal. It locates an inseparable genus drop at finitely many places, and the genus is unchanged exactly when every `δ_P` vanishes ([`TauCeti.Place.singularityDegree`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus/Change.html#TauCeti.Place.singularityDegree)).
- **Projective plane curves as schemes** — The `Proj` of `R[X₀, X₁, X₂]/(G)`, with its three charts identified with dehomogenized coordinate rings and its function field with the affine one. This is the interface the plane-curve genus and the Klein quartic are proved through ([`TauCeti.AlgebraicGeometry.projectivePlaneCurve`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/PlaneCurve/Basic.html#TauCeti.AlgebraicGeometry.projectivePlaneCurve)).
- **Section rings** — The graded ring `⨁ₙ L(nD)` gives the projective embedding of the regular model: high powers of a pole divisor are generated in degree one. That embedding makes every regular proper curve projective, with no exact-constants hypothesis ([`TauCeti.Divisor.sectionRing`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/SectionRing.html#TauCeti.Divisor.sectionRing), [`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/ProjectiveEmbedding.html#AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver)).

### Roadmap coverage

Layers **0–7, 10 and 11 are done**. Layer 10 closed with the projective-plane scheme, its charts and its function field.

Layers **8, 9 and 12 are partial**:

- **Layer 8** has the III.11 genus estimates (Castelnuovo, Riemann's inequality, the plane-model bound), the genus-change formula, the regular-field tensor criteria and Hilbert's different formula under separable residues. It still lacks the general different computation at inseparable residue fields. The fierce biquadratic example has its ramification groups but not its different.
- **Layer 9** is unchanged: the trace-residue comparison holds at separable-residue places, and the unrestricted base-compatible expansion is obstructed.
- **Layer 12** now has projectivity over any field and the anti-equivalence in the projective category. The characteristic-zero finite-map comparison of 12B.0d, including the Cartier ramification divisor, is not established here.

These judgements rest partly on truncated evidence.

## The frontier

- **The different at inseparable residue fields** — Compute the different from a trace Gram matrix and its elementary divisors, so that `v(det T) = f·d` with the full residue degree. Then check this against the fierce biquadratic example, where `d = 2` but the group sum is `3`.
- **Characteristic-zero finite maps and descent** — Compare the ramification divisor of the cotangent map with the trace-dual different, and descend finite models to a finitely generated field, as the BelyiMaps consumer requires.
- **Genus change beyond the linearly disjoint case** — The singularity-degree formula assumes finite `k′/k`, exact constants in `F·k′` and `[F·k′ : F] = [k′ : k]`. Algebraic extensions where the constants grow are not covered by it.
- **Inseparable residue fields** — The residue comparison cannot simply drop separability: completions are Laurent-series fields over their residue fields, but not always compatibly with the base field. The target needs revising rather than proving.
