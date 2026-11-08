module

import Mathlib
import TauCeti.Analysis.SpecialFunctions.LogIntegral
import TauCeti.NumberTheory.LFunctions.Mertens

/-!
# Explicit prime counting: target signatures

This file is not the roadmap. The roadmap is `README.md`; this file states, against the pinned
Mathlib and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each
with `sorry`, together with the few definitions their statements need. Every computational input
that a theorem uses (a finite-range verification, a verified height of zeros) is a hypothesis
with its data in the statement, exactly as in the README. The bounded-height Riemann hypothesis
`RiemannHypothesisUpTo` is the proposition of the roadmap ExplicitZetaBounds (§0.2), copied
verbatim because a roadmap module cannot be imported.

Headline theorems stated here:

* Layer 0: Montgomery–Vaughan's Brun–Titchmarsh inequality with the constant `2`
  (`brun_titchmarsh`), from the two finite-range propositions of its route: Montgomery–Vaughan's
  diagonal bound `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07` on `[6, 10⁹)` (`MVDiagonalFiniteRange`)
  and the weighted large sieve evaluated exactly for `25 ≤ y/k ≤ 2·10⁴`
  (`BrunTitchmarshFiniteRange`).
* Layer 2: Schoenfeld's bounds under the Riemann hypothesis
  (`schoenfeld_of_riemannHypothesis`), Lee–Nosal's bounds for `ψ` and `θ` under the Riemann
  hypothesis (`leeNosal_of_riemannHypothesis`, `leeNosal_theta_of_riemannHypothesis`), Büthe's
  bounds from the Riemann hypothesis to a height `T` (`buthe_of_riemannHypothesisUpTo`) and their
  extension under Johnston's condition (`johnston_of_riemannHypothesisUpTo`), and
  Carneiro–Milinovich–Soundararajan's prime in `[x, x + (22/25) √x log x]` under the Riemann
  hypothesis (`carneiro_milinovich_soundararajan`).
* Layer 3: Dusart's bound for `ψ` and `θ` from a zero-free region of constant `R`, the absence
  of zeros up to height `14` and Rosser's bound for the sum of `1/γ³` over the zeros
  (`dusart_of_zeroFreeRegion`, `ZetaZeroCubeSum`), and Axler's upper bound for `π(x)` from its
  `θ`-input (`axler_primeCounting_upper`).
* Layer 4: Vanlalngaia's explicit second theorem of Mertens from its `θ`-input
  (`vanlalngaia_sum_inv_prime`).
* Layer 5: Dusart's `p_k ≥ k(log k + log log k − 1)` from its `θ`- and `ψ`-inputs
  (`dusart_nth_prime_lower`).
* Layer 6: Lamzouri–Li–Soundararajan's least prime `p ≤ (φ(q) log q)²` in a reduced class under
  the generalised Riemann hypothesis (`lamzouri_li_soundararajan`).
* Layer 7: Schoenfeld's prime in `(x, x + x/16597)` from its `ψ`-input
  (`schoenfeld_interval`), Trudgian's prime in `[x, x(1 + 1/(111 log² x))]` and Axler's prime in
  `(x, x(1 + (0.048668 + 8.22·10⁻¹¹)/log³ x)]` from their `θ`-inputs and the record prime gaps
  (`trudgian_interval`, `axler_interval`).

Headline theorems that are not statable at the pins, and what each lacks:

* Rosser–Schoenfeld's `ψ(x) < 1.03883 x` and `θ(x) < 1.01624 x` for `x > 0`, Schoenfeld's
  Theorems 6* and 11, Dusart's `|ψ(x) − x| ≤ 0.006409 x/log x` and his rows `η_k`, and Trudgian's
  bound for `ψ`: these are the Layer 3 bounds themselves, whose every route beyond `10¹⁹` passes
  through a table proposition of README §3.1(b) (`DusartThesisTable`, `Dusart1999Row`) or, for
  Trudgian's middle range, §3.1(c) (`FaberKadiriTable`), a numerical inequality on the error
  function of Rosser–Schoenfeld's scheme, built from the integrals
  `K_ν(z, x) = (1/2) ∫ₓ^∞ t^{ν−1} exp(−(z/2)(t + 1/t)) dt` and a dozen auxiliary quantities, or on
  the smoothed zero-density error function of the Faber–Kadiri corrigendum. That function is not a simple definition, and stating the
  inequality without it would assert more than the roadmap proves. Their consequences for `π`,
  `p_n` and short intervals are stated above from pointwise inputs where they are headlines.
* Fiori–Kadiri–Swidinsky's bounds for `ψ` and `π`, Broadbent–Kadiri–Lumley–Ng–Wilk's
  `θ(x) ≤ (1 + 1.93378·10⁻⁸) x` and their `θ`-tables, Platt–Trudgian's and Johnston–Yang's bounds,
  Faber–Kadiri's bound, and Ramaré's bounds for `∑ Λ(n)/n`: they rest on the table propositions
  of README §3.1(c) and (d) and of Büthe's general theorem (README §2.3), numerical inequalities
  on the zero-density error function of display (3.9) of the Faber–Kadiri corrigendum, on the
  Pintz-form error function of a truncated explicit formula, itself bounded through the table
  proposition of README §2.1, and on Büthe's smoothed error, none of which is a simple definition
  either; Johnston–Yang's and Fiori–Kadiri–Swidinsky's further rest on the zero inputs of README
  §3.4.
