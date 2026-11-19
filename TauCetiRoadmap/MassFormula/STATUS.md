<!--tauceti-status:v1 {"roadmap":"MassFormula","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"f238f75784776b763032d5763a1c14e6f0e173e02b6b5757f51f6f401b0ea826","roadmap":"MassFormula","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: MassFormula

This file documents the status of the MassFormula roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is complete. Both of Serre's mass formulas are proved for every nonarchimedean local field, together with the finiteness dichotomy, convergence, the tame count and all the worked examples. Every layer from the counting invariants to the summit is done.

### Named results

- **Serre's first mass formula** — the totally ramified degree-n subextensions L of a separable closure of K satisfy ∑ q^{−c(L)} = n, where c(L) = d(L) − n + 1 ([`tsum_one_div_natCard_residueField_pow_wildExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent)). The sum is taken in ℝ≥0∞, and there is a [real form](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.hasSum_one_div_natCard_residueField_pow_wildExponent) that converges even when σ_K(n) is infinite.
- **Serre's second mass formula** — over any set of representatives of the K-isomorphism classes, ∑ 1/(#Aut_K(M)·q^{c(M)}) = 1 ([`IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent)). It is obtained by regrouping the first along [Serre's orbit count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Orbit.html#TauCeti.ncard_isomorphic_mul_natCard_algEquiv).
- **Serre's finiteness dichotomy** — σ_K(n) is infinite exactly when K has equal characteristic p and p ∣ n ([`infinite_totallyRamifiedOfDegree_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.infinite_totallyRamifiedOfDegree_iff)). The [tame count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.encard_totallyRamifiedOfDegree_of_not_dvd), exactly n extensions when p ∤ n, is its companion.
- **The integral of the root count** (Serre's Lemmas 2 and 3) — over the Eisenstein region, the number of roots in L of a random monic polynomial integrates to q^{−(d(L)+1)}(1 − q^{−1}) ([`lintegral_rootCount`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Integral.html#IntermediateField.lintegral_rootCount)). It rests on the [local fibre count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/RootCount/Fibre.html#TauCeti.IsTotallyRamified.existsUnique_isRoot_le_addVal_iff), Serre's Lemma 1.
- **The mass formula for ℚ_2 in degree 2** — σ_{ℚ_2}(2) is [exactly six fields](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Quadratic/PadicTwo.html#TauCeti.totallyRamifiedOfDegree_two_eq_padicTwo), and the sum 2·2⁻¹ + 4·2⁻² = 2 was computed directly, which independently checks c for an off-by-one error.

### Notable definitions and infrastructure

- **Hensel's lemma with an estimate** — over any Henselian discrete valuation ring, a root lies within a computable distance of an approximate root ([`exists_isRoot_addVal_eval_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/DiscreteValuationRing/Hensel.html#Polynomial.exists_isRoot_addVal_eval_eq)). This is more general than the complete case the roadmap asked for, and it is what makes root counts locally constant and the fibre count exact.
- **The Haar scaling law over a local field** — μ(A·S) = q^{−k} μ(S) when det A is associated to ϖ^k ([`addHaar_image_mulVec`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/LocalFieldScaling.html#MeasureTheory.Measure.addHaar_image_mulVec)). This is the non-archimedean change of variables behind every volume in the proof.
- **The Eisenstein region and the root count** — [`eisensteinSet`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Eisenstein/Region.html#TauCeti.eisensteinSet), of volume q^{−n}(1 − q^{−1}), parametrizes σ_K(n). Almost everywhere on it, the root counts [sum to n](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/RootCount.html#TauCeti.ae_tsum_rootCount_eq). This identity is what gets integrated, because almost every monic polynomial is [separable](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/AESeparable.html#MeasureTheory.Measure.ae_separable_monicOfCoeff).

### Roadmap coverage

All five layers are done. Layer 0 (σ_K(n), the wild exponent and its invariance, the box corollaries), Layer 1 (quantitative Newton lifting and local constancy of root counts) and Layer 2 (the lattice index and the scaling law) were already complete. Layer 3 now has almost-everywhere separability, almost-everywhere measurability of the root count, the local fibre count and the root-count integral, alongside the region, the root-count identity and countability. Layer 4 has Theorem 1, Theorem 2, both directions of the dichotomy, convergence, the orbit count and the tame count. Every worked example is discharged. That covers n = 1, the tame and ℚ_2 quadratic cases, and the Galois orbit case. It also covers the equal-characteristic example over 𝔽_q((X)), which is now a [local field](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/LocalField.html#TauCeti.LaurentSeries.isNonarchimedeanLocalField) with infinitely many degree-p extensions and a [convergent series](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/LaurentSeries.html#TauCeti.hasSum_one_div_natCard_pow_wildExponent_laurentSeries). The last is the integral consistency check: the root-count integrals [total](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Total.html#TauCeti.tsum_lintegral_rootCount_eq_of_normalized) n·q^{−n}(1 − q^{−1}).

## The frontier

- **Nothing remains under this roadmap.** Every milestone and acceptance criterion in the README is proved.
- **Krasner's refinement** — counting totally ramified extensions of given degree and given discriminant. The README names this as a direction for a future roadmap, not as work here.
- **Bhargava's mass formula** — the generalization to all étale extensions of a local field, the local input to conjectured densities of number-field discriminants. This is also a future roadmap, and it is unspecified.
