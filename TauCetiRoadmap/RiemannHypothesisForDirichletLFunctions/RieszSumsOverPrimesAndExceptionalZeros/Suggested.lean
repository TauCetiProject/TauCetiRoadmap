import Mathlib
import TauCeti.Analysis.SpecialFunctions.LogIntegral

/-!
# Riesz sums over primes and exceptional zeros: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with `sorry`
proofs. Dirichlet `L`-functions are Mathlib's `DirichletCharacter.LFunction`, and `(L′/L)(1, χ)`
is the quotient of its derivative at `1` by its value there; the von Mangoldt function is
`ArithmeticFunction.vonMangoldt` and Euler's constant is `Real.eulerMascheroniConstant`. As in the
README, the constants below are asserted to exist; none of them is claimed to be effective.

All three headlines are statable at the pins and are stated: the prime number theorem for the
Riesz remainder in its exception-free form (1.4i (c)), Linnik's theorem (1.7b (iii)), and the
count of primes that are norms of `α ≡ 1 (mod M)` from an imaginary quadratic field in short
intervals (2.9b (iv) (c)). The first and the third are this roadmap's general forms; beside them
stand the forms that the formal proof [FormalProof] of the README provides: the prime number
theorem for the Riesz remainder under a zero-free interval (1.4i (c′)) and the count for the
fields `ℚ(√−d)` (2.9b (iv) (c′)). The form of 1.4i (a) with the exceptional term follows from
1.4i (c) with AnalyticNumberTheoryPartI §0.34, and the field forms 1.4i (b) and (b′) follow from
1.4i (c) and (c′) in a few lines; none is restated.

The Deuring–Heilbronn repulsion (1.7b (i)) and Gallagher's prime number theorem in Linnik's range
(1.7b (ii)), on which Linnik's theorem rests, are statements of the formal proof and are stated.
The character prime number theorem with the exceptional term (1.4g (b)) is statable, but it is a
corollary of AnalyticNumberTheoryPartI §§0.18 and 0.34; it is a step of the routes and is not
stated here. The bound for `L′/L(1, χ)` under a zero-free box (1.4f), the power-sum inequality
(1.7a) and the bound for ray class numbers in 2.9b are statable as well; they are steps of the
routes to the headlines or statements that are not headlines, and they are not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RieszSumsOverPrimesAndExceptionalZeros

open ArithmeticFunction

/-! ## Layer 1: Zero-free boxes, Riesz remainders, exceptional zeros and Linnik's theorem -/

/-- The prime number theorem for the Riesz remainder, in its exception-free form (1.4i (c)).
There are absolute `C, c > 0` such that for every primitive nonprincipal Dirichlet character `χ`
of conductor `N` and every `y ≥ 2` the Riesz remainder
`G_χ(y) = Σ_{n ≤ y} Λ(n) χ(n) (y/n − 1) + y (L′/L)(1, χ)` satisfies
`|G_χ(y)| ≤ C y (log 3N)^5 exp(−c log y/(√(log y) + log N))`, and the remainder
`G_1(y) = Σ_{n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y` of the trivial character satisfies
`|G_1(y)| ≤ C y exp(−c √(log y))` for every `y ≥ 2`. This form is this roadmap's: it rests on
AnalyticNumberTheoryPartI §0.34, which the formal proof does not use, and the family uses
`norm_rieszRemainder_le_of_no_real_zero` instead. -/
theorem norm_rieszRemainder_le :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ ≠ 1 →
        ∀ y : ℝ, 2 ≤ y →
          ‖(∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (Λ n : ℂ) * χ n * ((y / n - 1 : ℝ) : ℂ)) +
              (y : ℂ) * (deriv χ.LFunction 1 / χ.LFunction 1)‖ ≤
            C * y * Real.log (3 * N) ^ 5 *
              Real.exp (-(c * Real.log y) / (√(Real.log y) + Real.log N))) ∧
      ∀ y : ℝ, 2 ≤ y →
        |(∑ n ∈ Finset.Icc 1 ⌊y⌋₊, Λ n * (y / n - 1)) - y * Real.log y +
            (1 + Real.eulerMascheroniConstant) * y| ≤
          C * y * Real.exp (-(c * √(Real.log y))) := by
  sorry

