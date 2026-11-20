<!--tauceti-status:v1 {"roadmap":"HilbertModules","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the Heisenberg cocycle calculus, symplectic annihilators and lattice covolumes with c_D c_(D^perp) = 1","state":"untouched"},{"id":"Layer 2","remaining":"the Schwartz-Bruhat space, Poisson summation for phase-space lattices and the fundamental identity","state":"untouched"},{"id":"Layer 3","remaining":"twisted group C*-algebras of phase-space lattices, the two pairings and positivity","state":"untouched"},{"id":"Layer 4","remaining":"completion, fullness and Rieffel's imprimitivity theorem for lattices","state":"untouched"},{"id":"Layer 5","remaining":"spectral invariance, smooth Parseval frames, the trace formula and transport","state":"untouched"},{"id":"Layer 6","remaining":"the worked families and the two-torus dictionary","state":"untouched"}],"readme_sha":"8f2b641ad5e1d03e58c7f5f640f1a9b40686ab74cb36fe268d13af88617c828f","roadmap":"HilbertModules/HeisenbergImprimitivity","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: HilbertModules

This file documents the status of the HilbertModules roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1 and H2 are both partial. H1's elementary module API is largely done, but its constructions (completions, direct sums, complements, quotients) have not started. H2 has its adjoint-pair foundations but no operator spaces yet. Tensor products, stabilization, continuous trace and unbounded operators (H3–H7) have not begun, and neither has the child roadmap HeisenbergImprimitivity.

### Named results

- **Automatic boundedness of adjoint pairs** — a plain function between complete C*-modules with an everywhere-defined adjoint is a bounded complex-linear map that commutes with the coefficient action. No linearity or boundedness is assumed, and the proof goes through the closed graph theorem ([`LinearMap.IsAdjointPair.exists_continuousLinearMaps_cstarModule`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/AdjointPair.html#LinearMap.IsAdjointPair.exists_continuousLinearMaps_cstarModule)).
- **The C*-identity for adjoint pairs** — for a bounded adjoint pair, ‖T*T‖ = ‖T‖², and T and T* have the same norm ([`LinearMap.IsAdjointPair.norm_adjoint_comp_self_cstarModule`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/AdjointPair.html#LinearMap.IsAdjointPair.norm_adjoint_comp_self_cstarModule)). This is the analytic input that will make L_A(E) a C*-algebra.
- **Cauchy–Schwarz for right Hilbert modules** — ⟨x,y⟩*⟨x,y⟩ ≤ ‖x‖²⟨y,y⟩ in the coefficient algebra ([`CStarModule.star_unop_inner_mul_unop_inner_le`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Basic.html#CStarModule.star_unop_inner_mul_unop_inner_le)), together with the norm form ‖⟨x,y⟩‖ ≤ ‖x‖‖y‖. Norm recovery from the unit ball and ‖xa‖ ≤ ‖x‖‖a‖ are proved alongside it.
- **Positivity of Gram matrices** — for a finite family in a right Hilbert A-module, the matrix of inner products is positive in the C*-algebra of matrices over A ([`CStarMatrix.gram_nonneg`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram_nonneg)). This is Raeburn–Williams Lemma 2.65.
- **Essentiality of the action** — x e → x for every x along any approximate identity of the coefficient algebra ([`CStarModule.tendsto_op_smul`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Basic.html#CStarModule.tendsto_op_smul)). Compact-operator arguments need this.

### Notable definitions and infrastructure

- **The right self-module** ([`CStarModule.instMulOpposite`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.instMulOpposite)) — A as a right Hilbert A-module with ⟨a, b⟩ = a*b, in the README's opposite-algebra convention, and [full](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.topologicalClosure_span_range_unop_inner_mulOpposite). It carries closed right ideals and the later identifications K_A(A) ≅ A and L_A(A) ≅ M(A).
- **The bounded map of an adjoint pair** ([`LinearMap.IsAdjointPair.toContinuousLinearMapCStarModule`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/AdjointPair.html#LinearMap.IsAdjointPair.toContinuousLinearMapCStarModule)) — this bundles the continuous linear map forced by the adjoint identity, which is the natural carrier for building L_A(E, F).
- **Gram matrices** ([`CStarMatrix.gram`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram)) — they supply the positivity input for interior tensor products in H3 and for the frame/projection comparison in H2.

### Roadmap coverage

H1 is partial. Polarization, the inner-product action laws, the right-module Cauchy–Schwarz forms, norm recovery, ‖xa‖ ≤ ‖x‖‖a‖, essentiality of the action, Gram positivity and the full right self-module are done. Still missing are completions and separated quotients, the factorizations x = ya and x = y⟨y,y⟩, closed right ideals, the finite-sum inner-product statements, Hilbert direct sums and H_A, H⊗A, orthogonal complements, and E/EJ with I_E. H2 is partial: uniqueness, automatic linearity and boundedness, ‖T*‖ = ‖T‖ and the C*-identity are proved for adjoint pairs. The space L_A(E) as a C*-algebra, rank-one operators and K_A(E), the identifications with multipliers and with K(H)⊗A, frames, the closed-range theorem, polar decomposition and the counterexamples are not. H3 through H7 are untouched. All six layers of HeisenbergImprimitivity are untouched: none of the Schrödinger, annihilator, Schwartz–Bruhat or frame declarations it names appears in the library.

## The frontier

- **L_A(E) as a C*-algebra** — package adjointable operators with addition, composition, (ST)* = T*S*, completeness and the operator norm, and make L_A(E) a unital C*-algebra. The norm identities and the bounded map of an adjoint pair are already in place.
- **Rank-one and module-compact operators** — θ_(x,y) with its adjoint, norm bound and composition law, then K_A(E) as a closed ideal acting nondegenerately. The essential-action result is the input this needs.
- **Completion and factorization** — the completion of a pre-Hilbert module and the separated quotient of a semidefinite one, with their universal properties, plus the factorizations x = ya and x = y⟨y,y⟩.
- **Direct sums and the standard module** — closed right ideals as submodules of the self-module, the finite-sum inner-product statements, Hilbert direct sums under norm-summability of Σ⟨x_i,x_i⟩, H_A and the K(ℓ²) example separating it from the Banach ℓ².
- **Orthogonal complements and quotients by ideals** — F⊥, complementability as adjointability of the inclusion, and the Hilbert A/J-module E/EJ. H2's polar decomposition needs these.
