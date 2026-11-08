module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

/-!
# Explicit exponential sums, character sums and sieve bounds: target signatures

This file is not the roadmap. The roadmap is `README.md`; this file states, against the pinned
Mathlib and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each
with `sorry`, together with the few definitions their statements need. Every finite verification
a theorem rests on is a named proposition, listed in Layer 6 of the README, and an explicit
hypothesis of each theorem that uses it.

Headline theorems stated here:

* Layer 0: the quadratic-character point count of a Weierstrass equation with `a₁ = a₃ = 0` over a
  finite field of odd characteristic (`pointCount_eq_card_add_sum_quadraticChar`,
  `frobeniusTrace_eq_neg_sum_quadraticChar`), consumed by Burgess's moment bound.
* Layer 1: Arias de Reyna's iterated van der Corput inequality (`iterated_vanDerCorput`). The
  finite van der Corput inequality, the Kusmin–Landau lemma and the derivative tests for
  exponential sums, Patel's corrected third, fourth and fifth derivative tests among them, belong
  to the roadmap ExplicitZetaBounds and are not stated here.
* Layer 2: the first and second derivative tests for integer points near a curve
  (`first_derivative_test_points`, `second_derivative_test_points`).
* Layer 3: the classical explicit Pólya–Vinogradov inequality (`polya_vinogradov_classical`),
  Lapkova's (`polya_vinogradov_lapkova`), Pomerance's (`polya_vinogradov_pomerance`) and
  Frolenkov–Soundararajan's bound for nonprincipal characters
  (`polya_vinogradov_frolenkov_soundararajan`).
* Layer 4: Burgess's moment bound (`burgess_moment_bound`), McGown's parametric Burgess
  inequality (`burgess_mcgown_parametric`) and his table of constants (`burgess_mcgown_table`);
  Treviño's tabulated Burgess inequalities (`burgess_trevino_table1`, `burgess_trevino_table3`),
  his uniform constant `2.74` (`burgess_trevino_uniform`) and the extension of the second table
  to every interval length (`burgess_trevino_table3_unrestricted`).
* Layer 5: Greaves's lower bound for Selberg's density sum (`greaves_density_sum`), Büthe's
  weighted Brun–Titchmarsh inequalities (`buthe_weighted_brun_titchmarsh`,
  `buthe_weighted_prime_sum`), Ramaré–Viswanadham's prime-power sum in a progression
  (`ramare_viswanadham_prime_powers`) and Fan's bounds for integers free of small prime factors
  (`fan_rough_count`).

Every headline theorem of the roadmap is statable at the pins and is stated here.
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

/-! ## Layer 0: the quadratic-character point count -/

/-- **The quadratic-character point count** (Silverman, §V.1). Over a finite field `F` of odd
characteristic, a Weierstrass equation `y² = x³ + a₂x² + a₄x + a₆` (that is, `a₁ = a₃ = 0`) has
projective point count `q + 1 + ∑_x η(x³ + a₂x² + a₄x + a₆)`, `η` the quadratic character of `F`
and `q = |F|`. The count is Tau Ceti's `WeierstrassCurve.pointCount`, which includes every singular
solution, so no ellipticity is assumed. -/
theorem pointCount_eq_card_add_sum_quadraticChar {F : Type*} [Field F] [Fintype F]
    [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) [W.IsCharNeTwoNF] :
    (W.pointCount : ℤ) = Fintype.card F + 1 +
      ∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

/-- **The Frobenius trace as a quadratic-character sum.** Under the hypotheses of
`pointCount_eq_card_add_sum_quadraticChar`, the trace `q + 1 − #W(F)` is
`−∑_x η(x³ + a₂x² + a₄x + a₆)`, singular equations included. -/
theorem frobeniusTrace_eq_neg_sum_quadraticChar {F : Type*} [Field F] [Fintype F]
    [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) [W.IsCharNeTwoNF] :
    W.frobeniusTrace = -∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

