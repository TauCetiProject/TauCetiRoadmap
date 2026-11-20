module

public import Mathlib

/-!
# The circle method and Vinogradov's three-primes theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, which numbers the milestones as Layer `n.m`. The declarations below state the headline
theorems against the pinned APIs, so that contributors and reviewers converge on names and
signatures; every headline is statable at the pins, so none is missing. Discharging all of them
finishes neither a layer nor the roadmap. `sorry` marks goals, not results.

Design choices made explicit here:

* every sum over `n ≤ x` runs over `Finset.Ioc 0 ⌊x⌋₊`, and every sum over `n ≤ N` over
  `Finset.Icc 1 N`; the index `0` never occurs;
* residue classes are `a : ZMod q`, coprimality is `IsUnit a`, as in Mathlib's Dirichlet theorem;
* bounds of the shape `min(X, 1/‖α‖)` carry the value `X` at `‖α‖ = 0` by an explicit `if`;
* uniform bounds quantify their constants before the uniform parameters;
* Siegel–Walfisz is stated here as the proposition `SiegelWalfiszBound`, with a real body, and the
  theorems of Layers 3 and 4 take it as a hypothesis until Layer 4.9;
* this file imports neither supplier roadmap; `psiAP` is the supplier's object, copied here with
  its argument order and body only because the supplier is not importable at the pins.
-/

@[expose] public section

noncomputable section

open Filter Topology ArithmeticFunction
open scoped Classical

namespace TauCetiRoadmap.CircleMethodThreePrimes

/-! ## Layer 0: the additive toolkit -/

section Layer0

/-- The additive character `e(α) = exp(2πiα)` (0.1). -/
def expTwoPiI (α : ℝ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * α)

/-- **0.1** Orthogonality on `ℝ/ℤ`. -/
theorem integral_expTwoPiI_intCast (m : ℤ) :
    ∫ α in (0 : ℝ)..1, expTwoPiI (m * α) = if m = 0 then 1 else 0 := by
  sorry

/-- The distance to the nearest integer, `‖α‖ = |α - round α|` (0.1). -/
def distInt (α : ℝ) : ℝ :=
  |α - round α|

/-- **0.1** The geometric-sum bound, with the value `N` at the integers. -/
theorem norm_sum_expTwoPiI_le (N : ℕ) (β : ℝ) :
    ‖∑ n ∈ Finset.Icc 1 N, expTwoPiI (n * β)‖ ≤
      if distInt β = 0 then (N : ℝ) else min (N : ℝ) (1 / (2 * distInt β)) := by
  sorry

/-- The Ramanujan sum `c_q(n) = ∑_{0 ≤ b < q, gcd(b, q) = 1} e(bn/q)` (0.2). -/
def ramanujanSum (q : ℕ) (n : ℤ) : ℂ :=
  ∑ b ∈ (Finset.range q).filter (fun b => Nat.Coprime b q), expTwoPiI ((b : ℝ) * n / q)

/-- **0.2** `c_q(n) = ∑_{d ∣ (q, n)} d μ(q/d)`. -/
theorem ramanujanSum_eq_sum_divisors (q : ℕ) (hq : 1 ≤ q) (n : ℤ) :
    ramanujanSum q n =
      ∑ d ∈ q.divisors.filter (fun d : ℕ => (d : ℤ) ∣ n), (d : ℂ) * (moebius (q / d) : ℂ) := by
  sorry

/-- **0.2** Multiplicativity of `c_q(n)` in `q`. -/
theorem ramanujanSum_mul (q₁ q₂ : ℕ) (h : Nat.Coprime q₁ q₂) (n : ℤ) :
    ramanujanSum (q₁ * q₂) n = ramanujanSum q₁ n * ramanujanSum q₂ n := by
  sorry

end Layer0

/-! ## Layer 1: bilinear estimates for additive twists -/

section Layer1

/-- **1.1** The type I sum bound, with the value `X/m` where `‖mα‖ = 0`. -/
theorem sum_min_inv_distInt_le : ∃ C : ℝ, ∀ (M : ℕ) (X α : ℝ) (c : ℤ) (q : ℕ),
    1 ≤ M → 1 ≤ X → 1 ≤ q → Int.gcd c q = 1 → |α - c / q| ≤ 1 / (q : ℝ) ^ 2 →
      ∑ m ∈ Finset.Icc 1 M,
          (if distInt (m * α) = 0 then X / m else min (X / m) (1 / distInt (m * α))) ≤
        C * (X / q + M + q) * Real.log (2 * M * q) := by
  sorry

