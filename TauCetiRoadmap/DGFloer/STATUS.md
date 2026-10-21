<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"fundamental chains rel boundary of manifolds with corners; the cubical Serre spectral sequence","state":"partial"},{"id":"Layer 1","remaining":"CW approximation, Eilenberg-MacLane spaces, Hurewicz mod a Serre class, Pontryagin-Thom, Diff(M) local triviality, Stiefel manifolds, degrees","state":"partial"},{"id":"Layer 2","remaining":"locally trivial bundles over paracompact bases as Hurewicz fibrations; loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change as a derived tensor product with the path bimodule, and its equivalence","state":"partial"},{"id":"Layer 4","remaining":"E2 page as classical local-coefficient homology; Brown universal cocycle and Tor","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"flows on manifolds, periodic orbits, action functional, Liouville domains, cotangent bundles of manifolds, capacities","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"fdb44314ab93d6179bbcf6372f125c22d3c3a5c292f5b3ea7b2da796aed13add","roadmap":"DGFloer","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-purpose foundation is far along. Cubical chains, path spaces, DG local systems and the algebra of twisting cocycles each have most of their milestones, but no layer is complete. Every Morse- and Floer-theoretic layer (5 and 7–11) has not begun, and Layer 6 has only linear-algebra preliminaries.

### Named results

- **The cubical–simplicial comparison**: normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso), relative chains and local coefficients included. This is the single bridge through which every homological input reaches the roadmap.
- **The cubical Eilenberg–Zilber and Künneth theorems**: the strictly associative cubical cross product is a [quasi-isomorphism](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Kunneth.html#TauCeti.quasiIso_cubicalCrossProduct), agrees with the simplicial one up to a natural homotopy, and gives the [Künneth theorem](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Kunneth.html#TauCeti.isIso_cubicalHomologyKunneth).
- **Hurewicz in degree one**: for a path-connected space, [π₁(X)ᵃᵇ ≅ H₁(X; ℤ)](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.html#TauCeti.HurewiczOne.hurewiczAddEquiv) naturally. Applied to loop spaces it gives [H₁(Ω²S³) ≅ ℤ](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.html#TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv), the input to Proposition 5.11.
- **Classical local systems as DG local systems**: [classical local systems are equivalent to the DG local systems concentrated in degree zero](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Classical/EssImage.html#TauCeti.classicalDGLocalSystemEquivalence), through the degree-zero map from loop chains to the group ring.
- **Invariance of the twisted complex**: [homologous twisting cocycles give homotopy-equivalent twisted complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/Equivalence.html#TauCeti.Homologous.homotopyEquiv), through specified continuation and parametrized cocycles. This is the algebraic form of "independent of choices" that Layers 5 and 8 will use.

### Notable definitions and infrastructure

- **The chain algebra of Moore loops** [`loopChainAlgebra`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/LoopAlgebra.html#TauCeti.loopChainAlgebra): because Moore concatenation is strict and the cubical cross product is strictly associative, `C_*(Ω_b B)` is a DG algebra without any Eilenberg–Zilber correction. DG local systems are right modules over it.
- **The DG local system of a map** [`fibrationLocalSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Fibration.html#TauCeti.fibrationLocalSystem): it is built from the strict loop action on the fibre of the Moore-path replacement, so it needs no lifting function. Two transitive lifting functions are compared by a [zigzag of quasi-isomorphisms](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Transport.html#TauCeti.liftingLocalSystemRoof).
- **The spectral sequence of a filtered complex**, built on Mathlib's spectral objects, with naturality and a [comparison theorem](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/SpectralSequence/Filtered/Comparison.html#CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page). It carries the index spectral sequence of twisted complexes and its continuation morphisms.

### Roadmap coverage

Layers 0–4 are all partial.

- **Layer 0** has items 1–3: chains, the cross product, and the comparison with its consequences, apart from a cubical Serre spectral sequence. Fundamental chains (item 4) are missing.
- **Layer 1** has Hurewicz in degree one, the homology invariance of weak equivalences (constant coefficients) and the filtered spectral sequence, whose strong convergence is proved only for finite filtrations. It also has the torsion and power-torsion Serre classes with their Tor and tensor axioms, the first step of the mod-2 vanishing argument, `CPᵈ` and `HPᵈ` as manifolds, and the quaternionic frames on spheres. It lacks CW approximation, Eilenberg–MacLane uniqueness, Hurewicz modulo a class, Pontryagin–Thom, local triviality of `Diff(M) → M`, Stiefel manifolds and the degree computations.
- **Layer 2** has Moore paths and free loops, Hurewicz fibrations and the Moore-path replacement, endpoint and restriction fibrations, the sphere mapping-space homeomorphisms, `G × Ω²G`, and the degree-raising map. I could not find bundles over paracompact bases as Hurewicz fibrations, and Ω of a fibration is proved only for fixed-interval loops.
- **Layer 3** has items 1–4 except derived basepoint change. The path bimodule exists, but the derived equivalence does not.
- **Layer 4** has items 1–3, the index filtration and its spectral sequence. The `E²` identification with the classical complex and the Brown-cocycle Tor computation are missing.
- **Layer 6** has time-dependent Hamiltonian flows on symplectic vector spaces (global Lipschitz hypothesis), magnetic translations and Liouville fields on the linear cotangent space.
- **Layers 5 and 7–11** are untouched.

## The frontier

- **Fundamental chains rel boundary** (Layer 0 item 4): the chain-level input of every representing chain system, and the gate to DG Morse homology.
- **Basepoint change** (Layer 3 item 1): the derived tensor product with the existing path bimodule, and the proof that it is an equivalence. This needs the DG roadmap's derived tensor product.
- **The `E²` page and the Brown cocycle** (Layer 4 items 4–5): identify the second page of the index spectral sequence with classical local-coefficient homology, and the twisted homology of the universal cocycle with `Tor`.
- **CW approximation and the mod-2 vanishing theorem** (Layer 1 items 2 and 4): extend the first unique-2-divisibility step to the full induction through Eilenberg–MacLane spaces and connected covers.
- **Time-dependent flows on manifolds and cotangent bundles** (Layer 6 items 1–3): move from symplectic vector spaces to manifolds, then 1-periodic orbits, action functionals and Liouville domains.
