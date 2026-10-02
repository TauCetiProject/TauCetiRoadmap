<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"the completion comparison: complete-DVR completions and A_F into the finite adeles","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"passage to the algebraic closure, unrestricted Clifford, genus never increases, cyclic G_0/G_1, Hilbert's formula, Abhyankar, III.10-III.11","state":"partial"},{"id":"Layer 9","remaining":"local expansions and residues, local components as residues, the residue theorem, independence from x, the elliptic invariant differential","state":"partial"},{"id":"Layer 10","remaining":"nonsingular Weierstrass model and Prop. 6.1.3; plane curves; general Kummer data; Artin-Schreier covers","state":"partial"},{"id":"Layer 11","remaining":"Wronskian Weierstrass-point counts, PGL2 and three-point rigidity, finiteness for g at least 2, the 84(g-1) bound, the Hermitian wild subgroup","state":"partial"},{"id":"Layer 12","remaining":"12A curve definition and k(X) a function field, normalizing P1 in F (12B), the anti-equivalence (12C), the dualizing-sheaf comparison","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch and the Hurwitz genus formula are proved, and Layers 0 to 4, 6 and 7 are done. Layer 5 lacks only the completion comparison. Layers 8 to 12 are genuinely partial, and no layer is untouched.

### Named results

- **The Riemann–Roch theorem**: if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula**: `[k' : k] · (2g' − 2) = [F' : F] · (2g − 2) + [k' : k] · deg Diff(F'/F)` when `F'/F` is finite separable with exact constants and `k'/k` is finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **Genus invariance under constant extension**: if `k` is exact in `F` and `k'/k` is finite separable, then `F·k'` has the same genus, and the conorm is injective on classes and preserves canonical classes ([`TauCeti.genus_eq_genus_of_constantCompositum_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus.html#TauCeti.genus_eq_genus_of_constantCompositum_eq_top)). An inseparable extension can make the genus drop: `y² = x^p − t` over `𝔽_p(t)` becomes rational after `t^{1/p}` is adjoined ([`TauCeti.GenusDrop.genus_lt_genus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/InseparableGenusDrop.html#TauCeti.GenusDrop.genus_lt_genus)).
- **The genus of `y² = f(x)`**: away from characteristic two, with `f` squarefree of degree `m`, the field has genus `⌊(m − 1)/2⌋` and is hyperelliptic once `m ≥ 5` ([`TauCeti.genus_eq_of_sq_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.html#TauCeti.genus_eq_of_sq_eq)). In genus at least two, its rational subfield of index two is unique ([`TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.html#TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two)).
- **The Weierstrass equation of a genus-one field**: at each rational place `P` of a genus-one field with exact constants, some `x` and `y` with pole divisors `2P` and `3P` satisfy a Weierstrass equation and generate the field, in Mathlib's normal forms in every characteristic ([`TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.html#TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one)).

### Notable definitions and infrastructure

- **Affine models from any transcendental element** ([`TauCeti.isDedekindDomain_integralClosure_adjoin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/AffineModel/IntegralClosure.html#TauCeti.isDedekindDomain_integralClosure_adjoin)): the integral closure of `k[x]` in `F` is Dedekind with fraction field `F`, with no separability assumption, and the charts for `x` and `x⁻¹` glue.
- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)): it carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`, and it is `F`-semilinear and transitive in towers. Hurwitz is the degree of this identity.
- **The Kähler–Weil comparison** ([`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Comparison.html#TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating)): for a separating `x`, an `F`-linear isomorphism `Ω[F⁄k] ≃ Ω_F` sends the Kähler `dx` to the cotrace of the standard differential of `k(x)`. It still depends on `x`.

### Roadmap coverage

Layers 0 to 4, 6 and 7 are done. Layer 7 closed with the cotrace's tower law and a wild example, `y² + y = x³` over `𝔽₂`. Layer 5 now has its non-rational genus-zero example, the pointless conic `x² + y² + 1 = 0`, and lacks only the completion comparison. Layers 8 to 12 are partial:

- **Layer 8** has genus invariance for finite separable constant extensions, the genus-drop counterexample, and ramification groups. It lacks the passage to the algebraic closure, unrestricted Clifford, the general rule that the genus never increases, cyclic `G₀/G₁`, Hilbert's formula, Abhyankar and the III.10–III.11 estimates.
- **Layer 9** has the comparison but no residues.
- **Layer 10** has the elliptic normal forms, the genus of `y² = f(x)` and the uniqueness of the index-two subfield. It lacks nonsingularity and Proposition 6.1.3, plane curves, general Kummer data and Artin–Schreier covers.
- **Layer 11** has rigidity, the `(2, 3, 7)` arithmetic and the restriction of hyperelliptic automorphisms to `k(x)`. It has no Weierstrass-point count and no Hurwitz bound.
- **Layer 12** has scheme-side comparisons that assume `k(X)` is a function field, but no normalization of `ℙ¹`.

## The frontier

- **Unrestricted Clifford (Layer 8)**: genus, degree and `ℓ` are now preserved under finite separable constant extensions. What remains is to pass to `F·k̄` for an algebraic closure and apply the infinite-field Clifford there.
- **Finiteness of `Aut(F/k)` in the hyperelliptic case (Layer 11)**: automorphisms already restrict to `k(x)`, with kernel the automorphisms over `k(x)`. What remains is `Aut(k(x)/k) ≅ PGL₂(k)` with three-point rigidity, and the preservation of the branch set.
- **Elliptic models (Layer 10)**: what remains is to show that the Weierstrass equation is nonsingular, so that `F` is the function field of an elliptic curve, and to prove the converse, Proposition 6.1.3.
- **Residues (Layer 9, with Layer 5's completion milestone)**: what remains is complete-DVR completions, local expansions, `res_P` with its change-of-uniformizer formula, local components as residues, the residue theorem, and independence of the comparison from `x`.
- **Normalizing `ℙ¹` in `F` (Layer 12B)**: what remains is the scheme gluing, the finite map to `ℙ¹`, projectivity, and 12A's proof that `k(X)` is a function field.
