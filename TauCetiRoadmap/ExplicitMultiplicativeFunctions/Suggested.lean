module

import Mathlib
import TauCeti.NumberTheory.LFunctions.Mertens

/-!
# Explicit multiplicative functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need: the real-argument summatory functions of the Möbius function, the Selberg
remainder, the first Stieltjes constant, superior highly composite numbers, and the finite
verifications of README Layer 0.7 that the headline proofs rest on, each a proposition with a real
body stating exactly the inequality a source checks.

Two conventions govern the hypotheses. The explicit prime estimates that the README imports from
ExplicitPrimeCounting enter as hypotheses of the exact shape the proofs use, so that no statement
depends on that roadmap's final constants. A finite verification enters as a hypothesis only when
it is not a restriction of the conclusion to an interval; where the README completes a theorem by
checking its own inequality on an initial interval, the theorem is stated here beyond that
interval, and the README records the interval and the proposition that covers it.

Headline theorems stated here, in README order: Ramaré's transfer theorem in its 2013 instance
`|M(D)| ≤ (0.0130/log D − 0.118/log² D) D` (Layer 1.5); Tao's bound `|m_S(x)| ≤ 1` and
Balazard's inequality (Layers 2.1–2.2); Ramaré's bound for `m̌(x) − 1` (Layer 3.1); the comparison
theorem of the convolution method for a general exponent and the Dirichlet-divisor model with the
constant term `γ² − 2γ₁` (Layers 5.1–5.2); the Hall–Tenenbaum inequality (Layer 6.3); the explicit
Mertens product of Rosser–Schoenfeld and Axler's cubic refinement (Layer 8.1); Robin's bound for
`ω(n)`, the Nicolas–Robin bound for `τ(n)` and Rosser–Schoenfeld's bound for `n/φ(n)` (Layer 9).

