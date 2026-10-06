<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"41e5e4923e49435450084dd38f558165776282ff","ts":"2026-10-04T21:34:46Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"general Hilbert different formula, genus never increases, Abhyankar and composita, III.10-III.11 inseparable steps and genus estimates","state":"partial"},{"id":"Layer 9","remaining":"Laurent expansions and residues, change of uniformizer, local components as residues, the residue theorem, the elliptic invariant differential","state":"partial"},{"id":"Layer 10","remaining":"nonsingular Weierstrass model and Prop. 6.1.3, plane curves, general Kummer data, the Artin-Schreier genus formula","state":"partial"},{"id":"Layer 11","remaining":"Wronskian Weierstrass-point counts, non-hyperelliptic finiteness, elliptic translations, the Hermitian wild subgroup","state":"partial"},{"id":"Layer 12","remaining":"12A curve definition and k(X) a function field, normalizing P1 in F (12B), the anti-equivalence (12C), the dualizing-sheaf comparison","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"41e5e4923e49435450084dd38f558165776282ff"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `41e5e49` (2026-10-04T21:34:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch, the Hurwitz genus formula and the `84(g − 1)` bound are proved. Layers 0 to 7 are done. Layers 8 to 12 are genuinely partial: residues, Weierstrass points, plane curves and the scheme dictionary are the main gaps. No layer is untouched.

### Named results

- **The Riemann–Roch theorem**: if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula**: `[k' : k] · (2g' − 2) = [F' : F] · (2g − 2) + [k' : k] · deg Diff(F'/F)` when `F'/F` is finite separable with exact constants and `k'/k` is finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The Hurwitz `84(g − 1)` bound**: a finite automorphism group of a genus `g ≥ 2` field with exact constants, tame over its fixed field, has order at most `84(g − 1)`; tameness is automatic in characteristic zero ([`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.html#TauCeti.natCard_le_eighty_four_mul_genus_sub_one)).
- **Clifford's theorem**: `2ℓ(D) ≤ deg D + 2` for `0 ≤ deg D ≤ 2g − 2`, over every exact constant field, finite ones included ([`TauCeti.Divisor.two_mul_dim_le_degree_add_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Consequences/Clifford.html#TauCeti.Divisor.two_mul_dim_le_degree_add_two)).
- **Finiteness of hyperelliptic automorphism groups**: over an algebraically closed field of characteristic other than two, a hyperelliptic field has at most `2 · (2g + 2)!` automorphisms ([`TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Hyperelliptic/Finite.html#TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two)). It rests on `Aut(k(X)/k) ≅ PGL₂(k)` ([`RatFunc.pglEquivAlgEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/RatFunc/Mobius.html#RatFunc.pglEquivAlgEquiv)).

### Notable definitions and infrastructure

- **Affine models from any transcendental element** ([`TauCeti.isDedekindDomain_integralClosure_adjoin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/AffineModel/IntegralClosure.html#TauCeti.isDedekindDomain_integralClosure_adjoin)): the integral closure of `k[x]` in `F` is Dedekind with fraction field `F`, with no separability assumption.
- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)): it carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of this identity, and the Kähler–Weil comparison for a separating `x` is built on it.
- **Completions at places** ([`TauCeti.Place.completionEquivAdicCompletion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Completion/Adic.html#TauCeti.Place.completionEquivAdicCompletion)): built intrinsically from the order filtration and identified with each affine model's adic completion. At a rational place the completed valuation ring is topologically `k[[T]]` ([`TauCeti.Place.completionIntegersHomeomorphPowerSeries`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Expansion/Completion.html#TauCeti.Place.completionIntegersHomeomorphPowerSeries)), which is where residues will start.

### Roadmap coverage

Layers 0 to 7 are done; Layer 5 closed with the completion comparison and the density of repartitions in the finite adeles. Layers 8 to 12 are partial:

- **Layer 8** has genus invariance for finite separable constant extensions, the genus-drop counterexample, unrestricted Clifford, ramification groups with cyclic `G₀/G₁`, and Hilbert's different formula only in its monogenic form. It lacks the general Hilbert formula, the rule that the genus never increases, Abhyankar and the III.10–III.11 estimates.
- **Layer 9** has the Kähler–Weil comparison and power-series expansions at rational places, but no residues.
- **Layer 10** has the elliptic normal forms, the genus of `y² = f(x)`, uniqueness of the index-two subfield, and Artin–Schreier ramification with the different `(p − 1)(m + 1)`. It lacks nonsingularity and Proposition 6.1.3, plane curves, general Kummer data and the Artin–Schreier genus formula.
- **Layer 11** has rigidity, `PGL₂` and three-point rigidity, hyperelliptic finiteness and the Hurwitz bound. It has no Weierstrass-point count, no non-hyperelliptic finiteness and no Hermitian example.
- **Layer 12** has scheme-side comparisons that assume `k(X)` is a function field, but no normalization of `ℙ¹`.

## The frontier

- **Residues (Layer 9)**: extend the `k[[T]]` identification to `k((T))`, define `res_P` with its change-of-uniformizer formula and a trace version at non-rational places, then prove that local components are residues, the residue theorem, and that the comparison does not depend on `x`.
- **Weierstrass points and non-hyperelliptic finiteness (Layer 11)**: the Wronskian count of Weierstrass points, with at least `2g + 3` of them in the non-hyperelliptic case; rigidity then gives finiteness. The Hermitian wild subgroup is a separate, self-contained target.
- **Artin–Schreier and Kummer genus formulas (Layer 10)**: the local Artin–Schreier data is in, so what remains is summing it into the genus formula, plus Kummer covers under the roadmap's four hypotheses.
- **Elliptic models (Layer 10)**: show that the Weierstrass equation is nonsingular, and prove the converse, Proposition 6.1.3.
- **Normalizing `ℙ¹` in `F` (Layer 12B)**: the scheme gluing, the finite map to `ℙ¹`, projectivity, and 12A's proof that `k(X)` is a function field.
