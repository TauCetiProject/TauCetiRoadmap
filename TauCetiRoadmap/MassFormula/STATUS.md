<!--tauceti-status:v1 {"roadmap":"MassFormula","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"79c6c7c5241b2ce4f400f51b55baaf8f1f6257419fba4f125f9103acb46685b0","roadmap":"MassFormula","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: MassFormula

This file documents the status of the MassFormula roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is complete. Both of Serre's mass formulas are proved for every nonarchimedean local field. So are the finiteness dichotomy, convergence, the orbit and tame counts, and every worked example the README uses as an acceptance test. The README now records this itself and hands the count on to two consumer roadmaps.

### Named results

- **Serre's first mass formula** — the totally ramified degree-n subextensions L of a separable closure of K satisfy ∑ q^{−c(L)} = n, where c(L) = d(L) − n + 1 ([`tsum_one_div_natCard_residueField_pow_wildExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent)). The sum is in ℝ≥0∞, and a [real form](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.hasSum_one_div_natCard_residueField_pow_wildExponent) converges even when σ_K(n) is infinite.
- **Serre's second mass formula** — over any set of representatives of the K-isomorphism classes, ∑ 1/(#Aut_K(M)·q^{c(M)}) = 1 ([`IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent)). It comes from regrouping the first formula along [Serre's orbit count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Orbit.html#TauCeti.ncard_isomorphic_mul_natCard_algEquiv).
- **Serre's finiteness dichotomy** — σ_K(n) is infinite exactly when K has equal characteristic p and p ∣ n ([`infinite_totallyRamifiedOfDegree_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.infinite_totallyRamifiedOfDegree_iff)). Its companion is the [tame count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Main.html#TauCeti.encard_totallyRamifiedOfDegree_of_not_dvd): there are exactly n extensions when p ∤ n.
- **The integral of the root count** (Serre's Lemmas 2 and 3) — over the Eisenstein region, the number of roots in L of a random monic polynomial integrates to q^{−(d(L)+1)}(1 − q^{−1}) ([`lintegral_rootCount`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Integral.html#IntermediateField.lintegral_rootCount)). It rests on the [local fibre count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/RootCount/Fibre.html#TauCeti.IsTotallyRamified.existsUnique_isRoot_le_addVal_iff), Serre's Lemma 1.
- **The mass formula for ℚ_2 in degree 2** — σ_{ℚ_2}(2) is [exactly six fields](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Quadratic/PadicTwo.html#TauCeti.totallyRamifiedOfDegree_two_eq_padicTwo). The sum 2·2⁻¹ + 4·2⁻² = 2 is computed directly, which independently checks c for an off-by-one error.

### Notable definitions and infrastructure

- **Hensel's lemma with an estimate** — over any Henselian discrete valuation ring, a root lies within a computable distance of an approximate root ([`exists_isRoot_addVal_eval_eq`](https://taucetiproject.org/docs/TauCeti/RingTheory/DiscreteValuationRing/Hensel.html#Polynomial.exists_isRoot_addVal_eval_eq)). This is what makes root counts locally constant and the fibre count exact. A [quadratic form](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselian/Basic.html#TauCeti.HenselianRing.exists_quadratic_root_of_isUnit_discrim), which lifts roots of monic quadratics with unit discriminant, now also serves the elliptic-curve work.
- **The Haar scaling law over a local field** — μ(A·S) = q^{−k} μ(S) when det A is associated to ϖ^k ([`addHaar_image_mulVec`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/LocalFieldScaling.html#MeasureTheory.Measure.addHaar_image_mulVec)). This is the non-archimedean change of variables behind every volume in the proof.
- **The Eisenstein region and the root count** — [`eisensteinSet`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Eisenstein/Region.html#TauCeti.eisensteinSet), of volume q^{−n}(1 − q^{−1}), parametrizes σ_K(n). Almost everywhere on it, the root counts [sum to n](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/RootCount.html#TauCeti.ae_tsum_rootCount_eq), and integrating that identity is the proof of Theorem 1.

### Roadmap coverage

All five layers are done. These are Layer 0 (σ_K(n), the wild exponent and its invariance, the box corollaries), Layer 1 (quantitative Newton lifting and local constancy of root counts), Layer 2 (the lattice index and the scaling law), Layer 3 (the region, almost-everywhere separability and measurability, the root-count identity, countability, the fibre count and the integral) and Layer 4 (Theorems 1 and 2, the dichotomy, convergence, the orbit count and the tame count). Every worked example is discharged, now including both halves of the Galois case: a Galois member of σ_K(n) is alone in its class and has [exactly n automorphisms](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Orbit.html#TauCeti.natCard_algEquiv_of_normal).

## The frontier

- **Nothing remains under this roadmap.** Every milestone and acceptance criterion in the README is proved, and the README says so.
- **Bhargava's mass formula** — the count over all étale extensions, obtained by applying Serre's formula over each unramified extension of K. This now belongs to the separate étale mass formula roadmap, and its state is not assessed here.
- **Krasner's count** — the refinement of σ_K(n) by discriminant, on the same wild exponent. It now belongs to the p-adic extension families roadmap, and it is also not assessed here.
