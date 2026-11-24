<!--tauceti-status:v1 {"roadmap":"ThetaSeries","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"§2.9: the discriminant-group equivalence of an orthogonal sum must carry the pairing character and e(q) to the products","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"7c82863c129f563b606675d621d910b636bc89f14efca610687c9f42e45c3b9c","roadmap":"ThetaSeries","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ThetaSeries

This file documents the status of the ThetaSeries roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is done. The theta series of an even lattice of level N is a modular form on Γ₀(N) with quadratic nebentypus χ_L, its coset series are modular forms on Γ(N), and the classical identities for E₈, the Leech lattice, the rank-16 pair, A₂ and D₄ are proved. The one genuinely open item is new to the roadmap: the discriminant group of an orthogonal sum (§2.9) is half done.

### Named results

- **The Hecke–Schoeneberg theorem** — for an even lattice of rank 2k and level N, Θ_L ∣[k] A = χ_L(d) Θ_L for every A in Γ₀(N) ([`ZLattice.IsEven.thetaSeries_slash_of_mem_Gamma0`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GeneralLevel.html#ZLattice.IsEven.thetaSeries_slash_of_mem_Gamma0)).
- **The level-one theorem** — the theta series of an even unimodular lattice of rank 2k is a modular form of weight k for SL(2, ℤ) ([`ZLattice.thetaForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.thetaForm)), and its rank is divisible by 8 ([`ZLattice.IsEven.eight_dvd_finrank`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.IsEven.eight_dvd_finrank)).
- **The closed form of a lattice Gauss sum** — for odd positive a coprime to a multiple c of the level, G_L(a, c) = c^k (det L)^{1/2} e(n/8) (D_L/a) ([`ZLattice.IsEven.gaussSum_eq_sqrt_card_mul_jacobiSym`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GaussSum.html#ZLattice.IsEven.gaussSum_eq_sqrt_card_mul_jacobiSym)). This is the evaluation that turns the coset splitting into Hecke–Schoeneberg.
- **The theta series of the Leech lattice** — it is E₄³ − 720Δ ([`TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Leech.html#TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant)), so the kissing number 196560 is an output, not an input.
- **The theta series of A₂** — Θ_{A₂} = 1 + 6 ∑ (∑_{d∣m} χ₋₃(d)) q^m, a weight-one Eisenstein series with character, pinned down by the Sturm bound on Γ₁(3) ([`TauCeti.IntegralLattice.thetaSeries_realModel_typeARootLattice_two_eq_tsum`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/A2.html#TauCeti.IntegralLattice.thetaSeries_realModel_typeARootLattice_two_eq_tsum)).

### Notable definitions and infrastructure

- **The bundled general-level theta form** ([`ZLattice.thetaFormOfLevel`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GeneralLevel.html#ZLattice.thetaFormOfLevel)) is a modular form on Γ₁(N) in the character space of χ_L. Its q-coefficients are representation numbers, so arithmetic consequences can be read straight off it.
- **The nebentypus χ_L** ([`ZLattice.IsEven.nebentypus`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Nebentypus.html#ZLattice.IsEven.nebentypus)) is the primitive Kronecker character of the signed discriminant, induced to the level. Its values, parity and conductor are all computed, so χ_L for a specific lattice is a calculation rather than a quotation.
- **The level** ([`ZLattice.level`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Level.html#ZLattice.level)) has a Gram-matrix characterisation and exact values for scaled and Fricke-partner lattices. Every Γ₀(N) and Γ(N) statement is phrased in terms of it. It is now also pinned down in degenerate cases: a lattice that does not span [has level 0](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Level.html#ZLattice.level_eq_zero_of_span_ne_top).

### Roadmap coverage

Layers 1 and 3–8 are done: Poisson summation, theta series and their q-expansions, both transformation laws, the level-one theorem, the Gauss sums from reciprocity to the nebentypus, Hecke–Schoeneberg with the coset forms and the Fricke identities, and the classical identifications. The consistency check of §4.4 now appears as [the double inversion Θ_L ∣[k] S² = (−1)^k Θ_L](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Inversion.html#ZLattice.thetaSeries_slash_S_mul_S), under a new name that the roadmap does not yet cite. The ½ℤ warning of Convention 11 is now [a proved counterexample](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/DiscriminantGroup.html#ZLattice.thetaSeries_dual_span_one_half_I_ne_sum). Layer 2 is now partial, because the rewritten roadmap added §2.9. The additive equivalence between the discriminant group of L ⊕ M and the product of the two discriminant groups exists, as `ZLattice.discriminantGroupOrthSumEquiv`, together with the product formula for orders. What is missing is that it carries the pairing character of L ⊕ M to the product of the two pairing characters and e(q_{L⊕M}) to e(q_L) e(q_M).

## The frontier

- **The discriminant form of an orthogonal sum (§2.9).** Prove that `ZLattice.discriminantGroupOrthSumEquiv` respects the pairing character for integral L and M, and e(q) for even L and M, then check √2ℤ² and A₂ ⊕ A₂ against Milgram's formula. Both statements follow from ‖(x, y)‖² = ‖x‖² + ‖y‖². Nothing else blocks them.
- **One lattice character, not two.** χ_L still has two parallel definitions with matching API. [`ZLattice.IsEven.thetaCharacter`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Character.html#ZLattice.IsEven.thetaCharacter) is the one the bundled form and the D₄ identification use. [`ZLattice.IsEven.nebentypus`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Nebentypus.html#ZLattice.IsEven.nebentypus) is the roadmap's §6.6 object, with its own API. Nothing in the source proves them equal. Do that, or retire one.
- **Out of scope, deliberately.** The roadmap excludes odd rank, where half-integral weight needs the metaplectic group, and Milgram's formula at indefinite signature. They are not open targets here.
