<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"fundamental chains rel boundary of manifolds with corners; the cubical Serre spectral sequence","state":"partial"},{"id":"Layer 1","remaining":"natural CW approximation, Serre spectral sequence over any base, K(A,n), Hurewicz mod a Serre class, Pontryagin-Thom, Diff(M), Stiefel, degrees","state":"partial"},{"id":"Layer 2","remaining":"locally trivial bundles over paracompact bases as Hurewicz fibrations; loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change as a derived tensor product with the path bimodule, and its equivalence","state":"partial"},{"id":"Layer 4","remaining":"Brown universal cocycle and the Tor identification","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"flows and periodic orbits on manifolds, action functional, Liouville completions, characteristic foliations, capacities","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, Propositions 5.11 and 5.13, Theorems A-C","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"a67033c8f1babc2c30beef6697134cce32e464c0150b5b19c02748b7de11ee74","roadmap":"DGFloer","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-purpose foundation (Layers 0–4) is far along, and Layer 4 lacks only the Brown universal cocycle, but no layer is complete. Layer 6 now has Liouville domains and the unit codisc bundle as one, and Layer 10 has its first milestone. The Morse and Floer layers (5 and 7–9) and Layer 11 have not begun.

### Named results

- **The cubical–simplicial comparison** — normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso), also for relative chains and [with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/LocalCoefficients/Comparison/Homotopy.html#TauCeti.LocalCoefficientSystem.twistedCubicalSingularHomotopyEquiv).
- **CW approximation** — every path-connected space receives a [weak homotopy equivalence from a CW complex](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Basic.html#TauCeti.isWeakHomotopyEquivalence_cwApproximationMap), and [weak equivalences induce isomorphisms on homology with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.html#ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap).
- **Lemma 3.41 of Barraud–Damian–Humilière–Oancea** — [a path-connected space is aspherical exactly when its double loop space has the homology of a point](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.html#TauCeti.MooreLoopSpace.isAspherical_iff_double_singularHomology), for both the Moore and fixed-interval loop models.
- **Invariance of the twisted complex** — [homologous twisting cocycles give homotopy-equivalent twisted complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/Equivalence.html#TauCeti.Homologous.homotopyEquiv), the algebraic form of "independent of choices" that Layers 5 and 8 will use; the [second page of the index spectral sequence](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/SpectralSequence/E2.html#TauCeti.TwistingCocycle.indexSpectralSequenceSecondPageXIso) is the homology of the classical complex.
- **The unit codisc bundle is a Liouville domain** — for compact Riemannian `M` without boundary, [`D*M` is a Liouville domain in `T*M`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Domain.html#TauCeti.CotangentBundle.isLiouvilleDomain_codiscBundle) for `ω_can` and primitive `−λ_can`, with Liouville field `p ∂_p` pointing outwards along `S*M`.

### Notable definitions and infrastructure

- **The chain algebra of Moore loops** [`loopChainAlgebra`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/LoopAlgebra.html#TauCeti.loopChainAlgebra): strict Moore concatenation and the strictly associative cubical cross product make `C_*(Ω_b B)` a DG algebra with no Eilenberg–Zilber correction, so DG local systems are simply right modules over it.
- **The DG local system of a map** [`fibrationLocalSystem`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Fibration.html#TauCeti.fibrationLocalSystem): built from the strict loop action on the fibre of the Moore-path replacement, with no lifting function. It is the coefficient system the fibration theorem of Layer 5 will consume.
- **Liouville domains** [`IsLiouvilleDomain`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Liouville/Domain.html#TauCeti.IsLiouvilleDomain): a compact sublevel set of an exact symplectic manifold whose Liouville field crosses the level outwards, with [boundary of restricted contact type](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Liouville/Domain.html#TauCeti.IsLiouvilleDomain.exists_isRestrictedContactType). It is the object symplectic homology in Layers 7–9 is defined on.

### Roadmap coverage

Layers 0–4, 6 and 10 are partial; Layers 5, 7, 8, 9 and 11 are untouched.

- **Layer 0** has items 1–3 except the cubical Serre spectral sequence; fundamental chains rel boundary (item 4) have not started.
- **Layer 1** has Hurewicz in degree one, CW approximation for path-connected spaces (not shown natural), invariance under weak equivalences with local coefficients, the filtered spectral sequence, the torsion Serre classes, and `CPᵈ`, `HPᵈ` as manifolds. It lacks `K(A, n)`, Hurewicz modulo a class, Pontryagin–Thom, `Diff(M) → M`, Stiefel manifolds, `G/H` and the degree computations.
- **Layer 2** lacks bundles over paracompact bases as Hurewicz fibrations, and `Ω` of a fibration on the Moore model.
- **Layer 3** has items 1–4 except derived basepoint change; **Layer 4** is done except the Brown cocycle.
- **Layer 6** has Hamiltonian flows and periodic orbits on Banach spaces (global Lipschitz), Liouville domains, and on cotangent bundles the Liouville field, `S*M` of restricted contact type and `D*M` a Liouville domain. Completions, the action functional, characteristic foliations and capacities are missing.
- **Layer 10** has Lemma 3.41 only.

## The frontier

- **Liouville completions** (Layer 6 item 2): attach the cylindrical end to a Liouville domain and define Hamiltonians linear at infinity and exact codimension-zero embeddings; symplectic homology needs all three.
- **Flows and the action functional on manifolds** (Layer 6 item 1): move time-dependent flows and 1-periodic orbits from Banach spaces to manifolds, then define the action functional on contractible or all loops.
- **The Brown cocycle** (Layer 4 item 5): identify the twisted homology of the universal cocycle of a CW structure with `Tor^{C_*(ΩB)}(𝓕, A)`. This needs the DG roadmap's derived tensor product.
- **Fundamental chains rel boundary** (Layer 0 item 4): the chain-level input to every representing chain system, and so the gate to DG Morse homology.
- **The Serre spectral sequence over any path-connected base** (Layer 1 item 2): a cubical Serre spectral sequence (Layer 0) comes first, and CW approximation still needs naturality up to homotopy.