/-- The prime number theorem for the Riesz remainder under a zero-free interval (1.4i (c′)), the
form of the formal proof. For every `c₀ > 0` there are `C, c > 0` such that for every primitive
nonprincipal Dirichlet character `χ` of conductor `N` for which, when `χ` is real, `L(s, χ)` has
no real zero in `(1 − c₀, 1)`, and every `y ≥ 2`,
`|G_χ(y)| ≤ C y (log 3N)^5 exp(−c log y/(√(log y) + log N))`; and
`|G_1(y)| ≤ C y exp(−c √(log y))` for every `y ≥ 2`. -/
theorem norm_rieszRemainder_le_of_no_real_zero (c₀ : ℝ) (hc₀ : 0 < c₀) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧
      (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ ≠ 1 →
        (χ ^ 2 = 1 → ∀ β : ℝ, 1 - c₀ < β → β < 1 → χ.LFunction (β : ℂ) ≠ 0) →
        ∀ y : ℝ, 2 ≤ y →
          ‖(∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (Λ n : ℂ) * χ n * ((y / n - 1 : ℝ) : ℂ)) +
              (y : ℂ) * (deriv χ.LFunction 1 / χ.LFunction 1)‖ ≤
            C * y * Real.log (3 * N) ^ 5 *
              Real.exp (-(c * Real.log y) / (√(Real.log y) + Real.log N))) ∧
      ∀ y : ℝ, 2 ≤ y →
        |(∑ n ∈ Finset.Icc 1 ⌊y⌋₊, Λ n * (y / n - 1)) - y * Real.log y +
            (1 + Real.eulerMascheroniConstant) * y| ≤
          C * y * Real.exp (-(c * √(Real.log y))) := by
  sorry

/-- The Deuring–Heilbronn repulsion (1.7b (i)). There is an absolute `c > 0` with the following
property. Let `q ≥ 3`, let `χ₁` be a real nonprincipal character modulo `q` and `β₁ ∈ [1/2, 1)`
with `L(β₁, χ₁) = 0`. Let `χ` be any character modulo `q` and `ρ ≠ 1` a zero of `L(s, χ)` with
`Re ρ ≥ 1/2`; if `χ = χ₁` and `ρ = β₁`, assume that `β₁` is a multiple zero of `L(s, χ₁)`. Then
`1 − Re ρ ≥ c log(c/((1 − β₁) ℒ))/ℒ` for every `ℒ ≥ log(q(|Im ρ| + 2))`. -/
theorem deuring_heilbronn_repulsion :
    ∃ c : ℝ, 0 < c ∧
      ∀ (q : ℕ) [NeZero q], 3 ≤ q → ∀ χ₁ : DirichletCharacter ℂ q, χ₁ ≠ 1 → χ₁ ^ 2 = 1 →
        ∀ β₁ : ℝ, 1 / 2 ≤ β₁ → β₁ < 1 → χ₁.LFunction (β₁ : ℂ) = 0 →
        ∀ (χ : DirichletCharacter ℂ q) (ρ : ℂ), χ.LFunction ρ = 0 → ρ ≠ 1 → 1 / 2 ≤ ρ.re →
          (χ = χ₁ → ρ = (β₁ : ℂ) → 2 ≤ analyticOrderAt χ₁.LFunction (β₁ : ℂ)) →
          ∀ ℒ : ℝ, Real.log (q * (|ρ.im| + 2)) ≤ ℒ →
            c * Real.log (c / ((1 - β₁) * ℒ)) / ℒ ≤ 1 - ρ.re := by
  sorry

