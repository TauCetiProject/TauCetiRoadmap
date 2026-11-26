import Mathlib

/-!
# Zero-free regions and primes in short windows: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib, the headline theorems that the overview of the README singles
out. None of them needs a carrier beyond Mathlib's Dirichlet characters and their L-functions,
Jacobi symbols, integrals and filters, so all of them are stated below.

* Reflection of the zeros for every character (1.2):
  `trivial_zero_or_LFunction_inv_one_sub_eq_zero`. The poles of the gamma factor `Γ_ℝ(s + j)` are
  written out through the parity of the character.
* The zero-free region with a bound for the logarithmic derivative, for one character at a time
  (1.4 (c)): `eventually_LFunction_ne_zero_and_norm_logDeriv_le` for a character that is not
  principal, and `eventually_LFunctionTrivChar₁_ne_zero_and_norm_logDeriv_le` for the principal
  character, whose function `E_χ` of 1.1 is Mathlib's `DirichletCharacter.LFunctionTrivChar₁`.
  The uniform form 1.4 (b), which 2.2 (b) uses, is a step and has no signature here.
* The Tauberian theorem with a rate (2.1): `eventually_abs_le_inv_pow_of_laplace_transform`.
* A prime `≡ 1` modulo a power of a fixed modulus in every logarithmic window (2.2 (c)):
  `eventually_exists_prime_modEq_one_log_mem_window`.
* The choice of `d` (3.5 (b)): `exists_prime_twist_LFunction_ne_zero`. Neither pinned library has
  the twist `ξ·(·/d)` as a named character; the statement singles it out among the characters
  modulo `qd` by its values `ξ(n)·(n/d)`, with Mathlib's Jacobi symbol, which is the Legendre
  symbol because `d` is prime.

The growth bounds of 1.3, the parts (a) and (b) of 2.2, the theta series and tail integrals of
3.1–3.4 and the density count 3.5 (a) are steps towards these; no signature is given for them in
this file.
-/

namespace TauCetiRoadmap.ShortGRH.ZeroFreeRegionsAndPrimesInShortWindows

open Filter

/-- **Reflection of the zeros for every character** (README 1.2). Let `χ` be a Dirichlet character
modulo `N ≥ 1`, primitive or not, and let `s ≠ 1` with `Re s ≠ 0` be a zero of `L(·, χ)`. Then
`s + j` is one of `0, −2, −4, …`, where `j` is `0` for even and `1` for odd `χ` (a pole of the gamma
factor `Γ_ℝ(s + j)`), or `1 − s` is a zero of the L-function of the conjugate character `χ⁻¹`. -/
theorem trivial_zero_or_LFunction_inv_one_sub_eq_zero {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) {s : ℂ} (hs₀ : s.re ≠ 0) (hs₁ : s ≠ 1)
    (hχs : χ.LFunction s = 0) :
    (χ.Even ∧ ∃ n : ℕ, s = -(2 * n)) ∨ (χ.Odd ∧ ∃ n : ℕ, s = -(2 * n + 1)) ∨
      χ⁻¹.LFunction (1 - s) = 0 := by
  sorry

/-- **A zero-free region with a bound for the logarithmic derivative**, for a character that is
not principal (README 1.4 (c)). For all large `l`, depending on `χ`: `L(s, χ) ≠ 0` and
`|L′(s, χ)/L(s, χ)| ≤ 2l^{25}` for every `s` with `Re s ≥ 1 − l^{−25}` and `|s| ≤ e^l`. -/
theorem eventually_LFunction_ne_zero_and_norm_logDeriv_le {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ ≠ 1) :
    ∀ᶠ l : ℝ in atTop, ∀ s : ℂ, 1 - 1 / l ^ 25 ≤ s.re → ‖s‖ ≤ Real.exp l →
      χ.LFunction s ≠ 0 ∧ ‖logDeriv χ.LFunction s‖ ≤ 2 * l ^ 25 := by
  sorry

/-- **A zero-free region with a bound for the logarithmic derivative**, for the principal
character modulo `N` (README 1.4 (c)), through the entire continuation `E` of `(s − 1)L(s, χ₀)`.
For all large `l`, depending on `N`: `E(s) ≠ 0` and `|E′(s)/E(s)| ≤ 2l^{25}` for every `s` with
`Re s ≥ 1 − l^{−25}` and `|s| ≤ e^l`. -/
theorem eventually_LFunctionTrivChar₁_ne_zero_and_norm_logDeriv_le (N : ℕ) [NeZero N] :
    ∀ᶠ l : ℝ in atTop, ∀ s : ℂ, 1 - 1 / l ^ 25 ≤ s.re → ‖s‖ ≤ Real.exp l →
      DirichletCharacter.LFunctionTrivChar₁ N s ≠ 0 ∧
        ‖logDeriv (DirichletCharacter.LFunctionTrivChar₁ N) s‖ ≤ 2 * l ^ 25 := by
  sorry

