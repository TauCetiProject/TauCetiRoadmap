import Mathlib
import TauCeti.NumberTheory.LFunctions.Dirichlet.Basic

/-!
# Zeros of L-functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the core
definitions they need: the order predicate `OrderLE` of Layer 0, the zero count `zeroCount` of
Layer 4, and the entire completion `zetaEntireCompletion` of the Riemann zeta function (the `ζ`
instance of the entire completion of Layer 0).

Stated here:

* Layer 3, the convexity bound on the critical line, uniform over primitive Dirichlet characters;
* Layer 5, Hadamard's factorization of an entire function of order at most one, and its instance
  `zetaEntireCompletion`;
* Layer 6, the de la Vallée Poussin region for `ζ`, and the uniform region for Dirichlet
  L-functions with its exceptional-zero clause and the normalization `c ≤ log 3 / 2`;
* Layer 7, the Riemann–von Mangoldt formula for `ζ`, and its conductor-uniform form for
  primitive Dirichlet characters;
* Layer 8, the truncated explicit formula for `Chebyshev.psi`, the Weil explicit formula for `ζ`
  over smooth compactly supported test functions, the effective prime ideal theorem over an
  arbitrary number field (8.5), and the effective prime number theorem in arithmetic
  progressions (the `K = ℚ` case of the ray-class count of 8.7).

Not statable at the pins:

* every zero statement about the Dedekind zeta function of a number field `K ≠ ℚ` or about a
  Hecke L-function over such a `K` (Layers 6.2–6.4 and 7.6 in those cases, 8.3–8.4 for `ζ_K`,
  and the character sums 8.6): Mathlib's `NumberField.dedekindZeta` is the Dirichlet series
  itself, a junk value off `Re s > 1`; Tau Ceti continues it only to a neighbourhood of
  `Re s ≥ 1`; and neither library has its continuation to `ℂ`, its completion, or the
  L-function of a Hecke character. The exceptional-zero terms of 8.5–8.8 are defined from those
  completions and are absent for the same reason; for a fixed field and modulus the stated
  estimates hold with or without them;
* the general ray-class count of 8.7 and its abelian Chebotarev transport 8.8: Mathlib has no
  ray class group, no Artin symbol and no Frobenius-class prime count, and the Tau Ceti revision
  this file is built against supplies none of them.

Stated here as well, from the direct primitive Dirichlet subsection 6.4a, on the native
`dirichletData` record and Mathlib's continued `DirichletCharacter.LFunction`: the order bound
of the record's completion, the gamma constant `gammaLogDerivBound`, the one-zero and
finite-sum retained-zero inequalities, and the finite-family radius. The completion
comparisons of 6.4a, its gamma bound on `[1, 3]` and its logarithmic-derivative comparison are
README targets, as are the growth, gamma-factor, conductor, counting, rectangle-contour and
certificate statements of Layers 0–2, 4, 7.1–7.3 and 9: they are about the L-functions
roadmap's analytic records, which are not at the pins, or are lemmas on the way to the
headlines.
-/

namespace TauCetiRoadmap.ZerosOfLFunctions

open Complex Filter Asymptotics Set
open scoped Real ContDiff

/-- **Layer 0.1, the order predicate.** `f` has order at most `A`: for every `A' > A`,
`f(s) = O(exp ‖s‖^{A'})` as `‖s‖ → ∞`. Entirety is a hypothesis of the theorems that use the
predicate, not part of it. -/
def OrderLE (f : ℂ → ℂ) (A : ℝ) : Prop :=
  ∀ A' > A, f =O[Bornology.cobounded ℂ] fun s ↦ Real.exp (‖s‖ ^ A')

/-- **Layer 4.1, the zero count.** The number of zeros of `f` in `R`, with multiplicity: the
finite sum over `R` of the positive part of the divisor of `f` on `U`. Poles contribute `0`,
and the sum is meaningful when `f` is meromorphic on `U ⊇ R` and its divisor has finite support
in `R` (a finsum over an infinite support is `0`). -/
noncomputable def zeroCount (f : ℂ → ℂ) (U R : Set ℂ) : ℕ :=
  ∑ᶠ ρ ∈ R, (MeromorphicOn.divisor f U ρ).toNat