/-! ## Layer 1: the iterated van der Corput inequality -/

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

/-- **Pomerance's explicit Pólya–Vinogradov inequality** (Pomerance 2011, Theorem 1). Under
`LapkovaSmallModuliVerified`, for a primitive character `χ` modulo `q > 1` and every interval
sum, `|S_χ(M, N)| ≤ (2/π²)√q log q + (4/π²)√q log log q + (3/2)√q` if `χ` is even and
`|S_χ(M, N)| ≤ (1/(2π))√q log q + (1/π)√q log log q + √q` if `χ` is odd. The source's analytic
argument covers even `q ≥ 21` and odd `q ≥ 45`; the classical bound covers even `q ≤ 20` and odd
`q ≤ 10`, and Lapkova's odd bound, which rests on the hypothesis for `q ≤ 25`, covers odd
`11 ≤ q ≤ 44`. -/
theorem polya_vinogradov_pomerance (hsmall : LapkovaSmallModuliVerified) {q : ℕ}
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : 1 < q) :
    (χ.Even → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
      2 / π ^ 2 * √q * log q + 4 / π ^ 2 * √q * log (log q) + 3 / 2 * √q) ∧
    (χ.Odd → ∀ (M : ℤ) (N : ℕ), ‖charIntervalSum χ M N‖ ≤
      1 / (2 * π) * √q * log q + 1 / π * √q * log (log q) + √q) := by
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

/-- **Layer 6.8, McGown's small range**: `∑_{a prime ≤ X} (π(a) − 1)/a < π(X)/3` for every integer
`2 ≤ X ≤ 100` (McGown 2012, Lemma A.8), and `π(A) ≥ A/(1 + log A)` for every integer
`3 ≤ A ≤ 58` (McGown 2012, proof of Theorem A.9). -/
def McGownSmallRange : Prop :=
  (∀ X : ℕ, 2 ≤ X → X ≤ 100 →
    ∑ a ∈ (Icc 1 X).filter Nat.Prime, ((Nat.primeCounting a : ℝ) - 1) / a <
      (Nat.primeCounting X : ℝ) / 3) ∧
  ∀ A : ℕ, 3 ≤ A → A ≤ 58 → (A : ℝ) / (1 + log A) ≤ Nat.primeCounting A

