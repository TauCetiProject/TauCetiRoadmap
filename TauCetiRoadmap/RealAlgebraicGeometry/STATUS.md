<!--tauceti-status:v1 {"roadmap":"RealAlgebraicGeometry","to_sha":"b8db0474eb2d3d0831a82689f429f61a3129b234","ts":"2026-10-08T05:52:52Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"integerProjection and integer delineability","state":"partial"},{"id":"Layer 6","remaining":"state quantifier elimination and the image/composition APIs unconditionally over R by discharging projection closure with image_tail","state":"partial"},{"id":"Layer 7","remaining":"the local discriminant theorem, the family theorem for a basis, recursive McCallum correctness","state":"partial"},{"id":"Layer 8","remaining":"analytic Lazard lifting theorem and family theorem, CAD existence by Lazard projection","state":"partial"}],"readme_sha":"4e22960daa5e9be64435d2e9eacdf53d942bab345e59d52a611561d4a59a67d3","roadmap":"RealAlgebraicGeometry","to_sha":"b8db0474eb2d3d0831a82689f429f61a3129b234"}-->
# Status: RealAlgebraicGeometry

This file documents the status of the RealAlgebraicGeometry roadmap up until `b8db047` (2026-10-08T05:52:52Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Collins route to the summit is essentially complete. Layers 1–4 are done, adapted CADs exist, and projection closure (Tarski–Seidenberg over `ℝ`) is proved. Monic and nonmonic Puiseux with parameters are in on the analytic side. The local discriminant theorem, McCallum correctness and Lazard lifting have not landed.

### Named results

- **Existence of adapted CADs** — every finite family of real polynomials in `n` variables has a cylindrical algebraic decomposition of `ℝⁿ` on whose cells each member is sign-invariant, with no well-orientedness assumption: [`exists_isCAD_signInvariant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.exists_isCAD_signInvariant).
- **The Tarski–Seidenberg theorem** — forgetting a coordinate maps semialgebraic subsets of `ℝⁿ⁺¹` to semialgebraic subsets of `ℝⁿ`: [`IsSemialgebraic.image_tail`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.IsSemialgebraic.image_tail).
- **Collins delineability** — if the Collins projection of a finite family is sign-invariant on a preconnected `S ⊆ ℝⁿ`, the fibres have a common stack of continuous ordered roots over `S`, with constant multiplicities and signs: [`nonempty_delineation_of_signInvariant_collinsProjection`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/Projection/Delineability.html#TauCeti.nonempty_delineation_of_signInvariant_collinsProjection).
- **The Sturm–Tarski theorem** — over any real closed field, the variation drop of a signed remainder chain is the sum of `sign q` over the distinct roots of `p`, without squarefreeness: [`Sturm.sum_sign_Ioo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Sturm/OneSided.html#TauCeti.Sturm.sum_sign_Ioo).
- **Nonmonic Puiseux with parameters** — a family whose discriminant is nonzero off `y = 0`, and whose leading and constant coefficients are powers of `y` times units, splits completely after `y = t^{d!}`, with roots of Laurent form `t^e·w` near the hyperplane: [`exists_analyticOnNhd_nonmonic_laurent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Polynomial/Puiseux/Laurent/Factorization.html#TauCeti.Polynomial.exists_analyticOnNhd_nonmonic_laurent).

### Notable definitions and infrastructure

- **Semialgebraic stacks.** A delineation over a semialgebraic base [is a semialgebraic stack](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/Stack/Semialgebraic.html#TauCeti.Delineation.isSemialgebraicStack), described by the shared root set and root counts below the height. This lets Collins delineability build each CAD level without adding derivatives to the family.
- **Ambient order along Puiseux sections.** In a ramified splitting with power-times-unit discriminant, the ambient order of the polynomial is [constant on every root section](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Polynomial/Puiseux/SectionOrder.html#TauCeti.orderAt_root_eq_of_puiseux). This is the order-invariance conclusion the local discriminant theorem needs, once its hypotheses are linked to the splitting.
- **Lazard delineations.** A [`LazardDelineation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/Stack/Lazard.html#TauCeti.LazardDelineation) is a common stack of roots of Lazard evaluations. Its invariance and analyticity properties are proved, so Lazard's lifting theorem only has to produce one.

### Roadmap coverage

Layers 1–4 are done. Layer 3's last item, the shared roots of an active subfamily, is now in. Layer 5 is done except for `integerProjection` and integer delineability. Layer 6 is done in substance: CADs exist, projection closure holds and samples realize all sign conditions. But [quantifier elimination](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/Semialgebraic/QuantifierElimination.html#TauCeti.exists_isQF_realize_iff) and the image and composition APIs are still stated with projection closure as a hypothesis, not unconditionally over `ℝ`. Layer 7 is partial. The analytic toolkit, monic and nonmonic Puiseux, the McCallum projection and its delineating set, and order constancy along sections are in. The local discriminant theorem, the family theorem and recursive McCallum correctness are missing. Layer 8 is partial: valuations, evaluators, Lazard evaluation and projection, and Lazard delineations are in. The analytic lifting theorem and CAD by Lazard projection are not.

## The frontier

- **Unconditional quantifier elimination over `ℝ`** — instantiate the projection-closure hypothesis of the quantifier-elimination, definability and image/composition statements with `IsSemialgebraic.image_tail`.
- **The local discriminant theorem** — derive the `y^a·u` form of the discriminant from constant order on an analytic submanifold, using the directional-order and complexification factorizations. Then combine it with the section-order result to get analytic delineability with constant order on sections.
- **McCallum family theorem and recursive correctness** — extend the local theorem to a squarefree, pairwise coprime basis, then prove order-invariant lifting under well-orientedness, including the delineating refinement at nullifying points.
- **Lazard lifting** — produce a Lazard delineation for a polynomial with constant Lazard valuations of discriminant, leading and trailing coefficients on a connected analytic submanifold. Nonmonic Puiseux supplies the analytic input. Then build CAD by Lazard projection.
- **Integer projection** — define `integerProjection`, show it maps onto the real projection of the integer family, and transport delineability.
