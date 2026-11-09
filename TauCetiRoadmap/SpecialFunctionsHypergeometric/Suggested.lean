module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Hypergeometric

/-!
# The Gauss hypergeometric function: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer and per item of the Summary of `README.md`, which is the definitive
document and states every target. One headline is not stated: the loop integrals 15.6.2–15.6.5
of 6.2. Their integrands are continued along the loop, so that each power carries a different
branch on each piece, and the pinned Tau Ceti contour API (`TauCeti/Analysis/Contour/`)
integrates single-valued functions over paths; it has no integral of a function continued along
its path.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
they live in `Complex`, beside Mathlib's `Complex.regularizedGaussHGFun`. They are stated with
their intended bodies so that the conventions are checked by the compiler: Euler's integral as an
`intervalIntegral` with principal powers, the definition of `𝐅` by Euler's integral and
uniqueness (`Classical.choose`, with the junk value `0` off the cut plane), `F = Γ(c) 𝐅`,
reciprocal Gamma factors, and the cut plane written as `1 - z ∈ slitPlane`. Theorems are stated
with `sorry`.

The construction of the continuation by contiguous shifts is a theorem
(`exists_isEulerContinuation`, with the shift relations), not the definition. Where the README
pins a domain or a removable point, the prototypes state it: the pair at `∞` on `ℂ \ (−∞, 1]`,
15.4.1 with its denominator cleared, 15.4.7 with the domain of its argument `z²`, and the
coefficients of 15.15.1 as Mathlib's terminating series. The Chapter 8 integrals of 9.4 write
`Γ(b, x)`, `E_p(t)` and `B_x(a, b)` of SpecialFunctionsEiLiErfIncompleteGamma through their
integrals on the positive axis.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsHypergeometric

open Complex Filter Topology Set MeasureTheory
open scoped Real Nat ComplexConjugate

/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### Definitions -/

/-- Euler's integral `(Γ(b) Γ(c − b))⁻¹ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt`
(DLMF 15.6.1), with principal powers. It is `𝐅(a, b; c; z)` for `0 < Re b < Re c` and
`1 − z ∈ slitPlane`. -/
def eulerIntegral (a b c z : ℂ) : ℂ :=
  (Gamma b * Gamma (c - b))⁻¹ *
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (b - 1) * (1 - (t : ℂ)) ^ (c - b - 1) * (1 - z * t) ^ (-a)

/-- `G` continues Euler's integral: at every `z` of the cut plane it is entire in `b` and in `c`
(the other arguments fixed), and it equals Euler's integral where `0 < Re b < Re c`. -/
def IsEulerContinuation (G : ℂ → ℂ → ℂ → ℂ → ℂ) : Prop :=
  (∀ a c z, 1 - z ∈ slitPlane → Differentiable ℂ fun b => G a b c z) ∧
  (∀ a b z, 1 - z ∈ slitPlane → Differentiable ℂ fun c => G a b c z) ∧
  (∀ a b c z, 1 - z ∈ slitPlane → 0 < b.re → b.re < c.re → G a b c z = eulerIntegral a b c z)

open scoped Classical in
/-- The principal branch of Olver's regularized hypergeometric function `𝐅(a, b; c; z)`
(DLMF 15.2.2), for all complex parameters and `1 − z ∈ slitPlane`: the value of a continuation
of Euler's integral, which exists and is unique on the cut plane
(`exists_isEulerContinuation`, `IsEulerContinuation.eq`). The value `0` off the cut plane is
junk. -/
def regularizedGaussHypergeometric (a b c z : ℂ) : ℂ :=
  if h : ∃ G, IsEulerContinuation G then
    if 1 - z ∈ slitPlane then h.choose a b c z else 0
  else 0

/-- The principal branch of the Gauss hypergeometric function `F(a, b; c; z) = Γ(c) 𝐅(a, b; c; z)`
(DLMF 15.2.1); the value `0` at `c ∈ {0, −1, −2, …}` is Mathlib's junk value of `Γ`. -/
def gaussHypergeometric (a b c z : ℂ) : ℂ := Gamma c * regularizedGaussHypergeometric a b c z


/-- `𝐅(a, b; c; z)`. -/
local notation "𝐅" => regularizedGaussHypergeometric

/-! ### Layer 1: definition and analytic properties -/

/-- **1.2** Uniqueness: two continuations of Euler's integral agree on the cut plane. -/
theorem IsEulerContinuation.eq {G₁ G₂ : ℂ → ℂ → ℂ → ℂ → ℂ} (h₁ : IsEulerContinuation G₁)
    (h₂ : IsEulerContinuation G₂) {a b c z : ℂ} (hz : 1 - z ∈ slitPlane) :
    G₁ a b c z = G₂ a b c z := sorry

/-- **1.2** Existence: a continuation of Euler's integral exists, constructed by iterating the
shift relations in `b` and in `c` down to the region of Euler's integral. -/
theorem exists_isEulerContinuation : ∃ G, IsEulerContinuation G := sorry

/-- **1.2** The shift relation in `c` (the regularized form of DLMF 15.5.15). -/
theorem regularizedGaussHypergeometric_shift_c (a b c : ℂ) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = (c - a) * 𝐅 a b (c + 1) z + a * 𝐅 (a + 1) b (c + 1) z := sorry

/-- **1.2** The shift relation in `b` (the regularized form of DLMF 15.5.16_5). -/
theorem regularizedGaussHypergeometric_shift_b (a b c : ℂ) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = 𝐅 a (b + 1) c z - a * z * 𝐅 (a + 1) (b + 1) (c + 1) z := sorry