/-- **McGown's parametric Burgess inequality** (McGown 2012, Theorem A.9). Let `χ` be a
nonprincipal character modulo an odd prime `p`, `r ≥ 2`, and let `d > 4`, `C ≥ 1`, `p₀ ≥ 2` satisfy
`(A.1) C^r p₀^{1/4 − 1/(4r)} (log p₀)^{1/2} ≥ 4d(d + 1)r` and
`(A.2) C ≥ ((d + 1)(2r − 1)(4r − 1))^{1/(2r)}/(1 − 2 d^{−(1 − 1/r)})`. Under
`RosserSchoenfeldFiniteRangeInput` and `McGownSmallRange`, for `p ≥ p₀`, every integer `N₀` and
every integer `1 ≤ H ≤ √(rd) p^{1/2 + 1/(4r)}`,
`|∑_{N₀ < n ≤ N₀ + H} χ(n)| ≤ C H^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_mcgown_parametric (hRS : RosserSchoenfeldFiniteRangeInput)
    (hsmall : McGownSmallRange) {p : ℕ}
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

/-- **Layer 6.5, McGown's table**: for each `2 ≤ r ≤ 15`, the right side
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
`RosserSchoenfeldFiniteRangeInput`, `McGownSmallRange` and `McGownTableCertificate`, for a
nonprincipal character `χ` modulo a prime `p ≥ 2·10⁴`, `2 ≤ r ≤ 15`, every integer `N₀` and every
integer `1 ≤ H ≤ 4p^{1/2 + 1/(4r)}`,
`|∑_{N₀ < n ≤ N₀ + H} χ(n)| < C(r) H^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_mcgown_table (hRS : RosserSchoenfeldFiniteRangeInput)
    (hsmall : McGownSmallRange) (hM : McGownTableCertificate) {p : ℕ} [Fact p.Prime]
    (hp : 20000 ≤ p) (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (r : ℕ) (hr : 2 ≤ r) (hr' : r ≤ 15)
    (N₀ : ℤ) (H : ℕ) (hH : 1 ≤ H) (hHp : (H : ℝ) ≤ 4 * (p : ℝ) ^ (1 / 2 + 1 / (4 * r) : ℝ)) :
    ‖charIntervalSum χ N₀ H‖ <
      mcgownConstant r * (H : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / (2 * r) : ℝ) := by
  sorry

/-- Treviño's Table 1: the constant `c₁(r, p₀)` of his Burgess inequality with `(log p)^{1/r}`,
at `p₀ = 10^e` for `e ∈ {7, 10, 20}` and `2 ≤ r ≤ 10` (Treviño 2015, Table 1); `0` elsewhere. -/
def trevinoTable1 : ℕ → ℕ → ℝ
  | 7, 2 => 2.7381 | 7, 3 => 2.0197 | 7, 4 => 1.7308 | 7, 5 => 1.6107 | 7, 6 => 1.5482
  | 7, 7 => 1.5052 | 7, 8 => 1.4703 | 7, 9 => 1.4411 | 7, 10 => 1.4160
  | 10, 2 => 2.5173 | 10, 3 => 1.7385 | 10, 4 => 1.5151 | 10, 5 => 1.4572 | 10, 6 => 1.4274
  | 10, 7 => 1.4042 | 10, 8 => 1.3846 | 10, 9 => 1.3662 | 10, 10 => 1.3495
  | 20, 2 => 2.3549 | 20, 3 => 1.3695 | 20, 4 => 1.3104 | 20, 5 => 1.2987 | 20, 6 => 1.2901
  | 20, 7 => 1.2813 | 20, 8 => 1.2729 | 20, 9 => 1.2641 | 20, 10 => 1.2562
  | _, _ => 0

/-- Treviño's Table 5: the parameters `(k, c₁′(r))` with which his closing inequality produces
`trevinoTable1 e r`, at `p₀ = 10^e` for `e ∈ {7, 10, 20}` and `2 ≤ r ≤ 10` (Treviño 2015,
Table 5); `(0, 0)` elsewhere. -/
def trevinoTable5 : ℕ → ℕ → ℝ × ℝ
  | 7, 2 => (2 / 45, 2.738) | 7, 3 => (1 / 16, 2.019) | 7, 4 => (1 / 12, 1.729)
  | 7, 5 => (1 / 12, 1.610) | 7, 6 => (1 / 12, 1.548) | 7, 7 => (11 / 150, 1.504)
  | 7, 8 => (19 / 300, 1.470) | 7, 9 => (19 / 300, 1.441) | 7, 10 => (4 / 75, 1.415)
  | 10, 2 => (1 / 30, 2.517) | 10, 3 => (11 / 150, 1.737) | 10, 4 => (31 / 300, 1.515)
  | 10, 5 => (7 / 75, 1.456) | 10, 6 => (1 / 12, 1.426) | 10, 7 => (11 / 150, 1.404)
  | 10, 8 => (19 / 300, 1.383) | 10, 9 => (19 / 300, 1.366) | 10, 10 => (4 / 75, 1.349)
  | 20, 2 => (1 / 30, 2.354) | 20, 3 => (2 / 15, 1.369) | 20, 4 => (37 / 300, 1.310)
  | 20, 5 => (31 / 300, 1.298) | 20, 6 => (7 / 75, 1.289) | 20, 7 => (1 / 12, 1.281)
  | 20, 8 => (1 / 12, 1.272) | 20, 9 => (11 / 150, 1.264) | 20, 10 => (11 / 150, 1.256)
  | _, _ => (0, 0)

/-- **Layer 6.6, Treviño's Table 1**: for every row `(e, r)` of Table 1 and every real
`p ≥ 10^e`, with `(k, c′) = trevinoTable5 e r`, `D = ((2r − 3)!!(r − 1))^{1/r}`,
`B = D p^{1/(2r)}`, `A = k c′^r p^{1/4 − 1/(4r)} log p / D`, and `s = (c₁(r − 1)/c′)^{r(r−1)}`
for `r ≥ 3` (`s = 1` for `r = 2`), one has `A ≥ 29`, `c′ < c₁(r)`, and the right side
`num/den` of Treviño's closing display (47), which at `r = 2` is display (46), has a positive
denominator and is at most `c₁(r)` (Treviño 2015, proof of Theorem 1). -/
def TrevinoTable1Certificate : Prop :=
  ∀ e ∈ ({7, 10, 20} : Finset ℕ), ∀ r : ℕ, 2 ≤ r → r ≤ 10 → ∀ p : ℝ, (10 : ℝ) ^ e ≤ p →
    let c := trevinoTable1 e r
    let k := (trevinoTable5 e r).1
    let c' := (trevinoTable5 e r).2
    let D : ℝ := (((2 * r - 3).doubleFactorial * (r - 1) : ℕ) : ℝ) ^ (1 / (r : ℝ))
    let B := D * p ^ (1 / (2 * (r : ℝ)))
    let A := k * c' ^ r * p ^ (1 / 4 - 1 / (4 * (r : ℝ))) * log p / D
    let s : ℝ := if r = 2 then 1 else (trevinoTable1 e (r - 1) / c') ^ (r * (r - 1))
    let g := A * B / ((A - 1) * (B - 1))
    let h := (A + 1) * (B + 1) / (A * B)
    let bracket := s ^ 2 / (D * p ^ (((r : ℝ) - 2) / (2 * ((r : ℝ) - 1)))) +
      1 / (4 * k * log p) + 1 / (4 * (r : ℝ) * ((r : ℝ) - 1) * k * log p) +
      log (1.85 * s * k * log p / D) / (k * log p ^ 2)
    let num := g * (2 * (r : ℝ) * (2 * (r : ℝ) - 1) * D / ((r : ℝ) - 1)) ^ (1 / (2 * (r : ℝ))) *
      bracket ^ (1 / (2 * (r : ℝ)))
    let den := 1 - 2 * (r : ℝ) ^ 2 / (2 * (r : ℝ) - 1) ^ 2 * k ^ (1 - 1 / (r : ℝ)) *
      h ^ (2 - 1 / (r : ℝ)) * g
    29 ≤ A ∧ c' < c ∧ 0 < den ∧ num ≤ c * den

/-- **Treviño's Burgess inequality** (Treviño 2015, Theorem 1 and Table 1). Under
`TrevinoTable1Certificate`, for `e ∈ {7, 10, 20}`, `2 ≤ r ≤ 10`, a prime `p ≥ 10^e`, a
nonprincipal character `χ` modulo `p`, every integer `M` and `N ≥ 1`,
`|∑_{M < n ≤ M + N} χ(n)| ≤ c₁(r, 10^e) N^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/r}`. -/
theorem burgess_trevino_table1 (hT : TrevinoTable1Certificate) {p : ℕ} [Fact p.Prime]
    (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (e : ℕ) (he : e ∈ ({7, 10, 20} : Finset ℕ))
    (hp : (10 : ℝ) ^ e ≤ p) (r : ℕ) (hr : 2 ≤ r) (hr' : r ≤ 10) (M : ℤ) (N : ℕ) (hN : 1 ≤ N) :
    ‖charIntervalSum χ M N‖ ≤
      trevinoTable1 e r * (N : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / r : ℝ) := by
  sorry

/-- **Treviño's uniform Burgess inequality** (Treviño 2015, Corollary 1). Under
`TrevinoTable1Certificate`, for a prime `p ≥ 10⁷`, a nonprincipal character `χ` modulo `p`, every
`r ≥ 1`, every integer `M` and `N ≥ 1`,
`|∑_{M < n ≤ M + N} χ(n)| ≤ 2.74 N^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/r}`. -/
theorem burgess_trevino_uniform (hT : TrevinoTable1Certificate) {p : ℕ} [Fact p.Prime]
    (hp : 10 ^ 7 ≤ p) (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (r : ℕ) (hr : 1 ≤ r) (M : ℤ)
    (N : ℕ) (hN : 1 ≤ N) :
    ‖charIntervalSum χ M N‖ ≤
      2.74 * (N : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / r : ℝ) := by
  sorry

/-- Treviño's Table 3: the constant `c₂(r, p₀)` of his Burgess inequality with
`(log p)^{1/(2r)}`, at `p₀ = 10^e` for `e ∈ {10, 15, 20}` and `2 ≤ r ≤ 10` (Treviño 2015,
Table 3); `0` elsewhere. -/
def trevinoTable3 : ℕ → ℕ → ℝ
  | 10, 2 => 3.6529 | 10, 3 => 2.5888 | 10, 4 => 2.1914 | 10, 5 => 1.9841 | 10, 6 => 1.8508
  | 10, 7 => 1.7586 | 10, 8 => 1.6869 | 10, 9 => 1.6283 | 10, 10 => 1.5794
  | 15, 2 => 3.5851 | 15, 3 => 2.5144 | 15, 4 => 2.1258 | 15, 5 => 1.9231 | 15, 6 => 1.7959
  | 15, 7 => 1.7066 | 15, 8 => 1.6384 | 15, 9 => 1.5857 | 15, 10 => 1.5410
  | 20, 2 => 3.5751 | 20, 3 => 2.4945 | 20, 4 => 2.1078 | 20, 5 => 1.9043 | 20, 6 => 1.7757
  | 20, 7 => 1.6854 | 20, 8 => 1.6187 | 20, 9 => 1.5654 | 20, 10 => 1.5216
  | _, _ => 0

/-- Treviño's Table 7: the parameters `(k, c₂′(r))` with which his closing inequality produces
`trevinoTable3 e r`, at `p₀ = 10^e` for `e ∈ {10, 15, 20}` and `2 ≤ r ≤ 10` (Treviño 2015,
Table 7); `(0, 0)` elsewhere. -/
def trevinoTable7 : ℕ → ℕ → ℝ × ℝ
  | 10, 2 => (0.124, 3.65) | 10, 3 => (0.126, 2.58) | 10, 4 => (0.106, 2.19)
  | 10, 5 => (0.091, 1.98) | 10, 6 => (0.080, 1.85) | 10, 7 => (0.072, 1.75)
  | 10, 8 => (0.064, 1.68) | 10, 9 => (0.058, 1.625) | 10, 10 => (0.054, 1.579)
  | 15, 2 => (0.124, 3.58) | 15, 3 => (0.131, 2.51) | 15, 4 => (0.116, 2.12)
  | 15, 5 => (0.101, 1.92) | 15, 6 => (0.090, 1.79) | 15, 7 => (0.079, 1.70)
  | 15, 8 => (0.071, 1.635) | 15, 9 => (0.065, 1.58) | 15, 10 => (0.060, 1.54)
  | 20, 2 => (0.124, 3.57) | 20, 3 => (0.135, 2.49) | 20, 4 => (0.120, 2.10)
  | 20, 5 => (0.107, 1.90) | 20, 6 => (0.095, 1.77) | 20, 7 => (0.084, 1.68)
  | 20, 8 => (0.077, 1.61) | 20, 9 => (0.070, 1.56) | 20, 10 => (0.064, 1.52)
  | _, _ => (0, 0)

/-- **Layer 6.7, Treviño's Table 3**: for every row `(e, r)` of Table 3 and every real
`p ≥ 10^e`, with `(k, c′) = trevinoTable7 e r`, `D` and `B` as in `TrevinoTable1Certificate`,
`A = k c′^r p^{1/4 − 1/(4r)} √(log p) / D` and `s = (c₂(r − 1)/c′)^{r(r−1)}` for `r ≥ 3`, one has
`A ≥ 31`, `8k < D`, `c′ < c₂(r)`, and the right side `num/den` of Treviño's closing display (58)
(`r = 2`) or (59) (`r ≥ 3`) has a positive denominator and is less than `c₂(r)` (Treviño 2015,
proof of Theorem 2). -/
def TrevinoTable3Certificate : Prop :=
  ∀ e ∈ ({10, 15, 20} : Finset ℕ), ∀ r : ℕ, 2 ≤ r → r ≤ 10 → ∀ p : ℝ, (10 : ℝ) ^ e ≤ p →
    let c := trevinoTable3 e r
    let k := (trevinoTable7 e r).1
    let c' := (trevinoTable7 e r).2
    let D : ℝ := (((2 * r - 3).doubleFactorial * (r - 1) : ℕ) : ℝ) ^ (1 / (r : ℝ))
    let B := D * p ^ (1 / (2 * (r : ℝ)))
    let A := k * c' ^ r * p ^ (1 / 4 - 1 / (4 * (r : ℝ))) * √(log p) / D
    let s : ℝ := (trevinoTable3 e (r - 1) / c') ^ (r * (r - 1))
    let g := A * B / ((A - 1) * (B - 1))
    let h := (A + 1) * (B + 1) / (A * B)
    let bracket : ℝ := if r = 2 then 3 / (8 * k) else
      log (1.85 * s * k * √(log p) / D) / (k * log p) + 1 / (4 * k) +
        1 / (4 * (r : ℝ) * ((r : ℝ) - 1) * k)
    let num := g * (2 * (r : ℝ) * (2 * (r : ℝ) - 1) * D / ((r : ℝ) - 1)) ^ (1 / (2 * (r : ℝ))) *
      bracket ^ (1 / (2 * (r : ℝ)))
    let den := 1 - 2 * (r : ℝ) ^ 2 / (2 * (r : ℝ) - 1) ^ 2 * k ^ (1 - 1 / (r : ℝ)) *
      h ^ (2 - 1 / (r : ℝ)) * g
    31 ≤ A ∧ 8 * k < D ∧ c' < c ∧ 0 < den ∧ num < c * den

/-- **Treviño's Burgess inequality with `(log p)^{1/(2r)}`** (Treviño 2015, Theorem 2 and
Table 3). Under `TrevinoTable3Certificate`, for `e ∈ {10, 15, 20}`, `2 ≤ r ≤ 10`, a prime
`p ≥ 10^e`, a nonprincipal character `χ` modulo `p`, every integer `M` and
`1 ≤ N ≤ 2p^{1/2 + 1/(4r)}`,
`|∑_{M < n ≤ M + N} χ(n)| < c₂(r, 10^e) N^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_trevino_table3 (hT : TrevinoTable3Certificate) {p : ℕ} [Fact p.Prime]
    (χ : DirichletCharacter ℂ p) (hχ : χ ≠ 1) (e : ℕ) (he : e ∈ ({10, 15, 20} : Finset ℕ))
    (hp : (10 : ℝ) ^ e ≤ p) (r : ℕ) (hr : 2 ≤ r) (hr' : r ≤ 10) (M : ℤ) (N : ℕ) (hN : 1 ≤ N)
    (hNp : (N : ℝ) ≤ 2 * (p : ℝ) ^ (1 / 2 + 1 / (4 * r) : ℝ)) :
    ‖charIntervalSum χ M N‖ <
      trevinoTable3 e r * (N : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
        log p ^ (1 / (2 * r) : ℝ) := by
  sorry

/-- **Treviño's Burgess inequality with `(log p)^{1/(2r)}` for every length** (Treviño 2015,
Corollary 2). Under `TrevinoTable1Certificate` and `TrevinoTable3Certificate`, for
`e ∈ {10, 15, 20}`, `3 ≤ r ≤ 10`, a prime `p ≥ 10^e`, a nonprincipal character `χ` modulo `p`,
every integer `M` and every `N ≥ 1`,
`|∑_{M < n ≤ M + N} χ(n)| < c₂(r, 10^e) N^{1 − 1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}`. -/
theorem burgess_trevino_table3_unrestricted (hT₁ : TrevinoTable1Certificate)
    (hT₃ : TrevinoTable3Certificate) {p : ℕ} [Fact p.Prime] (χ : DirichletCharacter ℂ p)
    (hχ : χ ≠ 1) (e : ℕ) (he : e ∈ ({10, 15, 20} : Finset ℕ)) (hp : (10 : ℝ) ^ e ≤ p) (r : ℕ)
    (hr : 3 ≤ r) (hr' : r ≤ 10) (M : ℤ) (N : ℕ) (hN : 1 ≤ N) :
    ‖charIntervalSum χ M N‖ <
      trevinoTable3 e r * (N : ℝ) ^ (1 - 1 / r : ℝ) * (p : ℝ) ^ ((r + 1) / (4 * r ^ 2) : ℝ) *
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

/-- **Layer 6.2, Büthe's small range**: for every real `1 < Y < 20000` there is a real `z ≥ 1`
with `Y ∏_{p ≤ z}(1 − 1/p) + 2^{π(z)} + π(z) < 2Y/log Y` (Büthe 2014, proof of Theorem 4.3). -/
def ButheSmallRangeVerified : Prop :=
  ∀ Y : ℝ, 1 < Y → Y < 20000 → ∃ z : ℝ, 1 ≤ z ∧
    Y * ∏ p ∈ (Icc 1 ⌊z⌋₊).filter Nat.Prime, (1 - 1 / (p : ℝ)) +
        2 ^ Nat.primeCounting ⌊z⌋₊ + Nat.primeCounting ⌊z⌋₊ < 2 * Y / log Y

/-- **Layer 6.3, Büthe's medium range**: for every real `20000 ≤ Y ≤ 4·10¹⁸` there is a real
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

/-- The finite-range input of ExplicitPrimeCounting §0.1: Montgomery–Vaughan's diagonal bound
`S(z) ≥ log z + 1.07` for every real `6 ≤ z < 10⁹`, the range below Büthe's explicit asymptotic
for `S`. It is restated here only so that the theorems consuming that section are statable at
the pins. -/
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

/-- **Layer 6.4, Fan's finite range**: the three inequalities of `fan_rough_count` for every real
`x < 2·10⁶` and every `z` in their respective ranges, the middle one for `x ≥ 8` (Fan 2022, proof
of the Theorem). -/
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
`4.9910 < z < 5`, where `Φ(7, z) = 3` and the right side lies strictly between `2.9981` and `3`;
it holds for every real `x ≥ 8`. -/
theorem fan_rough_count (hRS : RosserSchoenfeldFiniteRangeInput) (hMV : MVDiagonalFiniteRange)
    (hF : FanFiniteRange) (x z : ℝ) (hz : 1 < z) (hzx : z ≤ x) :
    (roughCount x z : ℝ) < x / log z ∧
      (8 ≤ x → max 3 √x ≤ z → (roughCount x z : ℝ) < x / log z - x / (2 * log z ^ 2)) ∧
      (max 2 (x ^ (2 / 5 : ℝ)) ≤ z → z ≤ √x → (roughCount x z : ℝ) < 2 * x / (3 * log z)) := by
  sorry

end TauCetiRoadmap.ExplicitCharacterSumsAndSieves