* Bennett–Martin–O'Bryant–Rechnitzer's `|ψ(x; q, a) − x/φ(q)| < x/(840 log x)`, Ramaré–Rumely's
  and Dusart's rows in progressions, McCurley's rows, Ramaré's Mertens theorem in progressions
  and Kadiri's intervals in progressions: they rest on the table propositions of README §§6.1,
  6.3, 6.4 and 6.6, numerical inequalities on the error functions of those papers.
* Kadiri–Lumley's, Cully-Hugill–Lee's and Ramaré–Saouter's intervals `(x(1 − Δ⁻¹), x]`: they rest
  on the positivity of the explicit quantity (2.64) of Kadiri–Lumley at tabulated parameters, and
  Cully-Hugill–Lee's also on a zero density recomputed at the height `3·10¹²` (README §7.3).
* Dudek's and Cully-Hugill's primes between consecutive powers: they assume a zero-density bound
  whose constants `C₁(σ)`, `C₂(σ)` are tabulated in `σ`.
-/

noncomputable section

open Real

namespace TauCetiRoadmap.ExplicitPrimeCounting

/-! ## Carriers -/

/-- The value `li 2 = 1.04516…` of the unoffset logarithmic integral at `2`, by the
exponential-integral series `li 2 = γ + log log 2 + ∑_{n ≥ 1} (log 2)ⁿ/(n · n!)`. It equals the
Cauchy principal value `⨍₀² dt/log t`; the logarithmic integral `li` itself is owned by the
roadmap SpecialFunctionsEiLiErfIncompleteGamma (§8.2), and this local copy exists only to make
the statements below statable at the pins. -/
def liTwo : ℝ :=
  eulerMascheroniConstant + log (log 2) +
    ∑' n : ℕ, log 2 ^ (n + 1) / (((n : ℝ) + 1) * ((n + 1).factorial : ℝ))

/-- The unoffset logarithmic integral `li x = Li x + li 2` for `x > 1`, where
`Li x = ∫₂ˣ dt/log t` is Tau Ceti's `TauCeti.Real.logIntegral`. For `x > 1` it agrees with
SpecialFunctionsEiLiErfIncompleteGamma's `li` (§8.2); the statements below use it only for
`x > 1`. -/
def li (x : ℝ) : ℝ :=
  TauCeti.Real.logIntegral x + liTwo

/-- Riemann's weighted prime count `π*(x) = ∑_{k ≥ 1} π(x^{1/k})/k`; only finitely many terms
are nonzero, those with `x^{1/k} ≥ 2`. -/
def riemannPrimeCount (x : ℝ) : ℝ :=
  ∑' k : ℕ, (Nat.primeCounting ⌊x ^ ((1 : ℝ) / ((k : ℝ) + 1))⌋₊ : ℝ) / ((k : ℝ) + 1)

/-- The sum `∑_{p ≤ x} 1/p` over the primes up to the real `x`. -/
def primeReciprocalSum (x : ℝ) : ℝ :=
  ∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p

/-! ## Layer 0: the Brun–Titchmarsh inequality -/

/-- **Montgomery–Vaughan's diagonal bound on its finite range**: for every real `u` with
`6 ≤ u < 10⁹`, `∑_{q ≤ u} μ²(q)/φ(q) ≥ log u + 1.07`. From `10⁹` on the bound follows from
Büthe's explicit asymptotic `log u + γ + ∑_p log p/(p(p − 1)) + O*(58/√u)` for this sum
(Büthe, *A Brun–Titchmarsh inequality for weighted sums over prime numbers*, Lemma 4.5); together
they give Montgomery–Vaughan's bound for every `u ≥ 6` (*The large sieve*, 1973, Lemma 7). -/
def MVDiagonalFiniteRange : Prop :=
  ∀ u : ℝ, 6 ≤ u → u < 10 ^ 9 →
    log u + 1.07 ≤
      ∑ q ∈ Finset.Icc 1 ⌊u⌋₊, ((ArithmeticFunction.moebius q : ℤ) : ℝ) ^ 2 / (q.totient : ℝ)

