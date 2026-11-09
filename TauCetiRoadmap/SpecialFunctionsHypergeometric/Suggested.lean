module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Hypergeometric

/-!
# The Gauss hypergeometric function: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer. The definitive document is `README.md`, which states every target; this
file states a selection of them, and discharging it finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
they live in `Complex`, beside Mathlib's `Complex.regularizedGaussHGFun`; here they live in this
file's `Complex` subnamespace. They are stated with their intended bodies so that the conventions
are checked by the compiler: Euler's integral as an `intervalIntegral` with principal powers, the
definition of `𝐅` by Euler's integral and uniqueness (`Classical.choose`, with the junk value `0`
off the cut plane), `F = Γ(c) 𝐅`, reciprocal Gamma factors, and the cut plane written as
`1 - z ∈ slitPlane`. Theorems are stated with `sorry`.

The construction of the continuation by contiguous shifts is a theorem
(`exists_isEulerContinuation`, with the shift relations and the fixed-count `shiftConstruction`),
not the definition. Where the README pins a domain or a removable point, the prototypes state it:
the pair at `∞` on `ℂ \ (−∞, 1]`, 15.4.1 with its denominator cleared, 15.4.7 with the domain of
its argument `z²`, and the coefficients of 15.15.1 as Mathlib's terminating series.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsHypergeometric

open Complex Filter Topology Set MeasureTheory
open scoped Real Nat ComplexConjugate

/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### Definitions -/

namespace Complex

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

/-- The shift construction with fixed counts (auxiliary): `p` shifts in `b`, then `q` shifts in
`c`, ending in Euler's integral. It is holomorphic on `Re b > −p`, `Re (c − b) > p − q` times the
cut plane, and the existence proof glues these functions. -/
def shiftConstruction : ℕ → ℕ → ℂ → ℂ → ℂ → ℂ → ℂ
  | 0, 0, a, b, c, z => eulerIntegral a b c z
  | 0, q + 1, a, b, c, z =>
      (c - a) * shiftConstruction 0 q a b (c + 1) z + a * shiftConstruction 0 q (a + 1) b (c + 1) z
  | p + 1, q, a, b, c, z =>
      shiftConstruction p q a (b + 1) c z - a * z * shiftConstruction p q (a + 1) (b + 1) (c + 1) z

end Complex

open Complex

/-- `𝐅(a, b; c; z)`. -/
local notation "𝐅" => regularizedGaussHypergeometric

/-! ### Layer 1: definition and analytic properties -/

/-- **1.1** Euler's integral is holomorphic in `(a, b, c, z)` on `0 < Re b < Re c` times the cut
plane. -/
theorem differentiableOn_eulerIntegral :
    DifferentiableOn ℂ (fun p : ℂ × ℂ × ℂ × ℂ => eulerIntegral p.1 p.2.1 p.2.2.1 p.2.2.2)
      (univ ×ˢ {q : ℂ × ℂ × ℂ | 0 < q.1.re ∧ q.1.re < q.2.1.re} ∩
        {p | 1 - p.2.2.2 ∈ slitPlane}) := sorry

/-- **1.2** Uniqueness: two continuations of Euler's integral agree on the cut plane. -/
theorem IsEulerContinuation.eq {G₁ G₂ : ℂ → ℂ → ℂ → ℂ → ℂ} (h₁ : IsEulerContinuation G₁)
    (h₂ : IsEulerContinuation G₂) {a b c z : ℂ} (hz : 1 - z ∈ slitPlane) :
    G₁ a b c z = G₂ a b c z := sorry

/-- **1.2** The shift construction with fixed counts is holomorphic on its region. -/
theorem differentiableOn_shiftConstruction (p q : ℕ) :
    DifferentiableOn ℂ (fun x : ℂ × ℂ × ℂ × ℂ => shiftConstruction p q x.1 x.2.1 x.2.2.1 x.2.2.2)
      {x | -(p : ℝ) < x.2.1.re ∧ (p : ℝ) - q < (x.2.2.1 - x.2.1).re ∧
        1 - x.2.2.2 ∈ slitPlane} := sorry

/-- **1.2** On its region the shift construction is `𝐅`; in particular constructions with
different counts agree where their regions overlap. -/
theorem regularizedGaussHypergeometric_eq_shiftConstruction (p q : ℕ) {a b c z : ℂ}
    (hb : -(p : ℝ) < b.re) (hbc : (p : ℝ) - q < (c - b).re) (hz : 1 - z ∈ slitPlane) :
    𝐅 a b c z = shiftConstruction p q a b c z := sorry

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

