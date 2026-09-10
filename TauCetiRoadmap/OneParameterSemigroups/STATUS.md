<!--tauceti-status:v1 {"roadmap":"OneParameterSemigroups","to_sha":"34ee8bbdc9e93687de81ec9d577b15011d78c35d","ts":"2026-09-03T22:54:01Z"}-->
# Status: OneParameterSemigroups

This file documents the status of the OneParameterSemigroups roadmap up until `34ee8bb` (2026-09-03T22:54:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every named non-stretch milestone is now established: Hille–Yosida and Lumer–Phillips generation, the abstract Cauchy problem, Bernstein’s theorem, Bochner’s theorem, and the Berg–Christensen–Ressel representation. Complex resolvent analyticity and the Stieltjes correspondences remain partial; the C₀-group/Stone stretch has substantial foundations but not the full unbounded theorem, while the LCA/Pontryagin extension has not begun.

### Named results

- **The Hille–Yosida characterization** — a densely defined real Banach-space operator generates a C₀ semigroup of growth `(M, ω)` exactly when `(ω, ∞)` lies in its resolvent set and all resolvent powers satisfy the sharp bounds `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` ([`hilleYosida_generation_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.html#TauCeti.Semigroups.hilleYosida_generation_iff)).
- **The Lumer–Phillips characterization** — an operator generates a contraction semigroup exactly when it is densely defined and maximally dissipative ([`exists_contractionSemigroup_generator_eq_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/LumerPhillips.html#TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff)).
- **The Hausdorff–Bernstein–Widder theorem** — closed-half-line complete monotonicity is equivalent to representation as the Laplace transform of a finite positive measure on `ℝ≥0` ([`hausdorff_bernstein_widder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.html#TauCeti.hausdorff_bernstein_widder)).
- **Bochner’s theorem** — continuity and positive-definiteness on a finite-dimensional real inner-product space are equivalent to representation by a unique finite Borel measure under the project’s Fourier convention ([`bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/BochnerTheorem.html#TauCeti.bochner)).
- **The Berg–Christensen–Ressel representation** — every bounded continuous positive-definite function on the involutive semigroup `ℝ≥0 × V` has a unique finite Laplace–Fourier representing measure ([`bcr_semigroup_bochner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Existence.html#TauCeti.bcr_semigroup_bochner)).

### Notable definitions and infrastructure

- The [`yosidaApproximation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Generation/Yosida/Basic.html#TauCeti.Semigroups.yosidaApproximation) turns an unbounded resolvent problem into bounded exponential semigroups whose compact-time limits produce both generation theorems.
- The canonical [`bochnerMeasure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Bochner/BochnerTheorem.html#TauCeti.bochnerMeasure) makes representing measures functorial enough for spatial slicing and the BCR construction.
- A [`StronglyContinuousGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Semigroups/Group/Basic.html#TauCeti.Semigroups.StronglyContinuousGroup) supplies the two-sided growth, generator, uniqueness, and differentiable-orbit API needed for the Stone-theorem stretch.

### Roadmap coverage

Part A’s non-stretch program is complete at theorem level: the C₀ and contraction objects, unbounded generator, real resolvent theory and sharp power bounds, both generation theorems, bounded perturbation, the abstract Cauchy problem, uniformly continuous characterization, and principal examples are present. Complex analyticity of the resolvent via complexification is not established here; C₀ groups are partial. Part B has the finite and open-half-line Hausdorff–Bernstein–Widder theorems, closure and composition theory, Lévy–Khintchine representation and uniqueness, while the Stieltjes relationships currently run only in the displayed directions. Part C has Bochner and BCR with uniqueness and the measure-slicing infrastructure; only the LCA stretch remains untouched.

## The frontier

- **Complex resolvent analyticity** — construct the complexified generator and prove holomorphy on its complex resolvent set; the current declarations provide the real-parameter resolvent identity and derivative formulas, not this bridge.
- **Stieltjes correspondences** — complete the converse characterizations around completely monotone and Bernstein functions; what is established here is that Stieltjes functions are completely monotone and that multiplication by the parameter admits a Bernstein extension.
- **Stone’s theorem** — extend the unitary-group theory from skew-adjointness of an existing generator and the bounded self-adjoint exponential example to the general unbounded self-adjoint generation theorem.
- **LCA Bochner theory** — no Pontryagin-duality generalization is established here; as the roadmap notes, this stretch depends on suitable upstream LCA support.