Every headline theorem is statable at the pins. Three groups of README targets are deliberately
not stated here. Ramaré–Zuniga Alterman's sharper instance of the transfer (README 1.10): its
constant `0.039` rests on the source's own treatment of the boundary terms of the weight passage,
whose finite inputs the README does not fix, so no hypothesis list can be written that is known to
suffice. Robin's unconditional bound `σ(n)/n < e^γ log log n + 0.6483/log log n` for `n ≥ 3`
(README 9.3): its proof needs explicit bounds for `θ` and a verification over the colossally
abundant numbers below the source's analytic range, in forms the README does not fix, so no
hypothesis list can be written that is known to suffice.
The statements that rest on unrefereed preprints (the linear bounds for `M` from the zeros of `ζ`,
the iterated power-of-logarithm bounds, Daval's conversions, the smoothed divisor problem and
Tudzi's Piltz remainders): they are README targets, not acceptance tests.
-/

noncomputable section

open Real Finset Filter

namespace TauCetiRoadmap.ExplicitMultiplicativeFunctions

/-! ## Layer 0: carriers, the Stieltjes constant and computational hypotheses -/

/-- The Mertens function `M(x) = Σ_{n ≤ x} μ(n)` at a real argument; the sum runs over
`Finset.Icc 1 ⌊x⌋₊`, so `M(x) = 0` for `x < 1` (README 0.1). -/
def moebiusSum (x : ℝ) : ℝ :=
  ∑ n ∈ Icc 1 ⌊x⌋₊, (ArithmeticFunction.moebius n : ℝ)

/-- The logarithmic Möbius sum `m(x) = Σ_{n ≤ x} μ(n)/n` at a real argument (README 0.1). -/
def moebiusDivSum (x : ℝ) : ℝ :=
  ∑ n ∈ Icc 1 ⌊x⌋₊, (ArithmeticFunction.moebius n : ℝ) / n

/-- The logarithmically weighted Möbius sum `m̌(x) = Σ_{n ≤ x} μ(n) log(x/n)/n` (README 0.1). -/
def moebiusLogSum (x : ℝ) : ℝ :=
  ∑ n ∈ Icc 1 ⌊x⌋₊, (ArithmeticFunction.moebius n : ℝ) * Real.log (x / n) / n

open Classical in
/-- The restricted sum `m_S(x) = Σ μ(n)/n` over the integers `1 ≤ n ≤ x` all of whose prime
factors lie in `S`, the multiplicative semigroup `⟨S⟩` (README 0.2); elements of `S` that are not
prime play no role. -/
def moebiusDivSumIn (S : Set ℕ) (x : ℝ) : ℝ :=
  ∑ n ∈ (Icc 1 ⌊x⌋₊).filter (fun n => ∀ p ∈ n.primeFactors, p ∈ S),
    (ArithmeticFunction.moebius n : ℝ) / n

/-- The Selberg remainder `R₂*(D)`, defined by
`Σ_{d ≤ D} (Λ ⋆ Λ(d) − Λ(d) log d) = −2γ ⌊D⌋ + R₂*(D)` (Ramaré 2013, (6.1); README 1.5). -/
def selbergRemainder (D : ℝ) : ℝ :=
  ∑ d ∈ Icc 1 ⌊D⌋₊,
      ((ArithmeticFunction.vonMangoldt * ArithmeticFunction.vonMangoldt) d -
        ArithmeticFunction.vonMangoldt d * Real.log d) +
    2 * eulerMascheroniConstant * ⌊D⌋₊

/-- The first Stieltjes constant `γ₁ = lim_{N → ∞} (Σ_{n ≤ N} (log n)/n − ½ log² N)`, the
normalisation for which `ζ(1 + s) = 1/s + γ − γ₁ s + …` (README 0.5). -/
def stieltjesGammaOne : ℝ :=
  limUnder atTop fun N : ℕ => ∑ n ∈ Icc 1 N, Real.log n / n - Real.log N ^ 2 / 2

/-- A Möbius table: `|M(x)| ≤ c √x` for every real `x` with `33 ≤ x ≤ H` (README 0.7). The
instance `(0.571, 10¹²)` is Dress's computation as quoted by Ramaré 2013, (4.5). -/
def MoebiusTableVerified (c H : ℝ) : Prop :=
  ∀ x : ℝ, 33 ≤ x → x ≤ H → |moebiusSum x| ≤ c * Real.sqrt x

/-- The finite computations of Ramaré 2013 on which the analytic part of its Theorem 1.1 rests
(README 0.7): the Selberg-remainder bounds of Lemma 6.3, the bound `|R₂*(D)| ≤ 0.0213 D` on
`[1.8·10⁹, 2.3104·10¹²]`, below the analytic range `D ≥ 1 520 000²` (where the printed proof relied
on a false range of its Lemma 4.5), the
integral of Lemma 6.4 with its value `−147.7678…` (the printed `−129.559` is not the value of the
integral), the small-values sum of Lemma 7.1, the boundary value of the proof of Theorem 1.1
(computed `−3.4852…`), the direct verification closing Lemma 7.2, and the extension of Lemma 4.2
below `3 430 190`. -/
def RamareTransferComputations : Prop :=
  (∀ D : ℝ, 3 ≤ D → D ≤ 1.1e8 →
    |selbergRemainder D| ≤ 1.80 * Real.sqrt D * Real.log D) ∧
  (∀ D : ℝ, 1.1e8 ≤ D → D ≤ 1.8e9 →
    |selbergRemainder D| ≤ 1.93 * Real.sqrt D * Real.log D) ∧
  (∀ D : ℝ, 1.8e9 ≤ D → D ≤ 2.3104e12 → |selbergRemainder D| ≤ 0.0213 * D) ∧
  |(∫ t in (1 : ℝ)..1e8, (Chebyshev.psi t - t) / t) + 147.768| ≤ 0.01 ∧
  (∑ k ∈ Icc 1 462848,
      |(ArithmeticFunction.vonMangoldt * ArithmeticFunction.vonMangoldt) k -
          ArithmeticFunction.vonMangoldt k * Real.log k + 2 * eulerMascheroniConstant| / k) +
      |selbergRemainder 462848| / 462848 ≤ 0.03739 * 4345 ∧
  |moebiusSum 2161205 -
      (∑ d ∈ Icc 1 2161205, (ArithmeticFunction.moebius d : ℝ) * Real.log d ^ 2) /
        Real.log 2161205 ^ 2| ≤ 3.49 ∧
  (∀ D : ℝ, 2161205 ≤ D → D ≤ 8613000 →
    |∑ d ∈ Icc 1 ⌊D⌋₊, (ArithmeticFunction.moebius d : ℝ) * Real.log d ^ 2| ≤
      (0.0130 * Real.log D - 0.144) * D) ∧
  (∀ x : ℝ, 1514928 ≤ x → x ≤ 3430190 →
    |Chebyshev.psi x - x| ≤ 0.0065 * x / Real.log x)

/-- The decimal enclosure of the first Stieltjes constant,
`γ₁ = −0.0728158454836767248605863758749013191377 + O*(10⁻⁴⁰)` (Berkane–Bordellès–Ramaré 2012,
(2.2), citing Kreminski 2003; README 0.7). -/
def StieltjesGammaOneEnclosure : Prop :=
  |stieltjesGammaOne + 0.0728158454836767248605863758749013191377| ≤ 1e-40

/-- Robin's primorial table (README 0.7): with `p_k = Nat.nth Nat.Prime (k - 1)` the `k`-th prime
and `θ(p_k) = log(p₁ ⋯ p_k)`, the inequality `k log θ(p_k) ≤ 1.3841 θ(p_k)` for `3 ≤ k ≤ K`. -/
def PrimorialTableVerified (K : ℕ) : Prop :=
  ∀ k : ℕ, 3 ≤ k → k ≤ K →
    (k : ℝ) * Real.log (Chebyshev.theta (Nat.nth Nat.Prime (k - 1))) ≤
      1.3841 * Chebyshev.theta (Nat.nth Nat.Prime (k - 1))

/-- `N` is a superior `k`-highly composite number associated to `ε` (README 9.2): `N ≥ 1` and
`τ_k(n)/n^ε ≤ τ_k(N)/N^ε` for every `n ≥ 1`, where `τ_k = ζ^k` is the `k`-fold Dirichlet
convolution of `ζ` (Teo 2026, p. 4). -/
def superiorHighlyComposite (k : ℕ) (ε : ℝ) (N : ℕ) : Prop :=
  0 < N ∧ ∀ n : ℕ, 0 < n →
    (((ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) n : ℝ) / (n : ℝ) ^ ε ≤
      ((ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) N : ℝ) / (N : ℝ) ^ ε)

/-- The finite table behind the maximal order of `τ_k` (README 0.7): every superior `k`-highly
composite number `N` associated to some `ε ∈ [ε₁, ε₂]` satisfies
`log τ_k(N) · log log N ≤ λ · log k · log N`. -/
def SuperiorTableVerified (k : ℕ) (ε₁ ε₂ lam : ℝ) : Prop :=
  ∀ ε : ℝ, ε₁ ≤ ε → ε ≤ ε₂ → ∀ N : ℕ, superiorHighlyComposite k ε N →
    Real.log ((ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) N) * Real.log (Real.log N) ≤
      lam * Real.log k * Real.log N

/-- Rosser–Schoenfeld's primorial table (README 0.7): for every `k ≥ 3` with `p_k < P`, the
primorial `N_k = p₁ ⋯ p_k` satisfies `N_k/φ(N_k) < e^γ log log N_k + 2.50637/log log N_k`. -/
def PrimorialTotientTableVerified (P : ℕ) : Prop :=
  ∀ k : ℕ, 3 ≤ k → Nat.nth Nat.Prime (k - 1) < P →
    ((primorial (Nat.nth Nat.Prime (k - 1)) : ℝ) /
        (primorial (Nat.nth Nat.Prime (k - 1))).totient) <
      exp eulerMascheroniConstant *
          Real.log (Real.log (primorial (Nat.nth Nat.Prime (k - 1)))) +
        2.50637 / Real.log (Real.log (primorial (Nat.nth Nat.Prime (k - 1))))

/-! ## Layer 1: the Mertens function -/

/-- **Ramaré's transfer theorem, the 2013 instance** (README 1.5; Ramaré 2013, Theorem 1.1). For
every real `D ≥ 2 161 205`, `|M(D)| ≤ (0.0130/log D − 0.118/log² D) D`, under the explicit prime
estimates `ψ(x) ≤ 1.04 x`, `|ψ(x) − x| ≤ 0.8 √x` on `[1500, 10¹⁰]`,
`|ψ(x) − x| ≤ 0.0065 x/log x` beyond `e²²`, `|ψ(x) − x| ≤ 0.000213 x` from `10¹⁰` and
`|Σ_{n ≤ x} Λ(n)/n − log x + γ| ≤ 0.0067/log x` from `1 520 000` (ExplicitPrimeCounting §§3.2,
3.3, 6.1, 4.2), the Möbius table to `10¹²`, Cohen–Dress–El Marraki's `|M(x)| ≤ x/4345` from
`2 160 535` (README 1.3), the squarefree bounds of README 7.1 (the remainder `0.7 √x` and
`(6/π²) log y + 0.578 ≤ Σ_{d ≤ y} μ²(d)/d ≤ (6/π²) log y + 1.166`) and the finite computations of the
source. On `[1 078 853, 2 161 205]` the same bound is a direct verification (README 1.5). -/
theorem abs_moebiusSum_le_ramare
    (hψ₁ : ∀ x : ℝ, 0 ≤ x → Chebyshev.psi x ≤ 1.04 * x)
    (hψ₂ : ∀ x : ℝ, 1500 ≤ x → x ≤ 1e10 → |Chebyshev.psi x - x| ≤ 0.8 * Real.sqrt x)
    (hψ₃ : ∀ x : ℝ, exp 22 < x → |Chebyshev.psi x - x| ≤ 0.0065 * x / Real.log x)
    (hψ₄ : ∀ x : ℝ, 1e10 ≤ x → |Chebyshev.psi x - x| ≤ 0.000213 * x)
    (hψ₅ : ∀ x : ℝ, 1520000 ≤ x →
      |∑ n ∈ Icc 1 ⌊x⌋₊, ArithmeticFunction.vonMangoldt n / n - Real.log x +
          eulerMascheroniConstant| ≤ 0.0067 / Real.log x)
    (hM : MoebiusTableVerified 0.571 1e12)
    (h4345 : ∀ x : ℝ, 2160535 ≤ x → |moebiusSum x| ≤ x / 4345)
    (hQ : ∀ x : ℝ, 1 ≤ x →
      |∑ n ∈ Icc 1 ⌊x⌋₊, (ArithmeticFunction.moebius n : ℝ) ^ 2 - 6 / π ^ 2 * x| ≤
        0.7 * Real.sqrt x)
    (hQ' : ∀ y : ℝ, 1 ≤ y →
      ∑ d ∈ Icc 1 ⌊y⌋₊, (ArithmeticFunction.moebius d : ℝ) ^ 2 / d ≤
        6 / π ^ 2 * Real.log y + 1.166)
    (hQ'' : ∀ y : ℝ, 1 ≤ y →
      6 / π ^ 2 * Real.log y + 0.578 ≤
        ∑ d ∈ Icc 1 ⌊y⌋₊, (ArithmeticFunction.moebius d : ℝ) ^ 2 / d)
    (hR : RamareTransferComputations) (D : ℝ) (hD : 2161205 ≤ D) :
    |moebiusSum D| ≤ (0.0130 / Real.log D - 0.118 / Real.log D ^ 2) * D := by
  sorry

/-! ## Layer 2: the logarithmic sum `m(x)` -/

/-- **Tao's theorem** (README 2.1; Tao 2010, Theorem 1.1). For every set `S` of primes and every
real `x`, `|Σ_{n ≤ x, n ∈ ⟨S⟩} μ(n)/n| ≤ 1`; `S` the set of all primes is Gram's `|m(x)| ≤ 1`. -/
theorem abs_moebiusDivSumIn_le_one (S : Set ℕ) (x : ℝ) : |moebiusDivSumIn S x| ≤ 1 := by
  sorry

/-- **Balazard's inequality** (README 2.2; Ramaré 2015, Theorem 1.1; Balazard 2012,
Proposition 7). For every real `x ≥ 1`, `|m(x)| ≤ |M(x)|/x + x⁻² ∫_1^x |M(t)| dt + 8/(3x)`. -/
theorem abs_moebiusDivSum_le_balazard (x : ℝ) (hx : 1 ≤ x) :
    |moebiusDivSum x| ≤
      |moebiusSum x| / x + (∫ t in (1 : ℝ)..x, |moebiusSum t|) / x ^ 2 + 8 / (3 * x) := by
  sorry

