<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"fundamental chains rel boundary of manifolds with corners; the cubical Serre spectral sequence","state":"partial"},{"id":"Layer 1","remaining":"natural CW approximation, Serre spectral sequence over any base, K(A,n), Hurewicz mod a Serre class, Pontryagin-Thom, Diff(M), Stiefel, degrees","state":"partial"},{"id":"Layer 2","remaining":"locally trivial bundles over paracompact bases as Hurewicz fibrations; loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change as a derived tensor product with the path bimodule, and its equivalence","state":"partial"},{"id":"Layer 4","remaining":"Brown universal cocycle and the Tor identification","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"flows and periodic orbits on manifolds, action functional, Liouville domains and completions, characteristic foliations, capacities","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, Propositions 5.11 and 5.13, Theorems A-C","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"fdb44314ab93d6179bbcf6372f125c22d3c3a5c292f5b3ea7b2da796aed13add","roadmap":"DGFloer","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-purpose foundation (Layers 0–4) is far along, and Layer 4 lacks only the Brown universal cocycle, but no layer is complete. Layer 6 now reaches cotangent bundles of manifolds, and Layer 10 has its first milestone. The Morse and Floer layers (5 and 7–9) and Layer 11 have not begun.

### Named results

- **The cubical–simplicial comparison** — normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso). The equivalence extends to relative chains and to [chains with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/LocalCoefficients/Comparison/Homotopy.html#TauCeti.LocalCoefficientSystem.twistedCubicalSingularHomotopyEquiv), and every homological input reaches the roadmap through it.
- **CW approximation** — every path-connected space receives a [weak homotopy equivalence from a CW complex](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Basic.html#TauCeti.isWeakHomotopyEquivalence_cwApproximationMap), and [weak equivalences induce isomorphisms on homology with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.html#ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap).
- **Lemma 3.41 of Barraud–Damian–Humilière–Oancea** — [a path-connected space is aspherical exactly when its double loop space has the homology of a point](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.html#TauCeti.MooreLoopSpace.isAspherical_iff_double_singularHomology). It holds for the Moore and fixed-interval models, and asphericity is [equivalent to being a `K(π₁, 1)`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.html#TauCeti.isEilenbergMacLaneSpaceOne_fundamentalGroup_iff).
- **Invariance of the twisted complex** — [homologous twisting cocycles give homotopy-equivalent twisted complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/Equivalence.html#TauCeti.Homologous.homotopyEquiv), through specified continuation and parametrized cocycles. This is the algebraic form of "independent of choices" that Layers 5 and 8 will use.
- **The `E²` page of the index spectral sequence** — [the second page is the homology of the classical complex](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/SpectralSequence/E2.html#TauCeti.TwistingCocycle.indexSpectralSequenceSecondPageXIso), built from `H(𝓕)` and the degree-zero entries of the cocycle (BDHO, Definition 3.38).

### Notable definitions and infrastructure

- **The chain algebra of Moore loops** [`loopChainAlgebra`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/LoopAlgebra.html#TauCeti.loopChainAlgebra): strict Moore concatenation and the strictly associative cubical cross product make `C_*(Ω_b B)` a DG algebra with no Eilenberg–Zilber correction. DG local systems are right modules over it, and their homology carries [a representation of `π₁`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Homology.html#TauCeti.IsDGRightModule.cohomologyRepresentation).
- **The DG local system of a map** [`fibrationLocalSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Fibration.html#TauCeti.fibrationLocalSystem): it is built from the strict loop action on the fibre of the Moore-path replacement, so it needs no lifting function. It is the coefficient system the fibration theorem of Layer 5 will consume.
- **The unit cosphere bundle** [`cosphereBundle`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Codisc.html#TauCeti.CotangentBundle.cosphereBundle): a compact smooth hypersurface of `T*M` for compact Riemannian `M`, and [of restricted contact type](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/ContactType.html#TauCeti.CotangentBundle.isRestrictedContactType_cosphereBundle) with Liouville field `p ∂_p`. This is the hypersurface on which the cotangent theorems are stated.

### Roadmap coverage

Layers 0–4, 6 and 10 are partial. Layers 5, 7, 8, 9 and 11 are untouched.

- **Layer 0** has items 1–3 except the cubical Serre spectral sequence. Fundamental chains rel boundary (item 4) have not started.
- **Layer 1** has Hurewicz in degree one, CW approximation for path-connected spaces (not shown natural), invariance under weak equivalences with local coefficients, and the filtered spectral sequence (strong convergence only for finite filtrations). It also has the two Serre classes, the first mod-2 step, `CPᵈ` and `HPᵈ` as manifolds, and analytic quaternionic frames. It lacks Eilenberg–MacLane spaces `K(A, n)`, Hurewicz modulo a class, Pontryagin–Thom, `Diff(M) → M`, Stiefel manifolds, `G/H` and the degree computations.
- **Layer 2** lacks bundles over paracompact bases as Hurewicz fibrations, and `Ω` of a fibration on the Moore model.
- **Layer 3** has items 1–4, now including `H(𝓕 ⊗ L) ≅ H(𝓕) ⊗ L`, except derived basepoint change.
- **Layer 4** is done except the Brown cocycle (item 5).
- **Layer 6** has Hamiltonian flows and periodic orbits on Banach spaces (global Lipschitz), and on cotangent bundles of manifolds the Liouville field, the codisc and cosphere bundles, and contact type.
- **Layer 10** has Lemma 3.41 only.

## The frontier

- **The Brown cocycle** (Layer 4 item 5): identify the twisted homology of the universal cocycle of a CW structure with `Tor^{C_*(ΩB)}(𝓕, A)`. This needs the DG roadmap's derived tensor product.
- **Fundamental chains rel boundary** (Layer 0 item 4): the chain-level input to every representing chain system, and so the gate to DG Morse homology.
- **The Serre spectral sequence over any path-connected base** (Layer 1 item 2): pull back along the new CW approximation. A cubical Serre spectral sequence (Layer 0) has to come first, and the approximation still needs naturality up to homotopy.
- **Basepoint change** (Layer 3 item 1): take the derived tensor product with the existing path bimodule and prove that it is an equivalence. This also waits on the DG roadmap's derived tensor product.
- **Liouville domains and the action functional** (Layer 6 items 1–2): define Liouville domains and their completions, so that `D*M` becomes one, and move time-dependent flows and 1-periodic orbits from Banach spaces to manifolds.