/-- **The weighted large sieve evaluated below `2·10⁴`**: for every integer `n` with
`25 ≤ n ≤ 2·10⁴` there is an integer `Q ≥ 2` with `1/L + π(Q) ≤ 2n/log n`, where
`L = ∑_{q ≤ Q} μ²(q)/(φ(q)(n + 1 + (3/2) q Q))` is the weighted diagonal sum for an interval of
`n + 1` consecutive integers. From `2·10⁴` on, the choice `Q = ⌊√(2(n + 1)/3)⌋` and the
diagonal bound (`MVDiagonalFiniteRange` with Büthe's asymptotic) give the same inequality by
partial summation; at `n = 24` it fails for every `Q`. -/
def BrunTitchmarshFiniteRange : Prop :=
  ∀ n : ℕ, 25 ≤ n → n ≤ 20000 → ∃ Q : ℕ, 2 ≤ Q ∧
    1 / (∑ q ∈ Finset.Icc 1 Q, ((ArithmeticFunction.moebius q : ℤ) : ℝ) ^ 2 /
          ((q.totient : ℝ) * ((n : ℝ) + 1 + 3 / 2 * (q : ℝ) * (Q : ℝ)))) +
        (Nat.primeCounting Q : ℝ) ≤
      2 * (n : ℝ) / log n

/-- **Brun–Titchmarsh inequality** (Montgomery–Vaughan, *The large sieve*, 1973, Theorem 2).
For real `x, y > 0` and coprime positive integers `k`, `l` with `y > k`, the number of primes
`p ≡ l (mod k)` in `(x, x + y]` is at most `2y/(φ(k) log(y/k))`. The proof is the weighted large
sieve with the constant `3/2`; the two finite-range propositions are the computations it uses
(the diagonal bound below `10⁹`, and the exact evaluation for `25 ≤ y/k ≤ 2·10⁴`). -/
theorem brun_titchmarsh (hD : MVDiagonalFiniteRange) (hE : BrunTitchmarshFiniteRange)
    (x y : ℝ) (hx : 0 < x) (k l : ℕ) (hk : 0 < k) (hkl : Nat.Coprime k l)
    (hy : (k : ℝ) < y) :
    (((Finset.Ioc ⌊x⌋₊ ⌊x + y⌋₊).filter (fun p => p.Prime ∧ p % k = l % k)).card : ℝ) ≤
      2 * y / ((k.totient : ℝ) * log (y / k)) := by
  sorry

/-! ## Layer 1: hypotheses -/

/-- **The Riemann hypothesis to height `H`**: every zero `s` of `riemannZeta` with
`0 < Re s < 1` and `|Im s| ≤ H` has `Re s = 1/2`. This is the proposition of the roadmap
ExplicitZetaBounds (§0.2), copied verbatim (up to the name of the bound variable) only to make
the statements below statable at the pins; its laws and the recorded verifications used below
(§0.4 there) belong to that roadmap. -/
def RiemannHypothesisUpTo (H : ℝ) : Prop :=
  ∀ s : ℂ, riemannZeta s = 0 → 0 < s.re → s.re < 1 → |s.im| ≤ H → s.re = 1 / 2

/-- **A zero-free region of the classical shape** with constant `R` from height `t₀`: no zero `s`
of `riemannZeta` has `|Im s| ≥ t₀` and `Re s ≥ 1 − 1/(R log |Im s|)`. -/
def ClassicalZeroFreeRegion (R t₀ : ℝ) : Prop :=
  ∀ s : ℂ, riemannZeta s = 0 → t₀ ≤ |s.im| → s.re < 1 - 1 / (R * log |s.im|)

/-- **Büthe's verified bounds** (Büthe, *An analytic method for bounding ψ(x)*, Math. Comp. 87
(2018), Theorem 2, obtained from the zeros of `ζ` up to height `10¹¹`), with the second
inequality from `1427` on: the printed threshold `1423` fails on `1426.47 < x < 1427`. -/
def ButheVerified : Prop :=
  (∀ x : ℝ, 11 < x → x ≤ 10 ^ 19 → |Chebyshev.psi x - x| ≤ 0.94 * √x) ∧
  (∀ x : ℝ, 1427 ≤ x → x ≤ 10 ^ 19 → x - Chebyshev.theta x ≤ 1.95 * √x) ∧
  (∀ x : ℝ, 1 ≤ x → x ≤ 10 ^ 19 → 0.05 * √x < x - Chebyshev.theta x) ∧
  (∀ x : ℝ, 2 ≤ x → x ≤ 10 ^ 19 → |li x - riemannPrimeCount x| < √x / log x) ∧
  (∀ x : ℝ, 2 ≤ x → x ≤ 10 ^ 19 →
    li x - Nat.primeCounting ⌊x⌋₊ ≤ √x / log x * (1.95 + 3.9 / log x + 19.5 / log x ^ 2)) ∧
  (∀ x : ℝ, 2 ≤ x → x ≤ 10 ^ 19 → 0 < li x - Nat.primeCounting ⌊x⌋₊)

/-- **The closing computation of Büthe's proof** (Büthe, *Estimating π(x) and related functions
under partial RH assumptions*, Math. Comp. 85 (2016), proof of Theorem 2), with the `π*` clause
from `97` on: the printed `x > 59` fails on `96.29 < x < 97`. -/
def Buthe2016Range : Prop :=
  (∀ x : ℝ, 59 < x → x < 5000 → |Chebyshev.psi x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
  (∀ x : ℝ, 599 < x → x < 5000 → |Chebyshev.theta x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
  (∀ x : ℝ, 97 ≤ x → x < 5000 → |riemannPrimeCount x - li x| ≤ √x * log x / (8 * π)) ∧
  (∀ x : ℝ, 2657 < x → x < 5000 →
    |(Nat.primeCounting ⌊x⌋₊ : ℝ) - li x| ≤ √x * log x / (8 * π))

/-- **Schoenfeld's finite ranges** (Schoenfeld, *Sharper bounds for the Chebyshev functions θ(x)
and ψ(x). II*, Math. Comp. 30 (1976)): Theorem 6* up to `10⁸`, inequalities (6.2)–(6.4) of
Theorem 10 up to `1427`, inequality (6.18) of Corollary 1 up to `5·10⁷`, and the interval of
Theorem 12 up to `10⁸`. -/
def Schoenfeld1976Range : Prop :=
  (∀ x : ℝ, 0 < x → x ≤ 10 ^ 8 → Chebyshev.theta x < 1.001093 * x ∧
    Chebyshev.psi x - Chebyshev.theta x < 1.001093 * √x + 3 * x ^ ((1 : ℝ) / 3)) ∧
  (∀ x : ℝ, 1155901 < x → x ≤ 10 ^ 8 → 0.998697 * x < Chebyshev.theta x) ∧
  (∀ x : ℝ, 121 < x → x ≤ 10 ^ 8 → 0.998697 * √x < Chebyshev.psi x - Chebyshev.theta x) ∧
  (∀ x : ℝ, 73.2 < x → x ≤ 1427 → |Chebyshev.psi x - x| < √x * log x ^ 2 / (8 * π)) ∧
  (∀ x : ℝ, 599 < x → x ≤ 1427 → |Chebyshev.theta x - x| < √x * log x ^ 2 / (8 * π)) ∧
  (∀ x : ℝ, 59 < x → x ≤ 1427 → -(√x * log x ^ 2 / (8 * π)) < Chebyshev.psi x - x) ∧
  (∀ x : ℝ, 2657 < x → x ≤ 5 * 10 ^ 7 →
    |(Nat.primeCounting ⌊x⌋₊ : ℝ) - li x| < √x * log x / (8 * π)) ∧
  (∀ x : ℝ, 2010759.9 < x → x ≤ 10 ^ 8 → ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) < x + x / 16597)