/-- **1.2** The type II bilinear bound. -/
theorem norm_typeII_le : ∃ C : ℝ, ∀ (M N : ℕ) (a b : ℕ → ℂ) (α : ℝ) (c : ℤ) (q : ℕ),
    1 ≤ M → M ≤ N → 1 ≤ q → Int.gcd c q = 1 → |α - c / q| ≤ 1 / (q : ℝ) ^ 2 →
      ‖∑ m ∈ Finset.Ioc M (2 * M), ∑ n ∈ Finset.Ioc 0 (N / m),
          a m * b n * expTwoPiI (α * m * n)‖ ≤
        C * Real.sqrt (∑ m ∈ Finset.Ioc M (2 * M), ‖a m‖ ^ 2)
          * Real.sqrt (∑ n ∈ Finset.Ioc 0 (N / M), ‖b n‖ ^ 2)
          * Real.sqrt (((N : ℝ) / M + M + (N : ℝ) / q + q) * Real.log (2 * N * q)) := by
  sorry

end Layer1

/-! ## Layer 2: exponential sums over primes -/

section Layer2

/-- `S(α) = ∑_{n=1}^N Λ(n) e(nα)`. -/
def primeExpSum (N : ℕ) (α : ℝ) : ℂ :=
  ∑ n ∈ Finset.Icc 1 N, (vonMangoldt n : ℂ) * expTwoPiI (n * α)

/-- **2.1** Vinogradov's minor-arc bound, in Vaughan's form. -/
theorem norm_primeExpSum_le : ∃ C : ℝ, ∀ (N : ℕ) (α : ℝ) (c : ℤ) (q : ℕ),
    2 ≤ N → 1 ≤ q → Int.gcd c q = 1 → |α - c / q| ≤ 1 / (q : ℝ) ^ 2 →
      ‖primeExpSum N α‖ ≤
        C * ((N : ℝ) / Real.sqrt q + (N : ℝ) ^ (4 / 5 : ℝ) + Real.sqrt (N * q))
          * Real.log N ^ 4 := by
  sorry

/-- **2.2** Parseval for `S`. -/
theorem integral_norm_sq_primeExpSum (N : ℕ) :
    ∫ α in (0 : ℝ)..1, ‖primeExpSum N α‖ ^ 2 = ∑ n ∈ Finset.Icc 1 N, vonMangoldt n ^ 2 := by
  sorry

end Layer2

/-! ## Layer 3: the major arcs -/

section Layer3

/-- `ψ(x; q, a) = ∑_{n ≤ x, n ≡ a} Λ(n)`. This is `AnalyticNumberTheoryPartI`'s `psiAP`, with the
same arguments and body, so that the identification in 4.9 is definitional; it is restated here only
because that roadmap is not importable at the pins. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), vonMangoldt n

/-- Siegel–Walfisz with a logarithmic saving, a hypothesis of Layers 3 and 4 until 4.9: for all
`A, B > 0` there is `C` with `|ψ(x; q, a) - x/φ(q)| ≤ C x (log x)^{-A}` for all `x ≥ 2`,
`1 ≤ q ≤ (log x)^B` and all units `a` modulo `q`. The constant is ineffective. -/
def SiegelWalfiszBound : Prop :=
  ∀ A B : ℝ, 0 < A → 0 < B → ∃ C : ℝ, ∀ (x : ℝ) (q : ℕ) (a : ZMod q),
    2 ≤ x → 1 ≤ q → (q : ℝ) ≤ Real.log x ^ B → IsUnit a →
      |psiAP q a x - x / Nat.totient q| ≤ C * x / Real.log x ^ A

