<!--tauceti-status:v1 {"roadmap":"ModularForms","to_sha":"5c3a971fc3bfb194123caab9cd90ef1a60322cea","ts":"2026-08-10T07:42:19Z"}-->
# Status: ModularForms

This file documents the status of the ModularForms roadmap up until `5c3a971` (2026-08-10T07:42:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The trunk root is built: Layer 0's diamond operators and nebentypus character spaces are complete apart from the Eisenstein series, and Layer 3's construction half (the Petersson inner product as an honest positive-definite pairing, and the old/new decomposition) is done. Layer 2 has its abstract and `GL_n` Hecke ring but no action on modular forms at all, which is what holds up the rest of the trunk; Layer 1 has the contour analysis and the order dictionary but not the valence formula; Layers 4 to 6 and 8 to 11 have not begun.

### Named results

- **The level-one structure theorem** — `E₄` and `E₆` are algebraically independent and generate every modular form of level one, so the graded ring is the polynomial ring `ℂ[X₀, X₁]`: [`mvPolynomialEquivModularForms`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.html#TauCeti.ModularForm.mvPolynomialEquivModularForms).
- **The nebentypus decomposition** — `M_k(Γ₁(N))` is the internal direct sum of the character spaces `M_k(N, χ)`, and likewise for cusp forms: [`isInternal_modFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CharacterDecomp.html#isInternal_modFormCharSpace).
- **The old/new decomposition** — the oldspace and its Petersson-orthogonal complement meet only in `0` and together span `S_k(Γ₁(N))`: [`sup_cuspFormsOld_cuspFormsNew_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Newforms/Basic.html#TauCeti.sup_cuspFormsOld_cuspFormsNew_eq_top), resting on positive definiteness of the pairing ([`peterssonInnerCosets_definite`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.html#CuspForm.peterssonInnerCosets_definite)). Stated at `Γ₁(N)`; the fixed-character refinement with its exact `M ∣ N`, `cond χ ∣ M` indexing is not proved.
- **The Sturm bound at finite index** — two weight-`k` forms whose `q`-expansions agree up to `k · [SL₂(ℤ) : Γ]/12` are equal, hence finite-dimensionality: [`sturm_bound_finiteIndex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/SturmBound.html#TauCeti.ModularForm.sturm_bound_finiteIndex).
- **Commutativity of the integral `GL_n` Hecke ring** — transposition is an anti-involution fixing every double coset, so Shimura's criterion applies at every `n`: [`commSemiringIntegralHeckeRing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/HeckeRing/GLn/TransposeAntiInvolution.html#HeckeRing.GLn.commSemiringIntegralHeckeRing).

### Notable definitions and infrastructure

- The diamond operators and the character spaces [`modFormCharSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/DiamondOperators.html#modFormCharSpace), defined as joint eigenspaces inside Mathlib's `ModularForm` rather than as a new bundled type, with the classical nebentypus law available as a theorem. This is the setting in which the rest of the roadmap is to be stated.
- The Petersson pairing at finite index [`peterssonInnerCosets`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.html#CuspForm.peterssonInnerCosets) together with the orthogonal-complement operator [`peterssonOrthogonal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Petersson/Orthogonal.html#TauCeti.CuspForm.peterssonOrthogonal), for which `V ⊔ Vᗮ = ⊤` and `Vᗮᗮ = V` hold.
- The truncated fundamental-domain contour [`fdBoundary`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/LevelOne/FundamentalDomainBoundary/Basic.html#TauCeti.ModularForm.fdBoundary), a piecewise-`C¹` immersion whose generalized winding numbers are known at every point (`-1` inside, `-1/2` at `i`, `-1/6` at each `ρ`-corner, `0` outside), paired with the `ℚ`-valued cusp order [`orderAtCusp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Order/AtCusp.html#TauCeti.orderAtCusp) and vanishing orders descended to `SL₂(ℤ)`-orbits with finite support.

### Roadmap coverage

Layer 0 is done except for Eisenstein series with character and the cusp–Eisenstein decomposition, which are untouched; the two-spellings milestone for `M_k(Γ₀(N))` and the parity lemma are both in. Layer 1 has the order dictionary at level one and the whole contour analysis, including the excised logarithmic assembly, but not the `k/12` identity and not the general-level norm map. Layer 2(a) has the convolution ring (Shimura's multiplicities, structure constants, associativity, unit, degrees), the classification of `GL_n` double cosets by elementary divisors, and the `p`-local subring `R_p`, plus the `GL₂` multiplication table of Shimura Theorem 3.24; Theorem 3.20 and most of the congruence-level theory are open, and Layer 2(b), the action on forms, is empty. Layer 3's construction milestones are in (invariant measure and its `PSL₂` descent, finite volume, coset tiling, representative independence, definiteness, old/new); its adjoint milestones are not. Layer 7 has two results: Hecke's abscissa bound and the entire continuation of a cusp form's L-series. Layers 4, 5, 6, 8, 9, 10 and 11 have nothing.

## The frontier

- **Hecke operators on forms.** `Tₙ` as `ℂ`-linear endomorphisms preserving `M_k(N,χ)` and `S_k(N,χ)`, the `q`-expansion recurrences, and the normalization lemma identifying the double coset `Γ₁(N)·diag(1,p)·Γ₁(N)` with the classical `Tₚ`. Both inputs now exist, and Layers 3 to 7 are all downstream of this one target.
- **The valence formula at level one.** The winding weights, the principal-value logarithmic integral and the four-piece excised assembly are in place; what remains is the limit in the truncation height and the bookkeeping that turns them into `ord_∞ + ½ord_i + ⅓ord_ρ + Σ_q ord_q = k/12`.
- **The Petersson adjoint and normality.** `Tₙ* = ⟨n⟩⁻¹Tₙ` for `(n,N) = 1`, hence normality and a simultaneous orthonormal eigenbasis. Blocked only on the operators themselves. Bad-prime stability of the newspace remains the roadmap's flagged source gap.
- **Shimura's Theorem 3.20 at general `n`.** `R_p` is defined with its universal property, but that it is a polynomial ring on the `n` diagonal prime cosets is not proved, nor are the two hand-off milestones the automorphic-representations roadmap consumes.
- **L-functions past continuation.** The Euler product, completed form and functional equation need eigenforms and the Fricke involution, so they wait on Layers 4 to 6.
