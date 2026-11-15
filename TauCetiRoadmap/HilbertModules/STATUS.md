<!--tauceti-status:v1 {"roadmap":"HilbertModules","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
# Status: HilbertModules

This file documents the status of the HilbertModules roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first layer, H1, has started. Gram-matrix positivity and the right self-module of a C*-algebra are proved. Completions, direct sums, orthogonal complements and quotients are still to come, and no module-operator, tensor-product, stabilization, continuous-trace or unbounded-operator work (H2–H7) has landed.

### Named results

- **Positivity of Gram matrices** — for a finite family x in a right Hilbert A-module, the matrix of inner products ⟨x_i, x_j⟩_A is positive in the C*-algebra of matrices over A ([`CStarMatrix.gram_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram_nonneg)). This is Raeburn–Williams Lemma 2.65.
- **The quadratic-form criterion for positivity** — a matrix over a C*-algebra is positive exactly when every finite sum Σ a_i* m_ij a_j is positive ([`CStarMatrix.nonneg_iff_forall_sum_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CStarMatrix.html#CStarMatrix.nonneg_iff_forall_sum_nonneg)).
- **Fullness of the right self-module** — the closed linear span of the inner products a*b is all of A ([`CStarModule.topologicalClosure_span_range_unop_inner_mulOpposite`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.topologicalClosure_span_range_unop_inner_mulOpposite)). The proof shows that these products are already dense.

### Notable definitions and infrastructure

- **The right self-module** ([`CStarModule.instMulOpposite`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.instMulOpposite)) — A as a right Hilbert A-module with ⟨a, b⟩ = a*b, in the README's opposite-algebra convention. It is kept distinct from Mathlib's left self-module, and a lemma identifies it with the left self-module of Aᵐᵒᵖ. This is the carrier for closed right ideals and for the later identifications K_A(A) ≅ A and L_A(A) ≅ M(A).
- **Gram matrices** ([`CStarMatrix.gram`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram)) — together with the identity expressing their quadratic forms as inner products of right linear combinations, these give the positivity input for interior tensor products in H3 and for the frame/projection comparison in H2.

### Roadmap coverage

H1 is partial. Its Gram-positivity milestone is done, and the self-module has its action and inner-product formulas and fullness. The rest of H1 is still missing: the right-module Cauchy–Schwarz forms and norm recovery, completion and separated quotients, the essential action and factorization, closed right ideals as submodules, the inner-product statements for Mathlib's finite sums, infinite Hilbert direct sums and the standard module H_A, H⊗A, orthogonal complements and adjointable projections, and the quotient E/EJ with the ideal I_E. H2 (adjointable and module-compact operators, frames, polar decomposition), H3 (interior tensor products, induction, imprimitivity, Rieffel correspondence), H4 (Kasparov stabilization, Brown–Green–Rieffel), H5 (C₀(X)-algebras, continuous fields, the torus section modules, continuous trace and the Dixmier–Douady classification), H6 (regular operators) and H7 (the local–global principle) are untouched as module theory. The child roadmap HeisenbergImprimitivity is not assessed here.

## The frontier

- **The rest of H1's elementary module API** — the right-module Cauchy–Schwarz inequalities ⟨x,y⟩*⟨x,y⟩ ≤ ‖x‖²⟨y,y⟩ and ‖⟨x,y⟩‖ ≤ ‖x‖‖y‖, norm recovery, ‖xa‖ ≤ ‖x‖‖a‖, and closed right ideals as submodules of the new self-module. These are the nearest steps.
- **Completion and essential action** — the completion of a pre-Hilbert module and the separated quotient of a semidefinite one, with their universal properties, plus x e_λ → x and the factorizations x = ya and x = y⟨y,y⟩, which compact-operator arguments need.
- **Direct sums and the standard module** — Hilbert direct sums over arbitrary index sets under norm-summability of Σ⟨x_i,x_i⟩, the standard module H_A = ℓ²(ℕ, A), and the K(ℓ²) example separating it from the Banach ℓ² of A-valued sequences.
- **Adjointable maps (H2)** — the `IsAdjointPair` notion, automatic linearity and boundedness through the closed graph theorem, and the C*-identity for L_A(E). These are stated in the roadmap's Suggested.lean but not yet proved, and the rank-one operators and K_A(E) come next.
- **Orthogonal complements and quotients by ideals** — F⊥, complementability as adjointability of the inclusion, and the Hilbert A/J-module E/EJ. These close out H1 and are needed for H2's polar decomposition.