/-- **1.2** DLMF 15.6.1: `𝐅` is Euler's integral where `0 < Re b < Re c`. -/
theorem regularizedGaussHypergeometric_eq_eulerIntegral {a b c z : ℂ} (hz : 1 - z ∈ slitPlane)
    (hb : 0 < b.re) (hbc : b.re < c.re) : 𝐅 a b c z = eulerIntegral a b c z := sorry

/-- **1.3** DLMF 15.2.2: on the unit disk, `𝐅` is Mathlib's series, for all parameters. -/
theorem regularizedGaussHypergeometric_eq_regularizedGaussHGFun (a b c : ℂ) {z : ℂ}
    (hz : ‖z‖ < 1) : 𝐅 a b c z = Complex.regularizedGaussHGFun a b c z := sorry

/-- **1.3** DLMF 15.2.1: on the unit disk, `F` is Mathlib's `₂F₁` when `c ∉ {0, −1, −2, …}`. -/
theorem gaussHypergeometric_eq_ordinaryHypergeometric (a b : ℂ) {c z : ℂ}
    (hc : ∀ k : ℕ, c ≠ -k) (hz : ‖z‖ < 1) : gaussHypergeometric a b c z = ₂F₁ a b c z := sorry

/-- **1.3** DLMF 15.2.3_5 on the cut plane. -/
theorem regularizedGaussHypergeometric_neg_nat (a b : ℂ) (n : ℕ) {z : ℂ}
    (hz : 1 - z ∈ slitPlane) :
    𝐅 a b (-n) z = poch(a, n + 1) * poch(b, n + 1) / (n + 1)! * z ^ (n + 1) *
      gaussHypergeometric (a + n + 1) (b + n + 1) (n + 2) z := sorry

/-- **1.4** Joint holomorphy in `(a, b, c, z)` on `ℂ³` times the cut plane. -/
theorem differentiableOn_regularizedGaussHypergeometric :
    DifferentiableOn ℂ (fun p : ℂ × ℂ × ℂ × ℂ => 𝐅 p.1 p.2.1 p.2.2.1 p.2.2.2)
      (univ ×ˢ univ ×ˢ univ ×ˢ {z | 1 - z ∈ slitPlane}) := sorry

/-- **1.4** Symmetry in `a` and `b`. -/
theorem regularizedGaussHypergeometric_comm (a b c z : ℂ) : 𝐅 a b c z = 𝐅 b a c z := sorry

/-- **1.4** Conjugation. -/
theorem regularizedGaussHypergeometric_conj (a b c z : ℂ) :
    𝐅 (conj a) (conj b) (conj c) (conj z) = conj (𝐅 a b c z) := sorry

/-! ### Layer 2: derivatives and contiguous relations -/

/-- **2.1** DLMF 15.5.1 in regularized form, for all parameters. -/
theorem hasDerivAt_regularizedGaussHypergeometric (a b c : ℂ) {z : ℂ}
    (hz : 1 - z ∈ slitPlane) :
    HasDerivAt (𝐅 a b c) (a * b * 𝐅 (a + 1) (b + 1) (c + 1) z) z := sorry

/-- **2.2** DLMF 15.5.11 in regularized form, for all parameters. -/
theorem regularizedGaussHypergeometric_contiguous_15_5_11 (a b c : ℂ) {z : ℂ}
    (hz : 1 - z ∈ slitPlane) :
    (c - a) * 𝐅 (a - 1) b c z + (2 * a - c + (b - a) * z) * 𝐅 a b c z +
      a * (z - 1) * 𝐅 (a + 1) b c z = 0 := sorry

/-! ### Layer 3: the hypergeometric equation and Riemann's equation -/

/-- **3.1** DLMF 15.10.1: `𝐅(a, b; c; ·)` solves the hypergeometric equation on the cut plane. -/
theorem regularizedGaussHypergeometric_hypergeometricEquation (a b c : ℂ) {z : ℂ}
    (hz : 1 - z ∈ slitPlane) :
    z * (1 - z) * deriv (deriv (𝐅 a b c)) z + (c - (a + b + 1) * z) * deriv (𝐅 a b c) z -
      a * b * 𝐅 a b c z = 0 := sorry

/-- **3.2** DLMF 15.10.3: the Wronskian of the pair 15.10.2 at `0`, in regularized form. -/
theorem wronskian_regularizedGaussHypergeometric_zero (a b c : ℂ) {z : ℂ}
    (hz₀ : z ∈ slitPlane) (hz₁ : 1 - z ∈ slitPlane) :
    let f₁ := 𝐅 a b c
    let f₂ := fun ζ : ℂ => ζ ^ (1 - c) * 𝐅 (a - c + 1) (b - c + 1) (2 - c) ζ
    f₁ z * deriv f₂ z - deriv f₁ z * f₂ z =
      Real.pi⁻¹ * Complex.sin (π * c) * z ^ (-c) * (1 - z) ^ (c - a - b - 1) := sorry

/-- **3.2** DLMF 15.10.7: the Wronskian of the pair at `∞`, with the printed principal powers, on
`ℂ \ (−∞, 1]`; the principal `z ^ (-a)` jumps across the negative real axis. -/
theorem wronskian_gaussHypergeometric_infty {a b c z : ℂ} (hab : ∀ n : ℤ, a - b ≠ n)
    (hz : z - 1 ∈ slitPlane) :
    let f₁ := fun ζ : ℂ => ζ ^ (-a) * gaussHypergeometric a (a - c + 1) (a - b + 1) ζ⁻¹
    let f₂ := fun ζ : ℂ => ζ ^ (-b) * gaussHypergeometric b (b - c + 1) (b - a + 1) ζ⁻¹
    f₁ z * deriv f₂ z - deriv f₁ z * f₂ z = (a - b) * z ^ (-c) * (z - 1) ^ (c - a - b - 1) :=
  sorry

