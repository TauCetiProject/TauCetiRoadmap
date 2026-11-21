<!--tauceti-status:v1 {"roadmap":"SobolevMapsBetweenManifolds","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"MemLpLoc and Banach-valued W^{1,p}_loc(Ω; F) over every finite-dimensional source, with their API","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"§6.2 the Jacobian J_f of a Sobolev map with its chart formula, and §6.3 |J_f| ≤ ‖Df‖ⁿ with local integrability; §6.1 is done","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"16606100fc8550592aae263ef5f39cce798a87b548ddf1906bf1b0d19b85e302","roadmap":"SobolevMapsBetweenManifolds","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SobolevMapsBetweenManifolds

This file documents the status of the SobolevMapsBetweenManifolds roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the linear algebra at the base of Layer 6 is in place: the oriented Jacobian of a linear map, with Hadamard's inequality and its equality case. Nothing has landed for the roadmap's Sobolev classes, its measure theory on manifolds, or anything built on them (Layers 1–5 and 7–11).

### Named results

- **Hadamard's inequality** — the oriented Jacobian of a linear map between oriented `n`-dimensional inner product spaces satisfies `|J(A)| ≤ ‖A‖ⁿ` ([`Orientation.abs_orientedJacobian_le`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.abs_orientedJacobian_le)). An orthonormal-basis form bounds it by the product of the lengths of the images of the basis vectors ([`Orientation.abs_orientedJacobian_le_prod_norm`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.abs_orientedJacobian_le_prod_norm)).
- **The equality case of Hadamard's inequality** — equality holds exactly when `A` is zero or conformal ([`Orientation.abs_orientedJacobian_toLinearMap_eq_norm_pow_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.abs_orientedJacobian_toLinearMap_eq_norm_pow_iff)), and the roadmap's §6.3 check relies on this.
- **Multiplicativity of the oriented Jacobian** — for three oriented spaces of the same dimension, `J(B ∘ A) = J(B) J(A)` ([`Orientation.orientedJacobian_comp`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian_comp)). This is the linear core of the chain rule for `J_f`.
- **The sign of the Jacobian** — `J(A) > 0` exactly when `A` is invertible and carries the source orientation to the target one ([`Orientation.orientedJacobian_pos_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian_pos_iff)), and `J(A) = 0` exactly when `A` is not bijective ([`Orientation.orientedJacobian_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian_eq_zero_iff)).

### Notable definitions and infrastructure

- **The oriented Jacobian** ([`Orientation.orientedJacobian`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian)) is the unique scalar by which `A` pulls the target volume form back to a multiple of the source one. Unlike the determinant, it works between distinct spaces, as tangent spaces at `x` and `f(x)` require. Its absolute value is `LinearMap.normDet A`.
- **The metric-rescaling and coordinate formulas** ([`Orientation.orientedJacobian_comp_eq_div_mul_of_volumeForm_compLinearMap`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian_comp_eq_div_mul_of_volumeForm_compLinearMap), [`Orientation.orientedJacobian_eq_det_toMatrix_mul_div`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/OrientedJacobian.html#Orientation.orientedJacobian_eq_det_toMatrix_mul_div)) give `J` after rescaling the volume forms, and as a matrix determinant times a ratio of basis volumes. Pointwise, these are §6.2's change-of-metric rule and chart formula.

### Roadmap coverage

Layer 6 is partial. §6.1 is done: every listed property of the linear oriented Jacobian is proved, including the behaviour in dimension zero. §6.2 (the Jacobian `J_f` of a Sobolev map) and §6.3 (`|J_f| ≤ ‖Df‖ⁿ` and local integrability) are untouched. Layers 1–5 and 7–11 are untouched. Tau Ceti already has some supplier material the README lists, such as chartwise null sets on manifolds and the planar local Sobolev classes over `ℂ`, but none of these layers' own targets has landed: no general-source `MemLpLoc` or `W^{1,p}_loc(Ω; F)`, no `IsSobolevMap`, no weak differential.

## The frontier

- **Local classes over every Euclidean source (§1.1–§1.2)** — define `MemLpLoc` and the Banach-valued `W^{1,p}_loc(Ω; F)` over every finite-dimensional real normed space, extending the planar classes. Everything else on the roadmap rests on these.
- **Euclidean calculus of the local class (Layer 2)** — the chain rule for `C¹` outer maps, change of variables under `C¹` diffeomorphisms and submersions, local mollification, and Banach-valued Morrey and Poincaré estimates. Mollification (§2.3) comes first.
- **Measure theory without a metric (Layer 3)** — the almost-everywhere filter built on `TauCeti.IsNullSet`, measures from positive continuous densities, chart measurability and local `Lᵖ` on a manifold. This can proceed alongside Layers 1–2 except where it uses §2.2 and §2.5.
- **The Jacobian of a Sobolev map (§6.2–§6.3)** — define `J_f(x) = J(Df(x))` and prove its chart formula, chain rules and `|J_f| ≤ ‖Df‖ⁿ`. The pointwise linear algebra is ready; this is blocked on Layer 4's `IsSobolevMap` and weak differential and on Layer 5's tangent norms.
