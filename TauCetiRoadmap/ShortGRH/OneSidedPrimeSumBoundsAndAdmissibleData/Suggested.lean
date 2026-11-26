import Mathlib

/-!
# One-sided prime sum bounds and admissible data: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib, the headline statements of the roadmap that need no carrier
beyond Mathlib's Dirichlet characters and L-functions: the remainders `R_q` (0.1), the one-sided
criterion (0.2), the one-sided bound (6.2 (c)) and the conditional passage to the half-plane (6.3).

The following are not stated here.

* The end theorems (the unconditional statement of 6.3, and 6.4): the value form, the predicate
  form, the strip form and Mathlib's `RiemannHypothesis`. They are the theorems of
  GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 and are stated in that roadmap's
  `Suggested.lean` (`LFunction_ne_zero_of_one_half_lt_re`,
  `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`, `re_eq_half_of_LFunction_eq_zero`,
  `riemannHypothesis`); stating them again here would plan them twice.
* Colengths, heights and twisted lattices (Layer 1), the parameters and the field (Layer 2),
  admissible data and their existence (Layer 3) and the prime sums (Layer 4). These are statable
  with Mathlib's number fields and lattices, but as long structures whose fields are fixed by the
  README; no signature is given for them in this file.
* Theorems A and B (5.3, 5.4) and the main inequality (6.1), and with it 6.2 (a): they are
  statements about admissible data and about automorphic forms on definite unitary groups of
  Hermitian spaces over the CM field of the data, their theta lifts and Poincaré maps. Neither
  Mathlib nor Tau Ceti has these carriers at the pins.
* 6.2 (b), the bound at the large integers with the constant `64 φ(q₀) + 3`: it mentions the
  remainder only and is statable as 6.2 (c) is; it is a step towards 6.2 (c), which is the
  headline stated here.
-/

namespace TauCetiRoadmap.ShortGRH.OneSidedPrimeSumBoundsAndAdmissibleData

open ArithmeticFunction Filter

/-! ## Layer 0: the remainders `R_q` and the one-sided criterion -/

section Remainder

variable (d : ℕ) [Fact d.Prime] (q : ℕ)

/-- The weight `λ_q` of 0.1: `λ_q(n) = Λ(n)·(1 − χ_K(n))` if `n ≡ 1 (mod q)` and `0` otherwise,
with `χ_K = (·/d)` the Legendre symbol of the prime `d`. -/
noncomputable def primeWeight (n : ℕ) : ℝ :=
  if (n : ZMod q) = 1 then Λ n * (1 - (legendreSym d n : ℝ)) else 0

/-- The function `E_ψ` of 0.1 for a Dirichlet character `ψ`: its L-function if `ψ` is not
principal, and the entire continuation of `(s − 1)·L(s, ψ)` if it is. -/
noncomputable def entireLFunction {N : ℕ} [NeZero N] (ψ : DirichletCharacter ℂ N) : ℂ → ℂ :=
  open Classical in if ψ = 1 then DirichletCharacter.LFunctionTrivChar₁ N else ψ.LFunction

/-- The product `ψ·χ_K` of 0.1, a Dirichlet character modulo `q·d`. -/
noncomputable def quadraticTwist {q : ℕ} (ψ : DirichletCharacter ℂ q) :
    DirichletCharacter ℂ (q * d) :=
  DirichletCharacter.changeLevel (Dvd.intro d rfl) ψ *
    DirichletCharacter.changeLevel (Dvd.intro_left q rfl)
      ((quadraticChar (ZMod d)).ringHomComp (Int.castRingHom ℂ))

variable [NeZero q]

/-- The function `G_q` of 0.1:
`G_q(s) = φ(q)⁻¹·(Σ_ψ (E′_{ψχ_K}/E_{ψχ_K}(s) − E′_ψ/E_ψ(s)) − 1)`, the sum over all Dirichlet
characters `ψ` modulo `q`. -/
noncomputable def logDerivMean (s : ℂ) : ℂ :=
  haveI : NeZero (q * d) := ⟨Nat.mul_ne_zero (NeZero.ne q) (Fact.out : d.Prime).ne_zero⟩
  (∑ ψ : DirichletCharacter ℂ q,
    (logDeriv (entireLFunction (quadraticTwist d ψ)) s - logDeriv (entireLFunction ψ) s) - 1) /
      (Nat.totient q : ℂ)

