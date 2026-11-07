module

import Mathlib

/-!
# Explicit exponential sums, character sums and sieve bounds: target signatures

This file is not the roadmap. The roadmap is `README.md`; this file states, against the pinned
Mathlib, the headline theorems of the roadmap that are statable at the pins, each with `sorry`,
together with the few definitions their statements need. Every finite verification a theorem
rests on is a hypothesis with its data in the statement, exactly as in Layer 6 of the README.

Headline theorems stated here:

* Layer 1: the Kusmin–Landau lemma in Landau's sharp form (`kusmin_landau`); the second
  derivative test of Arias de Reyna (`second_derivative_test`) and van der Corput's form of it
  (`second_derivative_test_sqrt`); Patel's corrected third, fourth and fifth derivative tests
  (`third_derivative_test`, `fourth_derivative_test`, `fifth_derivative_test`); Arias de Reyna's
  iterated van der Corput inequality (`iterated_vanDerCorput`).
* Layer 2: the first and second derivative tests for integer points near a curve
  (`first_derivative_test_points`, `second_derivative_test_points`).
* Layer 3: the classical explicit Pólya–Vinogradov inequality (`polya_vinogradov_classical`),
  Pomerance's (`polya_vinogradov_pomerance`), Lapkova's (`polya_vinogradov_lapkova`) and
  Frolenkov–Soundararajan's bound for nonprincipal characters
  (`polya_vinogradov_frolenkov_soundararajan`).
* Layer 4: Burgess's moment bound (`burgess_moment_bound`), McGown's parametric Burgess
  inequality (`burgess_mcgown_parametric`) and his table of constants (`burgess_mcgown_table`).
* Layer 5: Greaves's lower bound for Selberg's density sum (`greaves_density_sum`), Büthe's
  weighted Brun–Titchmarsh inequalities (`buthe_weighted_brun_titchmarsh`,
  `buthe_weighted_prime_sum`), Ramaré–Viswanadham's prime-power sum in a progression
  (`ramare_viswanadham_prime_powers`) and Fan's bounds for integers free of small prime factors
  (`fan_rough_count`).

Headline theorems that are not statable at the pins, and what each lacks:

* Treviño's uniform and tabulated Burgess inequalities (README §4.5: his Theorems 1 and 2 with
  Tables 1 and 3, and Corollaries 1 and 2). Each rests on the propositions *TrevinoTable1Certificate*
  and *TrevinoTable3Certificate* of README Layer 6, numerical inequalities on the closing displays
  (46)–(47) and (58)–(59) of Treviño's induction, evaluated with the parameters of his Tables 5
  and 7 for every `p ≥ p₀`. Those displays are explicit but long functions of eight quantities and
  a parameter `s` defined by a minimum; they are not simple definitions, and stating the theorems
  without the propositions would assert more than the roadmap proves.
-/

noncomputable section

open Real Finset

open scoped Classical

namespace TauCetiRoadmap.ExplicitCharacterSumsAndSieves

/-! ## Layer 0: carriers -/

/-- The interval exponential sum `S_f[a, b] = ∑_{n ∈ ℤ, a ≤ n ≤ b} e(f(n))`, where
`e(x) = exp(2πix)` is the complex value of Mathlib's `Real.fourierChar`. The half-open sum
`∑_{X < n ≤ X + Y}` is `intervalExpSum f (⌊X⌋ + 1) (X + Y)`. -/
def intervalExpSum (f : ℝ → ℝ) (a b : ℝ) : ℂ :=
  ∑ n ∈ Icc ⌈a⌉ ⌊b⌋, ((Real.fourierChar (f n) : Circle) : ℂ)

/-- The near-integer count `R(f, a, N, δ)`: the number of integers `n` with `a ≤ n ≤ a + N` whose
value `f(n)` lies at distance less than `δ` from the nearest integer. -/
def nearIntegerCount (f : ℝ → ℝ) (a N δ : ℝ) : ℕ :=
  ((Icc ⌈a⌉ ⌊a + N⌋).filter fun n : ℤ => |f n - round (f n)| < δ).card

/-- The character interval sum `S_χ(M, N) = ∑_{M < n ≤ M + N} χ(n)`. -/
def charIntervalSum {q : ℕ} (χ : DirichletCharacter ℂ q) (M : ℤ) (N : ℕ) : ℂ :=
  ∑ n ∈ Ioc M (M + N), χ (n : ZMod q)

/-- Selberg's diagonal sum `S(z) = ∑_{1 ≤ n ≤ z} μ²(n)/φ(n)`. -/
def selbergDiagonal (z : ℝ) : ℝ :=
  ∑ n ∈ Icc 1 ⌊z⌋₊, ((ArithmeticFunction.moebius n : ℤ) : ℝ) ^ 2 / (n.totient : ℝ)

/-- The sum `H₁(z) = ∑_{1 ≤ n ≤ z} μ²(n) σ(n)/φ(n)`, the absolute sum of Selberg's optimal weights
times its diagonal sum in Büthe's weighted sieve. -/
def selbergWeightMass (z : ℝ) : ℝ :=
  ∑ n ∈ Icc 1 ⌊z⌋₊,
    ((ArithmeticFunction.moebius n : ℤ) : ℝ) ^ 2 * (ArithmeticFunction.sigma 1 n : ℝ) /
      (n.totient : ℝ)