/-- **Layer 0.2 at the `ζ` instance, the entire completion.**
`zetaEntireCompletion s = s (s − 1) Λ(s)`, where `Λ = completedRiemannZeta`; it is written
through the entire function `completedRiemannZeta₀ = Λ + 1/s + 1/(1 − s)`, so that it is a
genuine entire function with the correct value `1` at `s = 0` and `s = 1`, where `Λ` has simple
poles. It is twice Riemann's `ξ`, whose normalization carries a factor `1/2`. -/
noncomputable def zetaEntireCompletion (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s + 1

/-! ## Layer 3: convexity -/

/-- **Layer 3.4, the convexity bound, uniform in the conductor.** For every `ε > 0` there is
`C` such that every primitive Dirichlet character `χ` modulo `q` satisfies
`‖L(1/2 + it, χ)‖ ≤ C (q (|t| + 3))^{1/4 + ε}` for all real `t`. At `q = 1` this is
`ζ(1/2 + it) ≪ |t|^{1/4 + ε}` (Titchmarsh §5.1); the general form is the convexity bound of
Iwaniec–Kowalski §5.2 for the analytic conductor `q(|t| + 3)`. -/
theorem dirichletLFunction_convexity (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → ∀ t : ℝ,
      ‖DirichletCharacter.LFunction χ (1 / 2 + t * I)‖ ≤
        C * ((q : ℝ) * (|t| + 3)) ^ (1 / 4 + ε) := sorry

/-! ## Layer 5: Hadamard factorization -/

/-- **Layer 5.5, Hadamard's factorization at order at most one.** An entire `f` of order at most
`1` with `f 0 ≠ 0` is `exp (a + b s) ∏_ρ ((1 − s/ρ) e^{s/ρ})^{m_ρ}`, the product over its zeros
`ρ` with their multiplicities `m_ρ`, unconditionally convergent for every `s` (Davenport,
*Multiplicative Number Theory*, §11). The index is all of `ℂ`, the exponent being `0` off the
zeros; `f 0 ≠ 0` makes the factor at `ρ = 0` equal to `1`. -/
theorem hadamard_of_orderLE_one (f : ℂ → ℂ) (hf : Differentiable ℂ f) (h0 : f 0 ≠ 0)
    (hord : OrderLE f 1) :
    ∃ a b : ℂ, ∀ s : ℂ,
      Multipliable (fun ρ : ℂ ↦ ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor f univ ρ).toNat) ∧
      f s = cexp (a + b * s) * ∏' ρ : ℂ, ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor f univ ρ).toNat :=
  sorry

/-- **Layer 5.5 at the `ζ` instance.** There are constants `A, B` with
`zetaEntireCompletion s = exp (A + B s) ∏_ρ ((1 − s/ρ) e^{s/ρ})^{m_ρ}` for every `s`, the
product over the zeros of `zetaEntireCompletion` with their multiplicities and unconditionally
convergent (Davenport §12). Its content beyond `hadamard_of_orderLE_one` is that
`zetaEntireCompletion` has order at most `1` (Layer 3.1). -/
theorem zetaEntireCompletion_hadamard :
    ∃ A B : ℂ, ∀ s : ℂ,
      Multipliable (fun ρ : ℂ ↦ ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor zetaEntireCompletion univ ρ).toNat) ∧
      zetaEntireCompletion s = cexp (A + B * s) * ∏' ρ : ℂ, ((1 - s / ρ) * cexp (s / ρ)) ^
        (MeromorphicOn.divisor zetaEntireCompletion univ ρ).toNat :=
  sorry

/-! ## Layer 6: zero-free regions -/

/-- **Layer 6.2 at `K = ℚ`, the de la Vallée Poussin region.** There is `c > 0` such that
`ζ(s) ≠ 0` whenever `s ≠ 1` and `Re s ≥ 1 − c / log (|Im s| + 3)` (Davenport §13). -/
theorem riemannZeta_zeroFreeRegion :
    ∃ c : ℝ, 0 < c ∧ ∀ s : ℂ, s ≠ 1 → 1 - c / Real.log (|s.im| + 3) ≤ s.re →
      riemannZeta s ≠ 0 := sorry

