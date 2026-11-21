import Mathlib

/-!
# Riesz sums over primes and exceptional zeros: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with `sorry`
proofs. Dirichlet `L`-functions are Mathlib's `DirichletCharacter.LFunction`, the von Mangoldt
function is `ArithmeticFunction.vonMangoldt`, and a real character is a quadratic one
(`MulChar.IsQuadratic`, values in `{0, 1, -1}`). The README requires several of the constants
below to be effective; effectivity is not expressed here.

Three of the four headlines are stated: the prime number theorem for a primitive character with
its exceptional term (1.4g (b)), the Deuring–Heilbronn repulsion and Linnik's theorem
(1.7b (i), (iii)), and the count of primes that are norms of `α ≡ 1 (mod M)` from an imaginary
quadratic field in short intervals (2.9b (iv) (c)). One is not statable at the pins:

* The Riesz remainder with the exceptional term (1.4i): for a primitive nonprincipal character `χ`
  of conductor `f_χ` and `y ≥ 2`, `|G_χ(y) − y^β/(β(1 − β))|` is at most
  `C y (log 3f_χ)^5 exp(−c log y/(√(log y) + log f_χ))`, the term present only if `χ` is real and
  `L(s, χ)` has an exceptional zero `β`; and, for the characters of a finite abelian field `E`
  whose exceptional zeros satisfy `1 − β ≥ c_ex`, `|G_{χ*}(y)| ≤ y exp(−c₁ (log y)^(1−α))` once
  `log f_E ≤ (log y)^α` and `y ≥ y₀(α, c_ex)`. Its exceptional zero is the predicate
  *IsExceptionalZero* of ZerosOfLFunctions 6.3: a real zero in the window
  `1 − c/log q(χ, 0) ≤ β < 1`, where `c` is the degree-one zero-free constant of ZerosOfLFunctions
  6.2–6.4 and `q(χ, 0)` the analytic conductor of its Layer 2. It lacks that constant, the analytic
  conductor and the predicate; neither Mathlib nor Tau Ceti has them, and a window with a free
  constant in their place would be a different statement.

The bound for `L′/L(1, χ)` under a zero-free box (1.4f), the power-sum inequality (1.7a) and the
bound for ray class numbers in 2.9b are statable as well; they are steps of the routes to the
headlines or statements that are not headlines, and they are not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.RieszSumsOverPrimesAndExceptionalZeros

open ArithmeticFunction

/-! ## Layer 1: Zero-free boxes, Riesz remainders, exceptional zeros and Linnik's theorem -/

/-- The character prime number theorem with the exceptional term (1.4g (b)). There are absolute
`c, c₁, C > 0` and a threshold `X₀` such that for every primitive nonprincipal Dirichlet character
`χ` of conductor `N ≥ 3` and every `X ≥ X₀`,
`Σ_{m ≤ X} χ(m) Λ(m) = −X^β₁/β₁ + O(X exp(−c log X/(√(log X) + log N)) (log N)^4)`,
with implied constant `C`, where the term `X^β₁/β₁` is present only if `χ` is real and `L(s, χ)`
has a real zero `β₁` in `(1 − c₁/log N, 1)`. -/
theorem character_psi_eq_sub_exceptional :
    ∃ c c₁ C X₀ : ℝ, 0 < c ∧ 0 < c₁ ∧ 0 < C ∧
      ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), 3 ≤ N → χ.IsPrimitive → χ ≠ 1 →
        ∀ X : ℝ, X₀ ≤ X →
          (¬ (MulChar.IsQuadratic χ ∧
                ∃ β : ℝ, 1 - c₁ / Real.log N < β ∧ β < 1 ∧ χ.LFunction β = 0) →
            ‖∑ m ∈ Finset.Icc 1 ⌊X⌋₊, χ m * (Λ m : ℂ)‖ ≤
              C * X * Real.exp (-(c * Real.log X) / (√(Real.log X) + Real.log N)) *
                Real.log N ^ 4) ∧
          (MulChar.IsQuadratic χ → ∀ β : ℝ, 1 - c₁ / Real.log N < β → β < 1 →
            χ.LFunction β = 0 →
            ‖∑ m ∈ Finset.Icc 1 ⌊X⌋₊, χ m * (Λ m : ℂ) + ((X ^ β / β : ℝ) : ℂ)‖ ≤
              C * X * Real.exp (-(c * Real.log X) / (√(Real.log X) + Real.log N)) *
                Real.log N ^ 4) := by
  sorry

/-- The Deuring–Heilbronn repulsion (1.7b (i)). There is an absolute `c > 0` with the following
property. Let `q ≥ 3`, let `χ₁` be a real nonprincipal character modulo `q` and `β₁ ∈ [1/2, 1)` a
zero of `L(s, χ₁)`. Let `χ` be any character modulo `q` and `ρ = β + iγ` a zero of `L(s, χ)` with
`β ≥ 1/2`, other than `s = 1` (the pole of the principal character, where the value of Mathlib's
total function is not a value of the `L`-function); if `χ = χ₁` and `ρ = β₁`, assume that `β₁` is
a multiple zero, that is, `L′(β₁, χ₁) = 0`.
Then `1 − β ≥ c log(c/((1 − β₁) ℒ))/ℒ` for every `ℒ ≥ log(q(|γ| + 2))`. -/
theorem exceptional_zero_repulsion :
    ∃ c : ℝ, 0 < c ∧
      ∀ (q : ℕ) [NeZero q] (χ₁ : DirichletCharacter ℂ q), 3 ≤ q → χ₁ ≠ 1 → MulChar.IsQuadratic χ₁ →
        ∀ β₁ : ℝ, 1 / 2 ≤ β₁ → β₁ < 1 → χ₁.LFunction β₁ = 0 →
          ∀ (χ : DirichletCharacter ℂ q) (ρ : ℂ), χ.LFunction ρ = 0 → ρ ≠ 1 → 1 / 2 ≤ ρ.re →
            (χ = χ₁ → ρ = β₁ → deriv χ₁.LFunction β₁ = 0) →
            ∀ ℒ : ℝ, Real.log (q * (|ρ.im| + 2)) ≤ ℒ →
              c * Real.log (c / ((1 - β₁) * ℒ)) / ℒ ≤ 1 - ρ.re := by
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
