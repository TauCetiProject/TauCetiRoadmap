import Mathlib

/-!
# Weil positivity and Li's criterion: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining steps, API lists and Checks are not restated.

Nothing here proves any case of the Riemann hypothesis: every statement about `ζ` is either an
equivalence with Mathlib's `RiemannHypothesis` or a consequence of it, or holds unconditionally.

The zeros of `ζ` are read on the completed zeta function: `zetaZeroMult ρ` is the positive part of
the divisor of `completedRiemannZeta` at `ρ`. It is `0` at the poles `0` and `1` (divisor `-1`) and
at the trivial zeros of `riemannZeta` (where the completed function is regular and nonzero), and it
is the multiplicity of `ρ` as a nontrivial zero of `ζ` everywhere else. Every sum over the zeros is
a `tsum` of an absolutely summable family, and the summability is part of the statement; the Li
sum `∑ (1 - (1 - 1/ρ)^n)`, which converges only conditionally, appears only through its symmetric
form `liCoeff` and as a limit of finite sums over discs.

The Mellin transform is Mathlib's `mellin g s = ∫ t^(s-1) g t`. Test functions are smooth
(`ContDiff ℝ ∞`), compactly supported, with `tsupport g ⊆ Ioi 0`.
-/

noncomputable section

open Complex Filter Set Topology
open scoped ContDiff ComplexConjugate

namespace TauCetiRoadmap.WeilPositivityAndLiCriterion

/-! ## Layer 1: the zero multiset of the completed zeta function -/