/-- **Layer 6.3–6.4 at `K = ℚ`, the region for Dirichlet L-functions.** There is one absolute
constant `c`, with `0 < c ≤ log 3 / 2`, such that for every modulus `q ≥ 1` and every Dirichlet
character `χ` modulo `q`, a zero `ρ` of `L(·, χ)` with `Re ρ ≥ 1 − c / log (q (|Im ρ| + 3))` is
real, simple, and occurs only for a real character (`χ² = 1`), and there is at most one such
zero (Davenport §14). Zeros are read through the meromorphic order, so the pole of the principal
character at `s = 1` is never one. The bound `c ≤ log 3 / 2` puts the whole region in
`Re s ≥ 1/2`, which is what the transfer between a character and its primitive source uses. -/
theorem dirichletLFunction_zeroFreeRegion :
    ∃ c : ℝ, 0 < c ∧ c ≤ Real.log 3 / 2 ∧
      ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
        (∀ ρ : ℂ, 1 - c / Real.log (q * (|ρ.im| + 3)) ≤ ρ.re →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ →
          ρ.im = 0 ∧ χ ^ 2 = 1 ∧ meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ = 1) ∧
        ∀ ρ₁ ρ₂ : ℂ, 1 - c / Real.log (q * (|ρ₁.im| + 3)) ≤ ρ₁.re →
          1 - c / Real.log (q * (|ρ₂.im| + 3)) ≤ ρ₂.re →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ₁ →
          0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ₂ → ρ₁ = ρ₂ := sorry

/-! ## Layer 7: the Riemann–von Mangoldt formula -/

/-- **Layer 7.4–7.5, Riemann–von Mangoldt for `ζ`.** With `N(T)` the number of zeros of the
completed zeta function `Λ` in `0 ≤ Re s ≤ 1`, `0 < Im s ≤ T`, counted with multiplicity,
`N(T) = (T/2π) log (T/2πe) + O(log T)` for every `T ≥ 2` (Titchmarsh, Theorem 9.4). The poles of
`Λ` at `0` and `1` lie on the excluded real axis. -/
theorem riemannVonMangoldt :
    ∃ C : ℝ, ∀ T : ℝ, 2 ≤ T →
      |(zeroCount completedRiemannZeta univ (Icc (0 : ℝ) 1 ×ℂ Ioc (0 : ℝ) T) : ℝ) -
          T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤ C * Real.log T := sorry