/-! ## Layer 3: the logarithmically weighted sum `m̌(x)` -/

/-- **Ramaré's bound for `m̌`** (README 3.1; Ramaré 2015, Theorem 1.4, with the kernel of its
Lemma 3.2 as corrected by the corrigendum). For every real `x ≥ 1`,
`|m̌(x) − 1| ≤ ((7/4 − γ)/x²) ∫_1^x |M(t)| dt + 2/x`. -/
theorem abs_moebiusLogSum_sub_one_le (x : ℝ) (hx : 1 ≤ x) :
    |moebiusLogSum x - 1| ≤
      (7 / 4 - eulerMascheroniConstant) / x ^ 2 * (∫ t in (1 : ℝ)..x, |moebiusSum t|) +
        2 / x := by
  sorry

/-! ## Layer 5: the convolution method -/

/-- **The comparison theorem of the convolution method** (README 5.1; Ramaré 1995, Lemma 3.2,
there at `α = 1/3`). Let `α > 0` and let `h, k` be arithmetic functions with
`Σ |h(n)| n^α < ∞`, and suppose that `Σ_{n ≤ t} k(n) = A log² t + B log t + C + O*(D t^{−α})` for
every real `t > 0`. Then for every real `t > 0`,
`Σ_{n ≤ t} (h ⋆ k)(n) = u log² t + v log t + w + O*(D t^{−α} Σ |h(n)| n^α)` with `u = A H(0)`,
`v = 2A H'(0) + B H(0)`, `w = A H''(0) + B H'(0) + C H(0)`, where `H(0) = Σ h(n)`,
`H'(0) = −Σ h(n) log n` and `H''(0) = Σ h(n) log² n`. -/
theorem norm_sum_mul_sub_le_comparison (h k : ArithmeticFunction ℂ) (α : ℝ) (hα : 0 < α)
    (A B C : ℂ) (D : ℝ)
    (hh : Summable fun n : ℕ => ‖h n‖ * (n : ℝ) ^ α)
    (hk : ∀ t : ℝ, 0 < t →
      ‖∑ n ∈ Icc 1 ⌊t⌋₊, k n - (A * (Real.log t : ℂ) ^ 2 + B * Real.log t + C)‖ ≤
        D * t ^ (-α))
    (t : ℝ) (ht : 0 < t) :
    ‖∑ n ∈ Icc 1 ⌊t⌋₊, (h * k) n -
        (A * (∑' n, h n) * (Real.log t : ℂ) ^ 2 +
          (2 * A * (-∑' n, h n * Real.log n) + B * ∑' n, h n) * Real.log t +
          (A * (∑' n, h n * (Real.log n : ℂ) ^ 2) + B * (-∑' n, h n * Real.log n) +
            C * ∑' n, h n))‖ ≤
      D * t ^ (-α) * ∑' n : ℕ, ‖h n‖ * (n : ℝ) ^ α := by
  sorry

/-- **The Dirichlet-divisor model** (README 5.2; Berkane–Bordellès–Ramaré 2012, Corollary 2.2,
with its constant term corrected to `γ² − 2γ₁` and its range to `t ≥ 1`; the constant `1.641` on
all of `t > 0` is Riesel–Vaughan's). With `P(t) = ½ log² t + 2γ log t + γ² − 2γ₁`,
`Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.16 t^{−1/3})` for every real `t ≥ 1` and
`Σ_{n ≤ t} τ(n)/n = P(t) + O*(1.641 t^{−1/3})` for every real `t > 0`, under the bound
`|Δ(x)| ≤ 0.961 √x` for every real `x ≥ 1` of README 7.4 and the decimal enclosures of `γ`
(ExplicitPrimeCounting §1.6) and of `γ₁`. -/
theorem sum_tau_div_model
    (hΔ : ∀ x : ℝ, 1 ≤ x →
      |∑ n ∈ Icc 1 ⌊x⌋₊, (ArithmeticFunction.sigma 0 n : ℝ) -
          x * (Real.log x + 2 * eulerMascheroniConstant - 1)| ≤ 0.961 * Real.sqrt x)
    (hγ : |eulerMascheroniConstant - 0.5772156649| < 1e-9)
    (hγ₁ : StieltjesGammaOneEnclosure) :
    (∀ t : ℝ, 1 ≤ t →
      |∑ n ∈ Icc 1 ⌊t⌋₊, (ArithmeticFunction.sigma 0 n : ℝ) / n -
          (Real.log t ^ 2 / 2 + 2 * eulerMascheroniConstant * Real.log t +
            eulerMascheroniConstant ^ 2 - 2 * stieltjesGammaOne)| ≤
        1.16 * t ^ (-(1 / 3 : ℝ))) ∧
    (∀ t : ℝ, 0 < t →
      |∑ n ∈ Icc 1 ⌊t⌋₊, (ArithmeticFunction.sigma 0 n : ℝ) / n -
          (Real.log t ^ 2 / 2 + 2 * eulerMascheroniConstant * Real.log t +
            eulerMascheroniConstant ^ 2 - 2 * stieltjesGammaOne)| ≤
        1.641 * t ^ (-(1 / 3 : ℝ))) := by
  sorry

/-! ## Layer 6: upper bounds for nonnegative multiplicative functions -/

open Classical in
/-- **The Hall–Tenenbaum inequality** (README 6.3; Hall–Tenenbaum 1988, Theorem 01). Let `f ≥ 0`
be multiplicative with `Σ_{p ≤ y} f(p) log p ≤ A y` for every real `y ≥ 0` and
`Σ_p Σ_{ν ≥ 2} f(p^ν) log(p^ν)/p^ν ≤ B`. Then for every real `x > 1`,
`Σ_{n ≤ x} f(n) ≤ (A + B + 1) (x/log x) Σ_{n ≤ x} f(n)/n`. -/
theorem sum_le_hall_tenenbaum (f : ArithmeticFunction ℝ) (hf : f.IsMultiplicative)
    (hf0 : ∀ n, 0 ≤ f n) (A B : ℝ)
    (hA : ∀ y : ℝ, 0 ≤ y → ∑ p ∈ Nat.primesLE ⌊y⌋₊, f p * Real.log p ≤ A * y)
    (hB : ∀ N : ℕ, ∑ m ∈ (Icc 1 N).filter (fun m => IsPrimePow m ∧ ¬ m.Prime),
      f m * Real.log m / m ≤ B)
    (x : ℝ) (hx : 1 < x) :
    ∑ n ∈ Icc 1 ⌊x⌋₊, f n ≤ (A + B + 1) * (x / Real.log x) * ∑ n ∈ Icc 1 ⌊x⌋₊, f n / n := by
  sorry

/-! ## Layer 8: explicit Euler products over primes -/

/-- **The explicit Mertens product** (README 8.1; Rosser–Schoenfeld 1962, Theorems 7–8). Under the
reciprocal-prime estimate `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x` for `x ≥ 24 284`, with
`B = mertensConstant ℚ` (ExplicitPrimeCounting §4.3), for every real `x ≥ 24 284`,
`1 − 1/log² x ≤ e^γ log x ∏_{p ≤ x}(1 − 1/p) ≤ 1 + 1/(2 log² x)` and
`1 − 1/(2 log² x) ≤ ∏_{p ≤ x}(1 − 1/p)⁻¹/(e^γ log x) ≤ 1 + 1/log² x`. On `1 < x < 24 284` the
four inequalities are a direct verification (README 8.1). -/
theorem mertens_product_explicit
    (hB : ∀ x : ℝ, 24284 ≤ x →
      |∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p - Real.log (Real.log x) -
          TauCeti.LFunctions.mertensConstant ℚ| ≤ 1 / Real.log x ^ 3)
    (x : ℝ) (hx : 24284 ≤ x) :
    (1 - 1 / Real.log x ^ 2 ≤
        exp eulerMascheroniConstant * Real.log x *
          ∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 - 1 / (p : ℝ)) ∧
      exp eulerMascheroniConstant * Real.log x * ∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 - 1 / (p : ℝ)) ≤
        1 + 1 / (2 * Real.log x ^ 2)) ∧
    (1 - 1 / (2 * Real.log x ^ 2) ≤
        (∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 - 1 / (p : ℝ)))⁻¹ /
          (exp eulerMascheroniConstant * Real.log x) ∧
      (∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 - 1 / (p : ℝ)))⁻¹ /
          (exp eulerMascheroniConstant * Real.log x) ≤ 1 + 1 / Real.log x ^ 2) := by
  sorry

/-- **Axler's cubic refinement of the Mertens product** (README 8.1; Axler 2018, Proposition 6.1
of the arXiv version). Under Axler's one-sided estimate
`Σ_{p ≤ x} 1/p − log log x − B ≥ −1/(20 log³ x) − 3/(16 log⁴ x)` for every real `x > 1`, with
`B = mertensConstant ℚ`, for every real `x ≥ 392 687`,
`e^γ log x ∏_{p ≤ x}(1 − 1/p) < 1 + 0.07/log³ x`. On `1 < x < 392 687` the inequality is a direct
verification (README 8.1). -/
theorem mertens_product_axler
    (hB : ∀ x : ℝ, 1 < x →
      -(1 / (20 * Real.log x ^ 3) + 3 / (16 * Real.log x ^ 4)) ≤
        ∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p - Real.log (Real.log x) -
          TauCeti.LFunctions.mertensConstant ℚ)
    (x : ℝ) (hx : 392687 ≤ x) :
    exp eulerMascheroniConstant * Real.log x * ∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 - 1 / (p : ℝ)) <
      1 + 0.07 / Real.log x ^ 3 := by
  sorry

