<!--tauceti-status:v1 {"roadmap":"ComplexKahlerGeometry","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: ComplexKahlerGeometry

This file documents the status of the ComplexKahlerGeometry roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The analytic comparisons of K3.0 are done. Three later targets have begun: the one-variable meromorphic germ field (K3.MeromorphicGermField), the complex scalar structure on smooth forms that opens K1, and the projective manifold of K7.1. All three are partial. Dolbeault theory (K2), Hermitian bundles (K4), Hodge theory (K5–K6) and the Frölicher spectral sequence (K8) have not started.

### Named results

- **Osgood's lemma**: a function of finitely many complex variables that is continuous and holomorphic in each variable separately is jointly analytic ([`ContinuousOn.analyticOnNhd_of_differentiableAt_update`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyIntegralPolydisc.html#ContinuousOn.analyticOnNhd_of_differentiableAt_update)). The proof goes through a Cauchy integral formula on polydiscs.
- **Holomorphic means smooth**: a map between complex manifolds is holomorphic exactly when it is `C^n` for any nonzero `n`, including `n = ω` ([`TauCeti.contMDiff_iff_mdifferentiable`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#TauCeti.contMDiff_iff_mdifferentiable)).
- **Complex manifolds are real-analytic**: with the same charts, a complex manifold is a real `C^ω` manifold on the underlying real model ([`IsManifold.restrictScalars_of_ne_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#IsManifold.restrictScalars_of_ne_zero)).
- **Meromorphic germs are the fraction field of holomorphic germs**: at a point of ℂ, the punctured germs of meromorphic functions form the fraction field of the stalk of holomorphic germs ([`TauCeti.holomorphicStructureSheaf.isFractionRing_meromorphicGerms`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/StructureSheaf/MeromorphicGerm.html#TauCeti.holomorphicStructureSheaf.isFractionRing_meromorphicGerms)). Every such germ is a holomorphic germ over a power of `z - a`.
- **Projective space is an analytic manifold**: over any nontrivially normed field, `ℙ 𝕜 (Fin (n+1) → 𝕜)` with its `n + 1` standard affine charts is a `C^r` manifold for every `r`, including `ω` ([`Projectivization.instIsManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/Projectivization.html#Projectivization.instIsManifold)). Over ℂ this is ℂPⁿ on the carrier K7.1 asks for.

### Notable definitions and infrastructure

- **Complex-valued smooth forms as a complex module**: complex scalars act on smooth forms through coefficient maps ([`TauCeti.SmoothForm.instModule`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/MapCoeff.html#TauCeti.SmoothForm.instModule)). Exterior derivative, pullback and the paired wedge are complex-linear, and coefficient conjugation is conjugate-linear. Every later type form and Dolbeault complex is meant to live on this carrier.
- **Collapse of the regularity ladder**: on a boundaryless finite-dimensional complex model, all the `C^m` groupoids with `m ≠ 0` coincide ([`TauCeti.contDiffGroupoid_eq_of_ne_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#TauCeti.contDiffGroupoid_eq_of_ne_zero)). Later layers can therefore work at whichever order is convenient.
- **Holomorphic germs on curves**: the stalks of the holomorphic structure sheaf on a complex curve are local domains and discrete valuation rings. They are now compared with ordinary function germs near the point. This is one-variable algebra and does not meet K3.HolomorphicStalk, which asks for several-variable germs.

### Roadmap coverage

K3.0 is done as far as its holomorphic/analytic/smooth comparisons and its realified atlas go. The supplied material does not establish whether the local defining-equation comparisons that K6 wants from K3.0 exist. K3.MeromorphicGermField is partial. The field, the fraction-field identification, injectivity of the holomorphic-to-punctured map and the finite-pole representation are proved. Still missing are the pullback along local biholomorphisms, the Laurent principal-part and residue-integral comparison with GlobalHolomorphicFunctions, and regular evaluation. The rest of K3 is untouched: several-variable stalks, Weierstrass preparation, Noetherianity, local parametrisation, coherence and Hartogs extension. K1 is partial, and only its complex-module paragraph is in place. The orientation comparisons, holomorphic implicit maps, submanifolds, `(p,q)` types, the Nijenhuis tensor and Newlander–Nirenberg are absent. K7.1 is partial. The affine charts, the analytic atlas, and Hausdorffness, compactness and second countability of projective space are present. No connectedness instance, comparison with K1's orientation or Riemann-sphere biholomorphism was found. K7.2–K7.4, K2, K4, K5, K6 and K8 are untouched.

## The frontier

- **K1 type calculus**: build the `(p,q)` decomposition, its projections and conjugation on the complex module of smooth forms that now exists. Everything in K2 and later is stated on these type forms.
- **K3.MeromorphicGermField completion**: add the pullback along a local biholomorphism, the principal-part splitting with its Cauchy-integral coefficient formula, and the regular-subring evaluation to ℂ. The comparison consumes GlobalHolomorphicFunctions' local Laurent phase.
- **K7.1 completion**: prove connectedness of ℂPⁿ, compare the real atlas and complex orientation with K1, and upgrade `OnePoint.equivProjectivization` to a biholomorphism. The orientation step waits on K1's orientation comparisons.
- **K3.HolomorphicStalk**: define several-variable holomorphic germs with their power-series comparison, then prove Weierstrass preparation and division. These rest on the K3.0 analyticity results and the contour and argument-principle inputs the roadmap names.
- **Newlander–Nirenberg**: the smooth theorem via Webster's iteration is still the longest prerequisite chain in the roadmap. It is far out of reach until K1's Nijenhuis calculus and the Hölder–Zygmund estimates exist.
