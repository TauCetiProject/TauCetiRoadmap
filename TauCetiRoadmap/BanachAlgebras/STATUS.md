<!--tauceti-status:v1 {"roadmap":"BanachAlgebras","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: BanachAlgebras

This file documents the status of the BanachAlgebras roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Four of the eight layers are under way and none is finished. A4 has its depth milestone, Cohen–Hewitt factorization, for left modules. A5 has the separating space and the stability lemma but none of its continuity theorems. A1 has the radical, and A2 has its Banach-valued Cauchy theory, but not the functional calculus. A3, A6, A7 and A8 have not begun.

### Named results

- **Cohen–Hewitt factorization**: over a Banach algebra with a left approximate identity bounded by C, every vector x in the essential part of a Banach left module is a·y with ‖a‖ ≤ C and y arbitrarily close to x. The action only has to be bounded, and as a consequence A·E is closed ([`ContinuousLinearMap.exists_apply_eq_of_mem_topologicalClosure_span`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/CohenFactorization.html#ContinuousLinearMap.exists_apply_eq_of_mem_topologicalClosure_span)).
- **Sinclair's stability lemma**: for Banach spaces linked by bounded maps Rₙ, the separating spaces of T R₁⋯Rₙ eventually stabilise. This is the gliding-hump engine behind separating ideals ([`TauCeti.eventuallyConst_separatingSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#TauCeti.eventuallyConst_separatingSpace)).
- **Continuity via the separating space**: a linear map between Banach spaces is continuous exactly when its separating space is zero ([`LinearMap.continuous_iff_separatingSpace_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#LinearMap.continuous_iff_separatingSpace_eq_bot)).
- **The radical as quasinilpotent left multiples**: in a complex Banach algebra, a lies in the Jacobson radical exactly when every product ba is quasinilpotent ([`TauCeti.Ring.mem_jacobson_iff_forall_gelfandRadius_mul_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Jacobson.html#TauCeti.Ring.mem_jacobson_iff_forall_gelfandRadius_mul_eq_zero)). A nonunital counterpart goes through the unitization.
- **The Banach-valued homology Cauchy theorem**: the integral of a holomorphic Banach-valued function over a null-homologous cycle vanishes. This is the starting point of the holomorphic calculus ([`TauCeti.Contour.Cycle.homologyCauchyTheorem`](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Cycle/HomologyCauchy.html#TauCeti.Contour.Cycle.homologyCauchyTheorem)).

### Notable definitions and infrastructure

- **The separating space** ([`LinearMap.separatingSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#LinearMap.separatingSpace)) is defined as the fibre over zero of the closed graph. Its composition, perturbation and intertwining formulas are what separating-ideal arguments consume.
- **The nonunital Jacobson radical** ([`TauCeti.nonUnitalJacobson`](https://taucetiproject.org/docs/TauCeti/RingTheory/Jacobson/NonUnital.html#TauCeti.nonUnitalJacobson)) is defined through the unitization. It agrees with the ordinary radical when a unit exists, and it fixes the meaning of "semisimple" used throughout A5.
- **The unitized module action** ([`ContinuousLinearMap.unitizationAction`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Unitization.html#ContinuousLinearMap.unitizationAction)) lets the ℓ¹ unitization act on a module over a nonunital algebra, with explicit bounds. The Cohen–Hewitt construction runs inside it.

### Roadmap coverage

**A1 is partial.** The nonunital radical, its closedness and its quasinilpotence and quasiregularity characterisations are proved, and every algebraic simple module over a unital Banach algebra has a complete norm with contractive action. Not yet done: quotients and closed-ideal constructions, primitive ideals, Rickart's theorem, the renormings and the worked examples.

**A2 is partial.** The Banach-valued homology Cauchy theorem, its derivative formulas, cycle norm bounds and the weak-holomorphy criterion are done. Not yet done: the cycle constructions around compact sets, the calculus, finite jets and Tadmor–Ritt.

**A4 is partial.** Bounded approximate identities are done: their net and finite-set forms, Dixon's left-right combination with bound C + D + CD, and convergence on the essential part. Left-module Cohen–Hewitt is done. Not yet done: the right-module and bimodule versions, dual actions, module tensor products and Arens products.

**A5 is partial.** The separating-space basics, the stability lemma and its intertwining form are proved. Not yet done: separating ideals, the structure theorem and the automatic-continuity theorems.

**A3, A6, A7 and A8 are untouched.**

## The frontier

- **Separating ideals (A5)**: show that the separating space of a surjective homomorphism, or of a module-intertwining map, is a separating ideal. The stability lemma this needs is now in place.
- **Rickart's theorem (A1)**: prove that the norm on a simple Banach module is unique up to equivalence and that module endomorphisms are scalars, via Gelfand–Mazur. The existence of a complete norm is done, in the unital case.
- **Primitive ideals and the radical (A1)**: maximal modular left ideals, primitive ideals, the radical as their intersection, and semisimplicity of the quotient. A5's structure theorem depends on these.
- **Cohen–Hewitt for right modules and bimodules (A4)**: this includes pseudo-unitality of essential bimodules. The left-module construction should transfer, after which dual actions and Arens products open up.
- **Holomorphic functional calculus (A2)**: the next prerequisite is the finite-cycle and grid construction around compact subsets of open sets, which disconnected spectra require.
