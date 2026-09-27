<!--tauceti-status:v1 {"roadmap":"GlobalNumberFields","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: GlobalNumberFields

This file documents the status of the GlobalNumberFields roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. Its Layer 1 headline theorem, mixed-place weak approximation, is done, and Layer 0 has a normalized absolute value on each infinite completion. Everything else, from the finite side of Layer 0 through moduli, ray class groups, ideal counting, adeles, ideles, Hecke characters, infinity types, cyclotomic arithmetic, and orders, has not been started.

### Named results

- **Artin–Whaples weak approximation at mixed places** — for finite sets of finite and infinite places, the diagonal image of a number field is dense in the product of the corresponding completions; this is the load-bearing export to Global Quadratic Forms, in exactly the mixed form that roadmap requires ([`TauCeti.GlobalNumberFields.weakApproximation_denseRange`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.html#TauCeti.GlobalNumberFields.weakApproximation_denseRange)).

### Notable definitions and infrastructure

- **Normalized absolute value on an infinite completion** — the monoid-with-zero homomorphism `x ↦ ‖x‖ ^ w.mult` on `w.Completion`, giving `|x|` at a real place and `|z|²` at a complex place, continuous and vanishing only at zero; it supplies the archimedean half of the local absolute values that the product formula and the idele norm will need ([`TauCeti.GlobalNumberFields.infiniteCompletionNormalizedAbsValue`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Places/Completion.html#TauCeti.GlobalNumberFields.infiniteCompletionNormalizedAbsValue)).
- **Agreement with the global normalized value on `K`** — on the dense copy of `K` the completion value is the normalized infinite-place value, which is what lets statements about `K` transfer to the completion ([`TauCeti.GlobalNumberFields.infiniteCompletionNormalizedAbsValue_algebraMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Places/Completion.html#TauCeti.GlobalNumberFields.infiniteCompletionNormalizedAbsValue_algebraMap)).

### Roadmap coverage

- Layer 0 (places, completions, product formula): partial. The infinite-place normalized absolute value and its real and complex formulas are done. Untouched: the identification of `w.Completion` with `ℝ` or `ℂ`, the finite-place normalized absolute value and its agreement with the valuation, finiteness of the places where `|x|_v ≠ 1`, the product formula, and functoriality under extensions.
- Layer 1 (weak approximation): partial. The primary mixed-completion theorem is done. Untouched: the `Kˣ` corollaries with simultaneous finite targets and real signs, the total sign homomorphism, and its surjectivity on `Kˣ`.
- Layers 2 through 11 (moduli and ray class groups; geometry of numbers and ray-class counting; finite adeles; full adeles; strong approximation and ideles; congruence subgroups; extensions and base change; Hecke and ray class characters; infinity types and cyclotomic arithmetic; orders and Picard groups): untouched. None of the interfaces promised to Class Field Theory, L-functions, Chebotarev, Adelic Algebraic Groups, or Integral Lattices exist yet.

## The frontier

- **Finish Layer 0** — define the finite-place normalized absolute value on `v.adicCompletion K`, prove the uniformizer convention and agreement with the valuation, then prove finiteness of the support of `|x|_v ≠ 1` and transport the product formula. The finite side depends on the finite-completion dictionary consumed from Number Field Arithmetic; whether that dictionary is available is not established here.
- **Finish Layer 1** — derive the `Kˣ` corollaries of weak approximation and build the total sign homomorphism with its surjectivity on `Kˣ`, which is what Layer 2's narrow-class obstruction is phrased against. No blocker beyond the theorem already in place.
- **Layer 2, moduli and ray class carriers** — `Modulus`, `congruenceSubgroup`, `idealsPrimeTo`, `RayClassGroup`, and `idealClass` with the intrinsic triviality criterion. This is the next thing every downstream consumer needs, and it requires `idealsAway` and `integralIdealsAway` from Number Field Arithmetic.
- **Layers 4 and 5, the adelic spine** — the placewise API of Mathlib's finite adeles, discreteness of `K` and compactness of `𝔸_K/K`. These can proceed in parallel with Layer 2 and need only Mathlib and Layer 0.
- **Layer 3, uniform ray-class ideal counting** — the power-saving lattice-point count and its assembly into `rayClassIdealCount`, which Chebotarev consumes. It waits on Layer 2 and is the largest single piece of work in the roadmap.
