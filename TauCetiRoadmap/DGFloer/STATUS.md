<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4","ts":"2026-11-24T09:13:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"cubical fundamental chains rel boundary of manifolds with corners","state":"partial"},{"id":"Layer 1","remaining":"the Serre E2 identification and its cubical transport, the Pontryagin-Thom shriek and fundamental-class interfaces","state":"partial"},{"id":"Layer 2","remaining":"loop maps of Hurewicz fibrations on positive-duration Moore loops","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"cellular and basepoint-change comparisons of Brown's cocycle, the twisted-complex comparison, disconnected CW complexes","state":"partial"},{"id":"Layer 5","remaining":"Morse trajectory spaces and their representing chains, independence of choices, DG Morse homology, the fibration theorem, free loops","state":"partial"},{"id":"Layer 6","remaining":"the completion of an abstract Liouville domain and Corollary E's graph construction","state":"partial"},{"id":"Layer 7","remaining":"Conley-Zehnder index, compactness, transversality and gluing, orientations, the Floer complex, symplectic homology, branches 7.C, 7.G, 7.T","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"the w2 sign and eta0, the canonical grading, classical Viterbo with local coefficients, Theorem K","state":"partial"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, the rest of Proposition 5.11, Proposition 5.13, Theorems A and C, Corollaries D and E","state":"partial"},{"id":"Layer 11","remaining":"the finite cover T x K to G and the torus criterion","state":"partial"}],"readme_sha":"de1223262deeac32c5823a4710c588791332570d3cd6cd0ca3ed628f050b2040","roadmap":"DGFloer","to_sha":"5b5d5152e4ad63b4ce6da9c1ba84c74226026aa4"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `5b5d515` (2026-11-24T09:13:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 3 is complete. Layer 4's Brown resolution now exists for every CW complex but lacks its comparisons, and Layers 0–2 are far along. The rewritten README gives Layer 6 new items, so it is no longer complete, and Layer 11 is now only the Lie group torus criterion. Layers 5, 7, 9 and 10 have isolated pieces, and Layer 8 has not begun.

### Named results

- **Basepoint change is a derived equivalence**: for points joined by a path, [tensoring with the Moore path chains in each direction gives inverse equivalences of derived categories](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Path/Equivalence.html#TauCeti.tensorPathChainLocalizedEquivalence).
- **Brown's semi-free model**: [the chains on the based path space of any CW complex have a semi-free model over the loop chains with one generator per cell](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Path/SemifreeModel.html#TauCeti.exists_semifreeModel_pathFromChain). It is unique up to homotopy and computes `− ⊗^𝐋 A`.
- **Mod-two vanishing** (Serre): [a simply connected space with the mod-2 homology of a point has uniquely 2-divisible homotopy groups](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/ModTwoVanishing.html#TauCeti.isUniquelyTwoDivisible_homotopyGroup_of_subsingleton_singularHomology), with no finiteness hypothesis.
- **Proposition 6.3** (Hofer–Zehnder, Struwe): [a finite `π₁`-sensitive capacity gives contractible almost existence on regular levels](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Capacity/AlmostExistence.html#TauCeti.SmoothTwoForm.IsNondegenerate.hasContractibleAlmostExistence_of_contractibleHZCapacity_ne_top).
- **Cartan three-form detection**: [a homomorphism from a compact 3-dimensional Lie group on which the pulled-back Cartan form is nonzero is not null-homotopic](https://taucetiproject.org/docs/TauCeti/Geometry/Lie/CartanThreeForm.html#ContMDiffMonoidMorphism.not_nullhomotopic_of_lie_eq_of_apply_ne_zero). This is the core of Layer 11 item 2.

### Notable definitions and infrastructure

- **Brown models** [`BrownModel`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Path/BrownModel.html#TauCeti.BrownModel): a semi-free twisting cocycle with a quasi-isomorphism to the based path chains. This is the object Layer 5's derived-coefficient comparisons consume.
- **Twisting chain systems** [`TwistingChainSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/MonoidAlgebra/TwistingChainSystem.html#TauCeti.TwistingChainSystem): chains on abstract moduli spaces satisfying the twisting equation. They exist and are unique up to homotopy once fundamental chains are supplied.
- **The orientation twist on free loops** [`freeLoopOrientationTwist`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Orientation/Twist.html#TauCeti.VectorBundleOrientationCover.freeLoopOrientationTwist): the factor `ev₀^*(o⁻¹) ⊗ ev₀^*(o^{−w})` of the Viterbo twist `η₀`.

### Roadmap coverage

Layer 3 is done and Layer 8 is untouched. The rest are partial:

- **Layer 0** lacks cubical fundamental chains rel boundary for manifolds with corners.
- **Layer 1** has the degree-one Hurewicz isomorphism, mod-two vanishing, the `Diff(M)` evaluation bundle and the cubical Serre sequence up to its first page. It lacks the `E²` identification and its cubical transport, and the Pontryagin–Thom shriek interfaces.
- **Layer 2** lacks the loop maps of Hurewicz fibrations on positive-duration Moore loops.
- **Layer 4** has Brown's model for every CW complex, its uniqueness and its derived tensor product. It lacks the cellular and basepoint-change comparisons of Brown's cocycle and the disconnected case.
- **Layer 5** has abstract representing, continuation and parametrized chain systems, but no Morse trajectory spaces.
- **Layer 6** has Proposition 6.3 and the contact-type step. It lacks the completion of an abstract Liouville domain and the graph construction for Corollary E.
- **Layer 7** has the energy identity, the action functional and PSS data. It has no moduli spaces or Floer complex, and none of the new 7.C, 7.G and 7.T branches.
- **Layer 9** has only the orientation factor of `η₀`.
- **Layer 10** has the degree-zero case of Proposition 5.11.
- **Layer 11** has Weyl's theorem, the Cartan detection theorem and the [aspherical-quotient criterion](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/EilenbergMacLane/ClosedManifold.html#Subgroup.isAspherical_quotient_iff_subsingleton) for `(A × K)/Γ`. It lacks the finite cover itself. The earlier Layer 11 results on spheres and abundance belong to the sequel roadmap under the new README.

## The frontier

- **The torus criterion** (Layer 11 items 1 and 3): the criterion for `(A × K)/Γ` with `K` a compact simply connected manifold is in, so what remains is writing `G` as `(ℝʳ × K)/Γ` with `K` compact and simply connected, then the statement `isAspherical_iff_exists_continuousMulEquiv_torus`.
- **Brown's cocycle comparisons** (Layer 4): the model exists for every CW complex. Its cellular and basepoint-change comparisons, the comparison with the twisted complex and the disconnected case remain.
- **The Viterbo twist `η₀`** (Layer 9 item 1): the orientation factor is in. The sign `σ` from `w₂` waits on CharacteristicClasses.
- **The Serre `E²` page** (Layer 1 item 2): the identification is now an AlgebraicTopology supplier target, and the cubical transport from `E²` on waits on it.
- **Fundamental chains rel boundary** (Layer 0): they are the one missing input for representing chain systems of Morse trajectories (Layer 5), together with HeegaardFloer's Lane M moduli spaces.
