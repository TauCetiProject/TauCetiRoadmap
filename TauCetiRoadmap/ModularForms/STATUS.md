<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"113fad874c528f374a36ad45d29a758825e770c4","ts":"2026-08-19T23:58:39Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `113fad8` (2026-08-19T23:58:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The level-one summit of Layer 1 is complete with the valence formula, while its general-level norm argument remains partial. Layer 0's diamond and character-space trunk and Layer 3's Petersson and old/new construction are substantially built; Layer 2 now has genuine double-coset operators on forms but not the uniform `T_n` action. Layer 7 contains continuation and an abscissa bound, while Eisenstein series and Layers 4–6 and 8–11 have not begun.

### Named results

- **The level-one valence formula** — a nonzero weight-`k` form has weighted divisor degree `k/12`, with weights `1/2` at `i` and `1/3` at `ρ`: [`valence_formula`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/ValenceFormula.html#TauCeti.ModularForm.valence_formula).
- **The level-one structure theorem** — `E₄` and `E₆` freely generate the graded ring of level-one modular forms: [`mvPolynomialEquivModularForms`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.html#TauCeti.ModularForm.mvPolynomialEquivModularForms).
- **The nebentypus decomposition** — `M_k(Γ₁(N))`, and likewise the cusp-form space, is the internal direct sum of its character spaces: [`isInternal_modFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CharacterDecomp.html#isInternal_modFormCharSpace).
- **The old/new decomposition with fixed nebentypus** — each `S_k(N,χ)` is spanned by its old and new intersections, which meet only at zero: [`sup_cuspFormsOld_cuspFormsNew_inf_cuspFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.html#TauCeti.sup_cuspFormsOld_cuspFormsNew_inf_cuspFormCharSpace).
- **Shimura's rank-two local presentation** — the `p`-local integral Hecke ring for `GL₂` is `ℤ[X₁,X₂]` on `T(1,p)` and `T(p,p)`: [`polynomialRingEquivTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Injective.html#HeckeRing.GLn.polynomialRingEquivTwo).

### Notable definitions and infrastructure

- The character space [`modFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/DiamondOperators.html#modFormCharSpace) is a joint eigenspace inside Mathlib's bundled modular forms, so later Hecke and Petersson results retain the analytic structure already present.
- The finite-index Petersson pairing [`peterssonInnerCosets`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.html#CuspForm.peterssonInnerCosets) supplies positive definiteness, orthogonal complements, and now orthogonality between distinct nebentypus components.
- The double-coset endomorphism [`heckeSlashGamma1ModularFormEnd`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/HeckeSlash/Gamma1.html#HeckeRing.GL2.heckeSlashGamma1ModularFormEnd) packages a right-coset slash sum as an operator on `M_k(Γ₁(N))` and is the main input for defining the classical `T_n`.

### Roadmap coverage

Layers 0–3 carry most current work: Layer 0 lacks both Eisenstein milestones; Layer 1 is complete at level one but has only the norm, orbit, stabilizer, and cusp-order infrastructure toward general level; Layer 2(a) has the abstract ring, the integral `GL_n` structure, and the local polynomial theorem only for ranks one and two, while its general-rank and congruence-level endpoints remain partial. Layer 2(b) has arbitrary double-coset operators, preservation of modularity and cuspidality, and the bad-prime upper-triangular coefficient formula, but no uniform `T_n`, ring action, full coefficient recurrence, or `U_p = T_p` theorem. Layer 3 has the positive Petersson pairing and characterwise old/new intersections, but not the exact conductor-indexed oldspace, adjoints, normality, or Hecke stability. Layer 7 remains limited to the abscissa bound and continuation; the remaining layers are untouched.

## The frontier

- **Uniform Hecke operators.** Identify the relevant double-coset sums with `T_n`, prove the ring homomorphism on character spaces and the full good- and bad-prime coefficient recurrences, and introduce `U_p` only through `U_p = T_p`.
- **General-level valence formula.** Finish the cusp-width and stabilizer bookkeeping for the full-coset norm and turn the level-one formula into the weighted divisor identity for every finite-index subgroup.
- **Petersson adjoints and normality.** Prove `T_n* = ⟨n⟩⁻¹T_n` for `(n,N)=1` and derive simultaneous diagonalization; this awaits the uniform operators.
- **Bad-prime newspace stability.** Establish the level-changing trace and Fricke adjoint identities needed to show that `U_p` preserves the newspace in the separate `p ‖ N`, `p² ∣ N`, and `p ∣ cond χ` cases.
- **General-rank local Hecke algebra.** Extend Shimura's polynomial presentation beyond `n=2` by proving the integral triangular-generation and injectivity statements, then supply the two local–global hand-off results required by the automorphic-representations roadmap.
