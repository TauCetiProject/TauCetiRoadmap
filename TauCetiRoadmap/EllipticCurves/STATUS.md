<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418","ts":"2026-11-11T08:00:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 0.5","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 4.5a","state":"done"},{"id":"Layer 4.5b","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"Cassels' theorem over Q: the global Selmer ratio for an isogeny and its dual, and equality of BSD quotients for isogenous curves","state":"partial"},{"id":"Layer 8","state":"done"}],"readme_sha":"f6859d835c348ad567a40601ade63de60c98574b77e8a62726a0fa7315af7144","roadmap":"EllipticCurves","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `a6027b1` (2026-11-11T08:00:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Mordell–Weil, the Hasse bound, finiteness of the Selmer group, Néron–Ogg–Shafarevich, the classification of twists and the Tate curve's uniformisation are all proved, and isogenous curves now have equal `L`-functions. Eleven of the twelve layers are complete. The one open milestone is Cassels' isogeny invariance of the BSD quotient, a stretch goal in Layer 7.

### Named results

- **The Mordell–Weil theorem** — the points of an elliptic curve over a number field form a [finitely generated group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField), and the worked example shows that [`y² = x³ − x + 1` has group `ℤ` over `ℚ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/WorkedExamples/X3SubXAddOne/Rank.html#TauCeti.WorkedExamples.nonempty_addEquiv_int_point_curveX3SubXAddOne).
- **The Hasse bound** — over a field with `q` elements the Frobenius trace satisfies [`a_q² ≤ 4q`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.html#WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card), proved through positivity of the degree form.
- **Finiteness of the Selmer group** — over a number field, [`Sel_m(E/K)` is finite](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Finite.html#WeierstrassCurve.finite_selmerGroup) (AEC X.4.2). The proof passes to the `m`-division field and uses Hermite's theorem.
- **The Néron–Ogg–Shafarevich criteria** — for `ℓ` prime to the residue characteristic, potential good reduction holds [exactly when inertia has finite image on `T_ℓ E`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/PotentialGoodReduction.html#WeierstrassCurve.hasPotentialGoodReduction_iff_finite_image_tateModuleGaloisRepresentation), and good reduction exactly when inertia acts trivially.
- **Isogeny invariance of the `L`-function** — isogenous curves over a number field have [the same `L`-function](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/LFunction/Isogeny.html#TauCeti.Isogeny.LFunction_eq) as a formal Dirichlet series, Euler factors at bad places included.

### Notable definitions and infrastructure

- **The BSD quotient and the statement of BSD over `ℚ`.** The [quotient](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Quotient.html#WeierstrassCurve.bsdQuotient) is defined when `Ш` is finite, from the real period of a global minimal equation, the regulator and the Tamagawa product. [BSD itself](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Statement.html#TauCeti.BirchSwinnertonDyerConjecture) is stated against a continuation of the actual `L`-series. It is a statement only, as the roadmap intends.
- **The duality toolkit for Cassels' theorem.** [`Sel_φ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Isogeny/Basic.html#TauCeti.Isogeny.selmerGroup) for an arbitrary isogeny has its descent sequence. [Local Tate duality](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/WeilPairing/Local.html#TauCeti.Isogeny.localTateKerWeilPairing_bijective) pairs `H¹(K, E₁[φ])` perfectly with `H¹(K, E₂[φ̂])`, local Kummer indices are known at finite and real places, and [global reciprocity for the Weil cup product](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/WeilPairing/Reciprocity.html#WeierstrassCurve.finsum_toRatAddCircle_localTateWeilPairing_add_sum_infiniteInvMap_eq_zero) makes the sum of local invariants vanish.
- **The local filtration of `E(K)`.** The formal group is the kernel of reduction, and its levels have their indices computed, with [the component-group factor equal to the Tamagawa number](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Index.html#WeierstrassCurve.index_formalPointFiltration_eq_mul_tamagawaNumber). This is how the `c_p` enter the BSD quotient and Cassels' local factors.

### Roadmap coverage

Layers 0, 0.5, 2, 3, 4, 4.5a, 4.5b, 5, 6 and 8 are done, as before. Layer 4 includes the Tate curve's [group isomorphism `Kˣ/q^ℤ ≃ E_q(K)`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Surjectivity.html#TauCeti.tateUniformizationEquiv). Layer 1 is now judged done. The previous report listed the formal exponential as missing, but the library defines, for every formal group law over a `ℚ`-algebra, the exponential as the compositional inverse of the logarithm, proves the two inverse, and shows the law is strictly isomorphic to the additive one. The elliptic formal group is such a law, so the milestone is covered by that general construction. Layer 7's core milestones are done, as are its stretch milestones for the BSD quotient over `ℚ` and the statement of BSD. Cassels' theorem is not.

## The frontier

- **The global Selmer ratio for `φ` and `φ̂`.** With reciprocity for the Weil cup product, local duality and the local Kummer indices proved, the next step is Cassels' formula expressing `#Sel_φ / #Sel_φ̂` through local indices. It does not appear in the library yet.
- **Cassels' isogeny invariance over `ℚ`.** The remaining work is to assemble the Selmer ratio with the existing transformation laws for `Ш` finiteness, the regulator, the real period and the Tamagawa product into equality of BSD quotients for isogenous curves. Since the `L`-functions now agree, this would also make the truth of BSD isogeny-invariant.
