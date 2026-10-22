<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"fd486a548737649acea650f298f83c4eb643851e","ts":"2026-10-21T23:37:36Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"Cor. 3.9.7 on complete splitting in composita and the III.11 drop estimates are not established in the supplied material","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","remaining":"projectivity of regular proper curves when k is not exact in the function field; dualizing-sheaf comparison without its all-places hypothesis","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"fd486a548737649acea650f298f83c4eb643851e"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `fd486a5` (2026-10-21T23:37:36Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch, the Hurwitz genus formula, the `84(g − 1)` bound and the anti-equivalence between regular proper curves and function fields are all proved. Layers 0 to 7 and 9 to 11 are done. Layers 8 and 12 are partial, each with a short list of remaining items. No layer is untouched.

### Named results

- **The Riemann–Roch theorem**: if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula**: `[k' : k](2g' − 2) = [F' : F](2g − 2) + [k' : k] deg Diff(F'/F)` for `F'/F` finite separable, with exact constants and `k'/k` finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The anti-equivalence of curves and function fields**: over any field `k`, `X ↦ k(X)` is an equivalence between regular proper curves with dominant morphisms and the opposite of the category of function fields over `k`. Its inverse sends `F` to the normalization of `ℙ¹` in `F` ([`RegularProperCurveCat.equivFunctionFieldCat`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.html#TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat)).
- **The Hurwitz `84(g − 1)` bound**: a finite automorphism group of a genus `g ≥ 2` field with exact constants, tame over its fixed field, has order at most `84(g − 1)` ([`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.html#TauCeti.natCard_le_eighty_four_mul_genus_sub_one)). A Hermitian translation group shows tameness is needed.
- **The genus of a smooth plane curve**: a smooth projective plane curve of degree `d` has genus `(d − 1)(d − 2)/2`, with canonical class is `(d − 3)H` ([`TauCeti.genus_eq_of_isHomogeneous`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/PlaneCurve/Projective.html#TauCeti.genus_eq_of_isHomogeneous)).

### Notable definitions and infrastructure

- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)) carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of that identity.
- **The two-chart model as `Proj`** ([`twoChartModel.sectionRingProjIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/SectionRing.html#TauCeti.AlgebraicGeometry.twoChartModel.sectionRingProjIso)) identifies the model glued from the affine models of `z` and `z⁻¹` with `Proj` of the section ring of the pole divisor of `z`. Projectivity is proved through this description.
- **Local components as trace residues** ([`Place.traceResidue_coord_smul_eq_repartitionDualComponent`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Differential/Independence.html#TauCeti.Place.traceResidue_coord_smul_eq_repartitionDualComponent)): at any place with separable residue field, the local component of a Weil differential is the trace of a residue. Over a perfect field this gives the residue theorem at every place.

### Roadmap coverage

Layers 0 to 7 were already done. This window finished three more:

- **Layer 9** now has residues and their transformation formula at every place with separable residue field. It also has a Kähler–Weil comparison that does not depend on the separating element, and the residue theorem over any perfect constant field. Every completion is `F_P((T))`, but at an inseparable residue field it is not `F_P((T))` over `k`. A guard theorem records this.
- **Layer 10** now has the Kummer genus formula and cyclicity under the roadmap's hypotheses, the full projection route for smooth plane curves, the imperfect-residue Artin–Schreier guard in `𝔽_p(a)((t))`, the characteristic-two hyperelliptic criterion, and the elliptic different in every characteristic.
- **Layer 11** now has automorphisms acting on Weil differentials, with equivariant divisors and a fixed canonical class.

Two layers remain partial:

- **Layer 8** has Abhyankar's lemma, Corollary 3.9.3, the absolute-irreducibility criterion (Corollary 3.6.8), Proposition 3.6.6, and Theorem 3.6.3 for infinite separable algebraic constant extensions. The genus never increases under algebraic constant extension. Corollary 3.9.7 and the III.11 drop estimates do not appear in the supplied material, which was partly truncated, so their status is unclear.
- **Layer 12** has the anti-equivalence, `ℙ¹_k` as the two-chart model of `k(X)`, models as normalizations, the genus and genus-one ladder compared with cohomology, and Riemann–Roch for line bundles in Serre-duality form. The geometric category is regular *proper* curves. Projectivity is proved only when `k` is exact in the function field.

## The frontier

- **Projectivity without exact constants (Layer 12B)**: a regular proper curve is shown to be projective only when `k` is algebraically closed in `k(X)`. The roadmap states the anti-equivalence for projective curves.
- **Complete splitting in composita (Layer 8)**: Corollary 3.9.7, a rational place that splits completely in `F₁` and `F₂` splits completely in `F₁F₂` with exact constants.
- **III.11 drop estimates (Layer 8)**: the genus-drop counterexample and non-increase are proved, but the quantitative estimates are not established here.
- **The dualizing sheaf in general (Layer 12E)**: the comparison of `Ω_{X/k}` with the canonical class assumes a curve that carries all the places of its function field. Whether that hypothesis can be removed is not settled here.
