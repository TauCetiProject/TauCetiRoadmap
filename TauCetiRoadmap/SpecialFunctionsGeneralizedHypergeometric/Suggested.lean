module

public import Mathlib

/-!
# The generalized hypergeometric functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib. `README.md` is
the definitive document and states every target. One headline is not stated here because its
carrier is not at the pins: the agreement of 1.2 with the principal branch of the Gauss function,
whose carrier `Complex.regularizedGaussHypergeometric` is in neither Mathlib nor Tau Ceti.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
they live in `Complex`, beside Mathlib's `Complex.regularizedHGFun`. They are stated with their
intended bodies so that the conventions are checked by the compiler: the principal branch for
`p = q + 1` as `Classical.choose` of a continuation of Mathlib's series to the cut plane, with the
junk value `0` off it, Mathlib's series for `p ≠ q + 1`, `F = Γ(b₁) ⋯ Γ(b_q) 𝐅`, and the cut plane
written as `1 - z ∈ slitPlane`. Theorems are stated with `sorry`.

The helpers `hgDomain` (the domain of `𝐅(a; b; ·)`), `terminatingSum` (a terminating sum as a
finite sum of Pochhammer quotients) and `thetaShift` (the operator `ϑ + c`) only abbreviate
statements.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsGeneralizedHypergeometric

open Complex Filter Topology Set MeasureTheory Finset
open scoped Real Nat ComplexConjugate

/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### Definitions -/

/-- `f` is a principal continuation of Mathlib's series `∑ₙ regularizedHGFunCoeff a b n zⁿ`: it is
holomorphic on the cut plane `ℂ \ [1, ∞)` and equals the series on the unit disk. -/
def IsPrincipalContinuation (a b : Multiset ℂ) (f : ℂ → ℂ) : Prop :=
  DifferentiableOn ℂ f {z | 1 - z ∈ slitPlane} ∧
    EqOn f (regularizedHGFun a b) (Metric.ball 0 1)

open scoped Classical in
/-- The regularized generalized hypergeometric function `𝐅(𝐚; 𝐛; z)` (DLMF 16.2.5): Mathlib's
series for `p ≠ q + 1`, and for `p = q + 1` the principal branch on the cut plane, which exists
and is unique (`exists_isPrincipalContinuation`, `IsPrincipalContinuation.eqOn`). The value `0`
off the cut plane for `p = q + 1` is junk; for `p > q + 1` the value is DLMF's only when the
series terminates. -/
def regularizedGeneralizedHypergeometric (a b : Multiset ℂ) (z : ℂ) : ℂ :=
  if Multiset.card a = Multiset.card b + 1 then
    if h : ∃ f, IsPrincipalContinuation a b f then
      if 1 - z ∈ slitPlane then h.choose z else 0
    else 0
  else regularizedHGFun a b z

/-- The generalized hypergeometric function `F(𝐚; 𝐛; z) = Γ(b₁) ⋯ Γ(b_q) 𝐅(𝐚; 𝐛; z)`
(DLMF 16.2.1); the value `0` when some `b_k ∈ {0, −1, −2, …}` is Mathlib's junk value of `Γ`. -/
def generalizedHypergeometric (a b : Multiset ℂ) (z : ℂ) : ℂ :=
  (b.map Gamma).prod * regularizedGeneralizedHypergeometric a b z

/-- The domain of `𝐅(a; b; ·)`: the cut plane for `p = q + 1`, and `ℂ` otherwise. -/
def hgDomain (a b : Multiset ℂ) : Set ℂ :=
  {z | Multiset.card a = Multiset.card b + 1 → 1 - z ∈ slitPlane}

/-- The terminating sum `∑_{k ≤ n} (𝐚)ₖ/((𝐛)ₖ k!)`, the value at `1` of a series with a top
parameter `−n`, written with Pochhammer symbols. -/
def terminatingSum (a b : List ℂ) (n : ℕ) : ℂ :=
  ∑ k ∈ range (n + 1),
    (a.map fun x => poch(x, k)).prod / ((b.map fun x => poch(x, k)).prod * (k ! : ℂ))

/-- The operator `ϑ + c`, `ϑ = z d/dz`. -/
def thetaShift (c : ℂ) (g : ℂ → ℂ) : ℂ → ℂ := fun z => z * deriv g z + c * g z

/-- `𝐅(𝐚; 𝐛; z)`. -/
local notation "𝐅" => regularizedGeneralizedHypergeometric

/-- `F(𝐚; 𝐛; z)`. -/
local notation "pFq" => generalizedHypergeometric

/-! ### Layer 1: definition and analytic properties -/

/-- 1.2: uniqueness of the principal continuation on the cut plane. -/
theorem IsPrincipalContinuation.eqOn {a b : Multiset ℂ} {f g : ℂ → ℂ}
    (hf : IsPrincipalContinuation a b f) (hg : IsPrincipalContinuation a b g) :
    EqOn f g {z | 1 - z ∈ slitPlane} := sorry

/-- 1.2: existence of the principal continuation for `p = q + 1`. -/
theorem exists_isPrincipalContinuation {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b + 1) : ∃ f, IsPrincipalContinuation a b f := sorry

/-- 1.2: the shift relation raising a bottom parameter. -/
theorem regularizedGeneralizedHypergeometric_shift_bottom {a₀ a₁ b₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b) {z : ℂ}
    (hz : z ∈ hgDomain (a₀ ::ₘ a₁ ::ₘ a) (b₀ ::ₘ b)) :
    𝐅 (a₀ ::ₘ a₁ ::ₘ a) (b₀ ::ₘ b) z =
      (b₀ - a₁) * 𝐅 (a₀ ::ₘ a₁ ::ₘ a) ((b₀ + 1) ::ₘ b) z +
        a₁ * 𝐅 (a₀ ::ₘ (a₁ + 1) ::ₘ a) ((b₀ + 1) ::ₘ b) z := sorry

/-- 1.2: the shift relation raising a top parameter. -/
theorem regularizedGeneralizedHypergeometric_shift_top {a₀ b₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) {z : ℂ}
    (hz : z ∈ hgDomain (a₀ ::ₘ a) (b₀ ::ₘ b)) :
    𝐅 (a₀ ::ₘ a) (b₀ ::ₘ b) z =
      𝐅 ((a₀ + 1) ::ₘ a) (b₀ ::ₘ b) z -
        z * a.prod * 𝐅 ((a₀ + 1) ::ₘ a.map (· + 1)) ((b₀ + 1) ::ₘ b.map (· + 1)) z := sorry

