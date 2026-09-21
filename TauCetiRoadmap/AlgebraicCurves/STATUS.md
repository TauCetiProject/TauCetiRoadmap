<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"a3c29b550e007f5a7acf0313f49de95ee2a4b18e","ts":"2026-09-21T12:30:22Z"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `a3c29b5` (2026-09-21T12:30:22Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The function-field core through divisors, genus, and Weil-differential Riemann–Roch is in place, and the different/cotrace/Hurwitz core has landed. Layer 2 still lacks the two-chart model glue; constant-field extensions, the Kähler–Weil comparison, model classes, automorphism bounds, and the full curve dictionary remain partial or untouched.

### Named results

- **Riemann–Roch via a canonical divisor** — For an exact constant field, a nonzero Weil differential supplies a divisor satisfying the full Riemann–Roch identity; multiplication identifies (L(W-D)) with the corresponding differential filtration ([the theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferential), [duality](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.riemannRochSpaceEquivWeilDifferential)).
- **The Hurwitz genus formula** — For a finite separable extension with exact constants, the cross-multiplied relation ties the two genera to the degree of the different ([formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The Weierstrass gap theorem** — At a rational place with exact constants there are exactly (g) pole gaps ([gap theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Consequences/WeierstrassGaps.html#TauCeti.Place.card_weierstrassGaps)).
- **The genus-zero rationality criterion** — Genus zero together with a divisor of degree one yields an algebraic equivalence with the rational function field ([criterion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Consequences/GenusZero.html#TauCeti.nonempty_algEquiv_ratFunc_of_genus_eq_zero_of_divisor_degree_eq_one)).
- **The hyperelliptic characterization** — Away from characteristic two, hyperellipticity is equivalent to genus at least two plus a degree-two divisor whose Riemann–Roch space has dimension at least two ([characterization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Hyperelliptic.html#TauCeti.isHyperellipticFunctionField_iff_two_le_genus_and_exists_degree_eq_two_and_two_le_dim)).

### Notable definitions and infrastructure

- **Geometric degree and the constant compositum** — The extension degree is separated into the constant-field cost and the residual geometric degree ([geometric degree](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/GeometricDegree.html#TauCeti.geometricDegree)).
- **Finite normalization** — The integral closure of a polynomial subring in a finite function-field extension is finite, supplying affine model candidates ([normalization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/IntegralClosure/MvPolynomial.html#TauCeti.IsIntegralClosure.finite_adjoin_of_transcendental)).
- **The scheme point–place dictionary** — At a discrete-valuation stalk, the function field, valuation ring, residue field, degree, and order are now connected to the associated normalized place ([place map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/Scheme/Place.html#AlgebraicGeometry.Scheme.toPlace)).

### Roadmap coverage

Layers 0–1 and 3–4 are done, including the rational-function-field and full Weil Riemann–Roch chains. Layer 2 is partial: finite normalization is proved, but complementary-chart compatibility and the resulting regular/projective model are not. Layer 5 has its high-degree, genus-zero, [class-number](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.html#TauCeti.Divisor.finite_classGroup), local-component, [Clifford](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Consequences/Clifford.html#TauCeti.Divisor.two_mul_dim_le_degree_add_two_of_infinite) (infinite-constant-field), and gap results; completion comparison remains. Layer 6 now has the [fundamental identity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Extension/Fundamental.html#TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isFunctionField), geometric-degree bookkeeping, decomposition/inertia, and [lower ramification groups](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.html#TauCeti.Place.ramificationGroup), but extension-existence and constant-field-identification hypotheses still constrain the API. Layer 7 has the different divisor, tame theorem, cotrace, and Hurwitz formulas; worked cover examples are not established here. Layer 8 is partial (purely inseparable place theory and Galois filtration are present; genus invariance/drop, composita, Hilbert's formula, and unrestricted Clifford are not). Layer 9 has only the [Kähler-dimension entry point](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Kaehler.html#TauCeti.finrank_kaehlerDifferential_eq_one_of_separating). Layer 10 has elliptic and hyperelliptic beginnings but no plane-curve package; Layer 11 is untouched. Layer 12 has initial scheme/stalk/place maps, not the regular projective anti-equivalence or cohomological comparison.

## The frontier

- **Completion comparison for repartitions** — Relate the restricted-product (A_F) to complete-DVR and finite-adele constructions, preserving valuations, residue fields, and filtrations.
- **Two-chart affine/projective model compatibility** — Glue the finite normalization with the complementary chart and prove the regular model properties needed by the dictionary.
- **Constant-field extensions and genus** — Prove the perfect/separably generated invariance package and state the inseparable genus-drop counterexamples; this is the prerequisite for Layer 8's unrestricted exports.
- **Kähler–Weil comparison and residues** — Construct the residue theory and compare (Omega[F/k]) with Weil differentials; the existing one-dimensional Kähler result is only the entry point.
- **The regular projective curve/function-field dictionary** — Build curves from the compatible charts and prove the divisor, (H^0=L(D)), genus, and canonical-class comparison contracts.
