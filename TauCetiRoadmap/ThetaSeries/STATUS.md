<!--tauceti-status:v1 {"roadmap":"ThetaSeries","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Poisson summation on Z^n (1B), dual transport (1D), summability (1E), Gaussians (1F), and the assembled theorem (1A)","state":"partial"},{"id":"Layer 2","remaining":"orthogonal sums in 2A, scaling (2B), the bridge (2D), level (2E), Fricke partner (2F), shells (2G), Kronecker symbol (2H)","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b57483b2741b1dc916f6a0566debb3839f2c2697c451306112e045c7b30934db","roadmap":"ThetaSeries","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: ThetaSeries

This file documents the status of the ThetaSeries roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The basic arithmetic of a real lattice is in place: duality, the integral, even and unimodular predicates, and the determinant with its discriminant group. One of the change-of-variables steps toward lattice Poisson summation has also landed. Poisson summation, the bridge to the rational integral-lattice library, the level, the theta series and everything modular have not begun.

### Named results

- **The determinant–index identity.** For an integral lattice L, the squared covolume equals the order of the finite discriminant group L^∨/L ([`ZLattice.IsIntegral.det_eq_card_discriminantGroup`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Determinant.html#ZLattice.IsIntegral.det_eq_card_discriminantGroup)), and so equals the index of L in its dual.
- **The unimodularity criteria.** For an integral lattice, being self-dual is equivalent to having covolume one ([`ZLattice.IsIntegral.isUnimodular_iff_covolume_eq_one`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Determinant.html#ZLattice.IsIntegral.isUnimodular_iff_covolume_eq_one)), to having determinant one, and to having a trivial discriminant group. The covolume direction is the one the roadmap singles out for consumers holding the sphere-packing normalization.
- **Covolume of the dual.** The dual of a full lattice has the inverse covolume ([`ZLattice.covolume_dual`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Covolume.html#ZLattice.covolume_dual)). This is one of the lemmas the README names for later consumers of Poisson summation.
- **Biduality.** The dual of the dual of a full lattice is the lattice itself ([`ZLattice.dual_dual`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Dual.html#ZLattice.dual_dual)).
- **Fourier change of variables.** For a linear automorphism A of a finite-dimensional real inner product space, the Fourier transform of f ∘ A is the inverse absolute determinant of A times the transform of f composed with the adjoint of A⁻¹ ([`ContinuousLinearEquiv.fourier_comp`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/ChangeOfVariables.html#ContinuousLinearEquiv.fourier_comp)). No integrability hypothesis is needed.

### Notable definitions and infrastructure

- **The dual lattice** [`ZLattice.dual`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Dual.html#ZLattice.dual) is Mathlib's dual submodule of the inner product, as the conventions require, and it carries a full-lattice instance, so later statements need no side condition to sum over L^∨.
- **Integral, even and unimodular lattices** ([`ZLattice.IsIntegral`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Integral.html#ZLattice.IsIntegral), [`ZLattice.IsEven`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Integral.html#ZLattice.IsEven), [`ZLattice.IsUnimodular`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Integral.html#ZLattice.IsUnimodular)) are defined against the dual. Evenness is proved to imply integrality, and all three are invariant under isometry. These are the hypotheses every later layer reads.
- **The determinant and discriminant group** ([`ZLattice.det`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Determinant.html#ZLattice.det), [`ZLattice.DiscriminantGroup`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Determinant.html#ZLattice.DiscriminantGroup)) follow the conventions: L^∨ ⧸ (L ∩ L^∨) for every lattice, finite only under integrality. They are the index sets for the coset theta series and the Gauss sums to come.

### Roadmap coverage

Layer 1 is partial: only the Fourier change of variables (1C) has landed. The ℤⁿ case (1B), dual-lattice transport under a linear automorphism (1D), summability (1E), the Gaussian transforms (1F) and the assembled theorem (1A) are all missing. Layer 2 is partial. 2C (covolume, determinant, index and the unimodularity equivalences) is done. 2A is done except that the predicates are not yet shown to be preserved by orthogonal direct sums. Scaling (2B), the bridge (2D), the level (2E), the Fricke partner (2F), shells (2G) and the Kronecker symbol (2H) have not started. Layers 3 to 8 are untouched: no theta series, transformation law, Gauss sum or modularity statement exists yet.

## The frontier

- **Poisson summation on ℤⁿ (1B).** Iterate Mathlib's one-dimensional theorem. This needs the partial-Schwartz bounds and Fubini for the Fourier integral, which are the real work of Layer 1.
- **Dual transport and assembly (1D, 1A).** Show that a linear automorphism moves the dual by the adjoint of its inverse and scales the covolume by its determinant. Combined with the landed change of variables and 1B, this gives the general lattice theorem. The isometry case of dual transport already exists.
- **Gaussians (1F).** Prove that the Gaussian is Schwartz and compute its transform in both the `cpow` and the even-rank integer-power forms. This is independent of 1B and feeds Layer 4 directly.
- **Finishing 2A and 2B.** Prove that the predicates are preserved by orthogonal direct sums in `WithLp 2 (E × F)`, then the scaling identities and the √m criteria with their `Nontrivial E` hypotheses.
- **The bridge and the level (2D, 2E).** Build the rational model through `ofIntegralForm` and match its discriminant group and quadratic map with the real ones. The level should then be read off the order of the discriminant quadratic map. The Kronecker symbol (2H) is independent of both and can proceed in parallel.
