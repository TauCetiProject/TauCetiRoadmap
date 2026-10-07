<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"66f3330c1cbabafd0f5b3ea4a646c43e23105ee2","ts":"2026-10-07T14:16:40Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"Morse-Smale genericity, compactness and gluing, the Morse complex and its homology, and the passage from a vector space to a manifold","state":"partial"},{"id":"Lane F0","remaining":"Fredholm property and index of the strip operator d/ds + A(s) with invertible asymptotics","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, general totally real boundary regularity, Riemann-Roch, Maslov index for paths","state":"partial"},{"id":"Lane F2","remaining":"local theory, the rest of Gromov compactness, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a19ecee1601706b1b50adb35a09859c17a721f46fa4ce2d90a1e591db5fe3aa3","roadmap":"HeegaardFloer","to_sha":"66f3330c1cbabafd0f5b3ea4a646c43e23105ee2"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `66f3330` (2026-10-07T14:16:40Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane F0 is done except for the strip operator: it has Morse–Sard, Sard–Smale, and generic manifolds of zeros of Fredholm sections. Lane M now has global stable and unstable manifolds and their transverse intersections, in a vector space. Every lane from M to F4 is partial. No chain complex has been built: Morse homology, Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)) — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values. It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero).

- **Generic regular zeros of Fredholm sections** ([`TauCeti.eventually_residual_exists_isManifold_sectionZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero)) — for a residual set of parameters, the zeros of a universal Fredholm section of a Banach bundle form a manifold of dimension the index. Every downstream transversality argument takes this form.

- **The stable-manifold theorem for a Morse critical point** ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)) — the global stable set of the negative-gradient flow is a `C¹` manifold modelled on the stable Hessian subspace, with `C¹` inclusion; the [unstable version](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_unstableSet_isManifold) also holds. It is proved for a `C²` function with globally Lipschitz gradient on a finite-dimensional inner product space, not on a manifold.

- **Symmetric powers of Riemann surfaces are complex manifolds** ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)) — the elementary-symmetric charts have analytic transition maps, including where points collide.

- **The energy identity for holomorphic strips** ([`TauCeti.stdComplexLineEnergy_eq_of_tendstoUniformlyOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Symplectic/Cotangent/Action.html#TauCeti.stdComplexLineEnergy_eq_of_tendstoUniformlyOn)) — a holomorphic strip with boundary on two exact graphs has energy equal to the drop in action between its ends. It is proved for a linear cotangent space only.

### Notable definitions and infrastructure

- [Transverse unstable and stable sets meet in an embedded submanifold](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Transversality.html#TauCeti.IsNondegenerateCriticalPoint.exists_unstableSet_inter_stableSet_chart) whose dimension is the difference of the Morse indices. This is the space of connecting trajectories that the Morse differential will count, once transversality is shown to be generic.

- Weak admissibility is characterized by [positive areas vanishing on periodic domains](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/Admissibility.html#TauCeti.HeegaardRegionSystem.weaklyAdmissible_iff_exists_pos_forall_sum_mul_eq_zero), so only finitely many nonnegative domains join two generators. This is the domain-level half of the Ozsváth–Szabó energy bound.

- The genus-one [lens space diagram](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/LensSpace.html#TauCeti.HeegaardRegionSystem.lensSpace) is weakly admissible, and the Ozsváth–Szabó class `ε` puts its `p` generators [in bijection with `ℤ/p`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Heegaard/LensSpace.html#TauCeti.HeegaardRegionSystem.epsilon_lensSpace_bijective), with no domain between distinct generators. This is the combinatorial input to the `HF̂(L(p, q)) = 𝔽^p` acceptance check.

### Roadmap coverage

Lane F0 is done except for the Fredholm property and index of the strip operator `d/ds + A(s)`. Lane M is partial. In a finite-dimensional inner product space with globally Lipschitz gradient, it has the Morse lemma, generic Morse perturbations, convergence of trajectories, global `C¹` stable and unstable manifolds, and the dimension of their transverse intersections. On manifolds it has the Morse lemma and adapted pseudo-gradients. It lacks Morse–Smale genericity, compactness, gluing and the complex. Lane F1 has supercritical `W^{1,p}` multiplication, the Maslov index for loops, and Schwarz reflection for a constant totally real boundary condition. Lane F2 has F2.1's definitions, energy identities and the mean-value inequality; local theory, transversality and gluing are untouched. Lane F3 has the action functional and the energy–action identity in a linear cotangent space, but no strip moduli. Lane F4 covers F4.1's geometry, Lipshitz's Maslov index and the class `ε` from F4.2, domain-level admissibility from F4.3, and the lens space diagram. Spin^c structures in general, nearly-symmetric `J` and F4.4–F4.5 are untouched. F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Morse–Smale genericity** — show that after a generic perturbation every unstable set meets every stable set transversally, so the connecting-trajectory manifolds above exist for all pairs of critical points. Sard–Smale from Lane F0 is available for this.

- **The Morse complex** — prove broken-trajectory compactness and gluing to get `∂² = 0`, then move the whole construction from a vector space to a compact manifold, with spheres and tori as the acceptance check.

- **The strip operator** — show that `d/ds + A(s)` with invertible asymptotics is Fredholm, so the section package has its first real application. This needs Lane F1's Sobolev spaces on strips.

- **The Cauchy–Riemann elliptic package** — `W^{k,p}` on strips, trace, Calderón–Zygmund, boundary regularity for varying totally real boundary conditions, and the Maslov index for paths with Riemann–Roch. It remains the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`** — identify the group where `ε` lives with `H₁(Y)` in general, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain. Admissibility finiteness then becomes Ozsváth–Szabó's energy bound.
