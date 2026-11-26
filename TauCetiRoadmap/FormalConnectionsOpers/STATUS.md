<!--tauceti-status:v1 {"roadmap":"FormalConnectionsOpers","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the ! tensor completion; relative Tate modules, lattices, completed base change and faithfully flat descent (section 1.3)","state":"partial"},{"id":"Layer 2","remaining":"form and vector-field connections, differential operators and principal parts, the flatness criterion, analytification on fixed models","state":"partial"},{"id":"Layer 3","remaining":"exp_N and log_N; ind-affine colimit and module descent over R((t)); Lie(LG); the gauge groupoid and Loc_G","state":"partial"},{"id":"Layer 3A","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"the Frenkel-Zhu oper reduction theorem; GL_n flag/oper equivalence and lattice estimate; sections 6.3 to 6.5","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"a71749f6b4ce721f81a70d40b3d943ff4a498590c3f14f240b6d71fec10f8606","roadmap":"FormalConnectionsOpers","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: FormalConnectionsOpers

This file documents the status of the FormalConnectionsOpers roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two of the roadmap's main theorems are proved: the regular horizontal trivialization of pole-free formal connections, and the cyclic-vector theorem. Formal loop groups and the gauge action are partly built. Layers 1, 2, 3 and 6 are partial. Nothing has landed for polynomial loops, opers, the Drinfeld–Sokolov normal form, the Poisson structure or the isomonodromy groupoid (Layers 3A, 4, 5, 7 and 8).

### Named results

- **Regular connections are determined by their fibre at the origin** — over a `ℚ`-algebra `R`, possibly nonreduced, taking the constant term is a bijection from the gauge transformations in `GL_n(R[[t]])` carrying `d + A dt` to `d + B dt` onto `GL_n(R)`. This is the README's first main theorem in exactly its matrix form (`PowerSeries.matrixGauge_constantCoeff_bijective`).
- **The cyclic-vector theorem** — over a differential field of characteristic zero with nonzero derivation, every finite-dimensional differential module has a cyclic vector ([`exists_cyclicVector`](https://taucetiproject.org/docs/TauCeti/RingTheory/Derivation/CyclicVector.html#TauCeti.exists_cyclicVector)). The library also has Katz's explicit candidates and the determinant polynomial that controls when they are cyclic.
- **The positive loop group is the limit of its jet groups** — `G(R[[t]])` is the group of compatible sequences of points of `G(R[t]/tᴺ)`, naturally in `R` ([`positiveLoopJetLimitMulEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/LoopGroup/Jet.html#TauCeti.HopfAlgebra.positiveLoopJetLimitMulEquiv)). For formally smooth `G`, `L⁺G/K_N` is the group of `N`-jets ([`quotientCongruenceSubgroupHom_span_X_pow_bijective`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/LoopGroup/Basic.html#TauCeti.HopfAlgebra.quotientCongruenceSubgroupHom_span_X_pow_bijective)).
- **Coefficient descent for loops** — along a faithfully flat `R → S`, loops over `R` are exactly the loops over `S` whose two pullbacks to `S ⊗_R S` agree ([`loopFaithfullyFlatDescentMulEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/LoopGroup/Descent.html#TauCeti.HopfAlgebra.loopFaithfullyFlatDescentMulEquiv)).

### Notable definitions and infrastructure

- **The intrinsic gauge action** ([`pointGauge`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Tangent/Gauge.html#Derivation.pointGauge)) — `Ad(g)A − dlog g` for points of any affine group along any derivation. It is a left action, `dlog` is a crossed homomorphism, and its stabilizer of the trivial connection is the group of horizontal points. This is the carrier on which the gauge groupoid and the oper normal form will be stated.
- **Pole-bounded pieces of the loop group** ([`poleBoundedEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/LoopGroup/PoleBounded/Representable.html#TauCeti.HopfAlgebra.poleBoundedEquiv)) — for a generating family of the coordinate ring, bounding the poles of a loop and of its inverse gives an affine subfunctor. This is the first step of the ind-affine presentation.
- **Formal coordinate substitution over any commutative ring** ([`substAlgEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Substitution/Coordinate.html#TauCeti.LaurentSeries.substAlgEquiv)) — it satisfies the chain rule and preserves the residue, and coordinate changes act on loop groups.

### Roadmap coverage

Layer 1 is partial: relative substitution, the chain rule and residue invariance are in place, but the `!` tensor completion and all of §1.3 (relative Tate modules, completed base change and Drinfeld's descent) have not been established. Layer 2 is partial: the first main theorem and the matrix gauge calculus are proved, while the form connection API, differential operators and principal parts, the flatness criterion and the analytification comparison of §2.4 are not established here. Layer 3 is partial: §3.1 is done apart from `exp_N`/`log_N`, §3.2 has the affine pieces and descent for loops, and §3.3 has the gauge action. Missing are the colimit presentation and its independence of embedding, module descent over `R((t))`, `Lie(LG) = 𝔤((t))`, and the gauge groupoid and `Loc_G(D×)` of §3.4. Layer 6 is partial: only the cyclic-vector part of §6.2 is done. Layers 3A, 4, 5, 7 and 8 are untouched.

## The frontier

- **The gauge groupoid (§3.4)** — the action groupoid of `pointGauge` with base change, its stackification `Loc_G(D×)`, and stabilizers as horizontal automorphisms. The action, cocycle and stabilizer lemmas are already there.
- **Ind-affine `LG` (§3.2)** — the colimit of the pole-bounded pieces and its independence of the generating family, then descent of finite projective `R((t))`-modules. This needs §1.3's Tate-module descent.
- **Congruence exponentials (§3.1)** — `exp_N : (tᴺ𝔤_R[[t]], BCH) ≃* K_N(R)` in characteristic zero, with its inverse and the finite-jet version.
- **The `GL_n` flag/oper equivalence and lattice estimate (§6.2)** — the next step after the cyclic-vector theorem. The full oper structure needs the intrinsic opers of Layer 4.
- **Polynomial loop factorization (Layer 3A)** — `G(R((t))) = G(R[t, t⁻¹])·G(R[[t]])`, stated in `Suggested.lean`. Nothing toward it has landed.