/-- 1.1 The multiplicity of `ρ` as a zero of the completed zeta function: the positive part of the
divisor of `completedRiemannZeta` on `ℂ` at `ρ`. It vanishes at the poles `0` and `1` and at the
trivial zeros of `riemannZeta`. -/
def zetaZeroMult (ρ : ℂ) : ℕ :=
  (MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat

/-- 1.2 The zero multiset is invariant under `ρ ↦ 1 - ρ`, multiplicities included. -/
theorem zetaZeroMult_one_sub (ρ : ℂ) : zetaZeroMult (1 - ρ) = zetaZeroMult ρ := by
  sorry

/-- 1.2 The zero multiset is invariant under complex conjugation, multiplicities included. -/
theorem zetaZeroMult_conj (ρ : ℂ) : zetaZeroMult (conj ρ) = zetaZeroMult ρ := by
  sorry

/-! ## Layer 2: the Bombieri–Lagarias criterion for multisets -/

/-- 2.1 Bombieri–Lagarias, multiset form. Let `m : ℂ → ℕ` be a multiset of complex numbers that
omits `1` and satisfies `∑ m ρ (1 + |Re ρ|) / (1 + |ρ|)^2 < ∞`. Then for every `n` the family
`ρ ↦ m ρ Re (1 - (ρ / (ρ - 1))^n)` is absolutely summable, and every point of the multiset has real
part at most `1/2` if and only if all these sums are nonnegative. The term is written with
`ρ / (ρ - 1) = (1 - 1/ρ)⁻¹`, which is `0` at `ρ = 0`, the correct value. -/
theorem bombieriLagarias (m : ℂ → ℕ) (h1 : m 1 = 0)
    (hs : Summable fun ρ : ℂ ↦ (m ρ : ℝ) * (1 + |ρ.re|) / (1 + ‖ρ‖) ^ 2) :
    (∀ n : ℕ, Summable fun ρ : ℂ ↦ (m ρ : ℝ) * (1 - (ρ / (ρ - 1)) ^ n).re) ∧
      ((∀ ρ : ℂ, m ρ ≠ 0 → ρ.re ≤ 1 / 2) ↔
        ∀ n : ℕ, 0 ≤ ∑' ρ : ℂ, (m ρ : ℝ) * (1 - (ρ / (ρ - 1)) ^ n).re) := by
  sorry

/-! ## Layer 3: Li coefficients and Li's criterion -/

/-- 3.1 The `n`-th Li coefficient of `ζ`, in its symmetric, absolutely convergent form
`λₙ = ½ ∑_ρ m_ρ Re [(1 - (1 - 1/ρ)^n) + (1 - (1 - 1/(1 - ρ))^n)]`. `liCoeff 0 = 0`. -/
def liCoeff (n : ℕ) : ℝ :=
  (1 / 2 : ℝ) * ∑' ρ : ℂ, (zetaZeroMult ρ : ℝ) *
    ((1 - (1 - 1 / ρ) ^ n) + (1 - (1 - 1 / (1 - ρ)) ^ n)).re

/-- 3.1 The family defining `liCoeff n` is summable for every `n`. -/
theorem summable_liCoeff (n : ℕ) :
    Summable fun ρ : ℂ ↦ (zetaZeroMult ρ : ℝ) *
      ((1 - (1 - 1 / ρ) ^ n) + (1 - (1 - 1 / (1 - ρ)) ^ n)).re := by
  sorry

/-- 3.1 The Li coefficient is the Bombieri–Lagarias sum of 2.1 for the zeros of `ζ`. -/
theorem liCoeff_eq_tsum (n : ℕ) :
    liCoeff n = ∑' ρ : ℂ, (zetaZeroMult ρ : ℝ) * (1 - (ρ / (ρ - 1)) ^ n).re := by
  sorry

/-- 3.2 Li's criterion: the Riemann hypothesis holds if and only if `λₙ ≥ 0` for every `n ≥ 1`. -/
theorem riemannHypothesis_iff_liCoeff_nonneg :
    RiemannHypothesis ↔ ∀ n : ℕ, 1 ≤ n → 0 ≤ liCoeff n := by
  sorry

/-- 3.2 Under the Riemann hypothesis every Li coefficient `λₙ` with `n ≥ 1` is positive. -/
theorem liCoeff_pos_of_riemannHypothesis (hRH : RiemannHypothesis) (n : ℕ) (hn : 1 ≤ n) :
    0 < liCoeff n := by
  sorry

/-- 3.3 `liCoeff n` is the limit, as `T → ∞`, of the finite sums of `m_ρ (1 - (1 - 1/ρ)^n)` over
the zeros with `|ρ| ≤ T`: Li's coefficient as a symmetric limit of the unsymmetrized sum. -/
theorem tendsto_liCoeff (n : ℕ) :
    Tendsto (fun T : ℝ ↦ ∑ᶠ ρ ∈ {z : ℂ | ‖z‖ ≤ T}, (zetaZeroMult ρ : ℂ) * (1 - (1 - 1 / ρ) ^ n))
      atTop (𝓝 (liCoeff n : ℂ)) := by
  sorry

/-- 3.4 Riemann's entire function `ξ(s) = ½ s (s - 1) π^(-s/2) Γ(s/2) ζ(s)`, written through the
entire function `completedRiemannZeta₀` so that it has its true value `1/2` at `s = 0` and
`s = 1`. -/
def riemannXi (s : ℂ) : ℂ :=
  (s * (s - 1) * completedRiemannZeta₀ s + 1) / 2

/-- 3.4 Li's derivative formula: for `n ≥ 1`,
`λₙ = (1/(n - 1)!) dⁿ/dsⁿ [s^(n-1) log ξ(s)]` at `s = 1`. -/
theorem liCoeff_eq_iteratedDeriv (n : ℕ) (hn : 1 ≤ n) :
    (liCoeff n : ℂ) = iteratedDeriv n (fun s : ℂ ↦ s ^ (n - 1) * Complex.log (riemannXi s)) 1 /
      (Nat.factorial (n - 1) : ℂ) := by
  sorry

/-! ## Layer 4: the Li class and the Gram matrices -/

/-- 4.1 Li's test function `Gₙ(s) = 1 - (1 - 1/s)^n`, a rational function with poles only at
`0`. -/
def liTestFunction (n : ℕ) (s : ℂ) : ℂ :=
  1 - (1 - 1 / s) ^ n

/-- 4.1 The Weil pairing of two Li test functions over the zeros of `ζ`:
`∑_ρ m_ρ Gₙ(ρ) conj (Gₖ(1 - conj ρ)) = λₙ + λₖ - λ_|n - k|`, the family being summable. -/
theorem liTestFunction_pairing (n k : ℕ) :
    Summable (fun ρ : ℂ ↦ (zetaZeroMult ρ : ℂ) *
        (liTestFunction n ρ * conj (liTestFunction k (1 - conj ρ)))) ∧
      ∑' ρ : ℂ, (zetaZeroMult ρ : ℂ) *
          (liTestFunction n ρ * conj (liTestFunction k (1 - conj ρ))) =
        (liCoeff n : ℂ) + liCoeff k - liCoeff (max n k - min n k) := by
  sorry

/-- 4.2 The Li Gram matrix of size `N`, with entries `λ_(i+1) + λ_(j+1) - λ_|i - j|`. -/
def liGramMatrix (N : ℕ) : Matrix (Fin N) (Fin N) ℝ :=
  fun i j ↦ liCoeff ((i : ℕ) + 1) + liCoeff ((j : ℕ) + 1) -
    liCoeff (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ))

/-- 4.2 The Riemann hypothesis holds if and only if every Li Gram matrix is positive
semidefinite. -/
theorem riemannHypothesis_iff_liGramMatrix_posSemidef :
    RiemannHypothesis ↔ ∀ N : ℕ, (liGramMatrix N).PosSemidef := by
  sorry

/-- 4.2 Under the Riemann hypothesis every Li Gram matrix is positive definite. -/
theorem liGramMatrix_posDef_of_riemannHypothesis (hRH : RiemannHypothesis) (N : ℕ) :
    (liGramMatrix N).PosDef := by
  sorry

/-! ## Layer 5: Weil's quadratic form on smooth test functions -/

/-- 5.1 Weil's form on the zero side, in Bombieri's convention:
`W(g, h) = ∑_ρ m_ρ ĝ(ρ) conj (ĥ(1 - conj ρ))`, with `ĝ = mellin g`. -/
def weilForm (g h : ℝ → ℂ) : ℂ :=
  ∑' ρ : ℂ, (zetaZeroMult ρ : ℂ) * (mellin g ρ * conj (mellin h (1 - conj ρ)))

/-- 5.1 For a smooth compactly supported test function `g` on `(0, ∞)` the family defining
`W(g, g)` is summable and `W(g, g)` is real. -/
theorem summable_weilForm_and_im_eq_zero (g : ℝ → ℂ) (hg : ContDiff ℝ ∞ g)
    (hgc : HasCompactSupport g) (hgs : tsupport g ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦ (zetaZeroMult ρ : ℂ) * (mellin g ρ * conj (mellin g (1 - conj ρ)))) ∧
      (weilForm g g).im = 0 := by
  sorry

/-- 5.2 Weil's criterion (Bombieri 2000, Theorem 1): the Riemann hypothesis holds if and only if
`Re W(g, g) ≥ 0` for every smooth compactly supported test function `g` on `(0, ∞)`. -/
theorem riemannHypothesis_iff_weilForm_nonneg :
    RiemannHypothesis ↔ ∀ g : ℝ → ℂ, ContDiff ℝ ∞ g → HasCompactSupport g →
      tsupport g ⊆ Ioi 0 → 0 ≤ (weilForm g g).re := by
  sorry

/-- 5.2 Under the Riemann hypothesis `Re W(g, g) > 0` for every nonzero smooth compactly
supported test function `g` on `(0, ∞)`. -/
theorem weilForm_pos_of_riemannHypothesis (hRH : RiemannHypothesis) (g : ℝ → ℂ)
    (hg : ContDiff ℝ ∞ g) (hgc : HasCompactSupport g) (hgs : tsupport g ⊆ Ioi 0) (hg0 : g ≠ 0) :
    0 < (weilForm g g).re := by
  sorry

end TauCetiRoadmap.WeilPositivityAndLiCriterion