/-- **3.3** DLMF 15.10.8: for `c = n ≥ 1` and `a, b ∉ {n − 1, n − 2, …}`, the logarithmic function
solves 15.10.1 on the slit unit disk, where its series converges. -/
theorem hypergeometricEquation_log_solution_15_10_8 {a b : ℂ} {n : ℕ} (hn : 1 ≤ n)
    (ha : ∀ k : ℤ, k ≤ (n : ℤ) - 1 → a ≠ k) (hb : ∀ k : ℤ, k ≤ (n : ℤ) - 1 → b ≠ k) :
    let w : ℂ → ℂ := fun z => gaussHypergeometric a b n z * Complex.log z -
      ∑ k ∈ Finset.Ico 1 n, (((n - 1)! * (k - 1)! : ℕ) : ℂ) /
        (((n - k - 1)! : ℂ) * poch(1 - a, k) * poch(1 - b, k)) * ((-z) ^ k)⁻¹ +
      ∑' k : ℕ, poch(a, k) * poch(b, k) / (poch((n : ℂ), k) * (k ! : ℂ)) * z ^ k *
        (digamma (a + k) + digamma (b + k) - digamma (1 + k) - digamma (n + k))
    DifferentiableOn ℂ w {z | z ∈ slitPlane ∧ ‖z‖ < 1} ∧
      ∀ z, z ∈ slitPlane → ‖z‖ < 1 →
        z * (1 - z) * deriv (deriv w) z + (n - (a + b + 1) * z) * deriv w z - a * b * w z = 0 :=
  sorry

/-- **3.4** DLMF 15.11.7, from a solution `u` of the hypergeometric equation to a solution `w` of
Riemann's equation 15.11.1 with singular points `α, β, γ` and exponents `{a₁, a₂}`, `{b₁, b₂}`,
`{c₁, c₂}` (condition 15.11.2), on an open set where the two quotients are in the slit plane. -/
theorem riemannEquation_of_hypergeometricEquation {α β γ a₁ a₂ b₁ b₂ c₁ c₂ : ℂ} (hαβ : α ≠ β)
    (hβγ : β ≠ γ) (hαγ : α ≠ γ) (hsum : a₁ + a₂ + b₁ + b₂ + c₁ + c₂ = 1) {U V : Set ℂ}
    (hU : IsOpen U) (hV : IsOpen V)
    (hUs : ∀ z ∈ U, (z - α) / (z - γ) ∈ slitPlane ∧ (z - β) / (z - γ) ∈ slitPlane)
    (hUV : ∀ z ∈ U, (z - α) * (β - γ) / ((z - γ) * (β - α)) ∈ V) {u : ℂ → ℂ}
    (hu : DifferentiableOn ℂ u V)
    (hu' : ∀ ζ ∈ V, ζ * (1 - ζ) * deriv (deriv u) ζ +
      (1 + a₁ - a₂ - ((a₁ + b₁ + c₁) + (a₁ + b₁ + c₂) + 1) * ζ) * deriv u ζ -
        (a₁ + b₁ + c₁) * (a₁ + b₁ + c₂) * u ζ = 0) :
    let w : ℂ → ℂ := fun z => ((z - α) / (z - γ)) ^ a₁ * ((z - β) / (z - γ)) ^ b₁ *
      u ((z - α) * (β - γ) / ((z - γ) * (β - α)))
    DifferentiableOn ℂ w U ∧ ∀ z ∈ U, deriv (deriv w) z +
      ((1 - a₁ - a₂) / (z - α) + (1 - b₁ - b₂) / (z - β) + (1 - c₁ - c₂) / (z - γ)) * deriv w z +
        ((α - β) * (α - γ) * a₁ * a₂ / (z - α) + (β - α) * (β - γ) * b₁ * b₂ / (z - β) +
          (γ - α) * (γ - β) * c₁ * c₂ / (z - γ)) / ((z - α) * (z - β) * (z - γ)) * w z = 0 :=
  sorry

/-! ### Layer 4: elementary functions and unit argument -/

