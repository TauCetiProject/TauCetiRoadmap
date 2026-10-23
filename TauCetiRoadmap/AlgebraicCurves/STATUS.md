<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the III.11 genus-drop estimates; Cor. 3.9.7 (complete splitting in composita) is not evidenced","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","remaining":"12E dualizing sheaf matched with the canonical class beyond algebraically closed k; 12B projectivity without exact constants","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch, the Hurwitz genus formula, the `84(g − 1)` bound and the anti-equivalence between regular proper curves and function fields are all proved. Layers 0 to 7 and 9 to 11 are done. Layer 8 lacks the III.11 genus-drop estimates. Layer 12 lacks the dualizing-sheaf comparison beyond algebraically closed `k` and projectivity without exact constants.

### Named results

- **The Riemann–Roch theorem**: if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula**: `[k' : k](2g' − 2) = [F' : F](2g − 2) + [k' : k] deg Diff(F'/F)` for `F'/F` finite separable, with exact constants and `k'/k` finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The curves–function fields anti-equivalence**: over a field `k`, taking the function field is an equivalence from regular proper curves with dominant morphisms to the opposite category of function fields of one variable, with the two-chart model, the normalization of `ℙ¹_k` in `F`, as inverse ([`TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.html#TauCeti.AlgebraicGeometry.RegularProperCurveCat.equivFunctionFieldCat)).
- **The Hurwitz `84(g − 1)` bound**: a finite automorphism group of a genus `g ≥ 2` field with exact constants, tame over its fixed field, has order at most `84(g − 1)` ([`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.html#TauCeti.natCard_le_eighty_four_mul_genus_sub_one)). The Hermitian translation group of order `q³` shows that tameness cannot be dropped.
- **The genus of a smooth plane curve**: a projective plane curve of degree `d` that is nonsingular over an algebraic closure has genus `(d − 1)(d − 2)/2`, by a separating projection and the different, with canonical class cut out by curves of degree `d − 3` ([`TauCeti.genus_eq_of_isHomogeneous`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/PlaneCurve/Projective.html#TauCeti.genus_eq_of_isHomogeneous)).

### Notable definitions and infrastructure

- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)) carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of that identity, and the Kähler–Weil comparison, now independent of the separating element, is built on it.
- **The section ring** `⨁ₙ L(nD)` of a divisor ([`TauCeti.Divisor.sectionRing`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/SectionRing.html#TauCeti.Divisor.sectionRing)). For a pole divisor its `Proj` is the two-chart model, and a high enough power is generated in degree one, which embeds the model in projective space.
- **Laurent expansions at any place** ([`TauCeti.Place.completionEquivLaurentSeriesOfSection`](https://taucetiproject.org/docs/TauCeti/FieldTheory/FunctionField/Place/Expansion/Laurent/CoefficientField.html#TauCeti.Place.completionEquivLaurentSeriesOfSection)) identify the completion with `F_P((T))` once a coefficient field is chosen. Such a field exists at every place, which makes residues work at places of any degree.

### Roadmap coverage

Layers 0 to 7 are done, and so are Layers 9, 10 and 11. Layer 9's residues and residue theorem need a separable residue field, or a perfect constant field. A guard theorem shows that no Laurent expansion over `k` exists at an inseparable residue field, so this hypothesis is necessary. Layer 10 now has the Kummer genus formula under the nondegeneracy hypothesis, the imperfect-residue Artin–Schreier guard, the full plane-curve projection route and the characteristic-two hyperelliptic criterion. Layer 11 gained the action of automorphisms on Weil differentials. Finiteness of `Aut(F/k)` for `g ≥ 2` holds over algebraically closed `k` with distinct Weierstrass gaps, which covers characteristic zero. Two layers are partial:

- **Layer 8** has genus invariance for all separable algebraic constant extensions, finite or not, and the theorem that the genus never increases. It also has Abhyankar's lemma, Corollary 3.9.3 and Corollary 3.6.8 over a perfect base, along with Hilbert's different formula and the Castelnuovo, Riemann and plane-model bounds. The III.11 drop estimates are not established. The reports also give no evidence for Corollary 3.9.7.
- **Layer 12** has 12A, 12C and 12D. For 12B, it has the identification of the model with the normalization of `ℙ¹_k`, and projectivity when `k` is exact in `F`. For 12E, it has `H⁰ = L(D)`, the cohomological genus and Riemann–Roch for line bundles in Serre-duality form. The dualizing sheaf is matched with the canonical class only over algebraically closed `k`.

## The frontier

- **The III.11 genus-drop estimates (Layer 8)**: the last Layer 8 deliverable named in the roadmap. Corollary 3.9.7, on complete splitting in composita, should also be confirmed or proved.
- **The dualizing sheaf beyond algebraically closed `k` (Layer 12E)**: Serre-duality-form Riemann–Roch for line bundles and the genus comparison ([`TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Curves/TwoChartModel/Genus.html#TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus)) are in place. What remains is identifying `ω_{X/k}` with the canonical class in the scope the roadmap fixes: separably generated `F`, smooth and geometrically connected model.
- **Projectivity without exact constants (Layer 12B)**: the projective embedding assumes that `k` is algebraically closed in `F`. The general case is not covered.
