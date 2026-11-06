<!--tauceti-status:v1 {"roadmap":"DGFloer","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"fundamental chains rel boundary of manifolds with corners; the cubical Serre spectral sequence","state":"partial"},{"id":"Layer 1","remaining":"K(A,n), Hurewicz mod a Serre class, exact fibration sequence, Serre spectral sequence E2, Diff(M) evaluation bundle, degrees of explicit maps","state":"partial"},{"id":"Layer 2","remaining":"locally trivial bundles over paracompact bases as Hurewicz fibrations; loop spaces of fibrations on the Moore model","state":"partial"},{"id":"Layer 3","remaining":"basepoint change as a derived tensor product with the path bimodule, and its equivalence","state":"partial"},{"id":"Layer 4","remaining":"Brown universal cocycle over arbitrary CW complexes and the Tor identification","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"Proposition 6.3 as one theorem, exact magnetic forms on T*Q, the Liouville-flow proof of Corollary E","state":"partial"},{"id":"Layer 7","remaining":"Conley-Zehnder index, compactness, transversality and gluing, orientations, the Floer complex, symplectic homology","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"Theorems L and M, the cotangent criterion, Propositions 5.11 and 5.13, Theorems A-C","state":"partial"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"4949c2d897f8dda21e7410798932406279da43f08f61f5528094bcdc7e64bd91","roadmap":"DGFloer","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: DGFloer

This file documents the status of the DGFloer roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-purpose foundation (Layers 0–4) is far along but no layer of it is complete. Layer 6 now has something in every item, and Layer 7 has its first milestone, the Floer energy identity. Layer 10 has one milestone; Layers 5, 8, 9 and 11 have not begun.

### Named results

- **The cubical–simplicial comparison** — normalized cubical singular chains are naturally chain homotopy equivalent to simplicial ones, so [cubical homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/Comparison/Basic.html#TauCeti.singularCubicalHomologyNatIso), also [with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Cubical/LocalCoefficients/Comparison/Homotopy.html#TauCeti.LocalCoefficientSystem.twistedCubicalSingularHomotopyEquiv).
- **CW approximation** — every space receives a [weak homotopy equivalence from a CW complex](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Sigma.html#TauCeti.isWeakHomotopyEquivalence_sigmaCWApproximationMap), [natural up to homotopy](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Sigma.html#TauCeti.comp_sigmaCWApproximationLift_homotopic) (Hatcher 4.13 and 4.18), and [weak equivalences induce isomorphisms on homology with local coefficients](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.html#ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap).
- **Lemma 3.41 of Barraud–Damian–Humilière–Oancea** — [a path-connected space is aspherical exactly when its double loop space has the homology of a point](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.html#TauCeti.MooreLoopSpace.isAspherical_iff_double_singularHomology).
- **The Floer energy identity** — for a weakly exact symplectic form, [the energy of a Floer cylinder is the drop in the contractible action](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/CylinderAction.html#TauCeti.SmoothTwoForm.IsNondegenerate.integral_floerEnergyDensity_eq_contractibleLoopAction_sub), so the action decreases along Floer cylinders.
- **The cotangent bundle completes the codisc bundle** — for compact Riemannian `M` without boundary, [`D*M` is a Liouville domain](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Domain.html#TauCeti.CotangentBundle.isLiouvilleDomain_codiscBundle) for `ω_can` and `−λ_can`, and [`T*M` is its completion](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Domain.html#TauCeti.CotangentBundle.isLiouvilleCompletion_codiscBundle) under the flow `p ↦ eᵗp`.

### Notable definitions and infrastructure

- **The chain algebra of Moore loops** [`loopChainAlgebra`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/LoopAlgebra.html#TauCeti.loopChainAlgebra): strict Moore concatenation and the strictly associative cubical cross product make `C_*(Ω_b B)` a DG algebra with no Eilenberg–Zilber correction, so DG local systems, including [that of a map](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/DGLocalSystem/Fibration.html#TauCeti.fibrationLocalSystem), are simply right modules over it.
- **Liouville completions** [`IsLiouvilleCompletion`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Liouville/Completion.html#TauCeti.IsLiouvilleCompletion): an ambient manifold whose complete Liouville flow carries every point into the domain. Its radial coordinate defines [Hamiltonians linear at infinity](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Liouville/LinearAtInfinity.html#TauCeti.IsLinearAtInfinity), and symplectic homology will be a limit over their slopes.
- **The π₁-sensitive Hofer–Zehnder capacity** [`contractibleHZCapacity`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.html#TauCeti.SmoothTwoForm.contractibleHZCapacity), with its [relative version](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Capacity/Relative.html#TauCeti.SmoothTwoForm.relContractibleHZCapacity): the quantity Theorems L and M bound to deduce almost existence.

### Roadmap coverage

Layers 0–4, 6, 7 and 10 are partial; Layers 5, 8, 9 and 11 are untouched.

- **Layer 0** has items 1–3 but not the cubical Serre spectral sequence; fundamental chains rel boundary (item 4) have not started.
- **Layer 1** has Hurewicz in degree one, natural CW approximation, the fibration boundary map (without exactness), the skeletal-filtration spectral sequence over any CW base, some Serre-class axioms, the Pontryagin–Thom collapse, and Stiefel manifolds. It lacks `K(A, n)`, Hurewicz modulo a class, the `Diff(M)` evaluation bundle and the degree computations.
- **Layer 2** lacks bundles over paracompact bases as Hurewicz fibrations, and `Ω` of a fibration on the Moore model; relative lifting for NDR pairs is in.
- **Layer 3** lacks only derived basepoint change. **Layer 4** lacks only the Brown cocycle; [homologous cocycles give homotopy-equivalent complexes](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DG/Twisted/Equivalence.html#TauCeti.Homologous.homotopyEquiv), and cocycles, continuation and the index spectral sequence now also work over arbitrary generator sets.
- **Layer 6** has flows, periodic orbits and the action functional on manifolds, completions and exact embeddings, the cotangent Liouville domain, characteristic foliations and capacities. Missing: exact magnetic forms, the Liouville-flow proof of Corollary E, and Proposition 6.3 assembled as one theorem.
- **Layer 7** has the energy identity of item 1 only. **Layer 10** has Lemma 3.41 only.

## The frontier

- **Proposition 6.3** (Layer 6 item 5): the monotonicity step and dense existence under finite capacity are proved; what remains is "finite `c°_HZ(W)` implies contractible almost existence".
- **The Conley–Zehnder index and Floer moduli spaces** (Layer 7 items 1–2): the index is to come from the Heegaard Floer roadmap's F1.4; compactness, transversality for generic `J` and gluing follow it.
- **The Brown cocycle** (Layer 4 item 5): twisted complexes over arbitrary generator sets, with attachment along cycles and a convergent index spectral sequence, are ready; the identification with `Tor` needs the DG roadmap's derived tensor product.
- **The Serre spectral sequence over any base** (Layer 1): with natural CW approximation and the skeletal filtration converging, the second page must still be identified with homology of the base with fibre-homology coefficients, and the fibration sequence shown exact.
- **Fundamental chains rel boundary** (Layer 0 item 4): the prerequisite for representing chain systems, and so for DG Morse homology.
