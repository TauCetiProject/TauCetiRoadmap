<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418","ts":"2026-11-11T08:00:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"fundamental chains rel boundary of general manifolds with corners; the cubical Serre spectral sequence","state":"partial"},{"id":"Layer 1","remaining":"Serre E2 identification, Hurewicz mod a Serre class and mod-2 vanishing, functorial K(A,n) and uniqueness, Pontryagin-Thom comparisons, homogeneous examples","state":"partial"},{"id":"Layer 2","remaining":"loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change as a derived tensor product with the path bimodule, and its equivalence","state":"partial"},{"id":"Layer 4","remaining":"the Brown resolution P_B over arbitrary CW complexes and the Tor identification","state":"partial"},{"id":"Layer 5","remaining":"Morse trajectory spaces and their representing chains, independence of choices, DG Morse homology, the fibration theorem, free loops","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"Conley-Zehnder index, compactness, transversality and gluing, orientations, the Floer complex, symplectic homology","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, the rest of Proposition 5.11, Proposition 5.13, Theorems A-C and Corollaries D and E","state":"partial"},{"id":"Layer 11","remaining":"Theorem H, fibered 2-sphere families, Proposition 6.31, Lemma 6.35 beyond n = 3, both proofs of 6.34 in full, homogeneous and projective spaces, Theorem G","state":"partial"}],"readme_sha":"4949c2d897f8dda21e7410798932406279da43f08f61f5528094bcdc7e64bd91","roadmap":"DGFloer","to_sha":"a6027b1d24fcb935c53bd5b50d11b40991cda418"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `a6027b1` (2026-11-11T08:00:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 6 is now complete: Proposition 6.3 is proved. The general-purpose foundation (Layers 0–4) is far along, but none of those layers is finished. Layer 5 has its first abstract chain-level results, and Layers 7, 10 and 11 each have isolated milestones. Layers 8 and 9 have not begun.

### Named results

- **The cubical–simplicial comparison**: normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso). This also holds [with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/LocalCoefficients/Comparison/Homotopy.html#TauCeti.LocalCoefficientSystem.twistedCubicalSingularHomotopyEquiv) and, now, [relatively](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Kunneth/Relative.html#TauCeti.quasiIso_cubicalCrossProductRel) for Eilenberg–Zilber.
- **CW approximation**: every space receives a [weak homotopy equivalence from a CW complex](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Sigma.html#TauCeti.isWeakHomotopyEquivalence_sigmaCWApproximationMap), [natural up to homotopy](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Sigma.html#TauCeti.comp_sigmaCWApproximationLift_homotopic) (Hatcher 4.13 and 4.18).
- **Eilenberg–MacLane spaces**: [every abelian group has a `K(A, n + 2)`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/EilenbergMacLane/Existence.html#TauCeti.exists_isEilenbergMacLaneSpace). It is built from a presentation by attaching cells and killing higher homotopy, and it is the fibre of each [stage of the Whitehead tower](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/NConnectedCover.html#TauCeti.isEilenbergMacLaneSpace_fiber_nConnectedCoverProj).
- **Hofer–Zehnder–Struwe almost existence** (Proposition 6.3): if a region has finite `π₁`-sensitive Hofer–Zehnder capacity, almost every regular level inside it carries a contractible closed characteristic.
- **Lemma 3.41 of Barraud–Damian–Humilière–Oancea**: [a path-connected space is aspherical exactly when its double loop space has the homology of a point](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.html#TauCeti.MooreLoopSpace.isAspherical_iff_double_singularHomology).

### Notable definitions and infrastructure

- **The chain algebra of Moore loops** [`loopChainAlgebra`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/LoopAlgebra.html#TauCeti.loopChainAlgebra): strict Moore concatenation makes `C_*(Ω_b B)` a DG algebra with no Eilenberg–Zilber correction, so DG local systems are simply right modules over it.
- **Twisting chain systems** [`TwistingChainSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/MonoidAlgebra/TwistingChainSystem.html#TauCeti.TwistingChainSystem): chains on abstract moduli spaces that satisfy the twisting equation. [Representing systems exist](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/MonoidAlgebra/RepresentingChainSystem.html#TauCeti.TwistingChainSystem.exists_isRepresenting) under a gluing condition. This is the chain-level form of the Barraud–Cornea construction, ready to receive Morse and Floer moduli spaces.
- **Covering by diffeomorphisms** [`IsCoveredByDiffeomorphisms`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Covered.html#TauCeti.HomologicalOrientation.IsCoveredByDiffeomorphisms): a class of `H_d(Diff(M))` that evaluates to `ℓ[M]`. This is the hypothesis through which Layer 11 obtains abundance.

### Roadmap coverage

Layer 6 is done. Layers 0–5, 7, 10 and 11 are partial; Layers 8 and 9 are untouched.

- **Layer 0** lacks fundamental chains rel boundary for general manifolds with corners (only the cube pair is done) and the cubical Serre spectral sequence.
- **Layer 1** now has the `Diff(M)` evaluation bundle and the degree computations (items 6 and 8), as well as `K(A, n)` existence, the Bockstein comparison and Serre's `K(A, 1)` axioms. It lacks the following:
  - the Serre `E²` identification;
  - Hurewicz modulo a class and mod-2 vanishing;
  - the pinned functorial `K(A, n)` model and its uniqueness;
  - the Pontryagin–Thom comparisons;
  - most of the homogeneous examples.
- **Layer 2** lacks `Ω` of a fibration on the Moore model. **Layer 3** lacks derived basepoint change; associative path bimodules are in. **Layer 4** lacks the Brown resolution itself, though semi-free twisted modules are now K-projective.
- **Layer 5** has the abstract representing chain systems and their evaluation into Moore loops, but nothing involving actual Morse trajectory spaces.
- **Layer 7** has the [Floer energy identity](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/CylinderAction.html#TauCeti.SmoothTwoForm.IsNondegenerate.integral_floerEnergyDensity_eq_contractibleLoopAction_sub) and PSS perturbation data.
- **Layer 10** has Lemma 3.41 and the [degree-zero case `k = 2` of Proposition 5.11](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/ReducedHomology.html#TauCeti.exists_injective_doubleLoopSpaceReducedHomology₀).
- **Layer 11** has `π₂(SO(3)) = 0`, Examples 6.28 and 6.30, and `S³` covered by rotations.

## The frontier

- **Proposition 6.34, second proof** (Layer 11 item 3): the evaluation bundle and the [degree-2 rotation family](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Degree/SphereRotation.html#Orientation.degreeAtRegularValue_sphereRotationFamily_of_even) are both proved. What remains is to push its fundamental class into `H_*(Diff(Sⁿ))` and evaluate it to `2[Sⁿ]`. The [first proof](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Sphere/Covered.html#TauCeti.HomologicalOrientation.exists_isCoveredByDiffeomorphisms_sphere_of_isMulTorsion) still waits on torsion of `π_{n−1}(SO(n))` beyond `n = 3`.
- **The Serre `E²` page** (Layer 1 item 2): the spectral sequence over a CW base is first-quadrant, and the fibre-homology local system is defined. The second page still has to be identified with `H_p(B; H_q(F))`. This identification is what mod-2 vanishing needs; the Whitehead-tower stages and the Bockstein comparison it also uses are in.
- **The Brown resolution** (Layer 4 item 5): single cell attachments, uniqueness of semi-free resolutions up to homotopy and the skeletal filtration of path chains are all in. The cell-by-cell construction of `P_B` and the `Tor` identification remain. The latter needs the DG roadmap's derived tensor product.
- **Representing chain systems for Morse trajectories** (Layer 5 items 1–2): the abstract existence theorem is ready. It needs fundamental chains rel boundary of manifolds with corners (Layer 0 item 4) and the Heegaard Floer roadmap's Lane M moduli spaces.
- **The Conley–Zehnder index and Floer moduli spaces** (Layer 7 items 1–2): the index is to come from the Heegaard Floer roadmap's F1.4. Compactness, transversality and gluing follow it.