/-- `Φ(x, z)`: the number of integers `1 ≤ n ≤ x` with no prime factor `p ≤ z` (so `1` is
counted). -/
def roughCount (x z : ℝ) : ℕ :=
  ((Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p : ℕ, p ∈ n.primeFactors → z < (p : ℝ)).card

/-- Büthe's functional `ρ_I(f) = ‖f‖₁/(‖f‖_∞ + ‖f′‖₁)` on `I = [x, x + y]`, with the
`L¹` norms of `f` and of its almost-everywhere derivative and the supremum of `|f|` on `I`. For
`f = 0` the quotient is `0/0 = 0`, which is Büthe's convention `ρ_I(0) = 0`. -/
def butheRho (f : ℝ → ℝ) (x y : ℝ) : ℝ :=
  (∫ t in x..x + y, |f t|) /
    (sSup ((fun t => |f t|) '' Set.Icc x (x + y)) + ∫ t in x..x + y, |deriv f t|)

/-! ## Layer 1: exponential sums under derivative conditions -/

/-- **Kusmin–Landau lemma** (Landau's sharp constant; Arias de Reyna 2024, Lemma 1 and
Remark 2). If `f` is continuously differentiable on `[a, b]` with monotone derivative and
`θ ≤ f′(x) − k ≤ 1 − θ` there for an integer `k` and `0 < θ ≤ 1/2`, then
`|∑_{a ≤ n ≤ b} e(f(n))| ≤ cot(πθ/2)`. -/
theorem kusmin_landau (f : ℝ → ℝ) (a b θ : ℝ) (k : ℤ) (hab : a ≤ b)
    (hf : ContDiffOn ℝ 1 f (Set.Icc a b))
    (hmono : MonotoneOn (derivWithin f (Set.Icc a b)) (Set.Icc a b) ∨
      AntitoneOn (derivWithin f (Set.Icc a b)) (Set.Icc a b))
    (hθ : 0 < θ) (hθ' : θ ≤ 1 / 2)
    (hderiv : ∀ x ∈ Set.Icc a b,
      θ ≤ derivWithin f (Set.Icc a b) x - k ∧ derivWithin f (Set.Icc a b) x - k ≤ 1 - θ) :
    ‖intervalExpSum f a b‖ ≤ cot (π * θ / 2) := by
  sorry

/-- **Second derivative test** (Arias de Reyna 2024, Lemma 4). If `f` is twice continuously
differentiable on `[a, b]` with `0 < λ ≤ |f″| ≤ Λ` there, then
`|∑_{a ≤ n ≤ b} e(f(n))| ≤ (Λ(b − a) + 2)(1 + 4/√(πλ)) + 1`. -/
theorem second_derivative_test (f : ℝ → ℝ) (a b lam Lam : ℝ) (hab : a ≤ b)
    (hf : ContDiffOn ℝ 2 f (Set.Icc a b)) (hlam : 0 < lam)
    (hderiv : ∀ x ∈ Set.Icc a b, lam ≤ |iteratedDerivWithin 2 f (Set.Icc a b) x| ∧
      |iteratedDerivWithin 2 f (Set.Icc a b) x| ≤ Lam) :
    ‖intervalExpSum f a b‖ ≤ (Lam * (b - a) + 2) * (1 + 4 / √(π * lam)) + 1 := by
  sorry

/-- **Second derivative test, van der Corput's form** (Arias de Reyna 2024, Lemma 5). Under the
hypotheses of `second_derivative_test` and `b − a ≥ 1`,
`|∑_{a ≤ n ≤ b} e(f(n))| ≤ A λ^{−1/2} (Λ(b − a) + 2)` with
`A = (2/√π)(1 + √(1 + 3π/8)) = 2.79368…`. -/
theorem second_derivative_test_sqrt (f : ℝ → ℝ) (a b lam Lam : ℝ) (hab : 1 ≤ b - a)
    (hf : ContDiffOn ℝ 2 f (Set.Icc a b)) (hlam : 0 < lam)
    (hderiv : ∀ x ∈ Set.Icc a b, lam ≤ |iteratedDerivWithin 2 f (Set.Icc a b) x| ∧
      |iteratedDerivWithin 2 f (Set.Icc a b) x| ≤ Lam) :
    ‖intervalExpSum f a b‖ ≤
      (2 / √π) * (1 + √(1 + 3 * π / 8)) / √lam * (Lam * (b - a) + 2) := by
  sorry

/-- **Third derivative test** (Patel 2022, Lemma 2.5, correcting Hiary 2016, Lemma 1.2). Let
`N` be an integer, `L ≥ 1`, and let `f` have three continuous derivatives on `[N + 1, N + L]` with
`1/W ≤ |f‴| ≤ λ/W` there, `W > 1`, `λ ≥ 1`. For `η > 0`,
`|∑_{n=N+1}^{N+L} e(f(n))|² ≤ (L W^{−1/3} + η)(α L + β W^{2/3})` with
`α = 1/η + (32λ/(15√π))√(η + W^{−1/3}) + 2λη W^{−1/3} + 2λ W^{−2/3}` and
`β = 64/(3√π √η) + 4 W^{−1/3}`. -/
theorem third_derivative_test (f : ℝ → ℝ) (N : ℤ) (L : ℕ) (hL : 1 ≤ L) (W lam η : ℝ)
    (hW : 1 < W) (hlam : 1 ≤ lam) (hη : 0 < η)
    (hf : ContDiffOn ℝ 3 f (Set.Icc (N + 1 : ℝ) (N + L)))
    (hderiv : ∀ x ∈ Set.Icc (N + 1 : ℝ) (N + L),
      1 / W ≤ |iteratedDerivWithin 3 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ∧
        |iteratedDerivWithin 3 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ≤ lam / W) :
    ‖intervalExpSum f (N + 1) (N + L)‖ ^ 2 ≤
      (L * W ^ (-(1 / 3 : ℝ)) + η) *
        ((1 / η + 32 * lam / (15 * √π) * √(η + W ^ (-(1 / 3 : ℝ))) +
            2 * lam * η * W ^ (-(1 / 3 : ℝ)) + 2 * lam * W ^ (-(2 / 3 : ℝ))) * L +
          (64 / (3 * √π * √η) + 4 * W ^ (-(1 / 3 : ℝ))) * W ^ (2 / 3 : ℝ)) := by
  sorry

/-- **Fourth derivative test** (Patel 2022, Lemma 3.1, with the factor `9/5` in `β₄` that its
proof gives). Let `f` have four continuous derivatives on `[N + 1, N + L]` with
`1/W ≤ |f⁽⁴⁾| ≤ λ/W`, `W > 1`, `λ ≥ 1`, and let `η₃, η₄ > 0`. With
`α̃₃ = 1/η₃ + (32λ/(15√π))√(η₃ + 1) + 2λη₃ + 2λ` and `β̃₃ = 64/(3√π√η₃) + 4`,
`|∑_{n=N+1}^{N+L} e(f(n))|² ≤ (L W^{−1/7} + η₄)(α₄ L + γ₄ √L W^{2/7} + β₄ W^{3/7})`, where
`α₄ = 1/η₄ + (72/91)√α̃₃ (η₄ + W^{−1/7})^{1/6}`,
`γ₄ = (72/55)√β̃₃ η₄^{−1/6} + √(η₃α̃₃) W^{−1/7}` and `β₄ = (9/5)√(β̃₃η₃) η₄^{−1/3}`. -/
theorem fourth_derivative_test (f : ℝ → ℝ) (N : ℤ) (L : ℕ) (hL : 1 ≤ L) (W lam η₃ η₄ : ℝ)
    (hW : 1 < W) (hlam : 1 ≤ lam) (hη₃ : 0 < η₃) (hη₄ : 0 < η₄)
    (hf : ContDiffOn ℝ 4 f (Set.Icc (N + 1 : ℝ) (N + L)))
    (hderiv : ∀ x ∈ Set.Icc (N + 1 : ℝ) (N + L),
      1 / W ≤ |iteratedDerivWithin 4 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ∧
        |iteratedDerivWithin 4 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ≤ lam / W) :
    let α₃ := 1 / η₃ + 32 * lam / (15 * √π) * √(η₃ + 1) + 2 * lam * η₃ + 2 * lam
    let β₃ := 64 / (3 * √π * √η₃) + 4
    let α₄ := 1 / η₄ + 72 / 91 * √α₃ * (η₄ + W ^ (-(1 / 7 : ℝ))) ^ (1 / 6 : ℝ)
    let γ₄ := 72 / 55 * √β₃ * η₄ ^ (-(1 / 6 : ℝ)) + √(η₃ * α₃) * W ^ (-(1 / 7 : ℝ))
    let β₄ := 9 / 5 * √(β₃ * η₃) * η₄ ^ (-(1 / 3 : ℝ))
    ‖intervalExpSum f (N + 1) (N + L)‖ ^ 2 ≤
      (L * W ^ (-(1 / 7 : ℝ)) + η₄) *
        (α₄ * L + γ₄ * √(L : ℝ) * W ^ (2 / 7 : ℝ) + β₄ * W ^ (3 / 7 : ℝ)) := by
  sorry

/-- **Fifth derivative test** (Patel 2022, Lemma 3.2, with `β₄` as in `fourth_derivative_test`).
Let `f` have five continuous derivatives on `[N + 1, N + L]` with `1/W ≤ |f⁽⁵⁾| ≤ λ/W`, `W > 1`,
`λ ≥ 1`, and let `η₃, η₄, η₅ > 0`. With `α̃₃, β̃₃, β₄` as in the fourth derivative test (at this
`λ`), `α̃₄ = 1/η₄ + (72/91)√α̃₃(η₄ + 1)^{1/6}` and `γ̃₄ = (72/55)√β̃₃ η₄^{−1/6} + √(η₃α̃₃)`,
`|∑ e(f(n))|² ≤ (L W^{−1/15} + η₅) · P₅` with
`P₅ = α₅ L + τ₅ L^{3/4} W^{2/15} + γ₅ √L W^{3/15} + ω₅ L^{1/4} W^{1/5} + β₅ W^{4/15}`, where
`α₅ = 1/η₅ + (392/435)√α̃₄ (η₅ + W^{−1/15})^{1/14}`, `τ₅ = (392/351)√γ̃₄ η₅^{−1/14}`,
`γ₅ = (98/78)√β₄ η₅^{−1/7} + √(η₄α̃₄) W^{−2/15}`, `ω₅ = (98/78)√(η₄γ̃₄) η₅^{−1/7}` and
`β₅ = (392/275)√(η₄β₄) η₅^{−3/14}`. -/
theorem fifth_derivative_test (f : ℝ → ℝ) (N : ℤ) (L : ℕ) (hL : 1 ≤ L) (W lam η₃ η₄ η₅ : ℝ)
    (hW : 1 < W) (hlam : 1 ≤ lam) (hη₃ : 0 < η₃) (hη₄ : 0 < η₄) (hη₅ : 0 < η₅)
    (hf : ContDiffOn ℝ 5 f (Set.Icc (N + 1 : ℝ) (N + L)))
    (hderiv : ∀ x ∈ Set.Icc (N + 1 : ℝ) (N + L),
      1 / W ≤ |iteratedDerivWithin 5 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ∧
        |iteratedDerivWithin 5 f (Set.Icc (N + 1 : ℝ) (N + L)) x| ≤ lam / W) :
    let α₃ := 1 / η₃ + 32 * lam / (15 * √π) * √(η₃ + 1) + 2 * lam * η₃ + 2 * lam
    let β₃ := 64 / (3 * √π * √η₃) + 4
    let α₄ := 1 / η₄ + 72 / 91 * √α₃ * (η₄ + 1) ^ (1 / 6 : ℝ)
    let γ₄ := 72 / 55 * √β₃ * η₄ ^ (-(1 / 6 : ℝ)) + √(η₃ * α₃)
    let β₄ := 9 / 5 * √(β₃ * η₃) * η₄ ^ (-(1 / 3 : ℝ))
    let α₅ := 1 / η₅ + 392 / 435 * √α₄ * (η₅ + W ^ (-(1 / 15 : ℝ))) ^ (1 / 14 : ℝ)
    let τ₅ := 392 / 351 * √γ₄ * η₅ ^ (-(1 / 14 : ℝ))
    let γ₅ := 98 / 78 * √β₄ * η₅ ^ (-(1 / 7 : ℝ)) + √(η₄ * α₄) * W ^ (-(2 / 15 : ℝ))
    let ω₅ := 98 / 78 * √(η₄ * γ₄) * η₅ ^ (-(1 / 7 : ℝ))
    let β₅ := 392 / 275 * √(η₄ * β₄) * η₅ ^ (-(3 / 14 : ℝ))
    ‖intervalExpSum f (N + 1) (N + L)‖ ^ 2 ≤
      (L * W ^ (-(1 / 15 : ℝ)) + η₅) *
        (α₅ * L + τ₅ * (L : ℝ) ^ (3 / 4 : ℝ) * W ^ (2 / 15 : ℝ) +
          γ₅ * √(L : ℝ) * W ^ (3 / 15 : ℝ) + ω₅ * (L : ℝ) ^ (1 / 4 : ℝ) * W ^ (1 / 5 : ℝ) +
          β₅ * W ^ (4 / 15 : ℝ)) := by
  sorry

/-- **Iterated van der Corput inequality** (Arias de Reyna 2024, Theorem 7). Let `X` be real,
`d ≥ 1`, and `H₁, …, H_d ≥ 1` integers with `H₁ + ⋯ + H_d ≤ Y`. For `a = (a₁, …, a_d)` with
`1 ≤ a_r ≤ H_r − 1` let `f_a(x) = ∑_{J ⊆ {1, …, d}} (−1)^{d − |J|} f(x + ∑_{j ∈ J} a_j)` and
`T = (Y H₁ ⋯ H_d)⁻¹ ∑_a |∑_{X < n ≤ X + Y − ∑ a_r} e(f_a(n))|`. With `B = 2 + 2√2`,
`|Y⁻¹ ∑_{X < n ≤ X + Y} e(f(n))| ≤ B · max(H₁^{−1/2}, …, H_d^{−1/2^d}, B^{−1/2^d} T^{1/2^d})`.
Here `H` is indexed by `Fin d`, so `H r` carries the exponent `−1/2^{r+1}`. -/
theorem iterated_vanDerCorput (f : ℝ → ℝ) (X Y : ℝ) (d : ℕ) (hd : 1 ≤ d) (H : Fin d → ℕ)
    (hH : ∀ r, 1 ≤ H r) (hHY : (∑ r, (H r : ℝ)) ≤ Y) :
    let B : ℝ := 2 + 2 * √2
    let fa : (Fin d → ℕ) → ℝ → ℝ := fun a x =>
      ∑ J : Finset (Fin d), (-1 : ℝ) ^ (d - J.card) * f (x + ∑ j ∈ J, (a j : ℝ))
    let T : ℝ := (Y * ∏ r, (H r : ℝ))⁻¹ *
      ∑ a ∈ Fintype.piFinset (fun r => Icc 1 (H r - 1)),
        ‖intervalExpSum (fa a) (⌊X⌋ + 1) (X + Y - ∑ r, (a r : ℝ))‖
    ‖Y⁻¹ * intervalExpSum f (⌊X⌋ + 1) (X + Y)‖ ≤
      B * max (⨆ r : Fin d, (H r : ℝ) ^ (-(1 / 2 ^ (r.val + 1) : ℝ)))
        (B ^ (-(1 / 2 ^ d : ℝ)) * T ^ (1 / 2 ^ d : ℝ)) := by
  sorry

/-! ## Layer 2: integer points near smooth curves -/

/-- **First derivative test for integer points** (TME-EMT, Integer points near smooth plane
curves; Zhao 2024, Theorem 2.5). If `f` is continuously differentiable on `[a, a + N]` with
`λ ≤ |f′| ≤ cλ` there, `λ > 0`, `c ≥ 1`, then for every `δ > 0`
`R(f, a, N, δ) ≤ 2cNλ + 4cNδ + 2δ/λ + 1`. -/
theorem first_derivative_test_points (f : ℝ → ℝ) (a N δ lam c : ℝ) (hN : 0 ≤ N) (hδ : 0 < δ)
    (hlam : 0 < lam) (hc : 1 ≤ c) (hf : ContDiffOn ℝ 1 f (Set.Icc a (a + N)))
    (hderiv : ∀ x ∈ Set.Icc a (a + N), lam ≤ |derivWithin f (Set.Icc a (a + N)) x| ∧
      |derivWithin f (Set.Icc a (a + N)) x| ≤ c * lam) :
    (nearIntegerCount f a N δ : ℝ) ≤ 2 * c * N * lam + 4 * c * N * δ + 2 * δ / lam + 1 := by
  sorry

/-- **Second derivative test for integer points** (Huxley's reduction; TME-EMT, Integer points
near smooth plane curves; Zhao 2024, Theorem 2.7). If `f` is twice continuously differentiable on
`[a, a + N]`, `N ≥ 1`, with `λ ≤ |f″| ≤ cλ` there, `λ > 0`, `c ≥ 1` and `Nλ ≥ c⁻¹`, then for
`0 < δ < 1/2`, `R(f, a, N, δ) ≤ 6((3c)^{1/3} N λ^{1/3} + (12c)^{1/2} N δ^{1/2} + 1)`. -/
theorem second_derivative_test_points (f : ℝ → ℝ) (a N δ lam c : ℝ) (hN : 1 ≤ N)
    (hδ : 0 < δ) (hδ' : δ < 1 / 2) (hlam : 0 < lam) (hc : 1 ≤ c) (hNlam : c⁻¹ ≤ N * lam)
    (hf : ContDiffOn ℝ 2 f (Set.Icc a (a + N)))
    (hderiv : ∀ x ∈ Set.Icc a (a + N), lam ≤ |iteratedDerivWithin 2 f (Set.Icc a (a + N)) x| ∧
      |iteratedDerivWithin 2 f (Set.Icc a (a + N)) x| ≤ c * lam) :
    (nearIntegerCount f a N δ : ℝ) ≤
      6 * ((3 * c) ^ (1 / 3 : ℝ) * N * lam ^ (1 / 3 : ℝ) +
        (12 * c) ^ (1 / 2 : ℝ) * N * δ ^ (1 / 2 : ℝ) + 1) := by
  sorry

/-! ## Layer 3: explicit Pólya–Vinogradov inequalities -/

/-- **Classical explicit Pólya–Vinogradov inequality** (Pomerance 2011, Lemma 4 and displays
(4)–(5); Montgomery–Vaughan 2007, §9.4). For a primitive character `χ` modulo `q ≥ 2` and all
`M ∈ ℤ`, `N ∈ ℕ`, `|S_χ(M, N)| < (2/π)√q (log q + log(4/π) + π²/(12q²))`. -/
theorem polya_vinogradov_classical {q : ℕ} (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    (hq : 2 ≤ q) (M : ℤ) (N : ℕ) :
    ‖charIntervalSum χ M N‖ <
      2 / π * √q * (log q + log (4 / π) + π ^ 2 / (12 * (q : ℝ) ^ 2)) := by
  sorry

/-- **Pomerance's explicit Pólya–Vinogradov inequality** (Pomerance 2011, Theorem 1). For a
primitive character `χ` modulo `q > 1` and every interval sum,
`|S_χ(M, N)| ≤ (2/π²)√q log q + (4/π²)√q log log q + (3/2)√q` if `χ` is even and
`|S_χ(M, N)| ≤ (1/(2π))√q log q + (1/π)√q log log q + √q` if `χ` is odd. -/
theorem polya_vinogradov_pomerance {q : ℕ} (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    (hq : 1 < q) :
    (χ.Even → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
      2 / π ^ 2 * √q * log q + 4 / π ^ 2 * √q * log (log q) + 3 / 2 * √q) ∧
    (χ.Odd → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
      1 / (2 * π) * √q * log q + 1 / π * √q * log (log q) + √q) := by
  sorry

/-- The two bounds of Lapkova's Lemma 3A for a character `χ` modulo `q`: every interval sum of
`χ` is at most `(2/π²)√q log q + 0.9467√q + 1.668` if `χ` is even and at most
`(1/(2π))√q log q + 0.8204√q + 1.0285` if `χ` is odd. -/
def LapkovaBound {q : ℕ} (χ : DirichletCharacter ℂ q) : Prop :=
  (χ.Even → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
    2 / π ^ 2 * √q * log q + 0.9467 * √q + 1.668) ∧
  (χ.Odd → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
    1 / (2 * π) * √q * log q + 0.8204 * √q + 1.0285)

/-- **Layer 6.1, small moduli in Lapkova's lemma**: the bounds of `LapkovaBound` for every
primitive character of modulus `2 ≤ q ≤ 25` (the Bober–Goldmakher data used in Lapkova 2018,
proof of Lemma 3A). -/
def LapkovaSmallModuliVerified : Prop :=
  ∀ q : ℕ, 2 ≤ q → q ≤ 25 → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → LapkovaBound χ

/-- **Lapkova's explicit Pólya–Vinogradov inequality** (Lapkova 2018, Lemma 3A, after
Frolenkov–Soundararajan). Under `LapkovaSmallModuliVerified`, every primitive character modulo
`q > 1` satisfies `LapkovaBound`. -/
theorem polya_vinogradov_lapkova (hsmall : LapkovaSmallModuliVerified) {q : ℕ}
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : 1 < q) : LapkovaBound χ := by
  sorry

/-- **Frolenkov–Soundararajan's bound for nonprincipal characters** (Frolenkov–Soundararajan
2013, Corollary 1, as quoted by TME-EMT, Character sums). For every nonprincipal character `χ`
modulo `q ≥ 1000` and all `M ∈ ℤ`, `N ∈ ℕ`,
`|S_χ(M, N)| ≤ (1/(π√2))√q (log q + 6) + √q`. -/
theorem polya_vinogradov_frolenkov_soundararajan {q : ℕ} (χ : DirichletCharacter ℂ q)
    (hχ : χ ≠ 1) (hq : 1000 ≤ q) (M : ℤ) (N : ℕ) :
    ‖charIntervalSum χ M N‖ ≤ 1 / (π * √2) * √q * (log q + 6) + √q := by
  sorry

/-! ## Layer 4: explicit Burgess inequalities for a prime modulus -/

/-- **Burgess's moment bound** (Treviño 2015, Theorem A, without its hypothesis `r ≤ 9B`). For a
nonprincipal character `χ` modulo a prime `p`, every integer `r ≥ 1` and real `B > 0`,
`∑_{x mod p} |∑_{1 ≤ b ≤ B} χ(x + b)|^{2r} ≤ (2r − 1)!! B^r p + (2r − 1) B^{2r} √p`. -/
theorem burgess_moment_bound {p : ℕ} [Fact p.Prime] (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1)
    (r : ℕ) (hr : 1 ≤ r) (B : ℝ) (hB : 0 < B) :
    ∑ x : ZMod p, ‖∑ b ∈ Icc 1 ⌊B⌋₊, χ (x + b)‖ ^ (2 * r) ≤
      ((2 * r - 1).doubleFactorial : ℝ) * B ^ r * p + (2 * r - 1) * B ^ (2 * r) * √p := by
  sorry

/-- The finite-range input of AnalyticNumberTheoryPartI §0.5: Rosser–Schoenfeld's two-sided
bound `(x/log x)(1 + 1/(2 log x)) < π(x) < (x/log x)(1 + 3/(2 log x))` for every real
`59 ≤ x < exp 10000`. It is restated here only so that the theorems consuming that section are
statable at the pins. -/
def RosserSchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 59 ≤ x → x < exp 10000 →
    x / log x * (1 + 1 / (2 * log x)) < (Nat.primeCounting ⌊x⌋₊ : ℝ) ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / log x * (1 + 3 / (2 * log x))

/-- **McGown's parametric Burgess inequality** (McGown 2012, Theorem A.9). Let `χ` be a
nonprincipal character modulo an odd prime `p`, `r ≥ 2`, and let `d > 4`, `C ≥ 1`, `p₀ ≥ 2` satisfy
`(A.1) C^r p₀^{1/4 − 1/(4r)} (log p₀)^{1/2} ≥ 4d(d + 1)r` and
`(A.2) C ≥ ((d + 1)(2r − 1)(4r − 1))^{1/(2r)}/(1 − 2 d^{−(1 − 1/r)})`. Under
`RosserSchoenfeldFiniteRangeInput`, for `p ≥ p₀`, every integer `N₀` and every integer
`1 ≤ H ≤ √(rd) p^{1/2 + 1/(4r)}`,
`|∑_{N₀ < n ≤ N₀ + H} χ(n)| ≤ C H^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_mcgown_parametric (hRS : RosserSchoenfeldFiniteRangeInput) {p : ℕ}
    [Fact p.Prime] (hp : p ≠ 2) (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (r : ℕ) (hr : 2 ≤ r)
    (d C p₀ : ℝ) (hd : 4 < d) (hC : 1 ≤ C) (hp₀ : 2 ≤ p₀)
    (hA1 : 4 * d * (d + 1) * r ≤
      C ^ r * p₀ ^ (1 / 4 - 1 / (4 * r) : ℝ) * log p₀ ^ (1 / 2 : ℝ))
    (hA2 : ((d + 1) * (2 * r - 1) * (4 * r - 1)) ^ (1 / (2 * r) : ℝ) /
      (1 - 2 / d ^ (1 - 1 / r : ℝ)) ≤ C)
    (hpp₀ : p₀ ≤ p) (N₀ : ℤ) (H : ℕ) (hH : 1 ≤ H)
    (hHp : (H : ℝ) ≤ √(r * d) * (p : ℝ) ^ (1 / 2 + 1 / (4 * r) : ℝ)) :
    ‖charIntervalSum χ N₀ H‖ ≤
      C * (H : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / (2 * r) : ℝ) := by
  sorry

/-- McGown's tabulated Burgess constants `C(r)` for `2 ≤ r ≤ 15` (McGown 2012, Table A.1);
`0` outside that range. -/
def mcgownConstant : ℕ → ℝ
  | 2 => 10.0366 | 3 => 4.9539 | 4 => 3.6493 | 5 => 3.0356 | 6 => 2.6765 | 7 => 2.4400
  | 8 => 2.2721 | 9 => 2.1467 | 10 => 2.0492 | 11 => 1.9712 | 12 => 1.9073 | 13 => 1.8540
  | 14 => 1.8088 | 15 => 1.7700 | _ => 0

/-- **Layer 6.6, McGown's table**: for each `2 ≤ r ≤ 15`, the right side
`C₀(r) = (12(2r − 1)(4r − 1))^{1/(2r)}/(1 − 2 · 11^{−(1 − 1/r)})` of (A.2) at `d = 11` is below
the tabulated `C(r)`, and `C₀(r)` satisfies (A.1) at `d = 11`, `p₀ = 2·10⁴`. -/
def McGownTableCertificate : Prop :=
  ∀ r : ℕ, 2 ≤ r → r ≤ 15 →
    let C₀ : ℝ := (12 * (2 * r - 1) * (4 * r - 1)) ^ (1 / (2 * r) : ℝ) /
      (1 - 2 * (11 : ℝ) ^ (-(1 - 1 / r) : ℝ))
    C₀ < mcgownConstant r ∧
      528 * (r : ℝ) ≤ C₀ ^ r * (2 * 10 ^ 4 : ℝ) ^ (1 / 4 - 1 / (4 * r) : ℝ) *
        log (2 * 10 ^ 4) ^ (1 / 2 : ℝ)

/-- **McGown's Burgess constants** (McGown 2012, Theorem A.1 and Table A.1). Under
`RosserSchoenfeldFiniteRangeInput` and `McGownTableCertificate`, for a nonprincipal character
`χ` modulo a prime `p ≥ 2·10⁴`, `2 ≤ r ≤ 15`, every integer `N₀` and every integer
`1 ≤ H ≤ 4p^{1/2 + 1/(4r)}`,
`|∑_{N₀ < n ≤ N₀ + H} χ(n)| < C(r) H^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_mcgown_table (hRS : RosserSchoenfeldFiniteRangeInput)
    (hM : McGownTableCertificate) {p : ℕ} [Fact p.Prime] (hp : 20000 ≤ p)
    (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (r : ℕ) (hr : 2 ≤ r) (hr' : r ≤ 15) (N₀ : ℤ)
    (H : ℕ) (hH : 1 ≤ H) (hHp : (H : ℝ) ≤ 4 * (p : ℝ) ^ (1 / 2 + 1 / (4 * r) : ℝ)) :
    ‖charIntervalSum χ N₀ H‖ <
      mcgownConstant r * (H : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / (2 * r) : ℝ) := by
  sorry

/-! ## Layer 5: explicit sieve upper bounds -/

/-- **Greaves's lower bound for Selberg's density sum** (Greaves 2001, Theorem 1, p. 52; TME-EMT,
Sieve bounds). Let `κ` be a function on the primes with `0 ≤ κ(p) < p`, `z ≥ 2`, `B > 0` with
`∑_{p < z} κ(p) log p/p ≤ B log z`, and `s ≥ 2B`. With `P(z) = ∏_{p < z} p`,
`∑_{d | P(z), d ≤ z^{s/2}} ∏_{p | d} κ(p)/(p − κ(p))` is at least
`(1 − exp(−((s/2) log(s/(2B)) − s/2 + B))) ∏_{p < z} (1 − κ(p)/p)⁻¹`. -/
theorem greaves_density_sum (κ : ℕ → ℝ) (hκ : ∀ p, p.Prime → 0 ≤ κ p ∧ κ p < p)
    (z B s : ℝ) (hz : 2 ≤ z) (hB : 0 < B)
    (hsum : ∑ p ∈ (range ⌈z⌉₊).filter Nat.Prime, κ p * log p / p ≤ B * log z)
    (hs : 2 * B ≤ s) :
    (1 - exp (-(s / 2 * log (s / (2 * B)) - s / 2 + B))) *
        ∏ p ∈ (range ⌈z⌉₊).filter Nat.Prime, (1 - κ p / p)⁻¹ ≤
      ∑ d ∈ (∏ p ∈ (range ⌈z⌉₊).filter Nat.Prime, p).divisors.filter
          (fun d : ℕ => ((d : ℕ) : ℝ) ≤ z ^ (s / 2)),
        ∏ p ∈ Nat.primeFactors d, κ p / ((p : ℝ) - κ p) := by
  sorry

/-- **Büthe's weighted Brun–Titchmarsh inequality** (Büthe 2014, Theorem 4.2). Let
`I = [x, x + y] ⊂ [0, ∞)`, `k, l` coprime positive integers and `f ≥ 0` absolutely continuous on
`I` with `ρ_I(f) > k`. Then `∑_{p ∈ I, p ≡ l (k)} f(p)` is less than
`(2‖f‖₁/(φ(k) log(ρ_I(f)/k)))(1 + 8/log(ρ_I(f)/k))` and less than
`3‖f‖₁/(φ(k) log(ρ_I(f)/k))`. -/
theorem buthe_weighted_brun_titchmarsh (f : ℝ → ℝ) (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
    (k l : ℕ) (hk : 0 < k) (hkl : Nat.Coprime k l)
    (hf : AbsolutelyContinuousOnInterval f x (x + y)) (hf0 : ∀ t ∈ Set.Icc x (x + y), 0 ≤ f t)
    (hρ : (k : ℝ) < butheRho f x y) :
    let S := ∑ p ∈ (Icc ⌈x⌉₊ ⌊x + y⌋₊).filter (fun p => p.Prime ∧ p % k = l % k), f p
    let ℓ := log (butheRho f x y / k)
    S < 2 * (∫ t in x..x + y, |f t|) / (k.totient * ℓ) * (1 + 8 / ℓ) ∧
      S < 3 * (∫ t in x..x + y, |f t|) / (k.totient * ℓ) := by
  sorry

/-- **Layer 6.3, Büthe's small range**: for every real `1 < Y < 20000` there is a real `z ≥ 1`
with `Y ∏_{p ≤ z}(1 − 1/p) + 2^{π(z)} + π(z) < 2Y/log Y` (Büthe 2014, proof of Theorem 4.3). -/
def ButheSmallRangeVerified : Prop :=
  ∀ Y : ℝ, 1 < Y → Y < 20000 → ∃ z : ℝ, 1 ≤ z ∧
    Y * ∏ p ∈ (Icc 1 ⌊z⌋₊).filter Nat.Prime, (1 - 1 / (p : ℝ)) +
        2 ^ Nat.primeCounting ⌊z⌋₊ + Nat.primeCounting ⌊z⌋₊ < 2 * Y / log Y

/-- **Layer 6.4, Büthe's medium range**: for every real `20000 ≤ Y ≤ 4·10¹⁸` there is a real
`z ≥ 1` with `Y/S(z) + H₁(z)²/S(z)² + π(z) < 2Y/log Y` (Büthe 2014, proof of Theorem 4.3). -/
def ButheMediumRangeVerified : Prop :=
  ∀ Y : ℝ, 20000 ≤ Y → Y ≤ 4 * 10 ^ 18 → ∃ z : ℝ, 1 ≤ z ∧
    Y / selbergDiagonal z + selbergWeightMass z ^ 2 / selbergDiagonal z ^ 2 +
        Nat.primeCounting ⌊z⌋₊ < 2 * Y / log Y

/-- **Büthe's weighted prime sum** (Büthe 2014, Theorem 4.3). Under `ButheSmallRangeVerified` and
`ButheMediumRangeVerified`, for `I = [x, x + y] ⊂ [0, ∞)` and every nonnegative absolutely
continuous `f` on `I` with `ρ_I(f) > 1`, `∑_{p ∈ I} f(p) < 2‖f‖₁/log ρ_I(f)`. -/
theorem buthe_weighted_prime_sum (hsmall : ButheSmallRangeVerified)
    (hmed : ButheMediumRangeVerified) (f : ℝ → ℝ) (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)
    (hf : AbsolutelyContinuousOnInterval f x (x + y)) (hf0 : ∀ t ∈ Set.Icc x (x + y), 0 ≤ f t)
    (hρ : 1 < butheRho f x y) :
    ∑ p ∈ (Icc ⌈x⌉₊ ⌊x + y⌋₊).filter Nat.Prime, f p <
      2 * (∫ t in x..x + y, |f t|) / log (butheRho f x y) := by
  sorry

/-- **Layer 6.2, the diagonal sum below `10⁹`**: `S(z) ≥ log z + 1.07` for every real
`6 ≤ z < 10⁹` (the range of Montgomery–Vaughan's Lemma 7 below Büthe's analytic estimate). -/
def MVDiagonalFiniteRange : Prop :=
  ∀ z : ℝ, 6 ≤ z → z < 10 ^ 9 → log z + 1.07 ≤ selbergDiagonal z

/-- **Ramaré–Viswanadham's prime-power sum** (Ramaré–Viswanadham 2021, Lemma 14, extending
Montgomery–Vaughan's Brun–Titchmarsh inequality). Under `MVDiagonalFiniteRange`, for an integer
`d ≥ 1`, a residue `a` prime to `d` and reals `A ≥ B > d`,
`∑_{A < m ≤ A + B, m ≡ a (d)} Λ(m)/log m ≤ 2B/(φ(d) log(B/d))`. -/
theorem ramare_viswanadham_prime_powers (hMV : MVDiagonalFiniteRange) (d a : ℕ) (hd : 1 ≤ d)
    (had : Nat.Coprime a d) (A B : ℝ) (hBA : B ≤ A) (hdB : (d : ℝ) < B) :
    ∑ m ∈ (Ioc ⌊A⌋₊ ⌊A + B⌋₊).filter (fun m => m % d = a % d),
        ArithmeticFunction.vonMangoldt m / log m ≤
      2 * B / (d.totient * log (B / d)) := by
  sorry

/-- **Layer 6.5, Fan's finite range**: the three inequalities of `fan_rough_count` for every real
`x < 2·10⁶` and every `z` in their respective ranges, the middle one for `x ≥ 8` (Fan 2022, the
direct verifications in the proof of the Theorem). -/
def FanFiniteRange : Prop :=
  ∀ x z : ℝ, x < 2 * 10 ^ 6 → 1 < z → z ≤ x →
    (roughCount x z : ℝ) < x / log z ∧
      (8 ≤ x → max 3 √x ≤ z → (roughCount x z : ℝ) < x / log z - x / (2 * log z ^ 2)) ∧
      (max 2 (x ^ (2 / 5 : ℝ)) ≤ z → z ≤ √x → (roughCount x z : ℝ) < 2 * x / (3 * log z))

/-- **Fan's bounds for integers free of small prime factors** (Fan 2022, the Theorem,
inequalities (4)–(6)). Under `RosserSchoenfeldFiniteRangeInput`, `MVDiagonalFiniteRange` and
`FanFiniteRange`, for reals `1 < z ≤ x`: `Φ(x, z) < x/log z`; if moreover `x ≥ 8` and
`z ≥ max(3, √x)`, `Φ(x, z) < x/log z − x/(2 log² z)`; and if `max(2, x^{2/5}) ≤ z ≤ √x`,
`Φ(x, z) < 2x/(3 log z)`. The middle inequality is false as printed at `x = 7` for
`4.9910 < z < 5`, where `Φ(7, z) = 3` and the right side lies strictly between `2.9982` and `3`;
it holds for every real `x ≥ 8`. -/
theorem fan_rough_count (hRS : RosserSchoenfeldFiniteRangeInput) (hMV : MVDiagonalFiniteRange)
    (hF : FanFiniteRange) (x z : ℝ) (hz : 1 < z) (hzx : z ≤ x) :
    (roughCount x z : ℝ) < x / log z ∧
      (8 ≤ x → max 3 √x ≤ z → (roughCount x z : ℝ) < x / log z - x / (2 * log z ^ 2)) ∧
      (max 2 (x ^ (2 / 5 : ℝ)) ≤ z → z ≤ √x → (roughCount x z : ℝ) < 2 * x / (3 * log z)) := by
  sorry

end TauCetiRoadmap.ExplicitCharacterSumsAndSieves