/-! ## Layer 9: pointwise bounds -/

/-- **Robin's bound for `ω(n)`** (README 9.1; Robin 1983, Théorème 11). For every natural `n ≥ 3`,
`ω(n) ≤ 1.3841 log n/log log n`, under the lower bound `p_k ≥ k(log k + log log k − 1)` for the
`k`-th prime, `k ≥ 2` (ExplicitPrimeCounting §5.3), and Robin's primorial table to `k = 26`. -/
theorem cardDistinctFactors_le_robin
    (hp : ∀ k : ℕ, 2 ≤ k →
      (k : ℝ) * (Real.log k + Real.log (Real.log k) - 1) ≤ Nat.nth Nat.Prime (k - 1))
    (htab : PrimorialTableVerified 26) (n : ℕ) (hn : 3 ≤ n) :
    (ArithmeticFunction.cardDistinctFactors n : ℝ) ≤
      1.3841 * Real.log n / Real.log (Real.log n) := by
  sorry

/-- **The Nicolas–Robin bound for `τ(n)`** (README 9.2; Nicolas–Robin 1983, Théorème 1; Teo 2026,
§6.1 and Table 12). For every natural `n ≥ 3`, `τ(n) ≤ n^{1.538 log 2/log log n}`; the maximum of
`log τ(n) log log n/(log 2 log n)` is `1.53794…`, at `n = 6 983 776 800`. The hypothesis is the
finite table of the superior highly composite numbers associated to `ε ∈ [0.1950, 0.3466]`. -/
theorem sigma_zero_le_nicolasRobin (htab : SuperiorTableVerified 2 0.1950 0.3466 1.538)
    (n : ℕ) (hn : 3 ≤ n) :
    (ArithmeticFunction.sigma 0 n : ℝ) ≤
      (n : ℝ) ^ (1.538 * Real.log 2 / Real.log (Real.log n)) := by
  sorry