/-- **Lee–Nosal's finite ranges**: their bound for `ψ` on `[101, 338]` and for `θ` on
`[2657, 3382]`, the ranges below which Büthe's verified bounds do not reach it. -/
def LeeNosalRange : Prop :=
  (∀ x : ℝ, 101 ≤ x → x ≤ 338 →
    |Chebyshev.psi x - x| ≤ √x * log x * (log x - log (log x)) / (8 * π)) ∧
  (∀ x : ℝ, 2657 ≤ x → x ≤ 3382 →
    |Chebyshev.theta x - x| ≤ √x * log x * (log x - log (log x)) / (8 * π))

/-- **The reciprocal sum over the low zeros** (the computation quoted by Lee–Nosal, display
(10)): the sum of `1/γ` over the zeros `β + iγ` of `riemannZeta` with `0 < β < 1` and
`0 < γ ≤ 10⁷`, each counted with its multiplicity, is at most `16.2106480369`. -/
def ZetaZeroReciprocalSum : Prop :=
  ∑' ρ : {s : ℂ // riemannZeta s = 0 ∧ 0 < s.re ∧ s.re < 1 ∧ 0 < s.im ∧ s.im ≤ 10 ^ 7},
      (analyticOrderNatAt riemannZeta ρ.1 : ℝ) / ρ.1.im ≤ 16.2106480369

/-- **The cube sum over the zeros** (Rosser, *Explicit bounds for some functions of prime numbers*,
1941, Lemma 17, as Dusart uses it in the proof of Lemma 3.4 of Math. Comp. 85 (2016)): for every
`T`, the sum of `1/γ³` over the zeros `β + iγ` of `riemannZeta` with `0 < β < 1` and `0 < γ ≤ T`,
each counted with its multiplicity, is at most `0.000835`; over the zeros of both signs this is
Rosser's `∑ 1/|γ|³ < 0.00167`. The full sum is `0.000730…`; the zero count with no zero below
height `14` bounds it only by `0.00159`, so the bound is a computation on the low zeros. -/
def ZetaZeroCubeSum : Prop :=
  ∀ T : ℝ, ∑' ρ : {s : ℂ // riemannZeta s = 0 ∧ 0 < s.re ∧ s.re < 1 ∧ 0 < s.im ∧ s.im ≤ T},
      (analyticOrderNatAt riemannZeta ρ.1 : ℝ) / ρ.1.im ^ 3 ≤ 0.000835

/-- **The zero count at low height**: for `2π ≤ T ≤ 10⁹`, the number `N(T)` of zeros `ρ` of
`riemannZeta` with `0 < Re ρ < 1` and `0 < Im ρ ≤ T`, each counted with its multiplicity, satisfies
`|N(T) − M(T)| ≤ 0.28 log T` with `M(T) = (T/2π) log(T/2π) − T/2π + 7/8`. It is the part below
height `10⁹` of the first branch of the zero count quoted by Lee–Nosal (display (8)); from `10⁹` on
Rosser's bound `0.137 log T + 0.443 log log T + 1.588` (*Explicit bounds for some functions of prime
numbers*, 1941, Theorem 19) is smaller than `0.28 log T`. -/
def ZetaZeroCountLowRange : Prop :=
  ∀ T : ℝ, 2 * π ≤ T → T ≤ 10 ^ 9 →
    |(∑' ρ : {s : ℂ // riemannZeta s = 0 ∧ 0 < s.re ∧ s.re < 1 ∧ 0 < s.im ∧ s.im ≤ T},
        (analyticOrderNatAt riemannZeta ρ.1 : ℝ)) -
      (T / (2 * π) * log (T / (2 * π)) - T / (2 * π) + 7 / 8)| ≤ 0.28 * log T

/-- **The verified prime gaps** (Oliveira e Silva–Herzog–Pardi, Math. Comp. 83 (2014), §2.2, as
quoted by Carneiro–Milinovich–Soundararajan, (1.15)): consecutive primes `p < p⁺` with
`11 ≤ p ≤ 4·10¹⁸` satisfy `p⁺ − p < log² p`. -/
def PrimeGapLogSquareVerified : Prop :=
  ∀ n : ℕ, 11 ≤ Nat.nth Nat.Prime n → (Nat.nth Nat.Prime n : ℝ) ≤ 4 * 10 ^ 18 →
    (Nat.nth Nat.Prime (n + 1) : ℝ) - Nat.nth Nat.Prime n < log (Nat.nth Nat.Prime n) ^ 2