/-- **A Tauberian theorem with a rate** (README 2.1). Let `R : ℝ → ℝ` be measurable with
`|R(v) − R(u)| ≤ L(v − u)` whenever `0 ≤ u ≤ v ≤ u + 1`, and let `F : ℂ → ℂ` satisfy
`(F(s) − F(1))/(s − 1) = ∫_0^∞ R(v)e^{(1−s)v} dv` for `Re s > 2`. If, for a natural number `A` and
all large `l`, `F` is complex differentiable with `|F(s)| ≤ l^A` at every `s` with
`Re s ≥ 1 − l^{−A}` and `|s| ≤ e^l`, then for every natural number `B`, `|R(u)| ≤ u^{−B}` for all
large `u`. -/
theorem eventually_abs_le_inv_pow_of_laplace_transform {R : ℝ → ℝ} (hR : Measurable R) {L : ℝ}
    (hRL : ∀ u v : ℝ, 0 ≤ u → u ≤ v → v ≤ u + 1 → |R v - R u| ≤ L * (v - u)) {F : ℂ → ℂ}
    (hF : ∀ s : ℂ, 2 < s.re →
      (F s - F 1) / (s - 1) = ∫ v in Set.Ioi (0 : ℝ), (R v : ℂ) * Complex.exp ((1 - s) * v))
    {A : ℕ} (hreg : ∀ᶠ l : ℝ in atTop, ∀ s : ℂ, 1 - 1 / l ^ A ≤ s.re → ‖s‖ ≤ Real.exp l →
      DifferentiableAt ℂ F s ∧ ‖F s‖ ≤ l ^ A)
    (B : ℕ) :
    ∀ᶠ u : ℝ in atTop, |R u| ≤ 1 / u ^ B := by
  sorry

/-- **Primes `≡ 1` modulo the powers of a fixed modulus in logarithmic windows** (README 2.2 (c)).
Let `m ≥ 1` with `4 ∣ m`, and let `A` be a natural number. For all large real `W`, depending on
`m` and `A`: for every integer `k ≥ 2` with `m^k ≤ W^A` and every real `U` with `W ≤ U ≤ W^A`
there is a prime `p ≡ 1 (mod m^k)` with `U ≤ log p ≤ U + W`. -/
theorem eventually_exists_prime_modEq_one_log_mem_window {m : ℕ} (hm : 0 < m) (h4m : 4 ∣ m)
    (A : ℕ) :
    ∀ᶠ W : ℝ in atTop, ∀ k : ℕ, 2 ≤ k → (m : ℝ) ^ k ≤ W ^ A → ∀ U : ℝ, W ≤ U → U ≤ W ^ A →
      ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD m ^ k] ∧ U ≤ Real.log p ∧ Real.log p ≤ U + W := by
  sorry

/-- **The choice of `d`** (README 3.5 (b)). Let `q ≥ 1` and let `a` be an invertible class modulo
`q` such that every prime `d ≡ a (mod q)` satisfies `d ≡ 7 (mod 8)` and `gcd(d, q) = 1`. For every
`β > 1/2` and real `H` there is a prime `d ≡ a (mod q)` such that, for every Dirichlet character
`ξ` modulo `q`, the twist `ξ·(·/d)` (the character `χ` modulo `qd` with `χ(n) = ξ(n)·(n/d)` for
every integer `n`) has no zero `s` with `Re s ≥ β` and `|Im s| ≤ H`. -/
theorem exists_prime_twist_LFunction_ne_zero {q : ℕ} [NeZero q] {a : ZMod q} (ha : IsUnit a)
    (hclass : ∀ d : ℕ, d.Prime → (d : ZMod q) = a → d % 8 = 7 ∧ d.Coprime q)
    {β : ℝ} (hβ : 1 / 2 < β) (H : ℝ) :
    ∃ d : ℕ, d.Prime ∧ (d : ZMod q) = a ∧
      ∀ (ξ : DirichletCharacter ℂ q) (M : ℕ) [NeZero M] (χ : DirichletCharacter ℂ M),
        M = q * d → (∀ n : ℤ, χ n = ξ n * (jacobiSym n d : ℂ)) →
        ∀ s : ℂ, β ≤ s.re → |s.im| ≤ H → χ.LFunction s ≠ 0 := by
  sorry

end TauCetiRoadmap.ShortGRH.ZeroFreeRegionsAndPrimesInShortWindows