/-- **Rosser–Schoenfeld's bound for `n/φ(n)`** (README 9.4; Rosser–Schoenfeld 1962, Theorem 15).
For every natural `n ≥ 3`, `n/φ(n) < e^γ log log n + 2.50637/log log n`, under the reciprocal-prime
estimate `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 1/log³ x` for `x ≥ 24 284` (ExplicitPrimeCounting
§4.3), the lower bound `θ(x) > x(1 − 1/(2 log x))` for `x ≥ 563` (ExplicitPrimeCounting §3.2) and
the primorial table below `24 284`. -/
theorem div_totient_lt_rosserSchoenfeld
    (hB : ∀ x : ℝ, 24284 ≤ x →
      |∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p - Real.log (Real.log x) -
          TauCeti.LFunctions.mertensConstant ℚ| ≤ 1 / Real.log x ^ 3)
    (hθ : ∀ x : ℝ, 563 ≤ x → x * (1 - 1 / (2 * Real.log x)) < Chebyshev.theta x)
    (htab : PrimorialTotientTableVerified 24284) (n : ℕ) (hn : 3 ≤ n) :
    (n : ℝ) / n.totient <
      exp eulerMascheroniConstant * Real.log (Real.log n) +
        2.50637 / Real.log (Real.log n) := by
  sorry

end TauCetiRoadmap.ExplicitMultiplicativeFunctions
