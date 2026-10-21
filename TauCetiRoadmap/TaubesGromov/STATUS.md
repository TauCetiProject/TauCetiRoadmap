<!--tauceti-status:v1 {"roadmap":"TaubesGromov","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: TaubesGromov

This file documents the status of the TaubesGromov roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only algebra exists so far. That covers the four-twist local weights and the ray-product expansion of TG2, the intersection-lattice algebra behind TG3's good-curve structure theorem and TG6.2, and the symplectic-matrix normalization identities of TG11.2. None of the analytic or geometric layers has begun: embedded normal operators, compactness, vortices, large-r estimates, gluing, and the SW = Gr point equality.

### Named results

- **The good-curve component inequality.** If e = Σ mᵢCᵢ with natural coefficients, the classes meet pairwise nonnegatively, and e·Cᵢ ≥ −1 whenever Cᵢ² < 0, then Σ mᵢ d(Cᵢ) ≤ d(e) ([`sum_mul_apply_self_sub_apply_canonical_le`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.sum_mul_apply_self_sub_apply_canonical_le)).
- **The structure of a good cycle through generic points.** The images are embedded and pairwise homologically disjoint, each contains exactly half its virtual dimension of the points, exceptional spheres [occur once](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.IsGoodCycle.mult_eq_one_of_apply_self_neg), and a repeated image [has square zero](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.IsGoodCycle.apply_self_eq_zero_of_one_lt_mult) and is κ-orthogonal. This is proved on an arbitrary integral bilinear form.
- **The independent-component expansion on a ray.** The n-th coefficient of Π_c f_label(c)(t^{m_c}) is the sum over configurations of total class n·A₀ of the products of local weights ([`coeff_rayTorusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.coeff_rayTorusWeightSeries)). When each class has finitely many tori, the infinite product exists and is [computed by a finite cutoff](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.coeff_tprod_expand_torusWeightSeries).
- **The reciprocal-polynomial identity.** For a 2g × 2g symplectic P, the polynomial p(t) = det(1 − tP) satisfies p′(1) = g·det(1 − P) ([`derivative_eval_one_charpolyRev`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Charpoly/Symplectic.html#SymplecticGroup.derivative_eval_one_charpolyRev)). Consequently p(t)/(1 − t)² has [coefficients det(1 − P)(a + 1 − g)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Charpoly/Symplectic.html#SymplecticGroup.coeff_coe_charpolyRev_mul_mk_one_sq) for a ≥ 2g − 1.
- **The cat-map test.** For [Arnold's cat map](https://taucetiproject.org/docs/TauCeti/Dynamics/CatMap.html#TauCeti.catMap), det(1 − P) = −1, [every iterate is nondegenerate](https://taucetiproject.org/docs/TauCeti/Dynamics/CatMap.html#TauCeti.det_one_sub_catMap_pow_neg), and (1 − 3t + t²)/(1 − t)² has [coefficient −n](https://taucetiproject.org/docs/TauCeti/Dynamics/CatMap.html#TauCeti.coeff_coe_charpolyRev_catMap_mul_mk_one_sq) in degree n ≥ 1.

### Notable definitions and infrastructure

- **The local multiplicity series** [`torusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.torusWeightSeries) and its coefficients [`torusWeight`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.torusWeight). These are the README's eight factors f_(±,i) as units of ℤ⟦t⟧, with the two signs inverse to each other. They make the multiplicity-m weight of a torus a well-defined integer.
- **The ray weight series** [`rayTorusWeightSeries`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.html#TauCeti.rayTorusWeightSeries). Together with general lemmas on products of expanded power series in the coefficientwise topology, it is the carrier the ray-only torus count will be stated in.
- **[`IsGoodCycle`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/GoodCycle.html#TauCeti.IsGoodCycle)**, the numerical shadow of a positive J-curve cycle in a good class. Its hypotheses are exactly what the geometry still has to supply.

### Roadmap coverage

TG2 is partial. The weight series, their inverses and coefficient recurrences, the finite-product expansion and the ray cutoff are done. The labels (σ, i) are still free parameters, though: the four flat sign lines, the twisted normal operators and the determinant signs that should define them are absent. So are the configuration carrier, Gr_(J,ω), and the disjointness theorem that turns the ray product into a count. TG3 and TG6.2 have their lattice algebra and nothing geometric. TG11.2 has the reciprocal-polynomial and coarse-coefficient identities and the cat-map series, but not the Wang torsion order |det(I − P)| or any orientation comparison. TG0, TG1, TG4–TG10, TG11.1, TG11.3 and TG11.4 have nothing that can be credited from the evidence here. The library does contain a gauge-fixed vortex operator at the vacuum and the Seiberg–Witten quadratic endomorphism, which are plausible early inputs to TG4–TG5, but no report has yet assessed them against this roadmap.

## The frontier

- **Four-twist labels from geometry (TG2).** Construct the sign lines χ: π₁(C) → {±1} and the twisted normal operators, then define σ(C) and i(C) by determinant transport, so that `torusWeightSeries` is fed actual labels. This needs TG1's embedded normal operator and the determinant orientations from HeegaardFloer and IndexTheory.
- **Disjointness on a square-zero ray.** Prove that distinct relevant torus images on the ray of A₀ are disjoint, by positivity and zero intersection. The independent-component expansion then identifies the ray-only count, and the conditional comparison with the full Gr series follows.
- **Instantiating `IsGoodCycle` (TG3).** Supply its hypotheses from actual curves: positivity of intersections, singular adjunction ind(C) = d(C) − 2δ(C), and the generic-point dimension bounds. This needs the bounded-window compactness and the stable-map adapter from AnalyticStableMaps.
- **Weighted count at fixed J.** Build the finite configuration carrier and Gr_(J,ω)(A) as a finite sum, with point-constraint and cutoff independence. This is the first point where the weights become an invariant.
- **TG11.2 normalization tests.** The integral Wang torsion order |det(I − P)| remains, as does the sign comparison saying the canonical orientation is opposite to the product orientation. The latter depends on the TG0.1 and TG11.2 orientation constructions.