/-- Gallagher's prime number theorem in Linnik's range (1.7b (ii)). There are absolute
`L, c, c₁, C > 0` with the following property. Let `q ≥ 3` and `a` coprime to `q`; let
`θ = 0` if there is no exceptional pair modulo `q` at width `c₁` (a real nonprincipal `χ₁`
modulo `q` and a real `β₁` with `L(β₁, χ₁) = 0` and `1 − c₁/log q < β₁ < 1`), and
`θ = χ₁(a)` for such a pair `(χ₁, β₁)`. Put `E_ψ(x) = (x − θ x^β₁/β₁)/φ(q)`,
`E_π(x) = (Li x − θ Li(x^β₁))/φ(q)` and `ε(x) = C (e^(−c log x/log q) + e^(−c √(log x)))`. Then
`|ψ(x;a,q) − E_ψ(x)| ≤ ε(x) E_ψ(x)` and `|π(x;a,q) − E_π(x)| ≤ ε(x) E_π(x)` for every
`x ≥ q^L`. -/
theorem gallagher_primeCount_linnik_range :
    ∃ L c c₁ C : ℝ, 0 < L ∧ 0 < c ∧ 0 < c₁ ∧ 0 < C ∧
      ∀ (q : ℕ) [NeZero q], 3 ≤ q → ∀ a : ℕ, a.Coprime q → ∀ θ β₁ : ℝ,
        ((θ = 0 ∧ ∀ (χ₁ : DirichletCharacter ℂ q) (β : ℝ), χ₁ ≠ 1 → χ₁ ^ 2 = 1 →
            1 - c₁ / Real.log q < β → β < 1 → χ₁.LFunction (β : ℂ) ≠ 0) ∨
          ∃ χ₁ : DirichletCharacter ℂ q, χ₁ ≠ 1 ∧ χ₁ ^ 2 = 1 ∧ 1 - c₁ / Real.log q < β₁ ∧
            β₁ < 1 ∧ χ₁.LFunction (β₁ : ℂ) = 0 ∧ θ = (χ₁ (a : ZMod q)).re) →
        ∀ x : ℝ, (q : ℝ) ^ L ≤ x →
          |(∑ n ∈ (Finset.Icc 1 ⌊x⌋₊).filter (fun n => n ≡ a [MOD q]), (Λ n : ℝ)) -
              (x - θ * x ^ β₁ / β₁) / q.totient| ≤
            C * (Real.exp (-(c * Real.log x / Real.log q)) + Real.exp (-(c * √(Real.log x)))) *
              ((x - θ * x ^ β₁ / β₁) / q.totient) ∧
          |(((Finset.Icc 1 ⌊x⌋₊).filter (fun p => p.Prime ∧ p ≡ a [MOD q])).card : ℝ) -
              (TauCeti.Real.logIntegral x - θ * TauCeti.Real.logIntegral (x ^ β₁)) /
                q.totient| ≤
            C * (Real.exp (-(c * Real.log x / Real.log q)) + Real.exp (-(c * √(Real.log x)))) *
              ((TauCeti.Real.logIntegral x - θ * TauCeti.Real.logIntegral (x ^ β₁)) /
                q.totient) := by
  sorry

/-- Linnik's theorem (1.7b (iii)): there is an absolute `L > 0` such that for every `q ≥ 3` and
every `a` coprime to `q`, the least prime `p ≡ a (mod q)` is at most `q^L`. -/
theorem exists_prime_modEq_le :
    ∃ L : ℝ, 0 < L ∧ ∀ q a : ℕ, 3 ≤ q → Nat.Coprime a q →
      ∃ p : ℕ, p.Prime ∧ p ≡ a [MOD q] ∧ (p : ℝ) ≤ (q : ℝ) ^ L := by
  sorry

/-! ## Layer 2: Prime ideals in short intervals and Artin L-functions -/

