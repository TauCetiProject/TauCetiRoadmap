<!--tauceti-status:v1 {"roadmap":"BanachAlgebras","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: BanachAlgebras

This file documents the status of the BanachAlgebras roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has only just begun. The opening of A5, the separating space of a linear map, is complete. A1 has a closed nonunital Jacobson radical and its quasinilpotence characterisation, but none of its other constructions. No work for A2, A3, A4, A6, A7 or A8 has been found in the library.

### Named results

- **Continuity via the separating space** — a linear map between Banach spaces is continuous exactly when its separating space is zero, which is the criterion every later automatic-continuity argument reduces to ([`LinearMap.continuous_iff_separatingSpace_eq_bot`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#LinearMap.continuous_iff_separatingSpace_eq_bot)).
- **Continuity modulo the separating space** — every such map becomes continuous after composing with the quotient by its separating space ([`LinearMap.continuous_mkQ_comp`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#LinearMap.continuous_mkQ_comp)).
- **The radical as quasinilpotent left multiples** — in a complex Banach algebra, a lies in the Jacobson radical exactly when every product ba is quasinilpotent, stated through Gelfand's formula ([`TauCeti.Ring.mem_jacobson_iff_forall_gelfandRadius_mul_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Jacobson.html#TauCeti.Ring.mem_jacobson_iff_forall_gelfandRadius_mul_eq_zero)); the nonunital version uses spectral radii in the unitization ([`TauCeti.mem_nonUnitalJacobson_iff_forall_spectralRadius_mul_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Jacobson.html#TauCeti.mem_nonUnitalJacobson_iff_forall_spectralRadius_mul_eq_zero)).
- **Closedness of the radical** — the nonunital radical of a normed algebra with summable geometric series is closed, pulled back from the ℓ¹ unitization ([`TauCeti.isClosed_nonUnitalJacobson`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Jacobson.html#TauCeti.isClosed_nonUnitalJacobson)).

### Notable definitions and infrastructure

- **The separating space** ([`LinearMap.separatingSpace`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SeparatingSpace.html#LinearMap.separatingSpace)), defined as the vertical fibre over zero of the closed graph. Its composition and perturbation formulas are what the stability lemma and separating-ideal arguments will consume.
- **The nonunital Jacobson radical** ([`TauCeti.nonUnitalJacobson`](https://taucetiproject.org/docs/TauCeti/RingTheory/Jacobson/NonUnital.html#TauCeti.nonUnitalJacobson)), a two-sided ideal defined through the external unitization and shown to agree with the ordinary radical in the unital case. This fixes the meaning of "semisimple" used in A5's theorems.

### Roadmap coverage

A5 is partial: its first paragraph is done (separating space, closedness, the continuity criterion, the quotient statement, composition and perturbation), and everything from the stability lemma onward is untouched. A1 is partial: the nonunital radical, its comparison with the unital one, closedness and the quasinilpotence and quasiregularity characterisations are proved. Its quotient and closed-ideal constructions, primitive ideals, Rickart's theorem, the renormings and the worked examples are not. A2 (holomorphic calculus, finite jets, Tadmor–Ritt), A3 (characters and examples), A4 (modules, Cohen–Hewitt, Arens products), A6 (Hochschild cohomology and amenability), A7 (group algebras and Johnson's theorem) and A8 (compact operators and Lomonosov) appear untouched.

## The frontier

- **The stability lemma (A5)** — the gliding-hump proof that the separating spaces of T R₁⋯Rₙ eventually stabilise, with the intertwining consequence. It builds directly on the separating-space API now in place.
- **Primitive ideals and the radical (A1)** — maximal modular left ideals, primitive ideals, and the radical as their intersection, with a semisimple quotient. A5's structure theorem for separating ideals needs this.
- **Rickart's theorem (A1)** — uniqueness of the Banach-module norm on a simple module and scalar endomorphisms via Gelfand–Mazur, the analytic input to the primitive-module reduction in A5.
- **Holomorphic functional calculus (A2)** — not started. The first step is extending Tau Ceti's homology Cauchy theorem to Banach-valued functions.
- **Cohen–Hewitt factorization (A4)** — not started. It needs bounded approximate identities and the module API first.
