<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"93386bc8ad670c449a461ad503cab6b55646542e","ts":"2026-09-21T23:39:53Z"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `93386bc` (2026-09-21T23:39:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached: Riemann–Roch is proved by the repartition and Weil-differential route, and the Hurwitz genus formula follows it, so Layers 0 through 7 are substantially complete. Layer 8's Galois ramification theory and Layer 10's elliptic and hyperelliptic material are partial, Layer 9 stops after `dim_F Ω[F⁄k] = 1`, and Layers 11 and 12 are barely begun.

### Named results

- **The Riemann–Roch theorem** — `ℓ(D) − ℓ(W − D) = deg D + 1 − g` for `W` the divisor of a nonzero Weil differential ([`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.isRiemannRochDivisor_weilDifferentialDivisor)), through the duality isomorphism `L(W − D) ≃ Ω_F(D)` ([`TauCeti.riemannRochSpaceEquivWeilDifferentialFiltration`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.riemannRochSpaceEquivWeilDifferentialFiltration)).
- **The Hurwitz genus formula** — `[k' : k] · (2g' − 2) = [F' : F] · (2g − 2) + [k' : k] · deg Diff(F'/F)` for `F'/F` finite separable with exact constants and `k'/k` finite separable ([`TauCeti.hurwitz_genus_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Hurwitz.html#TauCeti.hurwitz_genus_formula)).
- **Dedekind's different theorem** — `d(P'∣P) ≥ e(P'∣P) − 1` always, with equality exactly at the tame places ([`TauCeti.Place.ramificationIdx_eq_differentExponent_add_one_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Different/Tame.html#TauCeti.Place.ramificationIdx_eq_differentExponent_add_one_iff)).
- **The Weierstrass gap theorem** — at a rational place of a field of genus `g` there are exactly `g` gaps, characteristic-free ([`TauCeti.Place.card_weierstrassGaps`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Consequences/WeierstrassGaps.html#TauCeti.Place.card_weierstrassGaps)).
- **The group law on an elliptic function field** — the degree-one places, with a chosen base place, are `Cl⁰(F)`, and `P ⊕ Q = R` exactly when `P + Q ∼ R + P₀` ([`TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Elliptic.html#TauCeti.Place.degreeOneAddEquivDegreeZeroClassGroup)).

### Notable definitions and infrastructure

- **The divisor of a Weil differential and the canonical class** ([`TauCeti.canonicalClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.html#TauCeti.canonicalClass)) — `(ω)` is the greatest divisor bounding `ω`, and every representative of the class is itself the divisor of some Weil differential, so the class is usable as a divisor.
- **The cotrace** ([`TauCeti.weilDifferentialCotrace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Cotrace.html#TauCeti.weilDifferentialCotrace)) — the unique Weil differential of `F'` with `Tr_{k'/k}(Cotr ω · α) = ω(Tr_{F'/F} α)` on fibre-constant repartitions, with divisor `Con (ω) + Diff(F'/F)`. Hurwitz is the degree of that identity.
- **The decomposition and ramification filtration** ([`TauCeti.Place.ramificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.html#TauCeti.Place.ramificationGroup)) — decomposition field, inertia group and the groups `G_i(P)`, with their orders, normality and elementary abelian quotients in characteristic `p`.

### Roadmap coverage

Layers 0, 1, 3 and 4 are done, infinitude of the places included, and Layer 4 now reaches Riemann–Roch itself. Layer 5 is done apart from the completion comparison: the `deg ≥ 2g − 1` regime, non-special divisors, genus zero, Weierstrass gaps, the generator `η` of `Ω_{k(x)}` with `(η) = −2P_∞`, and the class number. Clifford's theorem holds there only over an infinite constant field; the unrestricted form belongs to Layer 8, which has not reached it. Layer 6 is done, the fundamental identity now unconditional at every place. Layer 7 is done: the different divisor, the tame value, the cotrace, Hurwitz and its corollaries. Layer 2 is unchanged and still partial, finite normalization absent, so affine models are hypotheses. Layer 8 is partial in one direction only: decomposition, inertia and ramification groups, purely inseparable extensions and separable generation over a perfect field; constant-field extensions `F·k″` are untouched beyond the geometric degree. Layer 9 still stops at `dim_F Ω[F⁄k] = 1`. Layer 10 has the elliptic and hyperelliptic definitions and characterizations, the elliptic group law, and the Weierstrass-curve instance (genus one, exact constants, a Dedekind coordinate ring); normal forms, plane curves and the covers are untouched. Layer 11 has only the automorphism action on places, divisors, classes and `L(D)`. Layer 12 has the beginnings of 12A: base-ring algebra structures on a scheme's stalks and function field, and codimension-one points giving places with matching orders.

## The frontier

- **Residues and the Kähler comparison (Layer 9)** — with the cotrace in, `δ(x) = Cotr(η)` is constructible and `(dx) = −2(x)_∞ + Diff(F/k(x))` is in reach. Missing first is Layer 5's completion milestone: local expansions and the change-of-uniformizer formula for `res_P`.
- **Finite normalization (Layer 2)** — that the integral closure of `k[x]` in `F` is module-finite and Dedekind without separability. Every affine model is still a hypothesis, and this is 12B's first prerequisite.
- **Model equations (Layer 10)** — the normal forms `y² = f(x)`, the hyperelliptic genus formula, and the Kummer and Artin–Schreier ramification data, the roadmap's own acceptance tests for the tame and wild halves of Layer 7.
- **Constant-field extensions (Layer 8)** — `F·k″` for algebraic `k″/k`, exactness of constants over a perfect field, and the degree bookkeeping. Unrestricted Clifford waits on this and on nothing else.
- **Automorphisms (Layer 11)** — rigidity, Weierstrass points, finiteness of `Aut(F/k)` for `g ≥ 2` and the `84(g−1)` bound have not begun; the Weierstrass-point count needs a Wronskian development absent so far.
