<!--tauceti-status:v1 {"roadmap":"ThetaSeries","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the √2·ℤ² Landsberg-Schaar test of 6B, the closed form of G_L(a, c) (6E) and the lattice character chi_L at the level (6F)","state":"partial"},{"id":"Layer 7","remaining":"evaluate the Gauss-sum scalar as chi_L(d) in 7C and 7E, the bundled forms (7D, 7E), diamond and cusp-form statements of 7F","state":"partial"},{"id":"Layer 8","state":"done"}],"readme_sha":"12fbbd9d41f41ebb1590ee1becdc726854d35c46d8264d1110afe4d343bf6533","roadmap":"ThetaSeries","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: ThetaSeries

This file documents the status of the ThetaSeries roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 to 5 and Layer 8 are done. That covers Poisson summation, the lattice model, the theta series, both transformation laws, level-one modularity, and the identities for E₈, rank 16 and Leech. The summit is partial. Θ_L transforms under Γ₀(N) by a scalar given as an explicit Gauss sum, but that scalar has not yet been evaluated as χ_L(d), and the bundled form does not exist.

### Named results

- **The level-one theorem** — the theta series of an even unimodular lattice of rank 2k is a modular form of weight k for SL(2, ℤ) ([`ZLattice.thetaForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.thetaForm)), and its rank is divisible by 8 ([`ZLattice.IsEven.eight_dvd_finrank`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/LevelOne.html#ZLattice.IsEven.eight_dvd_finrank)).
- **The inversion law** — in rank 2k, Θ_L(−1/τ) = (covol L)⁻¹ (−i)^k τ^k Θ_{L^∨}(τ) ([`ZLattice.thetaSeries_S_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Inversion.html#ZLattice.thetaSeries_S_smul)). The vector-valued form is proved for every integral lattice ([`ZLattice.IsIntegral.thetaCoset_S_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Inversion.html#ZLattice.IsIntegral.thetaCoset_S_smul)).
- **The theta series of the Leech lattice** — it is E₄³ − 720Δ ([`TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Leech.html#TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant)). So r_Λ(2m) = (65520/691)(σ₁₁(m) − τ(m)), and the kissing number 196560 is an output.
- **The theta series does not determine the lattice** — E₈ ⊕ E₈ and D₁₆⁺ both have theta series E₄², yet they are not isometric ([`TauCeti.IntegralLattice.not_forall_exists_map_eq_of_thetaSeries_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/RankSixteen.html#TauCeti.IntegralLattice.not_forall_exists_map_eq_of_thetaSeries_eq)).
- **The Γ₀(N) law with the Gauss sum unevaluated** — for A in Γ₀(N) with c > 0, Θ_L ∣[k] A = (−i)^k c^{−k} (covol L)⁻¹ G_L(a, c) Θ_L ([`ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/CosetSplitting.html#ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul)). This is Hecke–Schoeneberg up to one evaluation.

### Notable definitions and infrastructure

- **The level** ([`ZLattice.level`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Level.html#ZLattice.level)), with its divisibility properties and the exact level of the Fricke partner. Every Γ₀(N) statement is phrased in terms of it.
- **The rational and real models** ([`ZLattice.ratModel`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/RationalModel.html#ZLattice.ratModel), [`TauCeti.IntegralLattice.realModel`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/RealModel.html#TauCeti.IntegralLattice.realModel)) match discriminant forms, shells and level, and transfer non-isometry. This is how E₈, Leech and the rank-16 pair come in from Tau Ceti's lattice library.
- **Gauss sums of a lattice** ([`ZLattice.gaussSum`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/GaussSum.html#ZLattice.gaussSum)), with twisted and coset variants that vanish where the coset splitting needs them to.

### Roadmap coverage

Layers 1 to 5 and Layer 8 are done:

- **Layer 1** includes the Gaussian transforms.
- **Layer 2** covers 2A to 2H.
- **Layer 3** includes functoriality and the comparison with `jacobiTheta`.
- **Layer 4** includes the 4D checks.
- **Layer 5** includes the ℂ[E₄, Δ] decomposition.
- **Layer 8** includes the E₈-specific identity [`TauCeti.IntegralLattice.thetaSeries_realModel_typeE₈RootLattice`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/E8.html#TauCeti.IntegralLattice.thetaSeries_realModel_typeE₈RootLattice).

Layer 6 is partial. Done: 6A, the reciprocity law 6B ([`ZLattice.IsEven.gaussSum_eq_mul_dualGaussSum`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Reciprocity.html#ZLattice.IsEven.gaussSum_eq_mul_dualGaussSum)), Milgram's formula 6C ([`ZLattice.IsEven.dualGaussSum_one_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/ThetaSeries/Reciprocity.html#ZLattice.IsEven.dualGaussSum_one_one)), the odd-modulus evaluation 6D, and the fact that the weight is even when the level divides 2 ([`ZLattice.IsEven.even_of_level_dvd_two`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Milgram.html#ZLattice.IsEven.even_of_level_dvd_two)). Missing: 6B's mandatory test on √2·ℤ², the square of the Landsberg–Schaar identity; the closed form 6E; and the character χ_L of 6F at the level N. Toward 6F there are the Kronecker conductor criterion, the signed discriminant D_L ([`ZLattice.signedDiscr`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SignedDiscriminant.html#ZLattice.signedDiscr)), and its Kronecker character at modulus |D_L|, whose value at −1 is (−1)^k ([`ZLattice.IsEven.kroneckerChar_signedDiscr_neg_one`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/SignedDiscriminant.html#ZLattice.IsEven.kroneckerChar_signedDiscr_neg_one)).

Layer 7 is partial. Done:

- the reductions 7A and the splitting 7B;
- 7C and 7E, each with the Gauss sum unevaluated;
- boundedness at every cusp;
- the Fricke law of 7F in both normalisations.

## The frontier

- **The closed form of G_L(a, c) (6E).** Combine reciprocity with [the odd-modulus evaluation](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/GaussSum.html#ZLattice.IsEven.dualGaussSum_eq_jacobiSym) at t = −c. Both inputs exist.
- **The character χ_L (6F).** Use 6E at c = N to get (D_L/a) = 1 for a ≡ 1 mod N. Then use [the conductor criterion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LegendreSymbol/KroneckerSymbol.html#TauCeti.conductor_kroneckerChar_dvd_iff) to bring the primitive Kronecker character down to modulus N. This waits on 6E.
- **Hecke–Schoeneberg (7C, 7D).** Substitute the evaluated constant into the Γ₀(N) law using [`TauCeti.ModularForm.slash_eq_smul_of_mem_Gamma0_of_pos_odd`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/PositiveOdd/Slash.html#TauCeti.ModularForm.slash_eq_smul_of_mem_Gamma0_of_pos_odd). Then bundle the result in `modFormCharSpace k χ_L` and check that N = 1 recovers the level-one form.
- **Coset series on Γ(N) (7E).** Use 6E to show that the scalar in the Γ(N) splitting is 1, then bundle each θ_γ as a form for Γ(N).
- **The rest of 7F.** Show that Θ_L is never a cusp form and that it has diamond eigenvalue χ_L(d). Both follow once the bundled form exists.
