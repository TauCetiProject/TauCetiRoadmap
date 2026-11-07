<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartIV","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0","ts":"2026-10-23T19:26:26Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer R4","state":"untouched"},{"id":"Layer R5","state":"untouched"},{"id":"Layer F1","remaining":"Weierstrass division and preparation in W_n, derivatives preserving W_n, ring theory and faithful flatness of W_n, then F1.2 onward","state":"partial"}],"readme_sha":"95e89aee739785fe31db730bd9adc59b309654f1209c7076f652d88b8849ca11","roadmap":"AdicSpacesPartIV","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0"}-->
# Status: AdicSpacesPartIV

This file documents the status of the AdicSpacesPartIV roadmap up until `b4b3ce5` (2026-10-23T19:26:26Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first subsection of Layer F1 has begun. The Monsky–Washnitzer algebra of overconvergent power series is defined, with its unit criterion, primitives and the distinguishing automorphisms that Weierstrass theory needs. Weierstrass division itself, the ring theory of the algebra, dagger algebras and everything later in F1 have not begun, and neither have Layers R4 and R5.

### Named results

- **The unit criterion for overconvergent series** — an overconvergent series is a unit exactly when its constant coefficient is nonzero and strictly dominates every other coefficient, equivalently `|f − f(0)| < |f(0)|` in the Gauss norm ([`isUnit_washnitzerAlgebra_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/WashnitzerAlgebra.html#TauCeti.Dagger.isUnit_washnitzerAlgebra_iff)). It follows that a series invertible in the Tate algebra has an overconvergent inverse ([`isUnit_toTate_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/WashnitzerAlgebra.html#TauCeti.Dagger.washnitzerAlgebra.isUnit_toTate_iff)).
- **Overconvergence of primitives** — in characteristic zero the termwise primitive in any variable preserves overconvergence ([`primitive_mem_washnitzerAlgebra`](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/WashnitzerAlgebra.html#TauCeti.Dagger.primitive_mem_washnitzerAlgebra)). Behind it is a Gauss-norm bound showing that integration loses only an arbitrarily small amount of radius ([`exists_gaussNorm_primitive_le`](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPowerSeries/Primitive/GaussNorm.html#MvPowerSeries.exists_gaussNorm_primitive_le)).
- **Distinguishing automorphisms of the Monsky–Washnitzer algebra** — over a complete nonarchimedean field, a triangular automorphism `Xᵢ ↦ Xᵢ + Y^{αᵢ}` makes any nonzero overconvergent series distinguished in `Y`, with a unit leading coefficient ([`exists_triangularEquiv_isDistinguished_isUnit`](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/Distinguished.html#TauCeti.Dagger.washnitzerAlgebra.exists_triangularEquiv_isDistinguished_isUnit)). This is part (iii) of the roadmap's Weierstrass target.
- **Radius selection** — a series distinguished at unit radius stays distinguished, with a unit coefficient, over a Tate algebra of some radius `ρ > 1` at a second radius `r ≥ ρ` ([`exists_isDistinguished_isUnit_of_isDistinguished_one`](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/Distinguished.html#TauCeti.Dagger.exists_isDistinguished_isUnit_of_isDistinguished_one)). This is the unequal-radii step (iv), which the README's `Y + X²` example shows cannot be avoided.

### Notable definitions and infrastructure

- The [Monsky–Washnitzer algebra](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/WashnitzerAlgebra.html#TauCeti.Dagger.washnitzerAlgebra) `R⟨X⟩†`: the series restricted at some radius above 1, with its [inclusion into the Tate algebra](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/WashnitzerAlgebra.html#TauCeti.Dagger.washnitzerAlgebra.toTate). It is dense there and proper for at least one variable, and radii in the divisible hull of the value group suffice to define it. Every later F1 object is a quotient or localisation of it.
- [Substitution isomorphisms](https://taucetiproject.org/docs/TauCeti/RingTheory/Dagger/Subst.html#TauCeti.Dagger.washnitzerAlgebra.substEquiv): mutually inverse families of unit-ball polynomials without constant term give isomorphisms of Monsky–Washnitzer algebras, compatible with the Tate-algebra ones. These carry the change of variables needed in Weierstrass and Noether-normalisation arguments.

### Roadmap coverage

Layers R4 (étale and pro-étale sites, rigid comparison, smooth pairs) and R5 (perfectoid × smooth, coefficient algebras and sheaves) are untouched: the source has none of their named objects. Layer F1 is partial and confined to F1.1. *overconvergent-tate-algebra* is done except for three pieces: `∂/∂Xᵢ` preserving `W_n` with the Hasse-derivative Cauchy estimate, the identification `W_{n+1} ≅ W_n⟨X_{n+1}⟩†`, and the README's `washnitzerAlgebra_le_weightedRestrictedSubring` form of the inclusion. *overconvergent-weierstrass-division* has parts (iii) and (iv); division, preparation and the polyradius iteration are open. F1.1's ring-theoretic targets and F1.2–F1.16 have not started.

## The frontier

- **Weierstrass division and preparation in `W_n`** — with distinguishedness at unequal radii in hand, what remains is the polyradius iteration `T_n(r', r_n) ≅ T_{n−1}(r')⟨Y/r_n⟩`, then transporting the fixed-radius division and preparation to `W_n`, with uniqueness obtained by comparison at unit radius.
- **Derivatives preserve overconvergence** — `∂/∂Xᵢ` preserves `W_n`, via the Cauchy estimate `|∂ᵢ^{[j]} f|_ρ ≤ ρ^{-j}|f|_ρ` for Hasse derivatives, valid in every characteristic. This is the remaining analytic input for the overconvergent de Rham complex.
- **Ring theory of `W_n`** — noetherian, factorial and Jacobson, with every ideal strictly closed. This needs Weierstrass division.
- **Faithful flatness of `W_n → T_n`** — together with the bijection on maximal ideals and regularity of dimension `n`. This needs the ring theory above.
- **Dagger algebras (F1.2)** — quotients of `W_n` and their completions. Their noetherianity and the completion comparison depend on the two items above.