/-- **Vanlalngaia's finite range**: his three bounds for `∑_{p ≤ x} 1/p − log log x − B` up to
`89 967 803`, with `B` the Meissel–Mertens constant. -/
def VanlalngaiaRange : Prop :=
  ∀ x : ℝ, 2 ≤ x → x ≤ 89967803 →
    |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        4 / log x ^ 3 ∧
      (1000 ≤ x → |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        2.3 / log x ^ 3) ∧
      (24284 ≤ x → |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        1 / log x ^ 3)

/-- **Lamzouri–Li–Soundararajan's small moduli** (Math. Comp. 84 (2015), §4.3): for
`3 < q ≤ 20 000` every reduced class modulo `q` contains a prime `p ≤ (φ(q) log q)²`. -/
def LamzouriLiSoundararajanRange : Prop :=
  ∀ q : ℕ, 3 < q → q ≤ 20000 → ∀ a : ZMod q, IsUnit a →
    ∃ p : ℕ, p.Prime ∧ (p : ZMod q) = a ∧ (p : ℝ) ≤ ((q.totient : ℝ) * log q) ^ 2

/-! ## Layer 2: bounds under the Riemann hypothesis and to a height -/

/-- **Schoenfeld's bounds under the Riemann hypothesis** (Schoenfeld 1976, Theorem 10 and
Corollary 1), from Büthe's verified bounds and Schoenfeld's finite ranges. -/
theorem schoenfeld_of_riemannHypothesis (hRH : RiemannHypothesis) (hB : ButheVerified)
    (hS : Schoenfeld1976Range) :
    (∀ x : ℝ, 23 * 10 ^ 8 < x →
      |Chebyshev.psi x - x| < √x * (log x - 2) * log x / (8 * π) ∧
        |Chebyshev.theta x - x| < √x * (log x - 2) * log x / (8 * π)) ∧
    (∀ x : ℝ, 73.2 < x → |Chebyshev.psi x - x| < √x * log x ^ 2 / (8 * π)) ∧
    (∀ x : ℝ, 599 < x → |Chebyshev.theta x - x| < √x * log x ^ 2 / (8 * π)) ∧
    (∀ x : ℝ, 59 < x → -(√x * log x ^ 2 / (8 * π)) < Chebyshev.psi x - x) ∧
    (∀ x : ℝ, 0 < x → Chebyshev.theta x - x < √x * log x ^ 2 / (8 * π)) ∧
    (∀ x : ℝ, 2657 < x → |(Nat.primeCounting ⌊x⌋₊ : ℝ) - li x| < √x * log x / (8 * π)) ∧
    (∀ x : ℝ, 3 / 2 < x → (Nat.primeCounting ⌊x⌋₊ : ℝ) - li x < √x * log x / (8 * π)) := by
  sorry

