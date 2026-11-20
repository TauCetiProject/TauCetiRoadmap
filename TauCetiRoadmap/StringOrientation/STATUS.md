<!--tauceti-status:v1 {"roadmap":"StringOrientation","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the class lambda on BSpin, BString and the existence and H3-torsor theorem for String lifts","state":"untouched"},{"id":"Layer 2","remaining":"the MString comparison, geometric String bordism and the third stable stem","state":"untouched"},{"id":"Layer 3","remaining":"S3.0 prism covers, S3.1 differential characters, gerbes and 2-gerbes, string connections, diffeological forms and transgression","state":"partial"},{"id":"Layer 4","remaining":"the series Theta_q and Q and the integral, modular Witten genus","state":"untouched"},{"id":"Layer 5","remaining":"Cayley-plane bundles, family vanishing and McTague's kernel theorem away from 6","state":"untouched"},{"id":"Layer 6","remaining":"low-weight positive-Ricci vanishing and the framed SU(3) and S3 counterexamples","state":"untouched"}],"readme_sha":"60115a60ee6937c524f20c92375b5d6a21fa8fc5b77d403becbbff79023432b0","roadmap":"StringOrientation","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: StringOrientation

This file documents the status of the StringOrientation roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 3 has begun. Its foundations in S3.0 are half done: iterated fibre products of submersions have their manifold structure, but the prism covers do not exist yet. The obstruction theory of S1, the bordism comparisons of S2, the Witten genus and the Cayley-plane and curvature layers (S4–S6) have not been started.

### Named results

**Iterated fibre products of a submersion are manifolds**: for a smooth submersion π : Y → M between finite-dimensional real boundaryless manifolds, the tuples in Y^k with a common image in M form a manifold of dimension k·dim Y − (k−1)·dim M, smoothly embedded in Y^k, and closed when M is Hausdorff ([`exists_isManifold_iteratedFiberProduct_isSmoothEmbedding`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/IteratedSubmersion.html#TauCeti.exists_isManifold_iteratedFiberProduct_isSmoothEmbedding), [`isClosedEmbedding_coe_iteratedFiberProduct`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/IteratedSubmersion.html#TauCeti.isClosedEmbedding_coe_iteratedFiberProduct)).

**Independence of the order of iteration**: splitting a tuple into its first and last blocks of coordinates is a diffeomorphism onto the product of two smaller fibre products over M ([`iteratedFiberProductSplitDiffeomorph`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/IteratedSubmersion.html#TauCeti.iteratedFiberProductSplitDiffeomorph)).

**Face maps are surjective submersions**: deleting one coordinate of Y^[k] is a surjective submersion ([`isSubmersion_face`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/Simplicial.html#TauCeti.isSubmersion_face)). Each diagonal degeneracy is a smooth embedding ([`isSmoothEmbedding_degeneracy`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/Simplicial.html#TauCeti.isSmoothEmbedding_degeneracy)), and the five simplicial identities hold.

**Local sections of a surjective submersion**: if the source is boundaryless, every point of the base has a neighbourhood with a smooth section ([`exists_contMDiffOn_section_of_surjective`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Submersion/Basic.html#Manifold.IsSubmersion.exists_contMDiffOn_section_of_surjective)).

### Notable definitions and infrastructure

- [`IteratedFiberProduct`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/FiberProduct/IteratedSubmersion.html#TauCeti.IteratedFiberProduct), the k-fold fibre product Y^[k] as a subtype of tuples, with faces, degeneracies and reindexing. This is the carrier S3.2 needs for bundle gerbes and their descent complex.
- The library also contains much of S3.5's diffeology bridge: on finite-dimensional boundaryless manifolds, diffeological smoothness agrees with `ContMDiff`, and there are induced and functional diffeologies, with evaluation on mapping spaces. Plotwise forms and fibre integration with Stokes, which transgression needs, are not there.

### Roadmap coverage

Layer 3 is partial. In S3.0 the submersion part is done: local sections, the manifold structure on Y^[k], closedness, independence of the order of iteration and the simplicial structure. The contractible prism covers of M×[0,1] and their homotopy formula are not done. S3.5 is partial, as described above. Differential characters (S3.1), gerbes and 2-gerbes (S3.2–S3.3), string connections (S3.4) and transgression (S3.6) are untouched. Layers 1, 2, 4, 5 and 6 are untouched. In particular, the stable-range third stem stated in the roadmap's `Suggested.lean` is not proved in the library.

## The frontier

- **S3.0 prism covers.** Products of a smooth good cover of M with interval covers of [0,1] need to be shown smoothly contractible in their boundary models, and they need the homotopy formula dK + Kd = id − ev₀*. This depends on SmoothBundlesConnections B6.0's good covers and DifferentialGeometry §5.4 and §6.2.
- **S3.2 bundle gerbes.** The fibre-product carrier is now ready. Next comes exactness of the alternating pullback complex on forms over Y^[k], then gerbes and their descent.
- **S3.1 differential characters.** The groups Ĥᵏ(M;ℤ) and their two exact sequences are next. The Čech–Deligne comparison on prisms waits for the prism covers above.
- **S1.1 the class λ.** This is the entry point to S1, defined on the stable Spin classifier. It is blocked on GeneralizedCohomology G5.0 and on a K(ℤ,4) carrier, which the roadmap's own statement file says the pins do not have.
- **S2.3 the third stem in its stable range.** π_(n+3)(Sⁿ) ≅ ℤ/24 for n ≥ 5 can already be stated, but it depends on EllipticCohomology E4.S's stem computation and on Freudenthal from GeneralizedCohomology G2.
