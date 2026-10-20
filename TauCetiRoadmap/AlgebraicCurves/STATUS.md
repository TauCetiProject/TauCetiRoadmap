<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"Abhyankar's lemma and Cor. 3.9.3, the absolute-irreducibility criterion Cor. 3.6.8, Thm 3.6.3 for infinite algebraic constant extensions, III.11 drop estimates","state":"partial"},{"id":"Layer 9","remaining":"local components as residues for general differentials at nonrational places and without infinitely many rational places; Laurent theory at inseparable residue fields","state":"partial"},{"id":"Layer 10","remaining":"Kummer covers as cyclic Galois under general nondegeneracy, the imperfect-residue Artin-Schreier guard, the full plane-curve projection route, char-2 hyperelliptic criterion","state":"partial"},{"id":"Layer 11","remaining":"the action of automorphisms on Weil differentials","state":"partial"},{"id":"Layer 12","remaining":"12B projectivity and identification with the normalization of P1, 12C essential surjectivity and the anti-equivalence, 12E dualizing sheaf beyond algebraically closed k","state":"partial"}],"readme_sha":"8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5","roadmap":"AlgebraicCurves","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Riemann–Roch, the Hurwitz genus formula, the `84(g − 1)` bound and finiteness of automorphism groups in genus at least two are proved. Layers 0 to 7 are done. Layers 8 to 12 are each partial, with most of their milestones in place. Layer 11 lacks only the action on differentials, and Layer 12's anti-equivalence is the largest missing piece. No layer is untouched.

### Named results

- **The Riemann–Roch theorem**: if `W` is the divisor of a nonzero Weil differential, then `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for every divisor `D`, over any exact constant field ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)).
- **The Hurwitz genus formula**: `[k' : k](2g' − 2) = [F' : F](2g − 2) + [k' : k] deg Diff(F'/F)` for `F'/F` finite separable, with exact constants and `k'/k` finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **The Hurwitz `84(g − 1)` bound**: a finite automorphism group of a genus `g ≥ 2` field with exact constants, tame over its fixed field, has order at most `84(g − 1)` ([`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Automorphism/HurwitzBound.html#TauCeti.natCard_le_eighty_four_mul_genus_sub_one)). The Hermitian translation group of order `q³` shows that tameness cannot be dropped.
- **Finiteness of the automorphism group in genus at least two**: over an algebraically closed field where Weierstrass gaps are distinct as field elements, which always holds in characteristic zero, `Aut(F/k)` is finite. Non-hyperelliptic fields have at least `2g + 3` Weierstrass points, and rigidity does the rest; the hyperelliptic case goes through `PGL₂` (`TauCeti.finite_algEquiv_of_two_le_genus`).
- **The Artin–Schreier genus formula**: `[k' : k](2g' − 2) = p(2g − 2) + (p − 1) ∑_P (m_P + 1) deg P` for `y^p − y = u`, with reduced pole orders `m_P` supplied as hypotheses ([`TauCeti.artinSchreier_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/ArtinSchreier/Genus.html#TauCeti.artinSchreier_genus_formula)).

### Notable definitions and infrastructure

- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)) carries a Weil differential `ω` of `F` to one of `F'` with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of that identity. The Kähler–Weil comparison and the formula `(dx) = −2(x)_∞ + Diff(F/k(x))` are built on it.
- **Completions at places** ([`TauCeti.Place.completionEquivAdicCompletion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Completion/Adic.html#TauCeti.Place.completionEquivAdicCompletion)) come from the order filtration and are identified with each affine model's adic completion. Laurent expansions and residues start here.
- **Weierstrass coordinates on elliptic curves** ([`TauCeti.Place.exists_isWeierstrassCoordinates_isElliptic_of_genus_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Elliptic/Nonsingular.html#TauCeti.Place.exists_isWeierstrassCoordinates_isElliptic_of_genus_eq_one)) exist at every rational place of a genus-one field over a perfect constant field. This links the intrinsic theory to Mathlib's `WeierstrassCurve`.

### Roadmap coverage

Layers 0 to 7 are done. All five later layers are partial:

- **Layer 8** has genus invariance and non-increase for finite constant extensions, Hilbert's different formula for Galois extensions with separable residue fields, the purely inseparable step with its guard example, the Frobenius genus identity, and the Castelnuovo, Riemann and plane-model bounds. It lacks Abhyankar's lemma, Corollaries 3.9.3 and 3.6.8, and constant extension by an infinite algebraic `k''`.
- **Layer 9** has Laurent expansions, residues with the change-of-uniformizer formula, the Kähler–Weil comparison and the residue theorem over algebraically closed `k`, and the elliptic invariant differential has divisor zero. "Local components are residues" holds only at rational places, with infinitely many rational places assumed.
- **Layer 10** has the elliptic theory through Propositions 6.1.2, 6.1.3, 6.1.6 and 6.1.7 and the four Mathlib compatibility statements. It also has hyperelliptic models and genus, the genus of smooth plane curves (assuming separability, with a fixed projection), and the Kummer and Artin–Schreier genus formulas.
- **Layer 11** is complete apart from the action of automorphisms on Weil differentials.
- **Layer 12** has the curve definition, points as places, a regular proper two-chart model with function field `F`, the divisor dictionary, `H⁰ = L(D)`, and the cohomological genus. It lacks projectivity, the anti-equivalence, and the dualizing sheaf beyond `k̄`.

## The frontier

- **Automorphisms acting on differentials (Layer 11)**: the last missing Layer 11 milestone.
- **The anti-equivalence (Layer 12C)**: prove the two-chart model projective and identify it with the normalization of `ℙ¹` in `F`. Then show every regular projective curve is its own model, and package the natural isomorphisms.
- **Abhyankar's lemma and composita (Layer 8)**: `e(P'∣P) = lcm(e₁, e₂)` when one side is tame, and unramifiedness passing to composita and Galois closures. The absolute-irreducibility test, Corollary 3.6.8, is also still open.
- **Residues at non-rational places (Layer 9)**: Remark 4.3.7(d) for a general differential, without the infinitely-many-rational-places hypothesis that currently excludes finite constant fields.
- **Kummer and plane-curve hypotheses of record (Layer 10)**: the cyclic Galois structure and irreducibility under the general nondegeneracy condition, and the full projection route for plane curves. The imperfect-residue Artin–Schreier guard example is also open.
