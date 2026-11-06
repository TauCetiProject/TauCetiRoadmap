<!--tauceti-status:v1 {"roadmap":"PadicMeasuresIwasawaAlgebras","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"weak topology in unit coordinates (1.5), the homeomorphism clause of 1.7, finite free base change","state":"partial"},{"id":"Layer 2","remaining":"phi and psi on power series, root-of-unity averaging, bounded Amice norm, unit measures inside measures on Z_p, residue projections","state":"partial"},{"id":"Layer 3","remaining":"positive pseudo-moments and evaluation at characters of the units (3.2-3.3)","state":"partial"},{"id":"Layer 3a","state":"untouched"},{"id":"Layer 4","remaining":"pseudo-isomorphism, structure theorem, mu and lambda of modules, completed coordinate, characteristic ideals, growth formula","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"e6d4333167578933731d5a2542a702d15b8f16b05abfe38157e71d9a88aa7fcf","roadmap":"PadicMeasuresIwasawaAlgebras","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: PadicMeasuresIwasawaAlgebras

This file documents the status of the PadicMeasuresIwasawaAlgebras roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. The comparison of integral measures with the completed group algebra holds as an algebra isomorphism. The Weierstrass ring theory of Λ = O⟦T⟧, including its height-one primes and Iwasawa level coordinates, is now largely in. Layers 1–4 remain partial: the weak topology in unit coordinates, most of the Mahler–Amice operator calculus, evaluation at characters and the structure theory of Λ-modules are missing. Layers 3a, 5 and 6 have not begun.

### Named results

- **Measures are the completed group algebra.** For a profinite group Γ, the integral measures D(Γ, ℤ_p) and ℤ_p[[Γ]] are [isomorphic ℤ_p-algebras](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/CompletedGroupAlgebra.html#AbstractMeasure.completedGroupAlgebraEquiv), and the comparison map is continuous from the weak topology.
- **Measures from tower coordinates.** An integral measure on a group with a tower of finite quotients is [the same thing as a compatible family of finite projections](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/TowerCoordinates.html#AbstractMeasure.towerCoordinatesEquiv). On ℤ_pˣ, these are the [unit coordinates](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/TowerCoordinates.html#AbstractMeasure.existsUnique_finiteProjection_unitsToZModPow_eq) along (ℤ/pⁿ)ˣ.
- **Multiplication by x is the Mahler derivation.** The Amice transform of x·μ is [(1+T)d/dT applied to A_μ](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/Moments.html#AbstractMeasure.amiceTransform_weight_id), so moments are factorial coefficients of A_μ(e^T − 1).
- **The height-one primes of O⟦T⟧.** Over a complete discrete valuation ring with uniformiser ϖ, a prime of O⟦T⟧ [has height one exactly when](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/HeightOne.html#PowerSeries.height_eq_one_iff_of_isDiscreteValuationRing) it is (ϖ) or (F) for an irreducible distinguished F.
- **The Iwasawa level coordinate.** The map O⟦T⟧ → O[ℤ/pⁿ] with T ↦ [1] − 1 is surjective with [kernel (ω_n)](https://taucetiproject.org/docs/TauCeti/RingTheory/Iwasawa/LevelCoordinate.html#TauCeti.Iwasawa.ker_levelCoordinate). It is unique without any continuity assumption, and the levels [jointly separate points](https://taucetiproject.org/docs/TauCeti/RingTheory/Iwasawa/LevelCoordinate.html#TauCeti.Iwasawa.iwasawaCoordinate_injective).

### Notable definitions and infrastructure

- **[Towers of finite quotients](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/QuotientTower.html#TauCeti.FiniteQuotientTower).** With the [compatible families](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/QuotientTower.html#TauCeti.FiniteQuotientTower.compatibleFamilies) along them, this is the one framework that serves both the completed-group-algebra comparison and the unit coordinates.
- **The power basis of a Weierstrass quotient.** O⟦T⟧/(g) has the [power basis](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Weierstrass/Charpoly.html#PowerSeries.IsWeierstrassFactorizationAt.powerBasis) given by the class of T, with characteristic polynomial the distinguished factor. This turns determinants over Λ/(F) into determinants over O, which the growth formula of §4.7 needs.
- **[Extension of coefficients](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/ExtendCoefficients.html#AbstractMeasure.extendCoefficients)** from O-valued to K-valued measures, the bridge Layer 3a will use to evaluate O-measures at C_p-valued characters.

### Roadmap coverage

Layer 0 is done. Layer 1 is partial. Finite projections, the finite measure algebras, the quotients of ℤ_pˣ, character integrals, the existence and uniqueness of unit measures from coordinates (§1.4) and the completed-group-algebra isomorphism are in. Missing are the weak topology in unit coordinates (§1.5), the homeomorphism clause of §1.7 and finite free base change. Layer 2 is partial. It has moments and the Mahler derivation, restriction to pℤ_p and ℤ_pˣ, division by x and the Cartier operators. It lacks φ/ψ on power series, root-of-unity averaging, the bounded Amice norm, unit measures inside measures on ℤ_p, and §2.10–2.12. Layer 3 has §3.1 but not §3.2–3.3. Layer 4 is partial. §4.3 is in substance done: regularity, the height-one primes, the characteristic polynomial of Weierstrass quotients, and the cyclotomic factors ξ_m, irreducible over ℤ_p. §4.5 has the level coordinates and the Fitt⁰ API, but not their continuity or the completed coordinate. Pseudo-null modules are in, while pseudo-isomorphism, the structure theorem, μ/λ of modules, characteristic ideals and the growth formula are not. Layers 3a, 5 and 6 are untouched.

## The frontier

- **Weak topology in unit coordinates (§1.5, §1.7).** The coordinates are now a linear equivalence. What remains is the closed embedding into the product, weak compactness, and convergence through joint coordinates. With these, the comparison isomorphism can be upgraded to a homeomorphism.
- **The completed Iwasawa coordinate (§4.5).** What remains is continuity of the level maps, identifying the image of the joint map with the compatible families to get O⟦T⟧ ≅ O⟦ℤ_p⟧, and comparing it with the existing power-series coordinate.
- **Pseudo-isomorphism and the structure theorem (§4.1–4.2).** The height-one primes of Λ, which this step was waiting on, are now available. The bidual intersection formula and the elementary-module decomposition remain.
- **Evaluation at characters of ℤ_pˣ (§3.2–3.3).** The unit coordinates are now in place. This still needs the regularity of δ_{1+p} − 1 and positive pseudo-moments.
- **φ and ψ on power series (§2.2, §2.6).** Their transport through the Amice transform, and unit measures as ker ψ, rest on PadicFunctionalAnalysis §3.4.