/-- 1.2: Euler's integral, DLMF 16.5.2, in regularized form. -/
theorem regularizedGeneralizedHypergeometric_eq_eulerIntegral {a₀ b₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (h₀ : 0 < a₀.re) (h₁ : a₀.re < b₀.re) {z : ℂ}
    (hz : z ∈ hgDomain a b) :
    𝐅 (a₀ ::ₘ a) (b₀ ::ₘ b) z =
      (Gamma a₀ * Gamma (b₀ - a₀))⁻¹ *
        ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (a₀ - 1) * (1 - (t : ℂ)) ^ (b₀ - a₀ - 1) * 𝐅 a b (z * t) :=
  sorry

/-- 1.4: joint holomorphy in the parameters and the argument. -/
theorem differentiableOn_regularizedGeneralizedHypergeometric {p q : ℕ} (h : p ≤ q + 1) :
    DifferentiableOn ℂ
      (fun x : (Fin p → ℂ) × (Fin q → ℂ) × ℂ =>
        𝐅 (Finset.univ.val.map x.1) (Finset.univ.val.map x.2.1) x.2.2)
      {x | p = q + 1 → 1 - x.2.2 ∈ slitPlane} := sorry

/-- 1.4: conjugation. -/
theorem regularizedGeneralizedHypergeometric_conj {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) {z : ℂ} (hz : z ∈ hgDomain a b) :
    𝐅 (a.map conj) (b.map conj) (conj z) = conj (𝐅 a b z) := sorry

/-- 1.5: reversal of a terminating series, DLMF 16.2.3, for every `p` and `q`. -/
theorem terminatingSum_reverse_16_2_3 (a b : List ℂ) (m : ℕ)
    (hb : (b.map fun x => poch(x, m)).prod ≠ 0)
    (ha : (a.map fun x => poch(1 - (m : ℂ) - x, m)).prod ≠ 0) {z : ℂ} (hz : z ≠ 0) :
    ∑ k ∈ range (m + 1), poch(-(m : ℂ), k) * (a.map fun x => poch(x, k)).prod /
        ((b.map fun x => poch(x, k)).prod * (k ! : ℂ)) * z ^ k =
      (a.map fun x => poch(x, m)).prod * (-z) ^ m / (b.map fun x => poch(x, m)).prod *
        ∑ k ∈ range (m + 1), poch(-(m : ℂ), k) * (b.map fun x => poch(1 - (m : ℂ) - x, k)).prod /
          ((a.map fun x => poch(1 - (m : ℂ) - x, k)).prod * (k ! : ℂ)) *
            ((-1) ^ (a.length + b.length) / z) ^ k := sorry

/-- 1.5: the growth bound for `p = q`. -/
theorem norm_regularizedGeneralizedHypergeometric_le {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b) :
    ∃ C K : ℝ, ∀ w : ℂ, ‖𝐅 a b w‖ ≤ C * (1 + ‖w‖) ^ K * Real.exp (max w.re 0) := sorry

/-- 1.6: absolute convergence on the circle for `Re γ_q > 0`, DLMF 16.2.2. -/
theorem summable_norm_regularizedHGFunCoeff_of_re_pos {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b + 1) (hγ : 0 < (b.sum - a.sum).re) {z : ℂ}
    (hz : ‖z‖ = 1) : Summable fun n => ‖regularizedHGFunCoeff a b n * z ^ n‖ := sorry

/-- 1.6: convergence on the circle away from `1` for `−1 < Re γ_q ≤ 0`, to the principal branch. -/
theorem tendsto_partialSum_of_re_nonpos {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b + 1) (ha : ∀ x ∈ a, ∀ k : ℕ, x ≠ -k)
    (hγ₁ : -1 < (b.sum - a.sum).re) (hγ₂ : (b.sum - a.sum).re ≤ 0) {z : ℂ} (hz : ‖z‖ = 1)
    (hz₁ : z ≠ 1) :
    Tendsto (fun N => ∑ n ∈ range N, regularizedHGFunCoeff a b n * z ^ n) atTop
      (𝓝 (𝐅 a b z)) := sorry

/-- 1.6: divergence on the circle for `Re γ_q ≤ −1`. -/
theorem not_tendsto_partialSum_of_re_le_neg_one {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b + 1) (ha : ∀ x ∈ a, ∀ k : ℕ, x ≠ -k)
    (hb : ∀ x ∈ b, ∀ k : ℕ, x ≠ -k) (hγ : (b.sum - a.sum).re ≤ -1) {z : ℂ} (hz : ‖z‖ = 1) :
    ¬ ∃ s, Tendsto (fun N => ∑ n ∈ range N, regularizedHGFunCoeff a b n * z ^ n) atTop (𝓝 s) :=
  sorry

/-- 1.6: Abel's theorem at `z = 1`. -/
theorem tendsto_regularizedGeneralizedHypergeometric_one {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b + 1) (hγ : 0 < (b.sum - a.sum).re) :
    Tendsto (fun x : ℝ => 𝐅 a b x) (𝓝[<] 1) (𝓝 (regularizedHGFun a b 1)) := sorry

/-! ### Layer 2: derivatives and contiguous relations -/

/-- 2.1: DLMF 16.3.1 in regularized form. -/
theorem iteratedDeriv_regularizedGeneralizedHypergeometric {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (n : ℕ) {z : ℂ} (hz : z ∈ hgDomain a b) :
    iteratedDeriv n (𝐅 a b) z =
      (a.map fun x => poch(x, n)).prod * 𝐅 (a.map (· + n)) (b.map (· + n)) z := sorry

/-- 2.1: DLMF 16.3.2 in regularized form. -/
theorem iteratedDeriv_cpow_mul_16_3_2 {γ : ℂ} (hγ : ∀ k : ℕ, γ + 1 ≠ -k) {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (n : ℕ) {z : ℂ} (hz : z ∈ slitPlane)
    (hz' : z ∈ hgDomain a b) :
    iteratedDeriv n (fun w => w ^ γ * 𝐅 a b w) z =
      Gamma (γ + 1) * z ^ (γ - n) * 𝐅 ((γ + 1) ::ₘ a) ((γ + 1 - n) ::ₘ b) z := sorry

/-- 2.1: DLMF 16.3.3 in regularized form. -/
theorem iterate_cpow_mul_16_3_3 {γ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b) (n : ℕ) {z : ℂ} (hz : z ∈ slitPlane)
    (hz' : z ∈ hgDomain (γ ::ₘ a) b) :
    (fun g : ℂ → ℂ => fun w => w * deriv (fun v => v * g v) w)^[n]
        (fun w => w ^ (γ - 1) * 𝐅 (γ ::ₘ a) b w) z =
      poch(γ, n) * z ^ (γ + n - 1) * 𝐅 ((γ + n) ::ₘ a) b z := sorry

/-- 2.1: DLMF 16.3.4 in regularized form. -/
theorem iteratedDeriv_cpow_mul_16_3_4 {γ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 2) (n : ℕ) {z : ℂ} (hz : z ∈ slitPlane)
    (hz' : z ∈ hgDomain a (γ ::ₘ b)) :
    iteratedDeriv n (fun w => w ^ (γ - 1) * 𝐅 a (γ ::ₘ b) w) z =
      z ^ (γ - n - 1) * 𝐅 a ((γ - n) ::ₘ b) z := sorry

/-- 2.2: the first-order relation in a top parameter. -/
theorem thetaShift_regularizedGeneralizedHypergeometric_top {a₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b) {z : ℂ} (hz : z ∈ hgDomain (a₀ ::ₘ a) b) :
    thetaShift a₀ (𝐅 (a₀ ::ₘ a) b) z = a₀ * 𝐅 ((a₀ + 1) ::ₘ a) b z := sorry

/-- 2.2: the first-order relation in a bottom parameter. -/
theorem thetaShift_regularizedGeneralizedHypergeometric_bottom {b₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 2) {z : ℂ} (hz : z ∈ hgDomain a (b₀ ::ₘ b)) :
    thetaShift (b₀ - 1) (𝐅 a (b₀ ::ₘ b)) z = 𝐅 a ((b₀ - 1) ::ₘ b) z := sorry

/-- 2.2: DLMF 16.3.7. -/
theorem generalizedHypergeometric_contiguous_16_3_7 {a₁ a₂ a₃ b₁ b₂ : ℂ}
    (hb₁ : ∀ k : ℕ, b₁ ≠ -k) (hb₂ : ∀ k : ℕ, b₂ ≠ -k) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    pFq {a₁ + 2, a₂, a₃} {b₁, b₂} z * (a₁ * (a₁ + 1) * (1 - z)) +
        pFq {a₁ + 1, a₂, a₃} {b₁, b₂} z *
          (a₁ * (b₁ + b₂ - 3 * a₁ - 2 + z * (2 * a₁ - a₂ - a₃ + 1))) +
        pFq {a₁, a₂, a₃} {b₁, b₂} z *
          ((2 * a₁ - b₁) * (2 * a₁ - b₂) + a₁ - a₁ ^ 2 - z * (a₁ - a₂) * (a₁ - a₃)) -
        pFq {a₁ - 1, a₂, a₃} {b₁, b₂} z * ((a₁ - b₁) * (a₁ - b₂)) = 0 := sorry

/-! ### Layer 3: the differential equation -/

/-- 3.2: the generalized hypergeometric equation 16.8.3,
`ϑ (ϑ + b₁ − 1) ⋯ (ϑ + b_q − 1) w − z (ϑ + a₁) ⋯ (ϑ + a_p) w = 0`. -/
theorem regularizedGeneralizedHypergeometric_equation (a b : List ℂ)
    (h : a.length ≤ b.length + 1) {z : ℂ} (hz : z ∈ hgDomain (a : Multiset ℂ) (b : Multiset ℂ)) :
    thetaShift 0 (b.foldr (fun c g => thetaShift (c - 1) g) (𝐅 (a : Multiset ℂ) b)) z -
        z * a.foldr (fun c g => thetaShift c g) (𝐅 (a : Multiset ℂ) b) z = 0 := sorry

/-- 3.2: the equation in the form 16.8.4 (`p ≤ q`) and 16.8.5 (`p = q + 1`), with the leading
coefficients `α_q` and `β_q`. -/
theorem regularizedGeneralizedHypergeometric_equation_16_8_4 (a b : List ℂ)
    (h : a.length ≤ b.length + 1) :
    ∃ α β : ℕ → ℂ,
      β b.length = b.length * (b.length - 1 : ℂ) / 2 + b.sum ∧
      α b.length = (if a.length = b.length + 1 then -(b.length * (b.length + 1 : ℂ) / 2 + a.sum)
        else if a.length = b.length then -1 else 0) ∧
      ∀ z ∈ hgDomain (a : Multiset ℂ) (b : Multiset ℂ),
        (if a.length = b.length + 1 then z ^ b.length * (1 - z) else z ^ b.length) *
            iteratedDeriv (b.length + 1) (𝐅 (a : Multiset ℂ) b) z +
          ∑ j ∈ Finset.Icc 1 b.length, z ^ (j - 1) * (α j * z + β j) *
            iteratedDeriv j (𝐅 (a : Multiset ℂ) b) z +
          α 0 * 𝐅 (a : Multiset ℂ) b z = 0 := sorry

/-- 3.3: the functions `wⱼ` of the fundamental set 16.8.6 solve 16.8.3. -/
theorem solution_16_8_6 {q : ℕ} (a : List ℂ) (b : Fin q → ℂ) (h : a.length ≤ q + 1)
    (hb : ∀ j, ∀ n : ℤ, b j ≠ n) (hbb : ∀ i j, i ≠ j → ∀ n : ℤ, b i - b j ≠ n) (j : Fin q)
    {z : ℂ} (hz : z ∈ slitPlane) (hz' : z ∈ hgDomain (a : Multiset ℂ) (Finset.univ.val.map b)) :
    let w : ℂ → ℂ := fun z => z ^ (1 - b j) * pFq ((a : Multiset ℂ).map (1 + · - b j))
      ((2 - b j) ::ₘ ((Finset.univ.erase j).val.map fun k => 1 + b k - b j)) z
    thetaShift 0 ((List.ofFn b).foldr (fun c g => thetaShift (c - 1) g) w) z -
        z * a.foldr (fun c g => thetaShift c g) w z = 0 := sorry

/-- 3.3: the Wronskian of the fundamental set 16.8.6 at `0`. -/
theorem wronskian_solution_16_8_6 {q : ℕ} (a : Multiset ℂ) (b : Fin q → ℂ)
    (h : Multiset.card a ≤ q + 1) (hb : ∀ j, ∀ n : ℤ, b j ≠ n)
    (hbb : ∀ i j, i ≠ j → ∀ n : ℤ, b i - b j ≠ n) {z : ℂ} (hz : z ∈ slitPlane)
    (hz' : z ∈ hgDomain a (Finset.univ.val.map b)) :
    let w : Fin (q + 1) → ℂ → ℂ := Fin.cases (pFq a (Finset.univ.val.map b)) fun j z =>
      z ^ (1 - b j) * pFq (a.map (1 + · - b j))
        ((2 - b j) ::ₘ ((Finset.univ.erase j).val.map fun k => 1 + b k - b j)) z
    let ρ : Fin (q + 1) → ℂ := Fin.cases 0 fun j => 1 - b j
    (Matrix.of fun i j : Fin (q + 1) => iteratedDeriv i (w j) z).det =
      (∏ i : Fin (q + 1), ∏ j ∈ Finset.Ioi i, (ρ j - ρ i)) *
        z ^ (-(∑ j, b j) - (q * (q - 1) / 2 : ℂ)) *
        (if Multiset.card a = q + 1 then (1 - z) ^ ((∑ j, b j) - a.sum - q)
          else if Multiset.card a = q then exp z else 1) := sorry

/-- 3.4: the Wronskian of the fundamental set 16.8.7 at `∞`. -/
theorem wronskian_solution_16_8_7 {q : ℕ} (a : Fin (q + 1) → ℂ) (b : Multiset ℂ)
    (hb : Multiset.card b = q) (ha : ∀ i j, i ≠ j → ∀ n : ℤ, a i - a j ≠ n) :
    ∃ C : ℂ, C ≠ 0 ∧ ∀ z : ℂ, -z ∈ slitPlane →
      let w : Fin (q + 1) → ℂ → ℂ := fun j z =>
        (-z) ^ (-a j) * pFq (a j ::ₘ b.map (1 - · + a j))
          ((Finset.univ.erase j).val.map fun k => 1 - a k + a j) z⁻¹
      (Matrix.of fun i j : Fin (q + 1) => iteratedDeriv i (w j) z).det =
        C * (-z) ^ (-(∑ j, a j) - (q * (q + 1) / 2 : ℂ)) *
          (1 - z⁻¹) ^ (b.sum - (∑ j, a j) - q) := sorry

/-! ### Layer 4: argument unity -/

/-- 4.2: the Pfaff–Saalschütz sum, DLMF 16.4.3. -/
theorem terminatingSum_saalschutz (n : ℕ) (a b c d : ℂ) (hcd : c + d = a + b + 1 - n)
    (hc : poch(c, n) ≠ 0) (hd : poch(d, n) ≠ 0) :
    terminatingSum [-(n : ℂ), a, b] [c, d] n =
      poch(c - a, n) * poch(c - b, n) / (poch(c, n) * poch(c - a - b, n)) := sorry

/-- 4.2: the terminating Dixon sum, DLMF 16.4.5, for even `n = 2k`. -/
theorem terminatingSum_dixon_even (k : ℕ) (b c : ℂ)
    (h : poch(b, 2 * k) * poch(c, 2 * k) * poch(1 - b - 2 * k, 2 * k) *
      poch(1 - c - 2 * k, 2 * k) ≠ 0) :
    terminatingSum [-(2 * k : ℂ), b, c] [1 - b - 2 * k, 1 - c - 2 * k] (2 * k) =
      ((2 * k) ! : ℂ) * poch(b + c + k, k) / ((k ! : ℂ) * poch(b + k, k) * poch(c + k, k)) :=
  sorry

/-- 4.2: Dougall's very-well-poised `₇F₆` sum, DLMF 16.4.10. -/
theorem terminatingSum_dougall_7F6 (n : ℕ) (a b c d f : ℂ)
    (hbal : 2 * a + 1 = b + c + d + f - n)
    (h : poch(a / 2, n) * poch(a - b + 1, n) * poch(a - c + 1, n) * poch(a - d + 1, n) *
      poch(a - f + 1, n) * poch(a + n + 1, n) * poch(a - b - c - d + 1, n) ≠ 0) :
    terminatingSum [a, a / 2 + 1, b, c, d, f, -(n : ℂ)]
        [a / 2, a - b + 1, a - c + 1, a - d + 1, a - f + 1, a + n + 1] n =
      poch(a + 1, n) * poch(a - b - c + 1, n) * poch(a - b - d + 1, n) * poch(a - c - d + 1, n) /
        (poch(a - b + 1, n) * poch(a - c + 1, n) * poch(a - d + 1, n) *
          poch(a - b - c - d + 1, n)) := sorry

/-- 4.3: Dixon's sum, DLMF 16.4.4, in regularized form. -/
theorem regularizedHGFun_dixon {a b c : ℂ} (h : -2 < (a - 2 * b - 2 * c).re)
    (h₁ : ∀ k : ℕ, a / 2 + 1 ≠ -k) (h₂ : ∀ k : ℕ, a / 2 - b - c + 1 ≠ -k) :
    regularizedHGFun {a, b, c} {a - b + 1, a - c + 1} 1 =
      Gamma (a / 2 + 1) * Gamma (a / 2 - b - c + 1) *
        ((Gamma (a + 1))⁻¹ * (Gamma (a / 2 - b + 1))⁻¹ * (Gamma (a / 2 - c + 1))⁻¹ *
          (Gamma (a - b - c + 1))⁻¹) := sorry

/-- 4.3: Watson's sum, DLMF 16.4.6, in regularized form. -/
theorem regularizedHGFun_watson {a b c : ℂ} (h : -1 < (2 * c - a - b).re)
    (h₁ : ∀ k : ℕ, c + 1 / 2 ≠ -k) (h₂ : ∀ k : ℕ, c + (1 - a - b) / 2 ≠ -k) :
    regularizedHGFun {a, b, c} {(a + b + 1) / 2, 2 * c} 1 =
      Gamma (1 / 2) * Gamma (c + 1 / 2) * Gamma (c + (1 - a - b) / 2) *
        ((Gamma ((a + 1) / 2))⁻¹ * (Gamma ((b + 1) / 2))⁻¹ * (Gamma (c + (1 - a) / 2))⁻¹ *
          (Gamma (c + (1 - b) / 2))⁻¹ * (Gamma (2 * c))⁻¹) := sorry

/-- 4.3: Whipple's sum, DLMF 16.4.7, in regularized form. -/
theorem regularizedHGFun_whipple {a c : ℂ} (d : ℂ) (h : 0 < c.re) :
    regularizedHGFun {a, 1 - a, c} {d, 2 * c - d + 1} 1 =
      π * 2 ^ (1 - 2 * c) *
        ((Gamma (c + (a - d + 1) / 2))⁻¹ * (Gamma (c + 1 - (a + d) / 2))⁻¹ *
          (Gamma ((a + d) / 2))⁻¹ * (Gamma ((d - a + 1) / 2))⁻¹) := sorry

/-- 4.3: the Rogers–Dougall sum, DLMF 16.4.9, in regularized form. -/
theorem regularizedHGFun_rogersDougall {a b c d : ℂ} (h : (b + c + d - a).re < 1)
    (h₁ : ∀ k : ℕ, a - b - c - d + 1 ≠ -k) :
    regularizedHGFun {a, a / 2 + 1, b, c, d} {a / 2, a - b + 1, a - c + 1, a - d + 1} 1 =
      Gamma (a - b - c - d + 1) *
        ((Gamma (a / 2))⁻¹ * (Gamma (a + 1))⁻¹ * (Gamma (a - b - c + 1))⁻¹ *
          (Gamma (a - b - d + 1))⁻¹ * (Gamma (a - c - d + 1))⁻¹) := sorry

/-- 4.4: the Kummer–Thomae transformation, DLMF 16.4.11, in regularized form. -/
theorem regularizedHGFun_thomae {a b c d e : ℂ} (h : 0 < (d + e - a - b - c).re)
    (h' : 0 < (e - a).re) :
    regularizedHGFun {a, b, c} {d, e} 1 =
      Gamma (d + e - a - b - c) / Gamma (e - a) *
        regularizedHGFun {a, d - b, d - c} {d, d + e - b - c} 1 := sorry

/-- 4.4: the three-term relation 16.4.12, with `₃F₂(…; 1)` written as `Γ(d) Γ(e)` times
Mathlib's series at `1`. -/
theorem regularizedHGFun_three_term_16_4_12 {a b c d e : ℂ} (hd : ∀ k : ℕ, d - 1 ≠ -k)
    (he : ∀ k : ℕ, e ≠ -k) (h : 1 < (d + e - a - b - c).re) :
    let F : ℂ → ℂ := fun d' => Gamma d' * Gamma e * regularizedHGFun {a, b, c} {d', e} 1
    (a - d) * (b - d) * (c - d) * (F (d + 1) - F d) + a * b * c * F d =
      d * (d - 1) * (a + b + c - d - e + 1) * (F d - F (d - 1)) := sorry

/-- 4.4: the three-term relation 16.4.13, with `₃F₂(…; 1)` written as `Γ(d) Γ(e)` times
Mathlib's series at `1`. -/
theorem regularizedHGFun_three_term_16_4_13 {a b c d e : ℂ}
    (hd : ∀ k : ℕ, d ≠ -k) (he : ∀ k : ℕ, e ≠ -k) (h : 0 < (d + e - a - b - c).re) :
    Gamma d * Gamma e * regularizedHGFun {a, b, c} {d, e} 1 =
      c * (e - a) / (d * e) *
          (Gamma (d + 1) * Gamma (e + 1) * regularizedHGFun {a, b + 1, c + 1} {d + 1, e + 1} 1) +
        (d - c) / d * (Gamma (d + 1) * Gamma e * regularizedHGFun {a, b + 1, c} {d + 1, e} 1) :=
  sorry

/-- 4.4: Whipple's transformation of a balanced `₄F₃`, DLMF 16.4.14. -/
theorem terminatingSum_whipple_4F3 (n : ℕ) (a b c d e f : ℂ) (hbal : a + b + c - n + 1 = d + e + f)
    (h : poch(d, n) * poch(e, n) * poch(f, n) * poch(a - e - n + 1, n) *
      poch(a - f - n + 1, n) ≠ 0) :
    terminatingSum [-(n : ℂ), a, b, c] [d, e, f] n =
      poch(e - a, n) * poch(f - a, n) / (poch(e, n) * poch(f, n)) *
        terminatingSum [-(n : ℂ), a, d - b, d - c] [d, a - e - n + 1, a - f - n + 1] n := sorry

/-- 4.4: Whipple's transformation 16.4.15 when the `₄F₃` terminates, `f = −n`; the Gamma ratio
is written with Pochhammer symbols. -/
theorem terminatingSum_whipple_7F6 (n : ℕ) (a b c d e : ℂ)
    (h : poch(a / 2, n) * poch(a - b + 1, n) * poch(a - c + 1, n) * poch(a - d + 1, n) *
      poch(a - e + 1, n) * poch(a + n + 1, n) * poch(d + e - n - a, n) ≠ 0) :
    terminatingSum [a, a / 2 + 1, b, c, d, e, -(n : ℂ)]
        [a / 2, a - b + 1, a - c + 1, a - d + 1, a - e + 1, a + n + 1] n =
      poch(a + 1, n) * poch(a - d - e + 1, n) / (poch(a - d + 1, n) * poch(a - e + 1, n)) *
        terminatingSum [a - b - c + 1, d, e, -(n : ℂ)] [a - b + 1, a - c + 1, d + e - n - a] n :=
  sorry

/-- 4.4: Whipple's transformation 16.4.15 when the `₄F₃` terminates through
`a − b − c + 1 = −m`; the `₇F₆` is then an infinite series, written as the product of its bottom
`Γ`s and Mathlib's series at `1`. -/
theorem regularizedHGFun_whipple_7F6_16_4_15 (m : ℕ) (a b d e f : ℂ)
    (hconv : (1 + m + d + e + f - a).re < 2)
    (hbot : ∀ x ∈ [a / 2, a - b + 1, b - m, a - d + 1, a - e + 1, a - f + 1, a - d - e - f + 1],
      ∀ k : ℕ, x ≠ -k)
    (h : poch(a - b + 1, m) * poch(b - m, m) * poch(d + e + f - a, m) ≠ 0) :
    Gamma (a / 2) * Gamma (a - b + 1) * Gamma (b - m) * Gamma (a - d + 1) * Gamma (a - e + 1) *
        Gamma (a - f + 1) *
        regularizedHGFun {a, a / 2 + 1, b, a - b + 1 + m, d, e, f}
          {a / 2, a - b + 1, b - m, a - d + 1, a - e + 1, a - f + 1} 1 =
      Gamma (a - d + 1) * Gamma (a - e + 1) * Gamma (a - f + 1) * Gamma (a - d - e - f + 1) /
          (Gamma (a + 1) * Gamma (a - d - e + 1) * Gamma (a - d - f + 1) *
            Gamma (a - e - f + 1)) *
        terminatingSum [-(m : ℂ), d, e, f] [a - b + 1, b - m, d + e + f - a] m := sorry

/-! ### Layer 5: integral representations and the connection at infinity -/

/-- 5.1: the Laplace transform, DLMF 16.5.3, in regularized form. -/
theorem regularizedGeneralizedHypergeometric_eq_laplace {a₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b) (ha₀ : 0 < a₀.re) {z : ℂ}
    (hz : Multiset.card a = Multiset.card b → z.re < 1) :
    𝐅 (a₀ ::ₘ a) b z =
      (Gamma a₀)⁻¹ * ∫ t in Ioi (0 : ℝ), Real.exp (-t) * (t : ℂ) ^ (a₀ - 1) * 𝐅 a b (z * t) :=
  sorry

/-- 5.1: the inverse Laplace transform, DLMF 16.5.4, in regularized form. -/
theorem tendsto_integral_inverseLaplace_16_5_4 {b₀ : ℂ} {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (hb₀ : 0 < b₀.re) {c : ℝ} (hc : 0 < c) {z : ℂ}
    (hz : Multiset.card a = Multiset.card b + 1 → z.re < c) :
    Tendsto (fun T : ℝ => (2 * π)⁻¹ *
        ∫ y in -T..T, exp (c + y * I) * (c + y * I) ^ (-b₀) * 𝐅 a b (z / (c + y * I)))
      atTop (𝓝 (𝐅 a (b₀ ::ₘ b) z)) := sorry

/-- 5.2: the Mellin–Barnes integral 16.5.1 on a vertical line, `p ∈ {q, q + 1}`,
`−min Re a_k < σ < 0`, with reciprocal Gamma factors. -/
theorem regularizedGeneralizedHypergeometric_eq_mellinBarnes {a b : Multiset ℂ}
    (h : Multiset.card a = Multiset.card b ∨ Multiset.card a = Multiset.card b + 1) {σ : ℝ}
    (hσ : σ < 0) (ha : ∀ x ∈ a, -σ < x.re) {z : ℂ} (hz : -z ∈ slitPlane)
    (hz' : Multiset.card a = Multiset.card b → |arg (-z)| < π / 2) :
    (a.map Gamma).prod * 𝐅 a b z =
      (2 * π)⁻¹ * ∫ y : ℝ, (a.map fun x => Gamma (x + (σ + y * I))).prod *
        (b.map fun x => (Gamma (x + (σ + y * I)))⁻¹).prod * Gamma (-(σ + y * I)) *
          (-z) ^ (σ + y * I) := sorry

/-- 5.2: the loop integral 16.5.1, `p ≤ q + 1`, when no pole of any `Γ(a_k + s)` lies inside or on
the loop from `+∞ − iη` to `σ − iη`, `σ + iη` and `+∞ + iη`. -/
theorem regularizedGeneralizedHypergeometric_eq_loopIntegral {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (ha : ∀ x ∈ a, ∀ k : ℕ, x ≠ -k) {η σ : ℝ}
    (hη : 0 < η) (hσ : σ < 0)
    (hpole : ∀ x ∈ a, ∀ m : ℕ, σ ≤ (-x - m).re → η < |(-x - m).im|) {z : ℂ} (hz : z ≠ 0)
    (hz' : Multiset.card a = Multiset.card b + 1 → ‖z‖ < 1) :
    let f : ℂ → ℂ := fun s => (a.map fun x => Gamma (x + s)).prod *
      (b.map fun x => (Gamma (x + s))⁻¹).prod * Gamma (-s) * (-z) ^ s
    (a.map Gamma).prod * 𝐅 a b z =
      (2 * π * I)⁻¹ * ((∫ t in Ioi σ, f (t + η * I)) - (∫ t in Ioi σ, f (t - η * I)) +
        I * ∫ y in -η..η, f (σ + y * I)) := sorry

/-- 5.3: the series `H` of 16.11.2 and the connection 16.11.6 for `|z| > 1`, in regularized form. -/
theorem regularizedGeneralizedHypergeometric_eq_balancedH {q : ℕ} (a : Fin (q + 1) → ℂ)
    (b : Multiset ℂ) (hb : Multiset.card b = q) (ha : ∀ j, ∀ k : ℕ, a j ≠ -k)
    (haa : ∀ i j, i ≠ j → ∀ n : ℤ, a i - a j ≠ n) {z : ℂ} (hz : -z ∈ slitPlane)
    (hz₁ : 1 < ‖z‖) :
    (∏ j, Gamma (a j)) * 𝐅 (Finset.univ.val.map a) b z =
      ∑ m, ∑' k : ℕ, (-1) ^ k / (k ! : ℂ) * Gamma (a m + k) *
        (∏ l ∈ Finset.univ.erase m, Gamma (a l - a m - k)) *
          (b.map fun x => (Gamma (x - a m - k))⁻¹).prod * (-z) ^ (-a m - k) := sorry

/-- 5.3: the connection formula 16.8.8 on `−z ∈ slitPlane`, in regularized form. -/
theorem regularizedGeneralizedHypergeometric_connection_infty {q : ℕ} (a : Fin (q + 1) → ℂ)
    (b : Multiset ℂ) (hb : Multiset.card b = q) (ha : ∀ j, ∀ k : ℕ, a j ≠ -k)
    (haa : ∀ i j, i ≠ j → ∀ n : ℤ, a i - a j ≠ n) {z : ℂ} (hz : -z ∈ slitPlane) :
    (∏ j, Gamma (a j)) * 𝐅 (Finset.univ.val.map a) b z =
      ∑ j, Gamma (a j) * (∏ k ∈ Finset.univ.erase j, Gamma (a k - a j)) *
        (b.map fun x => (Gamma (x - a j))⁻¹).prod *
          ((-z) ^ (-a j) * pFq (a j ::ₘ b.map (1 - · + a j))
            ((Finset.univ.erase j).val.map fun k => 1 - a k + a j) z⁻¹) := sorry

/-- 5.3: the domain of 16.8.9: the connected component containing `z₀ − R − 1`,
`R = max ‖z₀‖ ‖z₀ − 1‖`, of the set where `‖z − z₀‖ > R`, `1 − z ∈ slitPlane` and
`z₀ − z ∈ slitPlane`. -/
def centeredDomain (z₀ : ℂ) : Set ℂ :=
  connectedComponentIn
    {z | max ‖z₀‖ ‖z₀ - 1‖ < ‖z - z₀‖ ∧ 1 - z ∈ slitPlane ∧ z₀ - z ∈ slitPlane}
    (z₀ - (max ‖z₀‖ ‖z₀ - 1‖ + 1))

/-- 5.3: the expansion 16.8.9 about `z₀`, in regularized form; the inner functions are Mathlib's
terminating series. -/
theorem regularizedGeneralizedHypergeometric_eq_centered_expansion {q : ℕ} (a : Fin (q + 1) → ℂ)
    (b : Multiset ℂ) (hb : Multiset.card b = q) (ha : ∀ j, ∀ k : ℕ, a j ≠ -k)
    (haa : ∀ i j, i ≠ j → ∀ n : ℤ, a i - a j ≠ n) {z z₀ : ℂ}
    (hz : z ∈ centeredDomain z₀) :
    (∏ j, Gamma (a j)) * 𝐅 (Finset.univ.val.map a) b z =
      ∑ j, (z₀ - z) ^ (-a j) * ∑' n : ℕ, Gamma (a j + n) / (n ! : ℂ) *
        (∏ k ∈ Finset.univ.erase j, Gamma (a k - a j - n)) *
          regularizedHGFun (Finset.univ.val.map fun k => a k - a j - n)
            (b.map (· - a j - n)) z₀ * (z - z₀) ^ (-(n : ℤ)) := sorry

/-! ### Layer 6: transformations, expansions and products -/

/-- 6.1: the quadratic transformation 16.6.1 on the unit disk. -/
theorem generalizedHypergeometric_quadratic_16_6_1 {a b c : ℂ}
    (hb : ∀ k : ℕ, a - b + 1 ≠ -k) (hc : ∀ k : ℕ, a - c + 1 ≠ -k) {z : ℂ} (hz : ‖z‖ < 1) :
    pFq {a, b, c} {a - b + 1, a - c + 1} z =
      (1 - z) ^ (-a) * pFq {a / 2, (a + 1) / 2, a - b - c + 1} {a - b + 1, a - c + 1}
        (-4 * z / (1 - z) ^ 2) := sorry

/-- 6.1: the cubic transformation 16.6.2 on the disk `‖z‖ < ½`. -/
theorem generalizedHypergeometric_cubic_16_6_2 {a b : ℂ} (hb : ∀ k : ℕ, b ≠ -k)
    (hb' : ∀ k : ℕ, a - b + 3 / 2 ≠ -k) {z : ℂ} (hz : ‖z‖ < 1 / 2) :
    pFq {a, 2 * b - a - 1, 2 - 2 * b + a} {b, a - b + 3 / 2} (z / 4) =
      (1 - z) ^ (-a) * pFq {a / 3, a / 3 + 1 / 3, a / 3 + 2 / 3} {b, a - b + 3 / 2}
        (-27 * z / (4 * (1 - z) ^ 3)) := sorry

/-- 6.2: the Fields–Wimp expansion 16.10.1 for `p < q`, `r ≤ s`. -/
theorem hasSum_fieldsWimp {a b c d : List ℂ} (hpq : a.length < b.length)
    (hrs : c.length ≤ d.length) {α β γ : ℂ} (hα : ∀ k : ℕ, α ≠ -k) (hβ : ∀ k : ℕ, β ≠ -k)
    (hγ : ∀ k : ℕ, γ ≠ -k) (hb : ∀ x ∈ b, ∀ k : ℕ, x ≠ -k)
    (hd : ∀ x ∈ d, ∀ k : ℕ, x ≠ -k) (z ζ : ℂ) :
    HasSum (fun k : ℕ => (a.map fun x => poch(x, k)).prod * poch(α, k) * poch(β, k) * (-z) ^ k /
        ((b.map fun x => poch(x, k)).prod * poch(γ + k, k) * (k ! : ℂ)) *
        pFq ((α + k) ::ₘ (β + k) ::ₘ (a.map (· + (k : ℂ)) : Multiset ℂ))
          ((γ + 2 * k + 1) ::ₘ (b.map (· + (k : ℂ)) : Multiset ℂ)) z *
        pFq ((-(k : ℂ)) ::ₘ (γ + k) ::ₘ (c : Multiset ℂ)) (α ::ₘ β ::ₘ (d : Multiset ℂ)) ζ)
      (pFq (a ++ c : Multiset ℂ) (b ++ d : Multiset ℂ) (z * ζ)) := sorry

/-- 6.2: Nørlund's expansion 16.10.2, `p = q + 1`, for `‖ζ − 1‖ < 1` and `Re z < ½`; the inner
functions are Mathlib's terminating series. -/
theorem hasSum_norlund {a₁ : ℂ} {a b : Multiset ℂ} (h : Multiset.card a = Multiset.card b)
    (hb : ∀ x ∈ b, ∀ k : ℕ, x ≠ -k) {z ζ : ℂ} (hζ : ‖ζ - 1‖ < 1) (hz : z.re < 1 / 2) :
    HasSum (fun k : ℕ => (1 - z) ^ (-a₁) * (poch(a₁, k) / (k ! : ℂ)) *
        ((b.map Gamma).prod * regularizedHGFun ((-(k : ℂ)) ::ₘ a) b ζ) * (z / (z - 1)) ^ k)
      (pFq (a₁ ::ₘ a) b (z * ζ)) := sorry

/-- 6.3: the product formula 16.12.1, in regularized form. -/
theorem regularizedGeneralizedHypergeometric_zero_one_mul (a b : ℂ) (h : ∀ k : ℕ, a + b - 1 ≠ -k)
    (z : ℂ) :
    𝐅 0 {a} z * 𝐅 0 {b} z =
      Gamma (a + b - 1) * 𝐅 {(a + b) / 2, (a + b - 1) / 2} {a, b, a + b - 1} (4 * z) := sorry

/-- 6.3: Clausen's formula 16.12.2 on the cut plane. -/
theorem gaussHypergeometric_sq_clausen {a b : ℂ} (h₁ : ∀ k : ℕ, a + b + 1 / 2 ≠ -k)
    (h₂ : ∀ k : ℕ, 2 * a + 2 * b ≠ -k) {z : ℂ} (hz : 1 - z ∈ slitPlane) :
    pFq {a, b} {a + b + 1 / 2} z ^ 2 =
      pFq {2 * a, 2 * b, a + b} {a + b + 1 / 2, 2 * a + 2 * b} z := sorry

/-- 6.3: the square of a Gauss function, 16.12.3, on the unit disk. -/
theorem hasSum_gaussHypergeometric_sq {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (hc' : ∀ k : ℕ, 2 * c - 1 ≠ -k) (ha : ∀ k : ℕ, a + 1 / 2 ≠ -k)
    (hb : ∀ k : ℕ, b + 1 / 2 ≠ -k) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun k : ℕ => poch(2 * a, k) * poch(2 * b, k) * poch(c - 1 / 2, k) /
        (poch(c, k) * poch(2 * c - 1, k) * (k ! : ℂ)) *
        terminatingSum [-(k : ℂ) / 2, (1 - k) / 2, a + b - c + 1 / 2, 1 / 2]
          [a + 1 / 2, b + 1 / 2, 3 / 2 - k - c] k * z ^ k)
      (pFq {a, b} {c} z ^ 2) := sorry

/-! ### Layer 7: limits and asymptotics in the parameters -/

/-- 7.1: the confluence 16.8.10, `p ≤ q`. -/
theorem tendsto_generalizedHypergeometric_confluence_top {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b) (hb : ∀ x ∈ b, ∀ k : ℕ, x ≠ -k) (z : ℂ) :
    Tendsto (fun α : ℂ => pFq (α ::ₘ a) b (z / α)) (Bornology.cobounded ℂ)
      (𝓝 (pFq a b z)) := sorry

/-- 7.1: the confluence 16.8.11 for `p ≤ q + 1`, on a sector `|ph β| ≤ π − δ`; for `p = q + 1`
with `‖z‖ < 1`, and `‖z‖ < sin δ` when `δ < π/2`. -/
theorem tendsto_generalizedHypergeometric_confluence_bottom {a b : Multiset ℂ}
    (h : Multiset.card a ≤ Multiset.card b + 1) (hb : ∀ x ∈ b, ∀ k : ℕ, x ≠ -k) {δ : ℝ}
    (hδ : 0 < δ) {z : ℂ}
    (hz : Multiset.card a = Multiset.card b + 1 → ‖z‖ < 1 ∧ (δ < π / 2 → ‖z‖ < Real.sin δ)) :
    Tendsto (fun β : ℂ => pFq a (β ::ₘ b) (β * z))
      (Bornology.cobounded ℂ ⊓ 𝓟 {β | |arg β| ≤ π - δ}) (𝓝 (pFq a b z)) := sorry



/-- 7.2: the large-parameter expansion 16.11.10, `p = q + 1`: `a₁, …, a_{k−1}` and `b₁, …, b_k`
shifted by `r`, `1 ≤ k ≤ q`. -/
theorem isBigO_generalizedHypergeometric_shift_16_11_10 {q : ℕ} (a : Fin (q + 1) → ℂ)
    (b : Fin q → ℂ) {k : ℕ} (hk : 1 ≤ k) (hkq : k ≤ q)
    (hb : ∀ j : Fin q, k ≤ (j : ℕ) → ∀ n : ℕ, b j ≠ -n) {z : ℂ} (hz : 1 - z ∈ slitPlane)
    (m : ℕ) :
    let A : ℝ → Fin (q + 1) → ℂ := fun r i => if (i : ℕ) + 1 < k then a i + r else a i
    let B : ℝ → Fin q → ℂ := fun r i => if (i : ℕ) < k then b i + r else b i
    (fun r : ℝ => pFq (Finset.univ.val.map (A r)) (Finset.univ.val.map (B r)) z -
        ∑ n ∈ range m, (∏ i, poch(A r i, n)) / ((∏ i, poch(B r i, n)) * (n ! : ℂ)) * z ^ n)
      =O[atTop] fun r : ℝ => ((r ^ m : ℝ))⁻¹ := sorry

/-- 7.2: the large-parameter expansion 16.11.11, `p < q`. -/
theorem isBigO_generalizedHypergeometric_shift {a b : Multiset ℂ}
    (h : Multiset.card a < Multiset.card b) (z : ℂ) (m : ℕ) :
    (fun r : ℝ => pFq (a.map (· + (r : ℂ))) (b.map (· + (r : ℂ))) z -
        ∑ n ∈ range m, (a.map fun x => poch(x + (r : ℂ), n)).prod /
          ((b.map fun x => poch(x + (r : ℂ), n)).prod * (n ! : ℂ)) * z ^ n) =O[atTop]
      fun r : ℝ => (r ^ ((Multiset.card b - Multiset.card a) * m) : ℝ)⁻¹ := sorry

end TauCetiRoadmap.SpecialFunctionsGeneralizedHypergeometric
