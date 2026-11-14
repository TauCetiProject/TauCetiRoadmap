# Progress log: CalibratedGeometry

An append-only record of what landed on the CalibratedGeometry roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"4bcb355867944159cdac5c1c1f745f7d986300b1","prs":[39191],"roadmap":"CalibratedGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## CalibratedGeometry: 2026-11-13 to 2026-11-13 (`4bcb355` to `aa6e43e`)

The roadmap's first end theorem is in: comass, defined as the supremum of a real alternating form's absolute values on orthonormal frames, [equals the native operator norm](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/Alternating.html#ContinuousAlternatingMap.norm_eq_sSup_abs_orthonormal), in every degree, including degree zero and degrees above the dimension, where both sides vanish (TauCeti#39191). It rests on a [bound criterion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/InnerProductSpace/Orthonormal/Alternating.html#ContinuousAlternatingMap.opNorm_le_iff_le_orthonormal): a bound on all orthonormal frames bounds the operator norm, for maps into any real normed space and with no finite-dimensionality assumption. It is proved by restricting to the span of an independent frame and using the top-degree formula there. This is a more direct route than the README's, which went through the comass form of the linear calibration inequality. On a finite-dimensional space, compactness of the Stiefel manifold shows that [the norm is attained](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Instances/Stiefel/Comass.html#ContinuousAlternatingMap.exists_orthonormal_norm_eq) on some orthonormal frame whenever the degree is at most the dimension, so comass is a maximum.

The rest of Layer 1 has not started. That covers the norm-determinant form of frame volume, the upper bound comparing comass with the Hilbert norm, the oriented Grassmannian of a general space, equality planes and external products. Nothing has landed yet for the later layers.
