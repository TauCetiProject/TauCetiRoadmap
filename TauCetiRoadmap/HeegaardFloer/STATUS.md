<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb","ts":"2026-11-28T06:58:08Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"integral differential, corner orientations, continuation invariance, Bott complexes and geometric and Witten comparisons","state":"partial"},{"id":"Lane M","remaining":"integral differential, corner orientations, continuation invariance, Bott complexes and geometric and Witten comparisons","state":"partial"},{"id":"Layer 2","remaining":"manifold trajectory charts, Morse–Smale, Bott and closed-return genericity, and surface-section comparisons","state":"partial"},{"id":"Layer 3","remaining":"the strip Fredholm/index theorem, analytic determinant gluing, weighted ends and general surface index comparisons","state":"partial"},{"id":"Layer 4","remaining":"general-J branch and intersection comparisons, curve compactness, transversality, analytic gluing and nonsqueezing","state":"partial"},{"id":"Layer 5","remaining":"strip moduli, the differential, continuation and invariance in the Liouville setting","state":"partial"},{"id":"Layer 6","remaining":"geometric diagram and Spinᶜ comparisons, nearly-symmetric J, domain-energy bounds and holomorphic HF invariance","state":"partial"},{"id":"Layer 7","remaining":"cylindrical compactness and gluing, bordered modules from curves and pairing, and knot Floer theory","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"f014b850362ce327a3fbae8ba3cb6d2242808ad9ce25327e9607c973a540de3e","roadmap":"HeegaardFloer","to_sha":"b4f07355dff5247676a8ca6f3ba39d26e14385fb"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `b4f0735` (2026-11-28T06:58:08Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The mod-two Morse complex and sharp Banach-space Sard–Smale theorem are established. Integral Morse homology and the analytic Floer constructions remain partial, despite the normalized Hölder disc solver and common-domain spectral flow now available; the reconciliation layer remains untouched.

### Named results

- **The mod-two Morse complex** — on a compact boundaryless manifold with a Morse–Smale adapted pseudo-gradient, the Morse boundary [squares to zero](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Morse/Boundary/Differential.html#TauCeti.IsAdaptedPseudoGradient.IsMorseSmale.morseBoundary_comp_morseBoundary).
- **The Sard–Smale theorem** — a Fredholm map at sharp regularity `k > max(index, 0)` has [meagre critical values](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm) on the stated Lindelöf Banach-space domains.
- **The normalized Hölder disc solver** — for `0 < α < 1`, the [augmented Cauchy–Riemann operator](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLine/Pi.html#TauCeti.rotatingLinePiAugmentedEquiv) with boundary in `e^(3iθ/2)ℝⁿ` is a Banach isomorphism after prescribing the centre value and first derivative, and [small Hölder perturbations](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLine/Perturbation.html#TauCeti.exists_pos_existsUnique_perturbedAugmentedConjWirtingerDerivL_eq_and_norm_le) retain unique solvability with uniform bounds.
- **The common-domain regular-crossing formula** — for symmetric paths through a compact domain embedding with locally available invertible shifts, injective endpoints and regular crossings, [spectral flow is the sum of crossing-form signatures](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/Spectral/CommonDomain/RegularCrossings.html#TauCeti.domainSpectralFlow_eq_finsum_sigPos_sub_sigNeg_domainCrossingForm).
- **Riemann–Roch for diagonal disc boundary conditions** — the real Fredholm index is [`n + Σ kᵢ`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/UnitDisc/RotatingLine/Diagonal.html#TauCeti.index_rotatingLinePiConjWirtingerDerivL) for boundary lines `e^(ikᵢθ/2)ℝ` when every `kᵢ ≥ −1` and `0 < α < 1`, not yet a general surface theorem.

### Notable definitions and infrastructure

- The [stabilized determinant-line gluing isomorphism](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/Gluing.html#ContinuousLinearMap.detLineGluingEquiv) supplies orientation algebra given surjective stabilizations and an isomorphism of stabilized kernels; its [associativity](https://taucetiproject.org/docs/TauCeti/Analysis/Fredholm/DeterminantLine/IteratedGluing.html#ContinuousLinearMap.detLineGluingEquiv_assoc) does not supply analytic neck-splicing estimates.
- [Regularity of weak solutions up to a totally real boundary](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyRiemann/Weak/Bootstrap/Boundary.html#TauCeti.contDiffOn_of_isWeakCauchyRiemannOn_halfPlane) extends the local analytic tools for general almost complex structures under the stated coefficient and Sobolev hypotheses.
- The [Maslov index of Lagrangian paths](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/Maslov.html#Matrix.UnitaryGroup.maslovIndex) provides the boundary-index carrier for the strip and end comparisons.

### Roadmap coverage

Layers 1–7 remain partial. Layer 1 (Lane M) has the mod-two complex, a signed boundary, local Cerf analysis and Euclidean Witten estimates, but not established integral cancellation, continuation invariance or Bott comparisons. Layer 2 (F0) has abstract Fredholm transversality and determinant infrastructure, with geometric path charts and Morse–Smale genericity still outstanding. Layer 3 (F1) now has the normalized Hölder solver and common-domain spectral flow, but the strip index theorem, weighted-end theory and general surface comparisons remain open here. Layer 4 (F2) has local regularity and symplectic foundations, not established curve compactness or gluing. Layers 5–7 (F3–F5) retain action/no-escape, symmetric-product and bordered-algebra foundations; holomorphic Floer complexes and their invariance are not established here. Layer 8 is untouched. Truncated module context limits this assessment, which carries forward the earlier coverage where no new evidence resolves it.

## The frontier

- **Integral Morse differential** — prove opposite boundary signs on compactified index-two components and compute the `ℝP²` differential `d₂ = ±2`.
- **Morse–Smale genericity** — construct the manifold trajectory charts and universal section needed to turn localized metric variations into the relative residual theorem.
- **Morse continuation** — prove the continuation chain-map identity and construct inverse and composition homotopies.
- **The strip index theorem** — prove the actual domain/range estimates and Fredholm theorem for `∂ₛ − A(s)` on the common Sobolev domain, with index `−SF(A)`.
- **Surface and weighted-end comparisons** — extend the disc models to the required Sobolev bundle and end adapters, retaining the boundary, weight and index conventions.
