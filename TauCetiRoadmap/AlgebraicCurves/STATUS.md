<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"the completion comparison (complete-DVR completions, A_F into the finite adeles) and a non-rational genus-zero example","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"cotrace semilinearity and tower transitivity (Prop. 3.4.11), the Artin–Schreier acceptance test","state":"partial"},{"id":"Layer 8","remaining":"genus invariance and canonical classes under constant extension, unrestricted Clifford, the genus-drop example, cyclic G_0/G_1, Hilbert's formula, Abhyankar, III.11","state":"partial"},{"id":"Layer 9","remaining":"local expansions and residues, local components as residues, the residue theorem, independence from x, the elliptic invariant differential","state":"partial"},{"id":"Layer 10","remaining":"nonsingular Weierstrass model and Prop. 6.1.3; general hyperelliptic models and Prop. 6.2.4; plane curves; general Kummer data; Artin–Schreier covers","state":"partial"},{"id":"Layer 11","remaining":"Wronskian Weierstrass-point counts, finiteness for g ≥ 2, PGL₂ and three-point rigidity, the 84(g−1) bound, the Hermitian wild subgroup","state":"partial"},{"id":"Layer 12","remaining":"12A curve definition and k(X) a function field, normalizing P¹ in F (12B), the anti-equivalence (12C), the dualizing-sheaf comparison","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch and the Hurwitz genus formula are proved, and Layers 0 to 4 and Layer 6 are done. Layers 5 and 7 each lack only a few named results. Layers 8 to 12 are genuinely partial, and no layer is untouched.

### Named results

- **The Riemann–Roch theorem** — if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula** — `[k' : k] · (2g' − 2) = [F' : F] · (2g − 2) + [k' : k] · deg Diff(F'/F)` when `F'/F` is finite separable with exact constants and `k'/k` is finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The genus of `y² = f(x)`** — away from characteristic two, with `f` squarefree of degree `m`, the field has genus `⌊(m − 1)/2⌋` and exact constants, and it is hyperelliptic once `m ≥ 5` ([`TauCeti.genus_eq_of_sq_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.html#TauCeti.genus_eq_of_sq_eq)).
- **The Weierstrass equation of a genus-one field** — at each rational place `P` of a genus-one field with exact constants, some `x` and `y` with pole divisors `2P` and `3P` satisfy a Weierstrass equation and generate the field ([`TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.html#TauCeti.Place.exists_isWeierstrassCoordinates_of_genus_eq_one)). The equation can be put in Mathlib's normal forms in every characteristic, characteristic two included.
- **Riemann–Roch spaces under constant extension** — for `k` exact in `F` and `k'/k` finite separable, `ℓ(Con D) = ℓ(D)`, and any `k`-basis of `L(D)` stays a basis ([`TauCeti.Divisor.dim_conorm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/ConstantExtension/RiemannRoch.html#TauCeti.Divisor.dim_conorm)).

### Notable definitions and infrastructure

- **Affine models from any transcendental element** ([`TauCeti.isDedekindDomain_integralClosure_adjoin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/AffineModel/IntegralClosure.html#TauCeti.isDedekindDomain_integralClosure_adjoin)) — the integral closure of `k[x]` in `F` is Dedekind with fraction field `F`, with no separability assumption, and the charts for `x` and `x⁻¹` glue.
- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)) — it carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of this identity, and applying it to `F/k(x)` gives the canonical divisor `(dx) = −2 (x)_∞ + Diff(F/k(x))`.
- **The Kähler–Weil comparison** ([`TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Comparison.html#TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating)) — for a separating `x`, an `F`-linear isomorphism `Ω[F⁄k] ≃ Ω_F` sends the Kähler `dx` to the cotrace of the standard differential of `k(x)`. It still depends on `x` and uses no residues.

### Roadmap coverage

Layers 0 to 4 are done, and so is Layer 6, now that the different exponent is known to be constant over a place in a Galois extension. Layer 5 lacks the completion comparison and a non-rational genus-zero example. Layer 7 lacks the cotrace's semilinearity and tower law and the Artin–Schreier acceptance test; its `y² = f(x)` worked example is now proved. Layers 8 to 12 are partial:

- **Layer 8** has ramification groups, and finite separable constant extensions are unramified and preserve `ℓ`, but genus invariance, unrestricted Clifford and the inseparable examples are missing.
- **Layer 9** has the comparison but no residues.
- **Layer 10** has the elliptic normal forms and the genus of `y² = f(x)`, but no nonsingularity, plane curves or Artin–Schreier covers.
- **Layer 11** has rigidity and the `(2, 3, 7)` arithmetic, but no Weierstrass-point count and no Hurwitz bound.
- **Layer 12** has scheme-side comparisons that assume `k(X)` is a function field, but no normalization of `ℙ¹`.

## The frontier

- **Genus invariance under constant extension (Layer 8, Theorem 3.6.3)** — unramifiedness and `ℓ(Con D) = ℓ(D)` are proved for finite separable `k'/k`. What remains is to deduce `g' = g` and that canonical divisors stay canonical, then extend to the algebraic closure and derive Clifford for finite constant fields.
- **Elliptic models (Layer 10)** — the Weierstrass equations and their normal forms exist in every characteristic. What remains is to prove the equation nonsingular, so that `F` is the function field of an elliptic curve, and then the converse, Proposition 6.1.3.
- **The Hurwitz bound and finiteness of `Aut(F/k)` for `g ≥ 2` (Layer 11)** — rigidity and the `1/42` triangle bound ([`TauCeti.one_div_forty_two_le_hyperbolic_triangle_deficit`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Data/Rat/HurwitzTriangle.html#TauCeti.one_div_forty_two_le_hyperbolic_triangle_deficit)) are in. Missing are Riemann–Hurwitz for `F/F^G` with its branch analysis, the Wronskian count of Weierstrass points, and uniqueness of the degree-two rational subfield.
- **Normalizing `ℙ¹` in `F` (Layer 12B)** — the Layer 2 inputs are complete. Missing are the scheme gluing, the finite map to `ℙ¹`, projectivity, and 12A's proof that `k(X)` is a function field.
- **Residues (Layer 9, with Layer 5's completion milestone)** — local expansions, `res_P` with its change-of-uniformizer formula, local components as residues, the residue theorem, and independence of the comparison from `x`.
