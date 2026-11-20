<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"cubical fundamental chains rel boundary of manifolds with corners","state":"partial"},{"id":"Layer 1","remaining":"Serre E2 identification and cohomological version, Hurewicz mod a Serre class, functorial K(A,n), Pontryagin-Thom comparisons, homogeneous examples","state":"partial"},{"id":"Layer 2","remaining":"loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change stated as an equivalence of derived categories","state":"partial"},{"id":"Layer 4","remaining":"the Brown resolution P_B over arbitrary CW complexes and the Tor identification","state":"partial"},{"id":"Layer 5","remaining":"Morse trajectory spaces and their representing chains, independence of choices, DG Morse homology, the fibration theorem, free loops","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"Conley-Zehnder index, compactness, transversality and gluing, orientations, the Floer complex, symplectic homology","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, the rest of Proposition 5.11, Proposition 5.13, Theorems A-C and Corollaries D and E","state":"partial"},{"id":"Layer 11","remaining":"Theorem H, Propositions 6.13, 6.15-6.18, 6.23 and 6.31, Lemma 6.35 beyond n = 3, abundance in Proposition 6.34, homogeneous and projective spaces, Theorem G","state":"partial"}],"readme_sha":"4949c2d897f8dda21e7410798932406279da43f08f61f5528094bcdc7e64bd91","roadmap":"DGFloer","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 6 is complete, and Layer 3 lacks only the derived-category packaging of basepoint change. The rest of the general foundation (Layers 0–2 and 4) is far along. The Serre spectral sequence still lacks its `E²` identification, and the Brown resolution exists only for the circle. Layers 5, 7, 10 and 11 have isolated milestones. Layers 8 and 9 have not begun.

### Named results

- **Mod-two vanishing** (Serre): [a simply connected space with the mod-2 homology of a point has uniquely 2-divisible homotopy groups](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/ModTwoVanishing.html#TauCeti.isUniquelyTwoDivisible_homotopyGroup_of_subsingleton_singularHomology), with no finiteness hypothesis. It replaces the source's non-Serre class in Theorem C.
- **The cubical–simplicial comparison**: normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso).
- **Lemma 3.41**: [a path-connected space is aspherical exactly when its double loop space has the homology of a point](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.html#TauCeti.MooreLoopSpace.isAspherical_iff_double_singularHomology).
- **Proposition 6.21**: the explicit double loops of Example 6.20 [generate the homology of `Ω²Sⁿ`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Sphere/DoubleTangentCircle.html#TauCeti.isIso_singularHomologyFunctor_map_tangentCircleDoubleLoop).
- **Example 6.30**: [a non-aspherical topological group is abundant with 2-spheres](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Sphere/Abundant/Group.html#TauCeti.HomologicalOrientation.isAbundantWithTwoSpheres_of_not_isAspherical). It is deduced from [abundance from a group action](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Sphere/Abundant/Action.html#TauCeti.HomologicalOrientation.isAbundantWithTwoSpheres_of_smul_ne_zero), the action form of Propositions 6.29 and 6.33, which assumes a path-connected stabilizer.

### Notable definitions and infrastructure

- **Basepoint change** [`basepointChange`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Path/BasepointChange.html#TauCeti.DGLocalSystem.basepointChange): tensoring with the chains on Moore paths. It preserves and reflects quasi-isomorphisms, so no resolution is needed, and changes [compose](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Path/CompositeChange.html#TauCeti.isQuasiIso_tensorPathChainConcat) up to a specified quasi-isomorphism.
- **Twisting chain systems** [`TwistingChainSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/MonoidAlgebra/TwistingChainSystem.html#TauCeti.TwistingChainSystem): chains on abstract moduli spaces satisfying the twisting equation. Representing systems exist under a gluing condition and are [unique up to homotopy](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/MonoidAlgebra/ChainSystemHomotopy.html#TauCeti.TwistingChainSystem.IsRepresenting.nonempty_homotopy).
- **The Serre comparison theorem modulo a class** [`isoModSerre_singularHomologyMap_of_commSq`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Fibration/Comparison.html#TauCeti.TopCat.isoModSerre_singularHomologyMap_of_commSq): a map of Serre fibrations inducing isomorphisms on fibre homology modulo a Serre class induces them on total spaces. It needs no `E²` page, and mod-two vanishing runs on it.

### Roadmap coverage

Layer 6 is done and Layers 8 and 9 are untouched. The rest are partial:

- **Layer 0** lacks only cubical fundamental chains rel boundary for manifolds with corners. Its homological input, [the boundary of the relative fundamental class](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/BoundaryFundamentalClass.html#TauCeti.HomologicalOrientation.isFundamentalClass_singularHomologyδ_fundamentalClassRel), is in. The [cubical Serre spectral sequence](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Fibration/Cubical/Serre.html#TauCeti.TopCat.cubicalSerreSpectralSequence) exists up to its first page.
- **Layer 1** has Hurewicz in degree one, CW approximation, the comparison theorems, the Serre spectral sequence up to its first page, mod-two vanishing, existence and uniqueness of `K(A, n)`, the `Diff(M)` evaluation bundle and the degree computations. It lacks the `E²` identification, the Serre cohomology spectral sequence, Hurewicz modulo a class, the functorial `K(A, n)`, the rest of the Pontryagin–Thom item and most homogeneous examples.
- **Layer 2** lacks loops of a fibration on the Moore model.
- **Layer 3** lacks only the statement of basepoint change as an equivalence of derived categories.
- **Layer 4** lacks the Brown resolution over arbitrary CW complexes and the `Tor` identification.
- **Layer 5** has abstract representing, continuation and parametrized chain systems, but no Morse trajectory spaces.
- **Layer 7** has the Floer energy identity, the action functional and PSS perturbation data, but no Conley–Zehnder index, moduli spaces or Floer complex.
- **Layer 10** has Lemma 3.41 and the degree-zero case of Proposition 5.11. The topological input to Theorem C, mod-two vanishing for `Ω₀Q`, is in.
- **Layer 11** has Definition 6.11, Examples 6.28 and 6.30, the action form of Propositions 6.29 and 6.33, Proposition 6.21, `π₂(SO(3)) = 0` and Lemma 7.6. It also has `2`-covering of odd spheres by rotation families, from the second proof of Proposition 6.34.

## The frontier

- **Proposition 6.34** (Layer 11 item 3): odd spheres are `2`-covered by diffeomorphisms through the rotation family. What remains is to turn this into abundance through Proposition 6.33, whose proved action form needs a group with path-connected stabilizer.
- **The Serre `E²` page** (Layer 1 item 2): the first page and the [fibre-homology local system](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Fibration/SerreLocalSystem.html#TauCeti.TopCat.serreFiberLocalSystem) are in. The page still has to be identified with `H_p(B; H_q(F))` through path-transport monodromy.
- **Theorem G** (Layer 11 item 6): Lemma 7.6 and the degree of a Pontryagin–Thom collapse as an intersection number are in. Proposition 7.5 and Lemma 7.7 remain.
- **The Brown resolution** (Layer 4 item 5): the circle case is done. The cell-by-cell construction over arbitrary CW complexes and the `Tor` identification remain, the latter through the DG roadmap's derived tensor product.
- **Representing chain systems for Morse trajectories** (Layer 5 items 1–2): the abstract existence and uniqueness theorems are ready. They need fundamental chains rel boundary of manifolds with corners (Layer 0 item 4) and the Heegaard Floer roadmap's Lane M moduli spaces.
