<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the III.11 genus-drop estimates for inseparable constant extensions","state":"partial"},{"id":"Layer 9","remaining":"revise the base-compatible expansion target at inseparable residue fields; the unrestricted form is obstructed","state":"partial"},{"id":"Layer 10","remaining":"the projective-plane scheme construction and its three-chart/function-field interface are not established here","state":"partial"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","remaining":"projectivity without exact constants and the anti-equivalence in the projective target category","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The function-field theory through Riemann–Roch and Riemann–Hurwitz is complete, as is the roadmap's automorphism theory, including finiteness in characteristic zero and the tame Hurwitz bound. The curve–function-field anti-equivalence is now packaged for regular proper curves; the full projective formulation and parts of the constant-extension, residue and plane-model scope remain partial. No layer is untouched.

### Named results

- **The Riemann–Roch theorem** — Over any exact constant field, `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for a canonical divisor `W` ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula** — For finite separable function-field extensions with finite separable exact-constant extension, `[k′ : k](2g′ − 2) = [F′ : F](2g − 2) + [k′ : k] deg Diff` ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The curve–function-field anti-equivalence** — Regular proper curves with dominant morphisms are contravariantly equivalent to one-variable function fields with embeddings, over any field ([`TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.html#TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat)).
- **Abhyankar's lemma** — In a compositum, when one of the two extensions at the place is tame, the ramification index is the least common multiple of the two indices ([`TauCeti.Place.ramificationIdx_restrict_sup`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Place/Extension/Abhyankar.html#TauCeti.Place.ramificationIdx_restrict_sup)).
- **The smooth plane-curve genus formula** — A geometrically nonsingular homogeneous equation of degree `d` gives genus `(d − 1)(d − 2)/2` for its coordinate-generated function field ([`TauCeti.genus_eq_of_isHomogeneous`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/PlaneCurve/Projective.html#TauCeti.genus_eq_of_isHomogeneous)).

### Notable definitions and infrastructure

- **Section rings** — The graded ring `⨁ₙ L(nD)` connects Riemann–Roch spaces to projective embeddings; sufficiently high powers of pole divisors give generation in degree one ([`TauCeti.Divisor.sectionRing`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/SectionRing.html#TauCeti.Divisor.sectionRing), [`TauCeti.riemannRochSpace_nsmul_poles_pow_le_pow`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/Pencil.html#TauCeti.riemannRochSpace_nsmul_poles_pow_le_pow)).
- **Automorphisms acting on Weil differentials** — The semilinear action transports local components and differential divisors, and preserves the canonical class, closing the last recorded automorphism milestone ([`TauCeti.weilDifferentialRepresentation`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Differential/Automorphism.html#TauCeti.weilDifferentialRepresentation)).
- **Completions over residue fields** — Every completed valued field admits a Laurent-series presentation, including inseparable residue fields; respecting the original constant field requires additional hypotheses ([`TauCeti.Place.exists_completion_ringEquiv_laurentSeries`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Place/Expansion/Laurent/CoefficientField.html#TauCeti.Place.exists_completion_ringEquiv_laurentSeries)).

### Roadmap coverage

Layers **0–7 and 11 are done**. Layers **8–10 and 12 remain partial**. Layer 8 now includes infinite separable algebraic constant extensions, Abhyankar's lemma, unramified composita and the absolute-irreducibility criterion; the III.11 genus-drop estimates remain unestablished here. Layer 9 has the trace-residue comparison at every separable-residue place, without an infinitude assumption, and arbitrary-residue Laurent presentations as valued fields; an unrestricted presentation over the base field is obstructed. Layer 10 now has general Kummer nondegeneracy, the imperfect-residue guard, characteristic-two hyperelliptic criteria and plane genus/canonical-class formulas; the complete projective-plane scheme and three-chart interface is not established here. Layer 12 has normalization, the proper anti-equivalence and the earlier divisor/cohomology dictionary, with projectivity proved under exact constants. These assessments use the visible declarations; some supplied evidence is truncated.

## The frontier

- **The projective anti-equivalence** — Extend projectivity beyond the exact-constants hypothesis and package the equivalence in the roadmap's projective target category; the current equivalence is for proper curves.
- **Genus-drop estimates** — Establish the remaining III.11 estimates for inseparable constant extensions, beyond the known non-increase theorem and strict-drop example.
- **Projective plane models** — Supply the geometric construction and its three-chart/function-field interface; the general homogeneous-equation genus formula is already available.
- **Inseparable residue fields** — Revise the unrestricted expansion target: a Laurent presentation as a valued field exists, but one over the base field can fail, so the residue comparison cannot simply drop separability ([`TauCeti.Place.isEmpty_completion_algEquiv_laurentSeries`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Place/Completion/InseparableResidueField.html#TauCeti.Place.isEmpty_completion_algEquiv_laurentSeries)).
