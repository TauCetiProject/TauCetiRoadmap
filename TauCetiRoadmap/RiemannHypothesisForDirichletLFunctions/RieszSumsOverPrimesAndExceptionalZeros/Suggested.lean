import Mathlib

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
intervals (2.9b (iv) (c)). The form of 1.4i (a) with the exceptional term follows from 1.4i (c)
with AnalyticNumberTheoryPartI §0.34, and the field form 1.4i (b) follows from 1.4i (c) in a few
lines; neither is restated.

The character prime number theorem with the exceptional term (1.4g (b)) and the Deuring–Heilbronn
repulsion (1.7b (i)) are statable, but they are corollaries of AnalyticNumberTheoryPartI §§0.18
and 0.34; they are steps of the routes and are not stated here. The bound for `L′/L(1, χ)` under a
zero-free box (1.4f), the power-sum inequality (1.7a) and the bound for ray class numbers in 2.9b
are statable as well; they are steps of the routes to the headlines or statements that are not
headlines, and they are not stated here.
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
`|G_1(y)| ≤ C y exp(−c √(log y))` for every `y ≥ 2`. -/
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
least `c′ h X/(B² log X)`. -/
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

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RieszSumsOverPrimesAndExceptionalZeros