/-- **1.4** The value at `z = 0`. -/
theorem regularizedGaussHypergeometric_zero (a b c : ℂ) : 𝐅 a b c 0 = (Gamma c)⁻¹ := sorry

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

/-- **3.1** The span criterion: two solutions of 15.10.1 with nonvanishing Wronskian on a
connected open set span the solutions there. -/
theorem exists_eqOn_combination_of_wronskian_ne_zero {a b c : ℂ} {U : Set ℂ} (hU : IsOpen U)
    (hUc : IsConnected U) {f₁ f₂ w : ℂ → ℂ}
    (hsol : ∀ f ∈ ({f₁, f₂, w} : Set (ℂ → ℂ)), DifferentiableOn ℂ f U ∧
      ∀ z ∈ U, z * (1 - z) * deriv (deriv f) z + (c - (a + b + 1) * z) * deriv f z -
        a * b * f z = 0)
    (hW : ∀ z ∈ U, f₁ z * deriv f₂ z - deriv f₁ z * f₂ z ≠ 0) :
    ∃ α β : ℂ, EqOn w (fun z => α * f₁ z + β * f₂ z) U := sorry

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
    (hz₀ : z ∈ slitPlane) (hz₁ : z - 1 ∈ slitPlane) :
    let f₁ := fun ζ : ℂ => ζ ^ (-a) * gaussHypergeometric a (a - c + 1) (a - b + 1) ζ⁻¹
    let f₂ := fun ζ : ℂ => ζ ^ (-b) * gaussHypergeometric b (b - c + 1) (b - a + 1) ζ⁻¹
    f₁ z * deriv f₂ z - deriv f₁ z * f₂ z = (a - b) * z ^ (-c) * (z - 1) ^ (c - a - b - 1) :=
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

/-- **4.2** The periodic Carlson lemma (auxiliary, for Dougall's sum). -/
theorem eq_zero_of_periodic_of_bound {f : ℂ → ℂ} {δ : ℝ} (hδ : 0 < δ)
    (hf : DifferentiableOn ℂ f {w : ℂ | -δ < w.re})
    (hper : ∀ w : ℂ, 0 ≤ w.re → f (w + 1) = f w) {C σ : ℝ} {K : ℕ} (hσ : σ < π)
    (hb : ∀ w : ℂ, 0 ≤ w.re → w.re ≤ 1 →
      ‖f w‖ ≤ C * (1 + |w.im|) ^ K * Real.exp (σ * |w.im|))
    (h0 : f 0 = 0) : ∀ w : ℂ, 0 ≤ w.re → f w = 0 := sorry

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

/-! ### Layer 7: quadratic transformations -/

/-- **7.1** DLMF 15.8.13 on the cut plane. -/
theorem gaussHypergeometric_quadratic_15_8_13 (a : ℂ) {b z : ℂ} (hb : ∀ k : ℕ, 2 * b ≠ -k)
    (hb' : ∀ k : ℕ, b + 1 / 2 ≠ -k) (hz : 1 - z ∈ slitPlane) :
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
theorem gaussHypergeometric_cubic_15_8_31 {a z : ℂ} (h₁ : ∀ k : ℕ, 4 * a + 2 / 3 ≠ -k)
    (h₂ : ∀ k : ℕ, 2 * a + 5 / 6 ≠ -k) (hz : z.re < 8 / 9) :
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

#check @_root_.Complex.regularizedGaussHGFun
#check @_root_.Complex.arctan
#check @_root_.Differentiable.apply_eq_apply_of_bounded
#check @_root_.mellinInv_mellin_eq
#check @_root_.Complex.ordinaryHypergeometric_div_Gamma_eq
#check @_root_.Complex.starConvex_one_slitPlane
#check @_root_.Complex.Gamma_mul_Gamma_eq_betaIntegral
#check @_root_.Complex.digamma
#check @_root_.Polynomial.Chebyshev.T_complex_cos
#check @_root_.Polynomial.shiftedLegendre
#check @_root_.Polynomial.coeff_shiftedLegendre
#check @_root_.TauCeti.Real.legendreK_eq_ordinaryHypergeometric
#check @_root_.TauCeti.Real.legendreEc_eq_ordinaryHypergeometric

end TauCetiRoadmap.SpecialFunctionsHypergeometric