/-- **3.2** The major-arc approximation of `S(a/q + β)`. -/
theorem primeExpSum_majorArc (hSW : SiegelWalfiszBound) (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C : ℝ, ∀ (N q : ℕ) (a : ℤ) (β : ℝ),
      2 ≤ N → 1 ≤ q → (q : ℝ) ≤ Real.log N ^ B → Int.gcd a q = 1 →
        ‖primeExpSum N (a / q + β) -
            (moebius q : ℂ) / Nat.totient q * ∑ n ∈ Finset.Icc 1 N, expTwoPiI (n * β)‖ ≤
          C * (1 + |β| * N) * N / Real.log N ^ A := by
  sorry

end Layer3

/-! ## Layer 4: the circle method and Vinogradov's three-primes theorem -/

section Layer4

/-- `r(N) = ∑_{n₁ + n₂ + n₃ = N, nᵢ ≥ 1} Λ(n₁) Λ(n₂) Λ(n₃)`. -/
def threePrimeWeight (N : ℕ) : ℝ :=
  ∑ n₁ ∈ Finset.Icc 1 N, ∑ n₂ ∈ Finset.Icc 1 N,
    if n₁ + n₂ < N then vonMangoldt n₁ * vonMangoldt n₂ * vonMangoldt (N - n₁ - n₂) else 0

/-- `R(N)`, the number of ordered triples of primes with sum `N`. -/
def threePrimeCount (N : ℕ) : ℕ :=
  ((Finset.Icc 1 N ×ˢ Finset.Icc 1 N).filter
    (fun pq => pq.1.Prime ∧ pq.2.Prime ∧ pq.1 + pq.2 < N ∧ (N - pq.1 - pq.2).Prime)).card

/-- **4.1** The integral representation `r(N) = ∫₀¹ S(α)³ e(-Nα) dα`. -/
theorem threePrimeWeight_eq_integral (N : ℕ) :
    (threePrimeWeight N : ℂ) = ∫ α in (0 : ℝ)..1, primeExpSum N α ^ 3 * expTwoPiI (-(N * α)) := by
  sorry

/-- The singular series `𝔖(N) = ∑_{q ≥ 1} μ(q) c_q(N) / φ(q)³` (the `q = 0` term is `0`). -/
def singularSeries (N : ℤ) : ℝ :=
  ∑' q : ℕ, (moebius q : ℝ) / (Nat.totient q : ℝ) ^ 3 * (ramanujanSum q N).re

/-- **4.4** The Euler product of the singular series. -/
theorem singularSeries_hasProd (N : ℤ) :
    HasProd (fun p : Nat.Primes =>
        if ((p : ℕ) : ℤ) ∣ N then 1 - 1 / (((p : ℕ) : ℝ) - 1) ^ 2
        else 1 + 1 / (((p : ℕ) : ℝ) - 1) ^ 3)
      (singularSeries N) := by
  sorry

/-- **4.4** `𝔖(N) = 0` for even `N`. -/
theorem singularSeries_eq_zero_of_even {N : ℤ} (hN : Even N) : singularSeries N = 0 := by
  sorry

/-- **4.4** `𝔖(N)` is bounded below by a positive constant on the odd integers. -/
theorem singularSeries_lower_bound_of_odd :
    ∃ c : ℝ, 0 < c ∧ ∀ N : ℤ, Odd N → c ≤ singularSeries N := by
  sorry

/-- **4.5** The singular integral: `∫₀¹ T(β)³ e(-Nβ) dβ = (N - 1)(N - 2)/2`. -/
theorem integral_geomSum_cube (N : ℕ) (hN : 1 ≤ N) :
    ∫ β in (0 : ℝ)..1, (∑ n ∈ Finset.Icc 1 N, expTwoPiI (n * β)) ^ 3 * expTwoPiI (-(N * β)) =
      (((N - 1) * (N - 2) / 2 : ℕ) : ℂ) := by
  sorry

/-- **4.7** The asymptotic formula `r(N) = ½ 𝔖(N) N² + O_A(N² (log N)^{-A})`. -/
theorem threePrimeWeight_asymptotic (hSW : SiegelWalfiszBound) (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, ∀ N : ℕ, 2 ≤ N →
      |threePrimeWeight N - singularSeries N / 2 * (N : ℝ) ^ 2| ≤
        C * (N : ℝ) ^ 2 / Real.log N ^ A := by
  sorry

/-- **4.8** `R(N) (log N)³ / N² - ½ 𝔖(N) → 0`. -/
theorem threePrimeCount_asymptotic (hSW : SiegelWalfiszBound) :
    Tendsto (fun N : ℕ => (threePrimeCount N : ℝ) * Real.log N ^ 3 / (N : ℝ) ^ 2 -
      singularSeries N / 2) atTop (𝓝 0) := by
  sorry

/-- **4.8** **Vinogradov's three-primes theorem.** Every sufficiently large odd integer is a sum
of three primes. The threshold is ineffective. -/
theorem vinogradov_threePrimes (hSW : SiegelWalfiszBound) :
    ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N → Odd N →
      ∃ p₁ p₂ p₃ : ℕ, p₁.Prime ∧ p₂.Prime ∧ p₃.Prime ∧ p₁ + p₂ + p₃ = N := by
  sorry

/-- **4.9** `SiegelWalfiszBound`, from `siegel_walfisz` of AnalyticNumberTheoryPartI §0.32. -/
theorem siegelWalfiszBound : SiegelWalfiszBound := by
  sorry

/-- **4.9** **Vinogradov's three-primes theorem.** Every sufficiently large odd integer is a sum
of three primes. The threshold is ineffective. -/
theorem vinogradov_threePrimes_unconditional :
    ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N → Odd N →
      ∃ p₁ p₂ p₃ : ℕ, p₁.Prime ∧ p₂.Prime ∧ p₃.Prime ∧ p₁ + p₂ + p₃ = N :=
  vinogradov_threePrimes siegelWalfiszBound

end Layer4

end TauCetiRoadmap.CircleMethodThreePrimes