/-- **Lee–Nosal's bound for `ψ` under the Riemann hypothesis** (Lee–Nosal, J. Number Theory 283
(2026), arXiv 2312.05628v4, Theorem 1.2, (2)): `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for
`x ≥ 101`. The zero count enters through `ZetaZeroCountLowRange` below height `10⁹` and through
Rosser's and Bellotti–Wong's explicit zero counts above it. -/
theorem leeNosal_of_riemannHypothesis (hRH : RiemannHypothesis) (hB : ButheVerified)
    (hL : LeeNosalRange) (hZ : ZetaZeroReciprocalSum) (hN : ZetaZeroCountLowRange) (x : ℝ)
    (hx : 101 ≤ x) :
    |Chebyshev.psi x - x| ≤ √x * log x * (log x - log (log x)) / (8 * π) := by
  sorry

/-- **Lee–Nosal's bound for `θ` under the Riemann hypothesis** (Lee–Nosal, Theorem 1.2, (3)):
`|θ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `x ≥ 2657`, from the inputs of the `ψ` bound
and the bound `ψ(x) − θ(x) < (1 + 1.93378·10⁻⁸) √x + 1.04320 x^{1/3}` for `x ≥ e⁴⁰` of
Broadbent–Kadiri–Lumley–Ng–Wilk (the paper's (24)). -/
theorem leeNosal_theta_of_riemannHypothesis (hRH : RiemannHypothesis) (hB : ButheVerified)
    (hL : LeeNosalRange) (hZ : ZetaZeroReciprocalSum) (hN : ZetaZeroCountLowRange)
    (hψθ : ∀ t : ℝ, exp 40 ≤ t →
      Chebyshev.psi t - Chebyshev.theta t < (1 + 1.93378e-8) * √t + 1.04320 * t ^ ((1 : ℝ) / 3))
    (x : ℝ) (hx : 2657 ≤ x) :
    |Chebyshev.theta x - x| ≤ √x * log x * (log x - log (log x)) / (8 * π) := by
  sorry

/-- **Büthe's bounds from the Riemann hypothesis to a height** (Büthe 2016, Theorem 2): if the
zeros of `ζ` up to height `T` lie on the critical line, then Schoenfeld's four bounds hold for
every `x` with `4.92 √(x/log x) ≤ T`. -/
theorem buthe_of_riemannHypothesisUpTo (T : ℝ) (hT : RiemannHypothesisUpTo T)
    (hB : ButheVerified) (hR : Buthe2016Range) (x : ℝ) (hxT : 4.92 * √(x / log x) ≤ T) :
    (59 < x → |Chebyshev.psi x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
    (599 < x → |Chebyshev.theta x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
    (97 ≤ x → |riemannPrimeCount x - li x| ≤ √x * log x / (8 * π)) ∧
    (2657 < x → |(Nat.primeCounting ⌊x⌋₊ : ℝ) - li x| ≤ √x * log x / (8 * π)) := by
  sorry

/-- **Johnston's extension of Büthe's bounds** (Johnston, Ramanujan J. 59 (2022), arXiv
2109.02249v2, Theorem 3.2): if the zeros of `ζ` up to height `T` lie on the critical line, then,
with the zeros up to the verified height `3 000 175 332 800` on the line as well, Büthe's four
bounds hold for every `x` with `9.06 √(x/log x)/log log x ≤ T`. Johnston's proof starts from
Büthe's range at that verified height (his Proposition 3.1); at `T = 3 000 175 332 800` the
condition holds for every `x ≤ 1.101·10²⁶` (his Corollary 3.3). -/
theorem johnston_of_riemannHypothesisUpTo (T : ℝ) (hT : RiemannHypothesisUpTo T)
    (hT₀ : RiemannHypothesisUpTo 3000175332800) (hB : ButheVerified) (hR : Buthe2016Range)
    (x : ℝ) (hxT : 9.06 * √(x / log x) / log (log x) ≤ T) :
    (59 < x → |Chebyshev.psi x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
    (599 < x → |Chebyshev.theta x - x| ≤ √x * log x ^ 2 / (8 * π)) ∧
    (97 ≤ x → |riemannPrimeCount x - li x| ≤ √x * log x / (8 * π)) ∧
    (2657 < x → |(Nat.primeCounting ⌊x⌋₊ : ℝ) - li x| ≤ √x * log x / (8 * π)) := by
  sorry

/-- **Carneiro–Milinovich–Soundararajan** (Comment. Math. Helv. 94 (2019), Theorem 5): under the
Riemann hypothesis, for every `x ≥ 4` the interval `[x, x + (22/25) √x log x]` contains a prime. -/
theorem carneiro_milinovich_soundararajan (hRH : RiemannHypothesis)
    (hG : PrimeGapLogSquareVerified) (x : ℝ) (hx : 4 ≤ x) :
    ∃ p : ℕ, p.Prime ∧ x ≤ p ∧ (p : ℝ) ≤ x + 22 / 25 * √x * log x := by
  sorry

/-! ## Layer 3: unconditional bounds for ψ, θ and π -/

/-- **Dusart's bound from a zero-free region** (Dusart, Math. Comp. 85 (2016),
Theorem 1.1): if `ζ` has no zero with `|Im s| ≥ 2π` and `Re s ≥ 1 − 1/(R log |Im s|)`, then with
`X = √(log x/R)`, `max(|θ(x) − x|, |ψ(x) − x|) < x √(8/π) X^{1/2} e^{−X}` whenever
`X ≥ max(8.36, 8/R)`; the theorem as printed asks `X ≥ max(8.36, 8R)`, but its proof uses
`X ≥ 8/R` (the inequality `e^{4X} ≤ √x` of its Lemma 3.4), which is what its Corollary 1.2 needs.
The low zeros enter through the absence of zeros of height at most `14` and through Rosser's bound
`ZetaZeroCubeSum` for the sum of `1/γ³`, which the proof of Lemma 3.4 uses. -/
theorem dusart_of_zeroFreeRegion (R : ℝ) (hR : 0 < R) (hZ : ClassicalZeroFreeRegion R (2 * π))
    (hlow : ∀ s : ℂ, riemannZeta s = 0 → 0 < s.re → s.re < 1 → 14 < |s.im|)
    (hcube : ZetaZeroCubeSum) (x : ℝ)
    (hX : max 8.36 (8 / R) ≤ √(log x / R)) :
    max |Chebyshev.theta x - x| |Chebyshev.psi x - x| <
      x * (√(8 / π) * √(√(log x / R)) * exp (-√(log x / R))) := by
  sorry

/-- **Axler's upper bound for `π(x)`** (Axler, *Effective estimates for some functions defined
over primes*, Integers 24 (2024), A34): for every `x ≥ 48`,
`π(x) < x/(log x − 1 − 1/log x − 3.024334/log² x − 12.975666/log³ x − 71.048668/log⁴ x
− 461.364417856444/log⁵ x − 4331.1/log⁶ x)`, from the `θ`-input
`|θ(t) − t| < 0.024334 t/log³ t` for `t ≥ 1 757 126 630 797` (Axler's Proposition 1.1, from the
tables of Broadbent–Kadiri–Lumley–Ng–Wilk), the zeros of `ζ` up to height `3 000 175 332 800` on
the critical line with Büthe's inputs (which give Johnston's `|π(x) − li x| ≤ √x log x/(8π)` and
`|θ(x) − x| ≤ √x log² x/(8π)` up to `10²⁶`), and the bound itself on `[48, 10¹⁹]`. -/
theorem axler_primeCounting_upper
    (hθ : ∀ t : ℝ, 1757126630797 ≤ t → |Chebyshev.theta t - t| < 0.024334 * t / log t ^ 3)
    (hT₀ : RiemannHypothesisUpTo 3000175332800) (hB : ButheVerified) (hR : Buthe2016Range)
    (hfin : ∀ x : ℝ, 48 ≤ x → x ≤ 10 ^ 19 →
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / (log x - 1 - 1 / log x - 3.024334 / log x ^ 2 -
        12.975666 / log x ^ 3 - 71.048668 / log x ^ 4 - 461.364417856444 / log x ^ 5 -
        4331.1 / log x ^ 6))
    (x : ℝ) (hx : 48 ≤ x) :
    (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / (log x - 1 - 1 / log x - 3.024334 / log x ^ 2 -
      12.975666 / log x ^ 3 - 71.048668 / log x ^ 4 - 461.364417856444 / log x ^ 5 -
      4331.1 / log x ^ 6) := by
  sorry

/-! ## Layer 4: sums over primes -/

/-- **Vanlalngaia's explicit second theorem of Mertens** (Vanlalngaia, Integers 17 (2017), A11,
Corollary 1), from its `θ`-input `|θ(t) − t| ≤ t/log³ t` for `t ≥ 89 967 803` and its finite range:
`∑_{p ≤ x} 1/p = log log x + B + O*(4/log³ x)` for `x ≥ 2`, with `2.3` for `x ≥ 1000` and `1` for
`x ≥ 24 284`, where `B` is the Meissel–Mertens constant. -/
theorem vanlalngaia_sum_inv_prime
    (hθ : ∀ t : ℝ, 89967803 ≤ t → |Chebyshev.theta t - t| ≤ t / log t ^ 3)
    (hV : VanlalngaiaRange) (x : ℝ) (hx : 2 ≤ x) :
    |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        4 / log x ^ 3 ∧
      (1000 ≤ x → |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        2.3 / log x ^ 3) ∧
      (24284 ≤ x → |primeReciprocalSum x - log (log x) - TauCeti.LFunctions.mertensConstant ℚ| ≤
        1 / log x ^ 3) := by
  sorry

/-! ## Layer 5: the n-th prime -/

/-- **Dusart's lower bound for the `k`-th prime** (Dusart, *The `k`th prime is greater than
`k(ln k + ln ln k − 1)` for `k ≥ 2`*, Math. Comp. 68 (1999), Theorem 3): with
`p_k = Nat.nth Nat.Prime (k − 1)`, `p_k ≥ k (log k + log log k − 1)` for every `k ≥ 2`, from
Robin's finite range (`p_k ≤ 10¹¹`), Robin's lower bound
`θ(p_k) ≥ k (log k + log log k − 1 + (log log k − 2.1454)/log k)` for `k ≥ 3` (Robin 1983,
Théorème 8), Schoenfeld's `|θ(x) − x| < 0.0077629 x/log x` for `x > e²²` and
`|θ(x) − x| < 1.657·10⁷ x/log⁴ x` for `x > 1` (Schoenfeld 1976, (5.6b*) and (5.8*)), and Dusart's
`|ψ(x) − x| ≤ 0.905·10⁻⁷ x` for `x ≥ e⁵⁰` (Theorem 2 there). -/
theorem dusart_nth_prime_lower
    (hfin : ∀ k : ℕ, 2 ≤ k → (Nat.nth Nat.Prime (k - 1) : ℝ) ≤ 10 ^ 11 →
      (k : ℝ) * (log (k : ℝ) + log (log (k : ℝ)) - 1) ≤ Nat.nth Nat.Prime (k - 1))
    (hRobin : ∀ k : ℕ, 3 ≤ k →
      (k : ℝ) * (log (k : ℝ) + log (log (k : ℝ)) - 1 +
          (log (log (k : ℝ)) - 2.1454) / log (k : ℝ)) ≤
        Chebyshev.theta (Nat.nth Nat.Prime (k - 1)))
    (hθ₁ : ∀ x : ℝ, exp 22 < x → |Chebyshev.theta x - x| < 0.0077629 * x / log x)
    (hθ₄ : ∀ x : ℝ, 1 < x → |Chebyshev.theta x - x| < 1.657e7 * x / log x ^ 4)
    (hψ : ∀ x : ℝ, exp 50 ≤ x → |Chebyshev.psi x - x| ≤ 0.905e-7 * x)
    (k : ℕ) (hk : 2 ≤ k) :
    (k : ℝ) * (log (k : ℝ) + log (log (k : ℝ)) - 1) ≤ Nat.nth Nat.Prime (k - 1) := by
  sorry