/-- Primes that are norms of `α ≡ 1 (mod M)` from an imaginary quadratic field, in short
intervals (2.9b (iv) (c)). There are absolute `c, c′, X₀ > 0` such that for every imaginary
quadratic field `K`, every integer `M ≥ 3` and `B = |d_K| M²`, if `X ≥ X₀`,
`log B ≤ c √(log X)` and `e^(−c √(log X)) ≤ h ≤ 1`, then the number of primes
`p ∈ (X, X(1 + h)]` of the form `p = N_{K/ℚ}(α)` with `α ∈ 𝒪_K` and `α ≡ 1 (mod M 𝒪_K)` is at
least `c′ h X/(B² log X)`. This form, for every imaginary quadratic field and with the exponent
`2`, is this roadmap's; the form of the formal proof is
`card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime`. -/
theorem card_primes_norm_one_mod_shortInterval_ge :
    ∃ c c' X₀ : ℝ, 0 < c ∧ 0 < c' ∧ 0 < X₀ ∧
      ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 →
        NumberField.IsTotallyComplex K →
        ∀ M : ℕ, 3 ≤ M → ∀ X h : ℝ, X₀ ≤ X →
          Real.log (|(NumberField.discr K : ℝ)| * M ^ 2) ≤ c * √(Real.log X) →
          Real.exp (-(c * √(Real.log X))) ≤ h → h ≤ 1 →
          c' * h * X / ((|(NumberField.discr K : ℝ)| * M ^ 2) ^ 2 * Real.log X) ≤
            ({p : ℕ | p.Prime ∧ X < p ∧ (p : ℝ) ≤ X * (1 + h) ∧
              ∃ α : NumberField.RingOfIntegers K,
                α - 1 ∈ Ideal.span {(M : NumberField.RingOfIntegers K)} ∧
                  Algebra.norm ℤ α = p}.ncard : ℝ) := by
  sorry

/-- Primes that are norms of `α ≡ 1 (mod M)` from `ℚ(√−d)` in short intervals, the form of the
formal proof (2.9b (iv) (c′)). There are absolute `A, c, c′ > 0` such that for every prime
`d ≡ 3 (mod 4)` with `d ≥ 100`, the field `K = ℚ(√−d)` (the imaginary quadratic field of
discriminant `−d`), every integer `M ≥ 3` and `B = d M²`, if `X ≥ 1`, `log B ≤ c √(log X)` and
`e^(−c √(log X)) ≤ h ≤ 1`, then the number of primes `p ∈ (X, X(1 + h)]` of the form
`p = N_{K/ℚ}(α)` with `α ∈ 𝒪_K` and `α ≡ 1 (mod M 𝒪_K)` is at least `c′ h X/(B^A log X)`. -/
theorem card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime :
    ∃ A c c' : ℝ, 0 < A ∧ 0 < c ∧ 0 < c' ∧
      ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 →
        NumberField.IsTotallyComplex K →
        ∀ d : ℕ, d.Prime → d % 4 = 3 → 100 ≤ d → NumberField.discr K = -(d : ℤ) →
        ∀ M : ℕ, 3 ≤ M → ∀ X h : ℝ, 1 ≤ X →
          Real.log (|(NumberField.discr K : ℝ)| * M ^ 2) ≤ c * √(Real.log X) →
          Real.exp (-(c * √(Real.log X))) ≤ h → h ≤ 1 →
          c' * h * X / ((|(NumberField.discr K : ℝ)| * M ^ 2) ^ A * Real.log X) ≤
            ({p : ℕ | p.Prime ∧ X < p ∧ (p : ℝ) ≤ X * (1 + h) ∧
              ∃ α : NumberField.RingOfIntegers K,
                α - 1 ∈ Ideal.span {(M : NumberField.RingOfIntegers K)} ∧
                  Algebra.norm ℤ α = p}.ncard : ℝ) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RieszSumsOverPrimesAndExceptionalZeros
