<!--tauceti-status:v1 {"roadmap":"ComplexKahlerGeometry","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: ComplexKahlerGeometry

This file documents the status of the ComplexKahlerGeometry roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The analytic foundation of K3.0 is in place. Several-variable holomorphy, analyticity and complex smoothness are now known to agree on open subsets of ℂⁿ and on complex manifolds, and a complex manifold carries its real-analytic realified atlas. None of the roadmap's main theories has begun: almost complex structures and type calculus (K1), Dolbeault cohomology (K2), analytic subvarieties (the rest of K3), Hermitian bundles (K4), Hodge theory (K5–K6), the projective, torus and Hopf examples (K7) and the Frölicher spectral sequence (K8).

### Named results

- **Osgood's lemma**: a function of finitely many complex variables that is continuous and holomorphic in each variable separately is jointly analytic ([`ContinuousOn.analyticOnNhd_of_differentiableAt_update`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyIntegralPolydisc.html#ContinuousOn.analyticOnNhd_of_differentiableAt_update)).
- **The Cauchy integral formula on a polydisc**: a function holomorphic on a closed polydisc is recovered inside it from its integral over the distinguished boundary torus ([`DifferentiableOn.torusIntegral_prod_sub_inv_smul`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CauchyIntegralPolydisc.html#DifferentiableOn.torusIntegral_prod_sub_inv_smul)). A variant for separately holomorphic functions is what drives Osgood's lemma.
- **Complex manifolds are real-analytic**: with the same charts, a complex manifold modelled on `𝓘(ℂ, E)` is a real `C^ω` manifold modelled on `𝓘(ℝ, E)`, and its holomorphic charts are real-analytic charts ([`IsManifold.restrictScalars_of_ne_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#IsManifold.restrictScalars_of_ne_zero)).
- **Holomorphic means smooth**: a map between complex manifolds is holomorphic exactly when it is `C^n` for any nonzero `n`, including `n = ω` ([`TauCeti.contMDiff_iff_mdifferentiable`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#TauCeti.contMDiff_iff_mdifferentiable)).

### Notable definitions and infrastructure

- **Collapse of the regularity ladder**: on a boundaryless finite-dimensional complex model, all the `C^m` groupoids with `m ≠ 0` coincide ([`TauCeti.contDiffGroupoid_eq_of_ne_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Complex/Analytic.html#TauCeti.contDiffGroupoid_eq_of_ne_zero)). So a `C^1` complex manifold has the same maximal atlas at every order, and later layers can choose whichever order is convenient.
- **Holomorphic structure sheaf and its stalks on curves**: the library already has the sheaf of analytic functions on a complex manifold. On complex curves its stalks are shown to be local rings and discrete valuation rings, with vanishing orders. This is one-variable local algebra and does not by itself meet K3.HolomorphicStalk, which asks for several-variable germs.

### Roadmap coverage

K3.0 is done as far as its holomorphic/analytic/smooth comparisons and its realified atlas go. The supplied material does not establish whether the local defining-equation comparisons K6 wants exported from K3.0 exist. The rest of K3 is untouched in the form the roadmap asks for: several-variable stalks, Weierstrass preparation, Noetherianity, local parametrisation, coherence and Hartogs extension. The curve-level stalk algebra above is adjacent to that work but is not part of it. K1, K2 and K4–K8 are untouched: the source shows no complex scalar action on smooth forms, no type decomposition or Nijenhuis tensor, no Dolbeault complex, no Hermitian or Chern connection, no Hodge Laplacian and no Fubini–Study form.

## The frontier

- **K1 complex type calculus**: put the `Module ℂ` action on DG's `SmoothForm` carrier, then build the `(p,q)` decomposition and conjugation. Everything in K2 and later is stated on this carrier.
- **K3.HolomorphicStalk**: define several-variable holomorphic germs and their power-series comparison, then prove Weierstrass preparation and division. These now rest on the K3.0 analyticity results above. They also need the contour and argument-principle inputs the roadmap names.
- **K3.MeromorphicGermField**: build the one-variable fraction field of holomorphic germs and identify it with punctured meromorphic germs. The curve stalks already being domains is a natural starting point.
- **K2 local Dolbeault lemma**: whole-polydisc `∂̄`-exactness through the parameter-dependent Cauchy–Green solver. This needs K1's type forms and GlobalHolomorphicFunctions' Cauchy–Green and Runge operators.
- **Newlander–Nirenberg**: the smooth theorem via Webster's iteration is the longest single prerequisite chain in the roadmap. It is far from reach until K1's Nijenhuis calculus and the Hölder–Zygmund estimates exist.
