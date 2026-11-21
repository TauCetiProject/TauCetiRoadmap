<!--tauceti-status:v1 {"roadmap":"CalibratedGeometry","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the oriented Grassmannian of a general space (1.4), the equality locus on it (1.5), external products (1.6)","state":"partial"},{"id":"Layer 2","remaining":"parallel forms in 2.1; integral smooth chains with mass and smoothing (2.3); ordered fundamental chains (2.4)","state":"partial"},{"id":"Layer 3","remaining":"the bounding-chain and integral-homology forms of 3.1; variations and stability (3.2); products (3.3)","state":"partial"},{"id":"Layer 4","remaining":"the Wirtinger inequality in degree two (4.1) and every degree (4.2); Kahler calibrations (4.3)","state":"untouched"},{"id":"Layer 5","remaining":"the oriented Lagrangian Grassmannian (5.2), special Lagrangian submanifolds and phase (5.3), gradient graphs (5.4)","state":"partial"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"0d621a69fa9a64e74d27db5344245094e4609d9f889fa70e90a0085f2871e573","roadmap":"CalibratedGeometry","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: CalibratedGeometry

This file documents the status of the CalibratedGeometry roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The fundamental theorem of calibrations is proved for immersions with equal real periods, and it rests on a nearly complete Layer 1 and on smooth calibrations and calibrated immersions from Layer 2. The chain-level form of the theorem, stability, the Kähler calibrations and McLean's deformation theory have not begun. Of the special Lagrangian layer, only its linear algebra on ℂⁿ is in the library.

### Named results

- **The fundamental theorem of calibrations** — an immersion calibrated by a smooth calibration has volume at most that of any compact oriented competitor with the same integrals against every smooth closed form of its degree. This holds in every degree, and the competitor may have boundary or corners ([`TauCeti.immersionVolume_le_of_isCalibratedImmersion`](https://taucetiproject.org/docs/TauCeti/Geometry/Calibrated/FundamentalTheorem.html#TauCeti.immersionVolume_le_of_isCalibratedImmersion)).
- **The equality case of the fundamental theorem** — under the same hypotheses, the two volumes are equal exactly when the competitor is itself calibrated with its orientation ([`TauCeti.immersionVolume_eq_iff_isCalibratedImmersion`](https://taucetiproject.org/docs/TauCeti/Geometry/Calibrated/FundamentalTheorem.html#TauCeti.immersionVolume_eq_iff_isCalibratedImmersion)).
- **Comass equals the native norm** — the operator norm of a real alternating form is the supremum of its absolute values on orthonormal frames, in every degree ([`ContinuousAlternatingMap.norm_eq_sSup_abs_orthonormal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/Alternating.html#ContinuousAlternatingMap.norm_eq_sSup_abs_orthonormal)).
- **Comass against the Hilbert norm** — a k-form on an n-dimensional space has comass at most its Hilbert norm, and its Hilbert norm is at most √(n choose k) times its comass ([`ContinuousAlternatingMap.sqrt_alternatingFormInner_self_le`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Comass.html#ContinuousAlternatingMap.sqrt_alternatingFormInner_self_le)).
- **The special Lagrangian calibration on ℂⁿ** — for n ≥ 1, Re(e^(−iθ)Ω) has comass one. A real orthonormal frame is calibrated by it exactly when the frame spans a Lagrangian plane on which e^(−iθ)Ω is real and positive (`TauCeti.norm_standardSpecialLagrangianForm`, `TauCeti.specialLagrangianFrame_iff`).

### Notable definitions and infrastructure

- **Smooth calibrations** — a smooth closed form whose comass is at most one at every point ([`TauCeti.IsCalibration`](https://taucetiproject.org/docs/TauCeti/Geometry/Calibrated/Basic.html#TauCeti.IsCalibration)). It is stable under negation, under pullback along Riemannian isometries and under restriction to open sets.
- **Calibrated immersions and their volume** — an oriented immersion is calibrated when the pulled-back form equals the Riemannian volume form of the pulled-back metric ([`TauCeti.IsCalibratedImmersion`](https://taucetiproject.org/docs/TauCeti/Geometry/Calibrated/Immersion.html#TauCeti.IsCalibratedImmersion)). Its volume does not depend on orientation or parametrization ([`TauCeti.immersionVolume`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Immersion/Volume.html#TauCeti.immersionVolume)).
- **Calibrated frames** — orthonormal frames on which a form takes the value one, invariant under isometries and SO(k) ([`ContinuousAlternatingMap.IsCalibratedFrame`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/CalibratedFrame.html#ContinuousAlternatingMap.IsCalibratedFrame)). They are the pointwise test used by the Wirtinger and special Lagrangian classifications.

### Roadmap coverage

**Layer 1** is partial.
- Done: 1.1, 1.2 (including the norm-determinant identity) and 1.3.
- 1.5 is done at the level of frames. The equality locus on the oriented Grassmannian is not, because the Grassmannian of a general space (1.4) is untouched.
- 1.6, external products, is untouched.

**Layer 2** is partial.
- 2.2 is done, including the pointwise and integrated calibration inequalities and their equality case.
- 2.1 is done except for its parallel-form part: the identity dφ = Alt(∇φ) and the constancy of comass for parallel forms.
- 2.3 and 2.4 are untouched. These are the integral smooth chains, with their mass and smoothing comparison, and the fundamental chains. The library does have Stokes' theorem on smooth simplices.

**Layer 3** is partial.
- 3.1 holds on closed sources with equal periods.
- The bounding-chain form, the integral-homology version and the relative version have not landed.
- 3.2 and 3.3 are untouched.

**Layer 5** is partial: 5.1 is done, and 5.2–5.4 are untouched.

**Layers 4 and 6** are untouched.

## The frontier

- **External products (1.6)**: evaluation on product frames, the binomial comass bound, and the product calibration theorem when one factor is a unit decomposable form. This needs only 1.1 and the frame-level 1.5, both of which are in place.
- **The Wirtinger inequality (4.1–4.2)**: the standard Kähler form and its normalized powers, with comass one and the classification of their calibrated frames. It needs only Layer 1. A degree-two Wirtinger inequality for compatible triples already exists in the library, owned by HeegaardFloer.
- **The rest of 2.1**: the covariant exterior-derivative identity for the Levi-Civita connection, the closedness of parallel forms, and the constancy of comass on components. This is blocked on RiemannianGeometry R1's tensor connections.
- **Integral smooth chains and fundamental chains (2.3–2.4)**: chain mass, the integral smoothing quasi-isomorphism and ordered fundamental chains. These unlock the bounding-chain and integral-homology forms of 3.1. They need AlgebraicTopology Stages 2, 3.1 and 6.3, TangentialBordism B1.5 and GeometricTopology's collars.
- **The oriented Grassmannian (1.4)**: the SO(k) quotient of the Stiefel manifold and its comparisons with the finite carriers. It is blocked on SmoothBundlesConnections B1.4, GeneralizedCohomology G4.0b and CharacteristicClasses C1.1a, and it gates both the equality locus of 1.5 and 5.2.
