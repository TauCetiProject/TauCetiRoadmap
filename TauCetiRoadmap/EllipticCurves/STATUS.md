<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8","ts":"2026-11-06T16:03:15Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 0.5","state":"done"},{"id":"Layer 1","remaining":"the formal exponential of the elliptic formal group over a Q-algebra; the logarithm is already identified with the integral of the invariant differential","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 4.5a","state":"done"},{"id":"Layer 4.5b","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"Cassels' isogeny invariance of the BSD quotient: the global Selmer comparison for an isogeny and its dual, Tamagawa numbers under isogeny, and the final assembly","state":"partial"},{"id":"Layer 8","state":"done"}],"readme_sha":"f6859d835c348ad567a40601ade63de60c98574b77e8a62726a0fa7315af7144","roadmap":"EllipticCurves","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `a67a650` (2026-11-06T16:03:15Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The proved results now include Mordell–Weil, the Hasse bound, finiteness of the Selmer group, Néron–Ogg–Shafarevich and Tate's uniformisation. Layers 0, 0.5, 2, 3, 4, 4.5a, 4.5b, 5, 6 and 8 are complete. Layer 1 still lacks the formal exponential of `Ê`. Layer 7 still lacks Cassels' isogeny invariance of the BSD quotient.

### Named results

- **The Hasse bound** — an elliptic curve over `𝔽_q` satisfies [`(#E(𝔽_q) − (q + 1))² ≤ 4q`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.html#WeierstrassCurve.hasse_bound). Its zeta function is rational and [an isogeny invariant](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Isogenous.html#TauCeti.Isogeny.zetaFunction_eq).
- **The Mordell–Weil theorem** — the points of an elliptic curve over a number field form a [finitely generated group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.html#WeierstrassCurve.Affine.fg_point_of_numberField). As a worked example, [the group of `y² = x³ − x + 1` over `ℚ` is `ℤ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/WorkedExamples/X3SubXAddOne/Rank.html#TauCeti.WorkedExamples.nonempty_addEquiv_int_point_curveX3SubXAddOne).
- **The Néron–Ogg–Shafarevich criteria** — for `ℓ` prime to the residue characteristic, good reduction holds exactly when inertia acts trivially on `T_ℓ E`. Potential good reduction holds [exactly when the inertia image is finite](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/PotentialGoodReduction.html#WeierstrassCurve.hasPotentialGoodReduction_iff_finite_image_tateModuleGaloisRepresentation).
- **Tate's uniformisation** — for a complete non-archimedean field `K` and a unit `q` with `‖q‖ < 1`, [`Lˣ/q^ℤ ≃ E_q(L)` as groups](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Surjectivity.html#TauCeti.tateUniformizationBaseChangeEquiv) for every complete extension `L`. The isomorphism is compatible in `L` and [Galois-equivariant](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Surjectivity.html#TauCeti.tateUniformizationBaseChangeEquiv_symm_map_algEquiv).
- **Local Tate duality for `E[m]`** — the cup product along the Weil pairing, followed by the local invariant, [identifies `H¹(K, E[m])` with its `ℤ/m`-dual](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/WeilPairing/Local.html#WeierstrassCurve.localTateWeilPairing_bijective). The same holds [for the kernels of an isogeny and its dual](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/WeilPairing/Local.html#TauCeti.Isogeny.localTateKerWeilPairing_bijective).

### Notable definitions and infrastructure

- **Selmer groups, Ш and isogeny descent.** `Sel_m` and Ш are built from general Selmer structures, and [`Sel_m` is finite](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Finite.html#WeierstrassCurve.finite_selmerGroup). For an arbitrary isogeny `φ` there are [`φ`-Selmer groups](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Isogeny/Basic.html#TauCeti.Isogeny.selmerGroup) with exact descent sequences. There is also a [count of their local conditions at every finite place](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Isogeny/Local.html#TauCeti.Isogeny.natCard_localCondition_selmerStructure_mul_natCard_localCondition_dual), and a proof that [finiteness of Ш is isogeny-invariant](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Isogeny/Sha.html#TauCeti.Isogeny.Hom.finite_sha_iff). These are the inputs Cassels' theorem uses.
- **The BSD quotient and the BSD statement over `ℚ`.** [`Ω · Reg · #Ш · ∏ c_p / #E(ℚ)_tors²`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Quotient.html#WeierstrassCurve.bsdQuotient) is defined when Ш is finite, and it is positive. The [statement of BSD](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Statement.html#WeierstrassCurve.BirchSwinnertonDyer) asks for a continuation of the actual `L`-series, as the README requires.
- **The real period over `ℚ`.** The [period of a global minimal equation](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/RealPeriod.html#WeierstrassCurve.minimalRealPeriod) is an isomorphism invariant and is positive. It also has [a transformation rule under isogeny](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MinimalRealPeriod.html#TauCeti.Isogeny.abs_mul_minimalRealPeriod_mul_index_eq_card_ker_mul) involving the kernel and the cokernel on real points.

### Roadmap coverage

Layers 0, 0.5, 2, 3, 4.5a, 4.5b, 5, 6 and 8 remain done. Layer 4 is now done too: the Tate curve's uniformisation is a group isomorphism over every complete extension, compatible in `L` and Galois-equivariant, and the Tate curve has split multiplicative reduction. Layer 1 is done except for milestone (ii), and half of that has landed. The [formal logarithm of `Ê` is the integral of `ω`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/InvariantDifferential.html#WeierstrassCurve.derivative_log_formalGroup_mul_formalInvariantDifferentialDenom) over a `ℚ`-algebra, but nothing supplied here gives a formal exponential for `Ê`. In Layer 7, the core is done, and the explicit and cohomological 2-Selmer groups are now isomorphic. The BSD quotient and the statement-only BSD milestone are also done. Cassels' isogeny invariance is the one stretch goal still open.

## The frontier

- **Cassels' isogeny invariance of the BSD quotient.** Many of its local and per-factor inputs are in place:
  - local Kummer-cokernel indices and local duality for `E[φ]` and `E[φ̂]`;
  - the transfer of Ш finiteness;
  - the behaviour of the regulator, torsion and real period under isogeny;
  - equal local factors at good and potentially good reduction.

  What remains is the global step that compares `#Sel_φ` with `#Sel_φ̂` through the product of local conditions, together with a comparison of Tamagawa numbers. Then all of it has to be assembled into invariance of the quotient.
- **The formal exponential of `Ê`.** The logarithm is identified with `∫ω`. A formal exponential for `Ê` over a `ℚ`-algebra, inverse to that logarithm, is not established in the supplied material.
