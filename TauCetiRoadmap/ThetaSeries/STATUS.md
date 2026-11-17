<!--tauceti-status:v1 {"roadmap":"ThetaSeries","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"12fbbd9d41f41ebb1590ee1becdc726854d35c46d8264d1110afe4d343bf6533","roadmap":"ThetaSeries","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ThetaSeries

This file documents the status of the ThetaSeries roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All eight layers are done, including the summit. The theta series of an even lattice of level N is a modular form on Γ₀(N) with quadratic nebentypus χ_L. Its coset series are modular forms on Γ(N). The classical identities for E₈, the Leech lattice, the rank-16 pair, A₂ and D₄ are proved. What remains is consolidation, not new mathematics.

### Named results

- **The Hecke–Schoeneberg theorem** — for an even lattice of rank 2k and level N, Θ_L ∣[k] A = χ_L(d) Θ_L for every A in Γ₀(N) ([`ZLattice.IsEven.thetaSeries_slash_of_mem_Gamma0`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GeneralLevel.html#ZLattice.IsEven.thetaSeries_slash_of_mem_Gamma0)).
- **The level-one theorem** — the theta series of an even unimodular lattice of rank 2k is a modular form of weight k for SL(2, ℤ) ([`ZLattice.thetaForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.thetaForm)), and its rank is divisible by 8 ([`ZLattice.IsEven.eight_dvd_finrank`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.IsEven.eight_dvd_finrank)).
- **The closed form of a lattice Gauss sum** — for odd positive a coprime to a multiple c of the level, G_L(a, c) = c^k (det L)^{1/2} e(n/8) (D_L/a) ([`ZLattice.IsEven.gaussSum_eq_sqrt_card_mul_jacobiSym`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GaussSum.html#ZLattice.IsEven.gaussSum_eq_sqrt_card_mul_jacobiSym)). This is the evaluation that turns the coset splitting into Hecke–Schoeneberg.
- **The theta series of the Leech lattice** — it is E₄³ − 720Δ ([`TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Leech.html#TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant)), so the kissing number 196560 is an output, not an input.
- **The theta series of A₂** — Θ_{A₂} = 1 + 6 ∑ (∑_{d∣m} χ₋₃(d)) q^m, a weight-one Eisenstein series with character, pinned down by the Sturm bound on Γ₁(3) ([`TauCeti.IntegralLattice.thetaSeries_realModel_typeARootLattice_two_eq_tsum`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/A2.html#TauCeti.IntegralLattice.thetaSeries_realModel_typeARootLattice_two_eq_tsum)).

### Notable definitions and infrastructure

- **The bundled general-level theta form** ([`ZLattice.thetaFormOfLevel`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/GeneralLevel.html#ZLattice.thetaFormOfLevel)), a modular form on Γ₁(N) in the character space of χ_L. Its q-coefficients are representation numbers, so arithmetic consequences can be read straight off it.
- **The nebentypus χ_L** ([`ZLattice.IsEven.nebentypus`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Nebentypus.html#ZLattice.IsEven.nebentypus)), the primitive Kronecker character of the signed discriminant induced to the level. Its values, parity and conductor are all computed, so χ_L for a specific lattice is a calculation rather than a quotation.
- **The level** ([`ZLattice.level`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Level.html#ZLattice.level)), with a Gram-matrix characterisation and the exact level of scaled and Fricke-partner lattices. Every Γ₀(N) and Γ(N) statement is phrased in terms of it.

### Roadmap coverage

Every layer is done. Layers 1 to 5 were already complete: Poisson summation, the lattice model, the theta series, both transformation laws and the level-one theorem. Layer 6 is now complete. Alongside reciprocity and the odd-modulus evaluation it has the √2·ℤ² Landsberg–Schaar test, Milgram's formula with the A₂ instance i√3, the closed form 6E, and the character χ_L at the level (6F). Layer 7 is complete:

- the Γ₀(N) law with its scalar evaluated (7C);
- the bundled form on Γ₁(N), whose N = 1 case is the level-one form (7D);
- the coset forms on Γ(N) (7E);
- the Fricke law, and the fact that Θ_L is never a cusp form (7F). The diamond-eigenvalue statement is, as the roadmap says, the content of membership in the character space.

Layer 8 is complete. It covers E₈, rank 16 and 24, Leech, and the non-determination of a lattice by its theta series. It now also has the A₂ and D₄ identifications, with r_{D₄}(2m) equal to 24 times the sum of the odd divisors of m.

## The frontier

- **One lattice character, not two.** χ_L has two parallel definitions with matching API. [`ZLattice.IsEven.thetaCharacter`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Character.html#ZLattice.IsEven.thetaCharacter) carries the bundled form, while [`ZLattice.IsEven.nebentypus`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Nebentypus.html#ZLattice.IsEven.nebentypus) carries the A₂ and D₄ computations. Nothing in the supplied material proves them equal. Do that, or retire one.
- **Out of scope, deliberately.** Odd rank, where half-integral weight needs the metaplectic group, and Milgram's formula at indefinite signature are excluded by the roadmap. They are not open targets here.
