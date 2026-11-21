<!--tauceti-status:v1 {"roadmap":"LFunctions","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the normalization theorem gaussianTheta_mellin_normalization, which needs the completed Dedekind zeta of Layer 3","state":"partial"},{"id":"Layer 2","remaining":"compatibility of partial zeta functions with change of modulus","state":"partial"},{"id":"Layer 3","remaining":"completed partial zeta functions, continuation and functional equation of zeta_K, residues, behaviour at s = 0, dedekindZetaData","state":"partial"},{"id":"Layer 4","remaining":"the cyclotomic factorizations of Dedekind zeta, primitive and imprimitive","state":"partial"},{"id":"Layer 5","remaining":"Gauss sums, completion, root number, heckeData, entirety and the functional equation","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"specialize the 3-4-1 criterion to finite-order Hecke L-functions and prove nonvanishing on Re s = 1","state":"partial"},{"id":"Layer 8","remaining":"Mertens' product, the Dedekind, Hecke and Grossencharacter comparison cards, named log-derivative exports","state":"partial"}],"readme_sha":"7cf8410736e9541efb6bb1162e28128f47dadef8cfa77167f5b41f6016fc1a6c","roadmap":"LFunctions","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: LFunctions

This file documents the status of the LFunctions roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The completed L-function record of Layer 0 is done. The theta and Mellin side of Hecke's method (Layer 1) is nearly complete, and partial zeta functions, Dirichlet cards and presented Hecke L-functions exist. The summit of the Dedekind layer has not been reached: ζ_K is not yet continued to the plane or given its functional equation. Grossencharacters have not begun.

### Named results

- **Mertens' second theorem for a number field**: [∑_{N𝔭 ≤ x} 1/N𝔭 − log log x tends to a constant B_K](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Mertens.html#TauCeti.LFunctions.tendsto_primeSummatory_inv_absNorm_sub_log_log). It is proved from [Mertens' first theorem](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Mertens.html#TauCeti.LFunctions.isBigO_primeSummatory_log_absNorm_div_sub_log), ∑ log N𝔭 / N𝔭 = log x + O(1).
- **Poisson summation over an ideal lattice**: [the sum of a Schwartz function over σ(I) equals the sum of its mixed-space Fourier transform over the Euclidean dual](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CanonicalEmbedding/PoissonSummation.html#TauCeti.NumberField.mixedEmbedding.tsum_idealLattice_eq_tsum_mixedDual_mixedFourier). That dual is [the trace dual](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CanonicalEmbedding/TraceDual.html#TauCeti.NumberField.mixedEmbedding.mixedDual_idealLattice) up to the factor 2 at complex places.
- **The theta transformation with one parameter per infinite place**: [θ_L(y) = covol(L)⁻¹ N(y)^(−1/2) θ_{L^∨}(y⁻¹)](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Theta/Inversion.html#TauCeti.LFunctions.latticeTheta_inv), Neukirch VII (3.6) on the imaginary axis.
- **The volume of a unit fundamental domain**: [every bounded fundamental domain for the units on the norm-one hypersurface has volume 2^(r−1) R / 2^r₂](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Theta/Surface/Volume.html#TauCeti.LFunctions.surfaceHaar_of_isUnitFundamentalDomain), Neukirch's (5.6) in this roadmap's normalization.
- **The functional equation of a primitive Dirichlet L-function, as a card**: [Λ(χ, s) equals the Gauss-sum root number times Λ(χ̄, 1 − s), with the conductor power included](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Dirichlet/Basic.html#TauCeti.LFunctions.dirichletData_hasFunctionalEquation).

### Notable definitions and infrastructure

- [**Completed L-function data**](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Data/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData) is the common record for every L-function in the roadmap. It comes with a dual, a [card built from a Dirichlet series](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Data/Series.html#TauCeti.LFunctions.AnalyticLFunctionData.ofSeries) by canonical continuation and the root number read off at s = 2, and an [exact translation between arithmetic and analytic normalizations](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Data/Normalization.html#TauCeti.LFunctions.NormalizationTranslation.hasFunctionalEquation_iff).
- [**The Mellin kernel**](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Theta/MellinKernel.html#TauCeti.LFunctions.mellinKernel) averages the theta series over a unit fundamental domain, which is Neukirch's (5.5). It already has its [transformation law](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Theta/MellinKernel.html#TauCeti.LFunctions.mellinKernel_inv) and continuity, and the theta series has [stretched-exponential decay](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Theta/Decay.html#TauCeti.LFunctions.exists_norm_latticeTheta_surfaceScale_sub_one_le). Together with the [level version of Mathlib's functional-equation pairs](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/FEPairWithLevel.html#TauCeti.FEPairWithLevel), these are the inputs for continuing ζ_K.
- [**The canonical meromorphic continuation**](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Continuation.html#TauCeti.meromorphicContinuation) from a right half-plane, with uniqueness on the whole plane. Both the continued Dedekind zeta function and the [presented Hecke L-function](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Hecke/Basic.html#TauCeti.LFunctions.heckeLFunctionC) are defined through it.

### Roadmap coverage

- **Layer 0** is done.
- **Layer 1** is done except for the single normalization theorem `gaussianTheta_mellin_normalization`, which needs Layer 3's completed zeta.
- **Layer 2** has partial zeta functions as class-indicator series, with:
  - convergence;
  - the sum over classes against the finite Euler correction;
  - the common residue;
  - continuation to Re s > 1 − 1/[K:ℚ];
  - the class-group case.

  Compatibility with change of modulus is missing.
- **Layer 3** has:
  - the continued `dedekindZetaC`;
  - the unit-quotient sums of Neukirch (5.3)–(5.4);
  - both uniqueness theorems for meromorphic continuation;
  - the Mellin kernel.

  The completed partial zeta functions, the functional equation, residues, behaviour at s = 0 and the Dedekind card are missing.
- **Layer 4** has the Dirichlet cards and the quadratic factorization ζ_K = ζ · L(χ_D) for the continued function. The cyclotomic factorizations are missing.
- **Layer 5** has:
  - presented Hecke L-functions;
  - primitive characters bundled with their conductor;
  - Euler corrections for induced characters;
  - orthogonality.

  Gauss sums, completions, root numbers and the card are missing.
- **Layer 6** is untouched.
- **Layer 7** has only the generic 3-4-1 criterion.
- **Layer 8** has Mertens' first and second theorems and the boundary data for −ζ_K′/ζ_K. Mertens' product and most comparison cards are missing.

## The frontier

- **Completed partial zeta functions**: unfold the theta series over the cone above a unit fundamental domain to get Z(𝔎, s) as the Mellin transform of the kernel minus its constant term. Then build the Dedekind functional-equation pair, which gives continuation, Λ_K(1 − s) = Λ_K(s) and the residues. Still missing are the kernel's decay at infinity and its comparison with the trace-dual lattice.
- **Mertens' product**: steps 3–4 of the README's route, through B_K = γ + log κ_K + ∑_𝔭(…). This needs the residue of `dedekindZetaC` in Layer 3's named form.
- **Hecke completions**: Gauss sums with (6.4), the completed function, the root number and the Hecke card, plus entirety for nontrivial primitive characters. The Mellin presentation waits on the Grossencharacter kernel of Layer 6.
- **Cyclotomic factorization of ζ_K**, in primitive and imprimitive form, on Re s > 1, as germs, and pointwise off s = 1.
- **Grossencharacters**: untouched. They are needed for the Hecke Mellin presentation and the last comparison cards.