/-! ## Layer 6: primes in arithmetic progressions -/

/-- **The least prime in a progression under the generalised Riemann hypothesis**
(Lamzouri–Li–Soundararajan, Math. Comp. 84 (2015), Corollary 1.2): for `q > 3`, if every
`L(s, χ)` modulo `q` satisfies the Riemann hypothesis, every reduced class modulo `q` contains a
prime `p ≤ (φ(q) log q)²`. The hypothesis `hGRH` is AnalyticNumberTheoryPartI §1.6's
`DirichletGRH χ` for every character `χ` modulo `q`, written out: every zero of `L(s, χ)` with
`Re s > 0`, other than the pole of the principal character, has `Re s = 1/2`. -/
theorem lamzouri_li_soundararajan (hR : LamzouriLiSoundararajanRange) (q : ℕ) [NeZero q]
    (hq : 3 < q)
    (hGRH : ∀ χ : DirichletCharacter ℂ q, ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) →
      DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2)
    (a : ZMod q) (ha : IsUnit a) :
    ∃ p : ℕ, p.Prime ∧ (p : ZMod q) = a ∧ (p : ℝ) ≤ ((q.totient : ℝ) * log q) ^ 2 := by
  sorry

/-! ## Layer 7: short intervals containing a prime -/

/-- **Schoenfeld's interval** (Schoenfeld 1976, Theorem 12): for every `x > 2 010 759.9` the open
interval `(x, x + x/16597)` contains a prime, from Schoenfeld's finite range, the verified prime
gaps, and the `ψ`-input `|ψ(t) − t| ≤ 0.978·10⁻⁵ t` for `t ≥ e³⁰` (the row `b = 30` of Dusart's
table). -/
theorem schoenfeld_interval (hS : Schoenfeld1976Range) (hG : PrimeGapLogSquareVerified)
    (hψ : ∀ t : ℝ, exp 30 ≤ t → |Chebyshev.psi t - t| ≤ 0.978e-5 * t) (x : ℝ)
    (hx : 2010759.9 < x) :
    ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) < x + x / 16597 := by
  sorry