/-- **Layer 7.6 at `K = ℚ`, the conductor-uniform count.** One constant `C` serves every
primitive Dirichlet character `χ` modulo `q`: the number `N±(T, χ)` of zeros of the completed
L-function in `0 ≤ Re s ≤ 1`, `|Im s| ≤ T` satisfies
`|N±(T, χ) − (T/π) log (qT/2πe)| ≤ C log (qT)` for `T ≥ 2` (Trudgian, Theorem 1, for the
nonprincipal characters, and Davenport §16). The conductor enters as `q`, not `q^{1/2}`; at
`q = 1` this is twice the count of `riemannVonMangoldt`. -/
theorem riemannVonMangoldt_dirichlet :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive →
      ∀ T : ℝ, 2 ≤ T →
        |(zeroCount (DirichletCharacter.completedLFunction χ) univ
              (Icc (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
            T / π * Real.log (q * T / (2 * π * Real.exp 1))| ≤ C * Real.log (q * T) := sorry

/-! ## Layer 8: the explicit formula and effective prime counts -/

/-- **Layer 8.3 at `K = ℚ`, the truncated explicit formula.** For `2 ≤ T ≤ x`,
`ψ(x) = x − ∑_{|Im ρ| ≤ T} x^ρ/ρ − log 2π − ½ log (1 − x^{−2}) + O(x log² x / T)`, the sum over
the zeros of the completed zeta function with multiplicity (the poles at `0` and `1` contribute
nothing, being points of negative divisor). This is Davenport §17's formula; the hypothesis
`T ≤ x` absorbs both its `log x` term near prime powers and the difference between `ψ` and its
half-value normalization. -/
theorem chebyshevPsi_explicitFormula :
    ∃ C : ℝ, ∀ x T : ℝ, 2 ≤ T → T ≤ x →
      ‖((Chebyshev.psi x : ℝ) : ℂ) -
          ((x : ℂ) - (∑ᶠ ρ ∈ Icc (0 : ℝ) 1 ×ℂ Icc (-T) T,
              ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * (x : ℂ) ^ ρ / ρ) -
            ((Real.log (2 * π) : ℝ) : ℂ) - ((Real.log (1 - x ^ (-2 : ℤ)) / 2 : ℝ) : ℂ))‖ ≤
        C * x * Real.log x ^ 2 / T := sorry

/-- **Layer 8.4 at `K = ℚ`, the Weil explicit formula.** For `φ` smooth with compact support in
`(0, ∞)` and Mellin transform `φ̃`, the family `ρ ↦ m_ρ φ̃(ρ)` over the zeros of the completed
zeta function is summable, and
`∑_ρ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + A(φ) − ∑_n Λ(n) (φ(n) + φ(1/n)/n)`, where
`A(φ) = (2π)⁻¹ ∫ (Γℝ'/Γℝ)(2 + it) (φ̃(2 + it) + φ̃(−1 − it)) dt` is the archimedean term and the
poles of `Λ` at `0` and `1` give `φ̃(0) + φ̃(1)` (Lang, *Algebraic Number Theory*, XVII §3,
Theorem 3.1, for this test class). The zero side is a `tsum` over the positive part of the
divisor, never a finsum. -/
theorem riemannZeta_weilExplicitFormula (φ : ℝ → ℂ) (hφ : ContDiff ℝ ∞ φ)
    (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦
        ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * mellin φ ρ) ∧
      ∑' ρ : ℂ, ((MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat : ℂ) * mellin φ ρ =
        mellin φ 0 + mellin φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ, logDeriv Gammaℝ (2 + t * I) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' n : ℕ, (ArithmeticFunction.vonMangoldt n : ℂ) * (φ n + φ (n : ℝ)⁻¹ / n) :=
  sorry

/-- **Layer 8.5, the effective prime ideal theorem.** For a number field `K` there is `c > 0`
such that the number of nonzero prime ideals of `𝓞 K` of norm at most `x` is
`Li(x) + O(x exp(−c √log x))`, with `Li x = ∫₂ˣ dt / log t` (the body of Tau Ceti's
`TauCeti.Real.logIntegral` contract from Arithmetic Dirichlet Series §6.2) and the constants depending on `K`. For fixed `K` a possible
exceptional zero `β` of `ζ_K` contributes `Li(x^β)`, which the error absorbs. -/
theorem primeIdealCount_effective (K : Type*) [Field K] [NumberField K] :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ ↦ (Set.ncard
            {P : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) |
              (Ideal.absNorm P.asIdeal : ℝ) ≤ x} : ℝ) -
          ∫ t in (2 : ℝ)..x, (Real.log t)⁻¹)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

/-- **Layer 8.7 at `K = ℚ`, the effective prime number theorem in arithmetic progressions.**
There is an absolute `c > 0` such that for every modulus `q ≥ 1` and residue `a` prime to `q`,
`π(x; q, a) = Li(x)/φ(q) + O(x exp(−c √log x))`, the implied constant depending on `q`
(Davenport §20; for fixed `q` a possible exceptional term `Li(x^β)/φ(q)` is absorbed). The
main term is the offset logarithmic integral `∫₂ˣ dt / log t`, not `x / log x`. At `q = 1`
this is de la Vallée Poussin's `π(x) = Li(x) + O(x exp(−c √log x))`. -/
theorem primeCounting_progression_effective :
    ∃ c : ℝ, 0 < c ∧ ∀ q a : ℕ, 0 < q → Nat.Coprime a q →
      (fun x : ℝ ↦ ((((Nat.primesBelow (⌊x⌋₊ + 1)).filter (· ≡ a [MOD q])).card : ℕ) : ℝ) -
          (∫ t in (2 : ℝ)..x, (Real.log t)⁻¹) / q.totient)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

end TauCetiRoadmap.ZerosOfLFunctions

/-! ## Layer 6, §6.4a: direct primitive Dirichlet interfaces -/

noncomputable section

namespace TauCetiRoadmap.ZerosOfLFunctions.DirichletRealZeros

open TauCeti.LFunctions
open scoped BigOperators

variable {q : ℕ} [NeZero q]

/-- **6.4a, order of the completion.** For a primitive `χ ≠ 1` modulo `q`, the completed
function `q^{s/2} Λ(s, χ)` of the native record is entire of order at most one, from the
vertical-strip bounds of Layer 1 and the functional equation; it is the order-one input of the
Hadamard product of Montgomery–Vaughan, Theorem 10.16, p. 351. -/
theorem completed_orderLE_one (χ : DirichletCharacter ℂ q) (hprim : χ.IsPrimitive)
    (hne : χ ≠ 1) : OrderLE (dirichletData χ hprim).completed 1 := by
  sorry

/-- **6.4a, the gamma constant** `C_Γ = ½ (|ψ(1/2)| + |ψ(3/2)| + |log π|)`, written in Euler's
constant and elementary logarithms (`ψ(1/2) = −γ_E − 2 log 2`, `ψ(3/2) = 2 − γ_E − 2 log 2`,
DLMF 5.4.13 and 5.5.2). Its value is `1 + (log π)/2`, and it bounds `‖logDeriv Gammaℝ s‖` for
real `1 ≤ s ≤ 3`, the interval covering both parity shifts `σ + κ` with `1 < σ ≤ 2` and
`κ ∈ {0, 1}`. -/
def gammaLogDerivBound : ℝ :=
  (|-Real.eulerMascheroniConstant - 2 * Real.log 2| +
    |2 - Real.eulerMascheroniConstant - 2 * Real.log 2| + |Real.log Real.pi|) / 2

/-- **6.4a, the one-zero inequality.** For a primitive real `χ ≠ 1` of conductor `q ≥ 3`, a
real zero `0 < β < 1` of `L(·, χ)` and `1 < σ ≤ 2`,
`1/(σ − β) ≤ Re (L'/L)(σ, χ) + ½ log q + C_Γ`, with the constant `C_Γ` fixed before `q`, `χ`,
`β` and `σ`. The route is the partial-fraction expansion of `L'/L` with the real-part
cancellation `Re B(χ) = −∑_ρ Re (1/ρ)` (Montgomery–Vaughan, Corollary 10.18, (10.37)–(10.38),
pp. 352–353): every zero of the completion contributes `Re (1/(σ − ρ)) ≥ 0`, all but one copy of
`β` are discarded, and the gamma term is at most `C_Γ`. -/
theorem one_zero_le_logDeriv (χ : DirichletCharacter ℂ q) (hq : 3 ≤ q)
    (hprim : χ.IsPrimitive) (hne : χ ≠ 1) (hreal : χ.IsQuadratic)
    (β σ : ℝ) (hβ0 : 0 < β) (hβ1 : β < 1) (hzero : χ.LFunction β = 0)
    (hσ : 1 < σ) (hσ2 : σ ≤ 2) :
    1 / (σ - β) ≤ (logDeriv χ.LFunction (σ : ℂ)).re +
      Real.log q / 2 + gammaLogDerivBound := by
  sorry

/-- **6.4a, the finite-sum inequality.** The same bound with any finite set `S` of zeros of
`L(·, χ)` in the critical strip retained, each weighted by its analytic multiplicity
`analyticOrderNatAt`; the constant `C_Γ` does not depend on `S` (Montgomery–Vaughan,
Corollary 10.18, (10.37)–(10.38), pp. 352–353). -/
theorem finite_zero_sum_le_logDeriv (χ : DirichletCharacter ℂ q) (hq : 3 ≤ q)
    (hprim : χ.IsPrimitive) (hne : χ ≠ 1) (hreal : χ.IsQuadratic)
    (S : Finset ℂ) (hS : ∀ ρ ∈ S, 0 < ρ.re ∧ ρ.re < 1 ∧ χ.LFunction ρ = 0)
    (σ : ℝ) (hσ : 1 < σ) (hσ2 : σ ≤ 2) :
    (∑ ρ ∈ S, (analyticOrderNatAt χ.LFunction ρ : ℝ) *
      (1 / ((σ : ℂ) - ρ)).re) ≤
      (logDeriv χ.LFunction (σ : ℂ)).re + Real.log q / 2 + gammaLogDerivBound := by
  sorry

/-- **6.4a, the finite-family radius.** For every bound `Q` there is one radius `δ_Q > 0` such
that every nonprincipal character `χ` modulo `q ≤ Q` has `L(s, χ) ≠ 0` on `‖s − 1‖ < δ_Q`: the
family is finite, each `L(·, χ)` is continuous at `1` with
`DirichletCharacter.LFunction_apply_one_ne_zero`, and `δ_Q` is the least of the individual
radii. No effectiveness and no uniformity over unbounded conductors is claimed. -/
theorem bounded_level_zero_free (Q : ℕ) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ (q : ℕ) [NeZero q], q ≤ Q →
      ∀ (χ : DirichletCharacter ℂ q), χ ≠ 1 →
        ∀ s : ℂ, ‖s - 1‖ < δ → χ.LFunction s ≠ 0 := by
  sorry

end TauCetiRoadmap.ZerosOfLFunctions.DirichletRealZeros

end
