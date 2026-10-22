<!--tauceti-status:v1 {"roadmap":"MassFormula","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"a.e. separability of Eisenstein polynomials, a.e. measurability of rootCount, the local fibre count, and the root-count integral","state":"partial"},{"id":"Layer 4","remaining":"Theorem 1, Theorem 2, convergence, the finite direction of the dichotomy, and the tame count","state":"partial"}],"readme_sha":"98690c28bb00a2385f452542cd3a140fb9aaab877515aa81e07eda4347cb51c0","roadmap":"MassFormula","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5"}-->
# Status: MassFormula

This file documents the status of the MassFormula roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The counting invariants (Layer 0), quantitative Newton lifting (Layer 1) and the lattice-index and Haar scaling layer (Layer 2) are done. Layer 3 is about half built: the Eisenstein region, its volume, countability and the pointwise root-count identity are in, but the fibre count and the integral are not. Of Layer 4, the orbit count and the infinite half of the finiteness dichotomy are proved; neither mass formula is.

### Named results

- **Hensel's lemma with an estimate** — over any Henselian discrete valuation ring, if ord F(y₀) > 2·ord F′(y₀) there is a root z with ord F(y₀) = ord F′(y₀) + ord(z − y₀), and it is [unique in that ball](https://taucetiproject.org/docs/TauCeti/RingTheory/DiscreteValuationRing/Hensel.html#Polynomial.existsUnique_isRoot_addVal_lt); this is [`exists_isRoot_addVal_eval_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/DiscreteValuationRing/Hensel.html#Polynomial.exists_isRoot_addVal_eval_eq), more general than the complete case the roadmap specified.
- **Local constancy of the root count** — a separable monic f over 𝒪[K] has a threshold T such that every monic g agreeing with f modulo 𝓂^T has as many roots in every member of σ_K(n) ([`exists_card_aroots_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/RootCount.html#TauCeti.exists_card_aroots_eq)).
- **The Haar scaling law over a local field** — if det A is associated to ϖ^k, then μ(A·S) = q^{−k} μ(S) for every regular Haar measure μ on ι → K and every set S ([`addHaar_image_mulVec`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/LocalFieldScaling.html#MeasureTheory.Measure.addHaar_image_mulVec)), the non-archimedean analogue of the real determinant formula.
- **Serre's orbit count** — for L in σ_K(n), the number of K-isomorphic members of σ_K(n) times #Aut_K(L) is n ([`ncard_isomorphic_mul_natCard_algEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Orbit.html#TauCeti.ncard_isomorphic_mul_natCard_algEquiv)); a Galois member is [alone in its class](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Orbit.html#TauCeti.setOf_isomorphic_eq_singleton_of_normal).
- **Infinitely many wild extensions in equal characteristic** — when K has characteristic p and p divides n, σ_K(n) is infinite ([`infinite_totallyRamifiedOfDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Infinite.html#TauCeti.infinite_totallyRamifiedOfDegree)), because the roots of X^n + π^m X + π have discriminant exponent nm.

### Notable definitions and infrastructure

- **Serre's σ_K(n) and the wild exponent** — [`totallyRamifiedOfDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Basic.html#TauCeti.totallyRamifiedOfDegree) and [`wildExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Basic.html#IntermediateField.wildExponent) are the junk-tolerant objects in which both mass formulas are stated. They already have the n − 1 ≤ d lower bound, isomorphism invariance, the tame criterion, and the [characterization by Eisenstein generators](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Eisenstein/Basic.html#TauCeti.mem_totallyRamifiedOfDegree_iff_exists_eisenstein_generator).
- **The Eisenstein region** — [`eisensteinSet`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Eisenstein/Region.html#TauCeti.eisensteinSet) is matched with the Eisenstein polynomials and has the [volume](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Eisenstein/Region.html#TauCeti.measure_eisensteinSet) q^{−n}(1 − q^{−1}). This is the domain of integration for Theorem 1.
- **The root count** — [`rootCount`](https://taucetiproject.org/docs/TauCeti/FieldTheory/IntermediateField/RootCount.html#IntermediateField.rootCount), whose sum over σ_K(n) is [exactly n](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/RootCount.html#TauCeti.tsum_rootCount_eq_of_separable) at every separable Eisenstein polynomial. That is the integrand of the summit.

### Roadmap coverage

Layers 0, 1 and 2 are done. That includes the box and cube descriptions of valuation balls in Eisenstein power-basis coordinates and the volume of boxes of ideal powers. Layer 3 is partial. The region, its measure, the root count and its pointwise sum are in, and countability of σ_K(n) is proved by polynomial approximation rather than the measure route the README sketches. Missing are almost-everywhere separability of Eisenstein polynomials, almost-everywhere measurability of the root count, the local fibre count and the root-count integral q^{−(d+1)}(1 − q^{−1}). Layer 4 is partial. The orbit count and the infinite direction of the finiteness dichotomy are done. Theorem 1, Theorem 2, the convergence statement, the finite direction of the dichotomy and the tame count are not. None of the worked examples beyond σ_K(1) = {K} and the Galois case of the orbit count are established here.

## The frontier

- **Almost every Eisenstein polynomial is separable** — show that the non-separable locus in the Eisenstein region is Haar-null, so that the pointwise root-count identity holds almost everywhere.
- **Measurability of the root count** — derive AEMeasurable of each rootCount on the region from the local constancy already proved and the null non-separable locus.
- **The local fibre count** — Serre's Lemma 1: for ρ with d + n ≤ nρ, a monic g has exactly one root in the cube ξ + π^ρ𝒪_L iff ord g(ξ) ≥ nρ + d. The Hensel estimate and the box description of balls are its inputs; it also needs ord f′(ξ) = d for an Eisenstein generator.
- **The integral of the root count** — ∫ rootCount L = q^{−(d L + 1)}(1 − q^{−1}) over the region, by change of variables through the scaling law; needs the fibre count.
- **Theorem 1 and its corollaries** — interchange sum and integral to get ∑ q^{−c(L)} = n. Theorem 2 then follows from the orbit count and invariance of c, and the finite half of the dichotomy, convergence and the tame count come after it.