/-- **Trudgian's prime interval** (Trudgian, *Updating the error term in the prime number
theorem*, Ramanujan J. 39 (2016), Corollary 2): for every `x ≥ 2 898 242` the interval
`[x, x (1 + 1/(111 log² x))]` contains a prime, from the `θ`-input `|θ(t) − t| ≤ 0.0045 t/log² t`
for `t ≥ e³⁵` (Lemma 1 there), the bound `p⁺ − p ≤ p/(111 log² p)` for consecutive primes
`p < p⁺` with `4 652 353 ≤ p ≤ 4·10¹⁸` (a consequence of the table of record prime gaps of
Oliveira e Silva–Herzog–Pardi), and the interval on `[2 898 242, 4 652 353]`. The source prints
the threshold `2 898 239`, which fails at `x = 2 898 240`. -/
theorem trudgian_interval
    (hθ : ∀ t : ℝ, exp 35 ≤ t → |Chebyshev.theta t - t| ≤ 0.0045 * t / log t ^ 2)
    (hgap : ∀ n : ℕ, 4652353 ≤ Nat.nth Nat.Prime n → (Nat.nth Nat.Prime n : ℝ) ≤ 4 * 10 ^ 18 →
      (Nat.nth Nat.Prime (n + 1) : ℝ) - Nat.nth Nat.Prime n ≤
        Nat.nth Nat.Prime n / (111 * log (Nat.nth Nat.Prime n) ^ 2))
    (hfin : ∀ x : ℝ, 2898242 ≤ x → x ≤ 4652353 →
      ∃ p : ℕ, p.Prime ∧ x ≤ p ∧ (p : ℝ) ≤ x * (1 + 1 / (111 * log x ^ 2)))
    (x : ℝ) (hx : 2898242 ≤ x) :
    ∃ p : ℕ, p.Prime ∧ x ≤ p ∧ (p : ℝ) ≤ x * (1 + 1 / (111 * log x ^ 2)) := by
  sorry

/-- **Axler's prime interval at the `log³` scale** (Axler, Integers 24 (2024), A34, Theorem 1;
arXiv v4, Theorem 1.2): for every `x ≥ 17 051 708` the interval
`(x, x (1 + (0.048668 + 8.22·10⁻¹¹)/log³ x)]` contains a prime, from three `θ`-inputs of
Broadbent–Kadiri–Lumley–Ng–Wilk (Math. Comp. 90 (2021): the rows `|θ(t) − t| < 2.1482·10⁻⁸ t` for
`t > e⁴⁰` and `|θ(t) − t| < 1.1344·10⁻⁹ t` for `t > e⁵⁰` of their Table 14, and
`|θ(t) − t| < 0.024334 t/log³ t` for `t > e²⁹` of their Table 15), the bound
`p⁺ − p ≤ (0.048668 + 8.22·10⁻¹¹) p/log³ p` for consecutive primes `p < p⁺` with `p⁺ ≥ 2·10⁷` and
`p ≤ 4·10¹⁸` (a consequence of the table of record prime gaps), and the interval on
`[17 051 708, 2·10⁷]`. -/
theorem axler_interval
    (hθ₄₀ : ∀ t : ℝ, exp 40 < t → |Chebyshev.theta t - t| < 2.1482e-8 * t)
    (hθ₅₀ : ∀ t : ℝ, exp 50 < t → |Chebyshev.theta t - t| < 1.1344e-9 * t)
    (hθ₃ : ∀ t : ℝ, exp 29 < t → |Chebyshev.theta t - t| < 0.024334 * t / log t ^ 3)
    (hgap : ∀ n : ℕ, 2 * 10 ^ 7 ≤ Nat.nth Nat.Prime (n + 1) →
      (Nat.nth Nat.Prime n : ℝ) ≤ 4 * 10 ^ 18 →
      (Nat.nth Nat.Prime (n + 1) : ℝ) - Nat.nth Nat.Prime n ≤
        (0.048668 + 8.22e-11) * Nat.nth Nat.Prime n / log (Nat.nth Nat.Prime n) ^ 3)
    (hfin : ∀ x : ℝ, 17051708 ≤ x → x ≤ 2 * 10 ^ 7 →
      ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) ≤ x * (1 + (0.048668 + 8.22e-11) / log x ^ 3))
    (x : ℝ) (hx : 17051708 ≤ x) :
    ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) ≤ x * (1 + (0.048668 + 8.22e-11) / log x ^ 3) := by
  sorry

end TauCetiRoadmap.ExplicitPrimeCounting