/-- **4.1** DLMF 15.4.1, with the denominator cleared: at `z = 0` the literal right side
`−z⁻¹ log(1 − z)` is Lean's `0`. -/
theorem mul_gaussHypergeometric_one_one_two {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    z * gaussHypergeometric 1 1 2 z = -Complex.log (1 - z) := sorry

/-- **4.1** DLMF 15.4.7, with the domain attached to the argument `z²`. -/
theorem gaussHypergeometric_sq_15_4_7 (a : ℂ) {z : ℂ} (hz : 1 - z ^ 2 ∈ slitPlane) :
    gaussHypergeometric a (1 / 2 + a) (1 / 2) (z ^ 2) =
      ((1 + z) ^ (-(2 * a)) + (1 - z) ^ (-(2 * a))) / 2 := sorry

/-- **4.2** DLMF 15.4.20 (Gauss): the series at `z = 1`. -/
theorem ordinaryHypergeometric_one {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : 0 < (c - a - b).re) :
    ₂F₁ a b c (1 : ℂ) = Gamma c * Gamma (c - a - b) / (Gamma (c - a) * Gamma (c - b)) := sorry

/-- **4.2** DLMF 15.4.20: the limit of the principal branch at `z = 1` in the cut plane. -/
theorem tendsto_gaussHypergeometric_one {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : 0 < (c - a - b).re) :
    Tendsto (gaussHypergeometric a b c) (𝓝[{z | 1 - z ∈ slitPlane}] 1)
      (𝓝 (₂F₁ a b c (1 : ℂ))) := sorry

/-- **4.2** DLMF 15.4.24 (Chu–Vandermonde). -/
theorem ordinaryHypergeometric_neg_nat_one (n : ℕ) (b : ℂ) {c : ℂ} (hc : poch(c, n) ≠ 0) :
    ₂F₁ (-n : ℂ) b c (1 : ℂ) = poch(c - b, n) / poch(c, n) := sorry

/-- **4.2** DLMF 15.4.25 (Dougall's bilateral sum). -/
theorem hasSum_dougall {a b c d : ℂ} (ha : ∀ n : ℤ, a ≠ n) (hb : ∀ n : ℤ, b ≠ n)
    (h : 1 < (c + d - a - b).re) :
    HasSum (fun n : ℤ => Gamma (a + n) * Gamma (b + n) * (Gamma (c + n))⁻¹ * (Gamma (d + n))⁻¹)
      ((π : ℂ) ^ 2 / (Complex.sin (π * a) * Complex.sin (π * b)) * Gamma (c + d - a - b - 1) *
        ((Gamma (c - a))⁻¹ * (Gamma (d - a))⁻¹ * (Gamma (c - b))⁻¹ * (Gamma (d - b))⁻¹)) :=
  sorry

/-- **4.2** DLMF 15.4.21. -/
theorem tendsto_gaussHypergeometric_div_neg_log {a b : ℂ} (hc : ∀ k : ℕ, a + b ≠ -k) :
    Tendsto (fun x : ℝ => gaussHypergeometric a b (a + b) x / -Complex.log (1 - (x : ℂ)))
      (𝓝[<] 1) (𝓝 (Gamma (a + b) * ((Gamma a)⁻¹ * (Gamma b)⁻¹))) := sorry

/-- **4.2** DLMF 15.4.22. -/
theorem tendsto_cpow_mul_gaussHypergeometric_sub {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : (c - a - b).re = 0) (hne : c ≠ a + b) :
    Tendsto (fun x : ℝ => (1 - (x : ℂ)) ^ (a + b - c) * (gaussHypergeometric a b c x -
        Gamma c * Gamma (c - a - b) * ((Gamma (c - a))⁻¹ * (Gamma (c - b))⁻¹)))
      (𝓝[<] 1) (𝓝 (Gamma c * Gamma (a + b - c) * ((Gamma a)⁻¹ * (Gamma b)⁻¹))) := sorry

/-- **4.2** DLMF 15.4.23. -/
theorem tendsto_gaussHypergeometric_div_cpow_one_sub {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : (c - a - b).re < 0) :
    Tendsto (fun x : ℝ => gaussHypergeometric a b c x / (1 - (x : ℂ)) ^ (c - a - b)) (𝓝[<] 1)
      (𝓝 (Gamma c * Gamma (a + b - c) * ((Gamma a)⁻¹ * (Gamma b)⁻¹))) := sorry

/-- **4.3** §15.2(i): on `|z| = 1` the series converges absolutely when `Re(c − a − b) > 0`. -/
theorem summable_norm_gaussTerm_of_re_pos {a b c z : ℂ} (hc : ∀ k : ℕ, c ≠ -k) (hz : ‖z‖ = 1)
    (h : 0 < (c - a - b).re) :
    Summable fun s : ℕ => ‖poch(a, s) * poch(b, s) / (poch(c, s) * (s ! : ℂ)) * z ^ s‖ := sorry

/-- **4.3** §15.2(i): on `|z| = 1`, `z ≠ 1`, the nonterminating series converges, but not
absolutely, when `−1 < Re(c − a − b) ≤ 0`, and its sum is the principal branch. -/
theorem tendsto_sum_gaussTerm_of_re_nonpos {a b c z : ℂ} (ha : ∀ k : ℕ, a ≠ -k)
    (hb : ∀ k : ℕ, b ≠ -k) (hc : ∀ k : ℕ, c ≠ -k) (hz : ‖z‖ = 1) (hz₁ : z ≠ 1)
    (h₁ : -1 < (c - a - b).re) (h₂ : (c - a - b).re ≤ 0) :
    Tendsto (fun N => ∑ s ∈ Finset.range N,
        poch(a, s) * poch(b, s) / (poch(c, s) * (s ! : ℂ)) * z ^ s) atTop
      (𝓝 (gaussHypergeometric a b c z)) ∧
    ¬ Summable fun s : ℕ => ‖poch(a, s) * poch(b, s) / (poch(c, s) * (s ! : ℂ)) * z ^ s‖ :=
  sorry

/-- **4.3** §15.2(i): on `|z| = 1` the nonterminating series diverges when
`Re(c − a − b) ≤ −1`. -/
theorem not_tendsto_sum_gaussTerm_of_re_le_neg_one {a b c z : ℂ} (ha : ∀ k : ℕ, a ≠ -k)
    (hb : ∀ k : ℕ, b ≠ -k) (hc : ∀ k : ℕ, c ≠ -k) (hz : ‖z‖ = 1) (h : (c - a - b).re ≤ -1) :
    ¬ ∃ L : ℂ, Tendsto (fun N => ∑ s ∈ Finset.range N,
        poch(a, s) * poch(b, s) / (poch(c, s) * (s ! : ℂ)) * z ^ s) atTop (𝓝 L) := sorry

/-! ### Layer 5: linear transformations and connection formulas -/

/-- **5.1** DLMF 15.8.1 (Euler's transformation) on the cut plane. -/
theorem regularizedGaussHypergeometric_euler (a b c : ℂ) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = (1 - z) ^ (c - a - b) * 𝐅 (c - a) (c - b) c z := sorry

/-- **5.1** DLMF 15.8.1 (Pfaff's transformation) on the cut plane. -/
theorem regularizedGaussHypergeometric_pfaff (a b c : ℂ) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = (1 - z) ^ (-a) * 𝐅 a (c - b) c (z / (z - 1)) := sorry

/-- **5.1** DLMF 15.8.2 on `|ph(−z)| < π`, for all parameters. -/
theorem regularizedGaussHypergeometric_connection_infty (a b c : ℂ) {z : ℂ}
    (hz : -z ∈ slitPlane) :
    Complex.sin (π * (b - a)) / π * 𝐅 a b c z =
      (-z) ^ (-a) * (Gamma b * Gamma (c - a))⁻¹ * 𝐅 a (a - c + 1) (a - b + 1) z⁻¹ -
        (-z) ^ (-b) * (Gamma a * Gamma (c - b))⁻¹ * 𝐅 b (b - c + 1) (b - a + 1) z⁻¹ := sorry

/-- **5.1** DLMF 15.8.4 on `|ph z| < π`, `|ph(1 − z)| < π`, for all parameters. -/
theorem regularizedGaussHypergeometric_connection_one (a b c : ℂ) {z : ℂ}
    (hz₀ : z ∈ slitPlane) (hz₁ : 1 - z ∈ slitPlane) :
    Complex.sin (π * (c - a - b)) / π * 𝐅 a b c z =
      (Gamma (c - a) * Gamma (c - b))⁻¹ * 𝐅 a b (a + b - c + 1) (1 - z) -
        (1 - z) ^ (c - a - b) * (Gamma a * Gamma b)⁻¹ * 𝐅 (c - a) (c - b) (c - a - b + 1) (1 - z) :=
  sorry

/-- **5.1** DLMF 15.2.3: the jump across the cut. -/
theorem tendsto_regularizedGaussHypergeometric_jump (a b c : ℂ) {x : ℝ} (hx : 1 < x) :
    Tendsto (fun ε : ℝ => 𝐅 a b c (x + ε * I) - 𝐅 a b c (x - ε * I)) (𝓝[>] 0)
      (𝓝 (2 * π * I * (Gamma a * Gamma b)⁻¹ * ((x : ℂ) - 1) ^ (c - a - b) *
        𝐅 (c - a) (c - b) (c - a - b + 1) (1 - x))) := sorry

/-- **5.2** DLMF 15.8.10 (`c − a − b = m`) on `|z − 1| < 1` in the cut plane, for
`a, b ∉ {0, −1, −2, …}`: the logarithmic series sums to `𝐅` minus the finite sum. -/
theorem regularizedGaussHypergeometric_log_15_8_10 {a b z : ℂ} (m : ℕ) (ha : ∀ k : ℕ, a ≠ -k)
    (hb : ∀ k : ℕ, b ≠ -k) (hz₁ : ‖z - 1‖ < 1) (hz : 1 - z ∈ slitPlane) :
    HasSum (fun k : ℕ => -((z - 1) ^ m * ((Gamma a)⁻¹ * (Gamma b)⁻¹) *
        (poch(a + m, k) * poch(b + m, k) / ((k ! : ℂ) * ((k + m)! : ℂ))) * (1 - z) ^ k *
        (Complex.log (1 - z) - digamma ((k : ℂ) + 1) - digamma ((k : ℂ) + m + 1) +
          digamma (a + k + m) + digamma (b + k + m))))
      (𝐅 a b (a + b + m) z - (Gamma (a + m))⁻¹ * (Gamma (b + m))⁻¹ *
        ∑ k ∈ Finset.range m,
          poch(a, k) * poch(b, k) * ((m - k - 1)! : ℂ) / (k ! : ℂ) * (z - 1) ^ k) := sorry

/-- **5.3** DLMF 15.10.15: the four expressions of Kummer's solution `w₅` agree on `Im z > 0`. -/
theorem gaussHypergeometric_kummer_w5_of_im_pos {a b c z : ℂ} (hab : ∀ k : ℕ, a - b + 1 ≠ -k)
    (hz : 0 < z.im) :
    let w := cexp (a * π * I) * z ^ (-a) * gaussHypergeometric a (a - c + 1) (a - b + 1) z⁻¹
    w = cexp ((c - b) * π * I) * z ^ (b - c) * (1 - z) ^ (c - a - b) *
        gaussHypergeometric (1 - b) (c - b) (a - b + 1) z⁻¹ ∧
      w = (1 - z) ^ (-a) * gaussHypergeometric a (c - b) (a - b + 1) (1 - z)⁻¹ ∧
      w = cexp ((c - 1) * π * I) * z ^ (1 - c) * (1 - z) ^ (c - a - 1) *
        gaussHypergeometric (1 - b) (a - c + 1) (a - b + 1) (1 - z)⁻¹ := sorry

/-- **5.4** DLMF 15.10.25 on the upper half-plane, as printed. -/
theorem gaussHypergeometric_eq_w5_w6_of_im_pos {a b c z : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (hab : ∀ n : ℤ, a - b ≠ n) (hz : 0 < z.im) :
    gaussHypergeometric a b c z =
      Gamma c * Gamma (b - a) / (Gamma b * Gamma (c - a)) *
          (cexp (a * π * I) * z ^ (-a) * gaussHypergeometric a (a - c + 1) (a - b + 1) z⁻¹) +
        Gamma c * Gamma (a - b) / (Gamma a * Gamma (c - b)) *
          (cexp (b * π * I) * z ^ (-b) * gaussHypergeometric b (b - c + 1) (b - a + 1) z⁻¹) :=
  sorry

/-- **5.4** DLMF 15.10.25 on the lower half-plane, with `i` replaced by `−i`; the printed form
fails there. -/
theorem gaussHypergeometric_eq_w5_w6_of_im_neg {a b c z : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (hab : ∀ n : ℤ, a - b ≠ n) (hz : z.im < 0) :
    gaussHypergeometric a b c z =
      Gamma c * Gamma (b - a) / (Gamma b * Gamma (c - a)) *
          (cexp (-(a * π * I)) * z ^ (-a) * gaussHypergeometric a (a - c + 1) (a - b + 1) z⁻¹) +
        Gamma c * Gamma (a - b) / (Gamma a * Gamma (c - b)) *
          (cexp (-(b * π * I)) * z ^ (-b) * gaussHypergeometric b (b - c + 1) (b - a + 1) z⁻¹) :=
  sorry

/-! ### Layer 6: integral representations -/

/-- **6.1** DLMF 15.6.8, a fractional integral. -/
theorem regularizedGaussHypergeometric_eq_integral_15_6_8 (a b : ℂ) {c d z : ℂ} (hd : 0 < d.re)
    (hdc : d.re < c.re) (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = (Gamma (c - d))⁻¹ *
      ∫ t in (0 : ℝ)..1, 𝐅 a b d (z * t) * (t : ℂ) ^ (d - 1) * (1 - (t : ℂ)) ^ (c - d - 1) := sorry

/-- **6.1** DLMF 15.6.9, for every `λ` (here `lam`). -/
theorem regularizedGaussHypergeometric_eq_integral_15_6_9 (a b lam : ℂ) {c d z : ℂ}
    (hd : 0 < d.re) (hdc : d.re < c.re) (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (d - 1) * (1 - (t : ℂ)) ^ (c - d - 1) *
      (1 - z * t) ^ (-(a + b - lam)) * 𝐅 (lam - a) (lam - b) d (z * t) *
        𝐅 (a + b - lam) (lam - d) (c - d) ((1 - t) * z / (1 - z * t)) := sorry

/-- **6.3** DLMF 15.6.6 (Mellin–Barnes), on the line `Re t = σ` with
`−min(Re a, Re b) < σ < 0`. -/
theorem regularizedGaussHypergeometric_eq_mellinBarnes (a b c : ℂ) {z : ℂ}
    (hz : -z ∈ slitPlane) {σ : ℝ} (hσ : σ < 0) (haσ : -a.re < σ) (hbσ : -b.re < σ) :
    𝐅 a b c z = (2 * π * Gamma a * Gamma b)⁻¹ *
      ∫ y : ℝ, Gamma (a + (σ + y * I)) * Gamma (b + (σ + y * I)) * Gamma (-(σ + y * I)) *
        (Gamma (c + (σ + y * I)))⁻¹ * (-z) ^ (σ + y * I) := sorry

/-- **6.3** Barnes's first lemma (DLMF 5.13.3, auxiliary, for 15.6.7). -/
theorem integral_Gamma_mul_Gamma_mul_Gamma_mul_Gamma {a b c d : ℂ} (ha : 0 < a.re)
    (hb : 0 < b.re) (hc : 0 < c.re) (hd : 0 < d.re) :
    (2 * π : ℂ)⁻¹ * ∫ y : ℝ, Gamma (a + y * I) * Gamma (b + y * I) * Gamma (c - y * I) *
        Gamma (d - y * I) =
      Gamma (a + c) * Gamma (a + d) * Gamma (b + c) * Gamma (b + d) / Gamma (a + b + c + d) :=
  sorry

/-- **6.3** DLMF 15.6.7 on the cut plane, on a line `Re t = σ` that separates the poles of
`Γ(a + t) Γ(b + t)` from those of `Γ(c − a − b − t) Γ(−t)`. -/
theorem regularizedGaussHypergeometric_eq_mellinBarnes_one_sub (a b c : ℂ) {z : ℂ}
    (hz : 1 - z ∈ slitPlane) {σ : ℝ} (hσ : σ < 0) (hσc : σ < (c - a - b).re) (haσ : -a.re < σ)
    (hbσ : -b.re < σ) :
    𝐅 a b c z = (2 * π * Gamma a * Gamma b * Gamma (c - a) * Gamma (c - b))⁻¹ *
      ∫ y : ℝ, Gamma (a + (σ + y * I)) * Gamma (b + (σ + y * I)) *
        Gamma (c - a - b - (σ + y * I)) * Gamma (-(σ + y * I)) * (1 - z) ^ (σ + y * I) := sorry

/-! ### Layer 7: quadratic transformations -/

/-- **7.1** DLMF 15.8.13 on the cut plane. -/
theorem gaussHypergeometric_quadratic_15_8_13 (a : ℂ) {b z : ℂ} (hb : ∀ k : ℕ, 2 * b ≠ -k)
    (hz : 1 - z ∈ slitPlane) :
    gaussHypergeometric a b (2 * b) z =
      (1 - z / 2) ^ (-a) *
        gaussHypergeometric (a / 2) (a / 2 + 1 / 2) (b + 1 / 2) ((z / (2 - z)) ^ 2) :=
  sorry

/-- **7.3** DLMF 15.4.26 (Kummer). -/
theorem gaussHypergeometric_neg_one {a b : ℂ} (hc : ∀ k : ℕ, a - b + 1 ≠ -k)
    (ha : ∀ k : ℕ, a / 2 + 1 ≠ -k) :
    gaussHypergeometric a b (a - b + 1) (-1) =
      Gamma (a - b + 1) * Gamma (a / 2 + 1) / (Gamma (a + 1) * Gamma (a / 2 - b + 1)) := sorry

/-- **7.3** DLMF 15.4.28 (Gauss's second theorem). -/
theorem gaussHypergeometric_half {a b : ℂ} (hc : ∀ k : ℕ, (a + b + 1) / 2 ≠ -k) :
    gaussHypergeometric a b ((a + b + 1) / 2) (1 / 2) =
      Real.sqrt π * Gamma ((a + b + 1) / 2) / (Gamma ((a + 1) / 2) * Gamma ((b + 1) / 2)) :=
  sorry

/-! ### Layer 8: cubic transformations -/

/-- **8.1** DLMF 15.8.31 on `Re z < 8/9`. -/
theorem gaussHypergeometric_cubic_15_8_31 {a z : ℂ} (h : ∀ k : ℕ, 4 * a + 2 / 3 ≠ -k)
    (hz : z.re < 8 / 9) :
    gaussHypergeometric (3 * a) (3 * a + 1 / 2) (4 * a + 2 / 3) z =
      (1 - 9 / 8 * z) ^ (-(2 * a)) *
        gaussHypergeometric a (a + 1 / 2) (2 * a + 5 / 6)
          (27 * z ^ 2 * (z - 1) / (9 * z - 8) ^ 2) :=
  sorry

/-- **8.1** DLMF 15.8.33 (Ramanujan's cubic transformation). -/
theorem gaussHypergeometric_ramanujan {z : ℂ}
    (hz : ‖z - (1 / 4 + Real.sqrt 3 / 4 * I)‖ < Real.sqrt 3 / 2 ∧
      ‖z - (1 / 4 - Real.sqrt 3 / 4 * I)‖ < Real.sqrt 3 / 2) :
    gaussHypergeometric (1 / 3) (2 / 3) 1 (1 - ((1 - z) / (1 + 2 * z)) ^ 3) =
      (1 + 2 * z) * gaussHypergeometric (1 / 3) (2 / 3) 1 (z ^ 3) := sorry

/-- **8.1** The cubic transformation behind 15.4.31 (DLMF's note cites Erdélyi et al. 1953a,
Eq. 2.11(41)), on the lens between `−1/3` and `1/9` where `ψ(x) = −27x(1 − x)²/(1 − 9x)²` stays off
`[1, ∞)`. -/
theorem gaussHypergeometric_cubic_three_halves {a x : ℂ} (hc : ∀ k : ℕ, 3 / 2 - 2 * a ≠ -k)
    (hx : x ≠ -1 / 3) (hx₉ : 1 - 9 * x ∈ slitPlane)
    (harg : |3 * arg (1 + 3 * x) - 2 * arg (1 - 9 * x)| < π) :
    gaussHypergeometric a (a + 1 / 2) (3 / 2 - 2 * a) x =
      (1 - x) ^ (1 - 4 * a) * (1 - 9 * x) ^ (2 * a - 2 / 3) *
        gaussHypergeometric (1 / 3 - a) (5 / 6 - a) (3 / 2 - 2 * a)
          (-27 * x * (1 - x) ^ 2 / (1 - 9 * x) ^ 2) := sorry

/-- **8.2** DLMF 15.4.31. -/
theorem gaussHypergeometric_neg_one_third {a : ℂ} (hc : ∀ k : ℕ, 3 / 2 - 2 * a ≠ -k) :
    gaussHypergeometric a (1 / 2 + a) (3 / 2 - 2 * a) (-1 / 3) =
      (8 / 9 : ℂ) ^ (-(2 * a)) * Gamma (4 / 3) * Gamma (3 / 2 - 2 * a) *
        ((Gamma (3 / 2))⁻¹ * (Gamma (4 / 3 - 2 * a))⁻¹) := sorry

/-! ### Layer 9: polynomial and elliptic cases, integrals, sums and products -/

/-- **9.1** DLMF 15.9.5: Chebyshev polynomials of the first kind. -/
theorem chebyshevT_eq_ordinaryHypergeometric (n : ℕ) (x : ℂ) :
    (Polynomial.Chebyshev.T ℂ (n : ℤ)).eval x = ₂F₁ (-n : ℂ) n (1 / 2) ((1 - x) / 2) := sorry

/-- **9.1** DLMF 15.9.7: Mathlib's shifted Legendre polynomial is the terminating Gauss series,
with no further sign; at `y = (1 − x)/2` both sides are `Pₙ(x)`. -/
theorem shiftedLegendre_eval_eq_ordinaryHypergeometric (n : ℕ) (y : ℂ) :
    ((Polynomial.shiftedLegendre n).map (Int.castRingHom ℂ)).eval y =
      ₂F₁ (-n : ℂ) (n + 1) 1 y := sorry

/-- **9.1** DLMF 15.9.26: `D(k) = (K(k) − E(k))/k²`. -/
theorem legendreD_eq_ordinaryHypergeometric {k : ℝ} (hk₀ : 0 < k ^ 2) (hk : k ^ 2 < 1) :
    (TauCeti.Real.legendreK k - TauCeti.Real.legendreEc k) / k ^ 2 =
      π / 4 * ₂F₁ (1 / 2 : ℝ) (3 / 2) 2 (k ^ 2) := sorry

/-- **9.2** DLMF 15.14.1: the Mellin transform. -/
theorem integral_cpow_mul_regularizedGaussHypergeometric_neg {a b c s : ℂ} (hs : 0 < s.re)
    (ha : s.re < a.re) (hb : s.re < b.re) :
    ∫ x in Ioi (0 : ℝ), (x : ℂ) ^ (s - 1) * 𝐅 a b c (-x) =
      Gamma s * Gamma (a - s) * Gamma (b - s) / (Gamma a * Gamma b * Gamma (c - s)) := sorry

/-- **9.2** DLMF 15.15.1. The coefficients `𝐅(−s, b; c; 1/z₀)` are Mathlib's terminating series
`regularizedGaussHGFun (-s) b c z₀⁻¹`, defined for every argument: `1/z₀` may lie on the cut,
where the continued `𝐅` is the junk `0`. -/
theorem hasSum_regularizedGaussHypergeometric_inv {a b c z z₀ : ℂ} (hz₀ : z₀ ≠ 0)
    (hz : max ‖z₀‖ ‖z₀ - 1‖ < ‖z - z₀‖) :
    HasSum (fun s : ℕ => poch(a, s) / s ! * Complex.regularizedGaussHGFun (-s) b c z₀⁻¹ *
        ((1 - z / z₀)⁻¹) ^ s)
      ((1 - z₀ / z) ^ a * 𝐅 a b c z⁻¹) := sorry

/-- **9.3** DLMF 15.16.4 on the cut plane. -/
theorem gaussHypergeometric_product_15_16_4 {a b c z : ℂ} (hc : ∀ n : ℤ, c ≠ n)
    (hz : 1 - z ∈ slitPlane) :
    gaussHypergeometric a b c z * gaussHypergeometric (-a) (-b) (-c) z +
      a * b * (a - c) * (b - c) / (c ^ 2 * (1 - c ^ 2)) * z ^ 2 *
        gaussHypergeometric (1 + a) (1 + b) (2 + c) z *
          gaussHypergeometric (1 - a) (1 - b) (2 - c) z = 1 := sorry

/-- **9.3** DLMF 15.16.5 (Elliott's generalized Legendre relation), with `Γ(½ + μ)` in place of
DLMF's misprinted `Γ(½ + ν)`; `lam`, `mu`, `nu` are DLMF's `λ`, `μ`, `ν`. -/
theorem gaussHypergeometric_legendreRelation {lam mu nu z : ℂ}
    (h₁ : ∀ k : ℕ, 1 + lam + mu ≠ -k) (h₂ : ∀ k : ℕ, 1 + nu + mu ≠ -k) (hz₀ : z ∈ slitPlane)
    (hz₁ : 1 - z ∈ slitPlane) :
    gaussHypergeometric (1 / 2 + lam) (-1 / 2 - nu) (1 + lam + mu) z *
        gaussHypergeometric (1 / 2 - lam) (1 / 2 + nu) (1 + nu + mu) (1 - z) +
      gaussHypergeometric (1 / 2 + lam) (1 / 2 - nu) (1 + lam + mu) z *
        gaussHypergeometric (-1 / 2 - lam) (1 / 2 + nu) (1 + nu + mu) (1 - z) -
      gaussHypergeometric (1 / 2 + lam) (1 / 2 - nu) (1 + lam + mu) z *
        gaussHypergeometric (1 / 2 - lam) (1 / 2 + nu) (1 + nu + mu) (1 - z) =
      Gamma (1 + lam + mu) * Gamma (1 + nu + mu) *
        ((Gamma (lam + mu + nu + 3 / 2))⁻¹ * (Gamma (1 / 2 + mu))⁻¹) := sorry

/-- **9.4** DLMF 8.14.6 for `Re s > −1`, with `Γ(b, x) = ∫_x^∞ u^{b−1} e^{−u} du`. -/
theorem integral_cpow_mul_exp_mul_upperIncompleteGamma {a b s : ℂ} (ha : 0 < a.re)
    (hab : 0 < (a + b).re) (hs : -1 < s.re) :
    ∫ x in Ioi (0 : ℝ), (x : ℂ) ^ (a - 1) * cexp (-(s * x)) *
        (∫ u in Ioi x, (u : ℂ) ^ (b - 1) * cexp (-(u : ℂ))) =
      Gamma (a + b) / (a * (1 + s) ^ (a + b)) *
        gaussHypergeometric 1 (a + b) (1 + a) (s / (1 + s)) := sorry

/-- **9.4** DLMF 8.17.9 for `0 ≤ x < 1`, with `B_x(a, b)` as its integral. -/
theorem incompleteBeta_eq_gaussHypergeometric {a b x : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hx₀ : 0 ≤ x) (hx₁ : x < 1) :
    (((∫ t in (0 : ℝ)..x, t ^ (a - 1) * (1 - t) ^ (b - 1)) : ℝ) : ℂ) =
      (x : ℂ) ^ (a : ℂ) * (1 - (x : ℂ)) ^ ((b : ℂ) - 1) / a *
        gaussHypergeometric 1 (1 - (b : ℂ)) ((a : ℂ) + 1) ((x : ℂ) / ((x : ℂ) - 1)) := sorry

/-- **9.4** DLMF 8.19.25 for `Re a > −1`, with `E_p(t) = ∫_1^∞ e^{−tu} u^{−p} du` and the
hypothesis `Re b > 0`. -/
theorem integral_exp_mul_cpow_mul_expIntegralE_of_re_gt_neg_one {a b p : ℂ} (ha : -1 < a.re)
    (hb : 0 < b.re) (hpb : 1 < (p + b).re) :
    ∫ t in Ioi (0 : ℝ), cexp (-(a * t)) * (t : ℂ) ^ (b - 1) *
        (∫ u in Ioi (1 : ℝ), cexp (-((t : ℂ) * u)) * (u : ℂ) ^ (-p)) =
      Gamma b * (1 + a) ^ (-b) / (p + b - 1) * gaussHypergeometric 1 b (p + b) (a / (1 + a)) :=
  sorry

#check @_root_.Complex.regularizedGaussHGFun
#check @_root_.Complex.arctan
#check @_root_.Differentiable.apply_eq_apply_of_bounded
#check @_root_.mellinInv_mellin_eq
#check @_root_.Complex.ordinaryHypergeometric_div_Gamma_eq
#check @_root_.Complex.starConvex_one_slitPlane
#check @_root_.Complex.Gamma_mul_Gamma_eq_betaIntegral
#check @_root_.Complex.digamma
#check @_root_.Complex.arg
#check @_root_.Polynomial.Chebyshev.T_complex_cos
#check @_root_.Polynomial.shiftedLegendre
#check @_root_.Polynomial.coeff_shiftedLegendre
#check @_root_.TauCeti.Real.legendreK_eq_ordinaryHypergeometric
#check @_root_.TauCeti.Real.legendreEc_eq_ordinaryHypergeometric

end TauCetiRoadmap.SpecialFunctionsHypergeometric
