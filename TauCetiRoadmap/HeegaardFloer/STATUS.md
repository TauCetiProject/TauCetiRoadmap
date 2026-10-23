<!--tauceti-status:v1 {"roadmap":"HeegaardFloer","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Lane M","remaining":"gluing and d^2 = 0, Morse-Smale genericity, Morse homology and its comparison with singular homology, and the full theory on compact manifolds","state":"partial"},{"id":"Lane F0","remaining":"Fredholm property and index of the strip operator d/ds + A(s) with A(s) unbounded, as Floer theory needs","state":"partial"},{"id":"Lane F1","remaining":"Sobolev spaces on strips, trace, Calderon-Zygmund, general totally real boundary regularity, Riemann-Roch, spectral flow","state":"partial"},{"id":"Lane F2","remaining":"smooth removal of singularities, bubbling for strips with totally real boundary, local theory, transversality and gluing","state":"partial"},{"id":"Lane F3","remaining":"strip moduli in T*M, d^2 = 0, continuation maps, invariance and the T*S^1 computation","state":"partial"},{"id":"Lane F4","remaining":"spin^c structures in general, nearly-symmetric J, energy equals domain area, the HF-hat complex and its invariance","state":"partial"},{"id":"Lane F5","state":"untouched"}],"readme_sha":"a19ecee1601706b1b50adb35a09859c17a721f46fa4ce2d90a1e591db5fe3aa3","roadmap":"HeegaardFloer","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: HeegaardFloer

This file documents the status of the HeegaardFloer roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Lane F0's abstract transversality package is in place, and the strip operator `d/ds + A(s)` is Fredholm with the expected index, but only when `A(s)` acts on a finite-dimensional space. Lane M has most of the Morse complex in a vector space, without `∂² = 0`, which waits on gluing. Every lane from M to F4 is partial. Floer homology, holomorphic `HF̂`, Lane F5 and the reconciliations have not begun.

### Named results

- **The Sard–Smale theorem** — a sufficiently smooth Fredholm map on an open subset of a separable Banach space has meagre critical values ([`TauCeti.isMeagre_image_criticalPoints_of_isFredholm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Fredholm/SardSmale.html#TauCeti.isMeagre_image_criticalPoints_of_isFredholm)). It builds on the finite-dimensional [Morse–Sard theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Sard/OutermostStratum.html#ContDiff.addHaar_image_criticalPoints_eq_zero).

- **The index of the trajectory operator** — for a `C¹` family of symmetric operators on a finite-dimensional space with invertible limits, `u ↦ u' + A u` is Fredholm from `W^{1,2}(ℝ, E)` to `L²(ℝ, E)` ([`TauCeti.WeakDerivStep.isFredholm_trajectoryOperator`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Fredholm.html#TauCeti.WeakDerivStep.isFredholm_trajectoryOperator)), with index a difference of Morse indices of the limits ([`TauCeti.WeakDerivStep.index_trajectoryOperator_eq_finrank_pointSpectralSubspace_sub_finrank`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/EnergyEstimate/Index.html#TauCeti.WeakDerivStep.index_trajectoryOperator_eq_finrank_pointSpectralSubspace_sub_finrank)).

- **The stable-manifold theorem for a Morse critical point** — the global stable set of the negative-gradient flow is a `C¹` manifold modelled on the stable Hessian subspace ([`TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Calculus/Morse/Manifold.html#TauCeti.IsNondegenerateCriticalPoint.exists_stableSet_isManifold)), proved for a `C²` function with globally Lipschitz gradient on a finite-dimensional inner product space.

- **Darboux's theorem** — a closed two-form nondegenerate at a point is constant in suitable local coordinates ([`TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Darboux.html#TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq)), stated on open subsets of a finite-dimensional vector space rather than on symplectic manifolds.

- **Symmetric powers of Riemann surfaces are complex manifolds** — the elementary-symmetric charts have analytic transition maps, even where points collide ([`TauCeti.isManifold_symChartedSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/SymmetricPower/Manifold.html#TauCeti.isManifold_symChartedSpace)).

### Notable definitions and infrastructure

- [Generic regular zeros of Fredholm sections](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/Section/Parametric.html#TauCeti.eventually_residual_exists_isManifold_sectionZero): for a residual set of parameters, the zeros of a universal Fredholm section of a Banach bundle form a manifold of dimension the index.

- The mod-two Morse boundary counts index-one trajectories, which are [finite](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/CompactSublevel.html#TauCeti.finite_unstableSet_inter_stableSet_inter_level_of_isCompact_sublevel) under Morse–Smale transversality and compact sublevels, and `∂² = 0` is [equivalent to an even count of broken index-two trajectories](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/Boundary/Square.html#TauCeti.morseBoundary_comp_morseBoundary_eq_zero_iff). With [index-two sequential compactness](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/Morse/SequentialCompactness.html#TauCeti.exists_subseq_unbroken_or_broken_of_morseIndex_eq_add_two), only gluing stands between this and the Morse complex.

- [Energy quantization for `J`-holomorphic planes](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/Energy/Quantization.html#TauCeti.exists_pos_forall_le_integral_norm_fderiv_one_sq_of_ne) and [finiteness of bubbling points](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/JHolomorphic/Energy/Bubbling.html#TauCeti.exists_pos_forall_exists_strictMono_finset_norm_fderiv_le): the interior bubbling half of Gromov compactness.

### Roadmap coverage

Lane F0 is done except for the strip operator in the Floer case, where `A(s)` is unbounded; the finite-dimensional case is proved. Lane M is partial. In a vector space it has the Morse lemma, generic Morse functions, the stable manifolds and trajectory results above, and the surjectivity step for Morse–Smale genericity; gluing exists only as a linear λ-lemma. On compact manifolds it has adapted pseudo-gradients and Morse–Smale trajectory spaces of dimension the index difference. Lane F1 has supercritical `W^{1,p}` multiplication, the Maslov index of loops and the relative index of paths with its axioms, and Schwarz reflection for constant totally real boundary. Lane F2 has F2.1's definitions with local Darboux, energy identities, quantization, finitely many bubbling points, and continuous `W^{1,p}` extension across finite-energy punctures; local theory, transversality and gluing are untouched. Lane F3 has the action functional, the energy–action identity, Hamiltonian flows and exact graph translations, all in a linear cotangent space, with no strip moduli. Lane F4 has F4.1's geometry, Lipshitz's Maslov index, the class `ε`, the relative grading, domain-level admissibility and the lens space diagram; spin^c structures in general, nearly-symmetric `J` and F4.4–F4.5 are untouched. Lane F5, the reconciliations and all acceptance criteria are untouched.

## The frontier

- **Gluing Morse trajectories**: globalize the linear λ-lemma so that broken index-two trajectories pair up, giving `∂² = 0` over 𝔽₂.

- **Morse–Smale genericity**: combine the surjectivity of admissible perturbations with parametric transversality to show that a generic perturbation is Morse–Smale.

- **Removal of singularities**: upgrade the continuous `W^{1,p}` extension across a finite-energy puncture to a smooth `J`-holomorphic one, which needs interior elliptic regularity from Lane F1, then treat strips with totally real boundary.

- **The Floer strip operator**: prove Fredholmness of `d/ds + A(s)` when `A(s)` is an unbounded self-adjoint operator, with index given by spectral flow. This needs Lane F1's Sobolev spaces on strips, still the long pole.

- **Spin^c structures and energy in `Sym^g(Σ)`**: identify the group where `ε` lives with `H₁(Y)` in general, define `s_z`, and prove that a holomorphic disk's energy is the area of its domain.
