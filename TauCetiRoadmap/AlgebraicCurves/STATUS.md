<!--tauceti-status:v1 {"roadmap":"AlgebraicCurves","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: AlgebraicCurves

This file documents the status of the AlgebraicCurves roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0, 1 and 3 are done, through Riemann's theorem and the genus, and Layer 2's dictionary is done for a given Dedekind model. Layer 4 reaches `dim_F Ω_F = 1` but not the canonical divisor, duality, or Riemann–Roch; Layer 6 is nearly complete; Layers 5, 7 and 9 are partial; Layers 8 and 10–12 have not begun.

### Named results

- **The product formula** — every principal divisor has degree zero, via `deg (z)₀ = deg (z)∞ = [F : k(z)]`, over any constant field ([`TauCeti.Divisor.degree_principal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.html#TauCeti.Divisor.degree_principal)).
- **Riemann's theorem** — `ℓ(D) ≥ deg D + 1 − g` for Stichtenoth's supremum genus, with equality in large degree ([`TauCeti.Divisor.degree_add_one_sub_genus_le_dim`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.html#TauCeti.Divisor.degree_add_one_sub_genus_le_dim)).
- **The index of specialty as a dimension** — `i(D) = dim_k A_F ⧸ (A_F(D) + F)` over an exact constant field ([`TauCeti.finrank_quotient_repartitionSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Repartition/IndexOfSpecialty.html#TauCeti.finrank_quotient_repartitionSpace)).
- **Weil differentials are one-dimensional** — `dim_F Ω_F = 1` and `dim_k Ω_F(D) = i(D)` ([`TauCeti.finrank_weilDifferentialSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Dimension.html#TauCeti.finrank_weilDifferentialSpace)).
- **The fundamental identity** — `∑ e(P′∣P) f(P′∣P) = [F′ : F]` at every place for `F′/F` finite separable, and without separability at the places of an affine model ([`TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Extension/Fundamental.html#TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable)).

### Notable definitions and infrastructure

- **Normalized places** ([`TauCeti.Place`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Place/Basic.html#TauCeti.Place)) — surjective `ℤᵐ⁰`-valuations trivial on `k`, so place equality is valuation equality; the valuation ring is a DVR.
- **The repartition space and its filtration** ([`TauCeti.repartitionSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Repartition/Basic.html#TauCeti.repartitionSpace)) — entries in `F`, no completions, `F ∩ A_F(D) = L(D)`, and `dim_k A_F(E)/A_F(D) = deg E − deg D`.
- **The affine-model dictionary** ([`TauCeti.Place.heightOneSpectrumEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/AffineModel/Prime.html#TauCeti.Place.heightOneSpectrumEquiv)) — places finite on a Dedekind model are its height one primes, with matching residue fields and orders; at divisor level `⟨[P] : P ∤ R⟩ → Cl(F) → ClassGroup R → 0` is exact, and `Cl⁰(F) ≅ ClassGroup R` when the only place at infinity is rational ([`TauCeti.Divisor.degreeZeroClassGroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Divisor/AffineModel.html#TauCeti.Divisor.degreeZeroClassGroupEquiv)).

### Roadmap coverage

- **Layers 0, 1, 3** — done; only the corollary that there are infinitely many places is not visible. On `k(x)`, `−2·P_∞` is a Riemann–Roch divisor with `g₀ = 0` ([`TauCeti.Divisor.isRiemannRochDivisor_neg_two_zsmul_ofPoint_infty`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/RiemannRoch/Uniqueness.html#TauCeti.Divisor.isRiemannRochDivisor_neg_two_zsmul_ofPoint_infty)); the `ℓ(n·P_∞) = n + 1` computation is not visible by name.
- **Layer 2** — partial: places ↔ height one primes, the finite chart and its complement, and holomorphy rings (integrally closed ⟺ holomorphy ring, PID for finite `S`) are done; finite normalization and two-chart compatibility are untouched, so every model is a hypothesis.
- **Layer 4** — partial: repartitions, the quotient engine, `i(D)` and `g` as dimensions, Weil differentials with `F`-action, uniqueness of the Riemann–Roch data; untouched: `(ω)`, the canonical class, duality, Riemann–Roch.
- **Layer 5** — partial: strong approximation, local components with the abstract residue theorem ([`TauCeti.finsum_repartitionDualComponent_eq_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/LocalComponent.html#TauCeti.finsum_repartitionDualComponent_eq_zero)), and the zeta-free class number (`Finite Cl⁰(F)`) are done; the `deg ≥ 2g − 1` regime, genus 0, Weierstrass gaps, Clifford, `η` on `k(x)`, completions and the transfer to `ClassGroup R_x` are not.
- **Layer 6** — done except the fundamental identity for inseparable `F′/F` at places over infinity, the geometric degree, and the constant-field identification; extensions of places exist only when both `F′/F` and `k′/k` are integral.
- **Layer 7** — partial: the different exponent via the local model `𝒪′_P`, `d ≥ e − 1` and `d = 0 ⟺` unramified; the different divisor, the tame equality, the cotrace and Hurwitz are untouched.
- **Layer 9** — first subsection done, `dim_F Ω[F⁄k] = 1` with basis `dx` ([`TauCeti.finrank_kaehlerDifferential_eq_one_of_separating`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/FunctionField/Differential/Kaehler.html#TauCeti.finrank_kaehlerDifferential_eq_one_of_separating)); residues and the Weil comparison untouched.
- **Layers 8, 10, 11, 12** — untouched.

## The frontier

- **Riemann–Roch** — what remains is the divisor `(ω)` of a nonzero Weil differential, the canonical class, and duality `L(W − D) ≅ Ω_F(D)`; with `dim_k Ω_F(D) = i(D)` in, duality is the whole theorem; uniqueness then yields `ℓ(W) = g` and `deg W = 2g − 2`.
- **Layer 5 consequences** — the `deg ≥ 2g − 1` regime, `ℓ(n·[0]) = n`, genus 0, Weierstrass gaps and `[Infinite k]` Clifford wait on Riemann–Roch; `η` and the completion comparison do not.
- **The different divisor and Hurwitz (Layer 7)** — finite support of `d(P′∣P)`, the tame value `d = e − 1` under residue separability, then the cotrace, which needs the canonical divisor of a Weil differential; Hurwitz is blocked on both.
- **Finite normalization (Layer 2)** — that the integral closure of `k[x]` in `F` is module-finite and Dedekind without separability keeps affine models hypothetical; it also feeds Layer 12B.
- **Layers 8, 10, 12** — untouched; `Cl⁰(F) ≅ ClassGroup R` is not instantiated at `WeierstrassCurve`; nothing in the digest touches Mathlib's elliptic curves. Layer 12's contracts could be drafted now.