/-- The remainder `R_q` of 0.1:
`R_q(y) = Σ_{1 ≤ n ≤ y} λ_q(n)·(1/n − 1/y) − (log y)/φ(q) − c_q` with `c_q = Re G_q(1)`. -/
noncomputable def primeRemainder (y : ℝ) : ℝ :=
  ∑ n ∈ Finset.Icc 1 ⌊y⌋₊, primeWeight d q n * (1 / (n : ℝ) - 1 / y) -
    Real.log y / (Nat.totient q : ℝ) - (logDerivMean d q 1).re

end Remainder

/-- **The one-sided criterion** (0.2). Let `q₀` be a positive multiple of `8`, let `d₀ ≡ 7 (mod 8)`
be prime to `q₀`, and let `β > 1/2`. If for every prime `d ≡ d₀ (mod q₀)` the remainder
`R_{q₀}^{(d)}(x)` is at most `x^{β−1}` for all large real `x`, then `L(ρ, ψ) ≠ 0` for every
Dirichlet character `ψ` modulo `q₀` and every `ρ ≠ 1` with `Re ρ > β`. It is a theorem of
[ShortProof], `New/Reduction/Zeros/Criterion.lean` (`New.LFunction_ne_zero_of_primeRemainder_le`). -/
theorem LFunction_ne_zero_of_primeRemainder_le {q₀ : ℕ} [NeZero q₀] (hq₀ : 8 ∣ q₀) {d₀ : ℕ}
    (hd₀ : d₀ % 8 = 7) (hd₀q₀ : d₀.Coprime q₀) {β : ℝ} (hβ : 1 / 2 < β)
    (h : ∀ (d : ℕ) [Fact d.Prime], d ≡ d₀ [MOD q₀] →
      ∀ᶠ x : ℝ in atTop, primeRemainder d q₀ x ≤ x ^ (β - 1))
    (ψ : DirichletCharacter ℂ q₀) {ρ : ℂ} (hρ : ρ ≠ 1) (hβρ : β < ρ.re) :
    ψ.LFunction ρ ≠ 0 := by
  sorry

/-! ## Layer 6: the one-sided bound and the half-plane -/

/-- **The one-sided bound** (6.2 (c)). Let `q₀` be a positive multiple of `18480` and `d` a prime
with `d ≡ q₀/2 − 1 (mod q₀)`, so that `(q₀, d)` are parameters (2.1). Then for every `ε > 0`,
`R_{q₀}^{(d)}(y) ≤ y^{−1/2+ε}` for all large real `y`. It is a theorem of [ShortProof],
`New/Reduction/OneSidedBound.lean` (`New.eventually_primeRemainder_le_rpow`). -/
theorem eventually_primeRemainder_le_rpow {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ y ^ (-1 / 2 + ε) := by
  sorry

/-- **From the one-sided bounds to the half-plane** (6.3, the conditional statement). Let `χ` be a
Dirichlet character modulo `N ≥ 1` and `s ≠ 1` with `Re s > 1/2`. Put `q₀ = 18480·N` and
`d₀ = 9240·N − 1`. If for every prime `d ≡ d₀ (mod q₀)` and every `ε > 0` the remainder
`R_{q₀}^{(d)}(y)` is at most `y^{−1/2+ε}` for all large `y`, then `L(s, χ) ≠ 0`. -/
theorem LFunction_ne_zero_of_forall_primeRemainder_le {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 / 2 < s.re) (hs₁ : s ≠ 1)
    (h : ∀ (d : ℕ) [Fact d.Prime], d ≡ 9240 * N - 1 [MOD 18480 * N] → ∀ ε : ℝ, 0 < ε →
      ∀ᶠ y : ℝ in atTop, primeRemainder d (18480 * N) y ≤ y ^ (-1 / 2 + ε)) :
    χ.LFunction s ≠ 0 := by
  sorry

end TauCetiRoadmap.ShortGRH.OneSidedPrimeSumBoundsAndAdmissibleData
