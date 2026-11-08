module

import Mathlib

/-!
# Explicit bounds for the zeta function and Dirichlet L-functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the definitions they need:
the bounded-height Riemann hypotheses `RiemannHypothesisUpTo` and `DirichletGRHUpTo` of Layer 0.2,
Platt's heights `plattHeight` of Layer 0.3, the records of
Layers 0.4 and 0.4b, the Riemann–Siegel theta function `riemannSiegelTheta` of Layer 0.4a,
Vinogradov's count `vinogradovCount` of Layer 4.9a, the zero counts `zetaZeroCount` and
`dirichletZeroCount` of Layer 5, the real-zero gap `HasLandauSiegelGap` of Layer 7.9, the density
counts `zetaZeroCountRight` and `zetaZeroDensityCount` of Layer 8 (each written with the
meromorphic order, in the rectangle of the source it serves), and the count
`primitiveLZeroCount` with the largest real zero `largestRealZero` of the family of primitive
L-functions of Layer 8.4. Every constant below is a literal decimal of its source.

Stated here:

* Layer 0.3, the absence of real zeros for conductors up to `400 000`, given Platt's records;
* Layer 0.5a, the Euler–Maclaurin formula of first order and of order `2m`, for functions with
  values in a real Banach space;
* Layer 2.5, the two-sided bound for `‖Γ(σ + it)‖` on vertical lines;
* Layer 3.2, Rademacher's convexity bound for primitive Dirichlet L-functions;
* Layer 4.5b, Mathlib's `hardyZ` as `e^{iϑ(t)} ζ(1/2 + it)` and the Riemann–Siegel formula with
  Gabcke's remainder; Layer 4.7, `‖ζ(1/2 + it)‖ ≤ 0.618 t^{1/6} log t` (Hiary–Patel–Yang);
  Layer 4.8, Patel's and Hiary–Leong–Yang's bounds for `‖ζ(1 + it)‖`; Layer 4.9a, Ford's explicit
  Vinogradov mean value theorem; Layer 4.10, Ford's Richert-type bound for `ζ` and the Hurwitz
  zeta function;
* Layer 5.2, the Bellotti–Wong form of the Riemann–von Mangoldt formula for
  `T ≥ 30 610 046 000`, and for `T ≥ e` given the recorded bound for `S(T)`; Layer 5.3, the
  explicit zero count for primitive Dirichlet L-functions (Bennett–Martin–O'Bryant–Rechnitzer);
* Layer 7.3, the classical region with `R₀ = 5.558691` (Mossinghoff–Trudgian–Yang); Layer 7.4,
  Yang's Littlewood-type region; Layer 7.5, McCurley's region for the product of the L-functions
  modulo `q` in Thorner–Zaman's form, and Kadiri's region for `3 ≤ q ≤ 400 000`; Layer 7.6, the
  Vinogradov–Korobov region with `c = 55.241`; Layer 7.7, Bordignon's bounds for real zeros of
  quadratic L-functions of conductor above `400 000`; Layer 7.9, the real-zero gap `1/5` up to
  conductor `10¹⁰`; Layer 7.10, the Hiary–Leong–Yang bound for `1/‖ζ(1 + it)‖`;
* Layer 8.1, Kadiri's density bounds at `σ = 17/20` and `σ = 9/10`; Layer 8.3, the
  Kadiri–Lumley–Ng density bound at `σ = 9/10`; Layer 8.4, Thorner and Zaman's explicit log-free
  densities for the primitive L-functions of conductor at most `Q`; Layer 8.5, Bellotti's log-free
  density bound near `σ = 1`;
* Layer 9.1, Ramaré's upper bounds for `‖L(1, χ)‖`; Layer 9.3, the
  Mossinghoff–Starichkova–Trudgian lower bound for non-quadratic characters and Lu–Zaman–Zhao's
  lower bound for quadratic characters of conductor up to `10¹⁰`.

Every computation that a theorem rests on is a record (README 0.4 and 0.4b): a named proposition
below and an explicit hypothesis of each theorem that uses it, directly or through another
theorem here; nothing here proves one. The other numerical steps of the sources, their choice of
parameters and the evaluation of their closed-form constants there, are inequalities between
explicit real numbers inside the proofs.

Not statable at the pins:

* Rademacher's bound (3.2) at the generality of an analytic record of finite-order type, which
  needs the record `AnalyticLFunctionData` of the L-functions roadmap and its continued
  L-function, absent from Mathlib and Tau Ceti; its Dirichlet instance is stated.

Not stated: the README instances that rest on unrefereed preprints (the region of 7.3 with
`R₀ = 4.896`, the real-zero gaps of 7.9 without a conductor cap, Banks's and Guo's, and Lee and
Leong's bounds for `1/ζ` in the classical region and on `σ ≥ 3/4` of 7.10).
The Stirling, polygamma, convexity, exponential-sum, Perron, mean-value, large-sieve and
weighted-zero-sum statements of Layers 1–6 and the general criteria of Layer 7 are README targets:
they are the lemmas on the way to the theorems below. So are the remaining instances of Layers 3–9:
inputs to the theorems below (3.3, 3.4, 4.9, the further critical-line bounds of 4.7, 5.4, 7.2),
and other constants and ranges for the quantities bounded below (the further regions of 7.5–7.7,
Leong's bounds for `1/ζ` of 7.10, 9.2).
-/

namespace TauCetiRoadmap.ExplicitZetaBounds

open Complex

open scoped Real

/-! ## Layer 0: explicit errors, recorded computations, cosine polynomials and Euler–Maclaurin -/

/-- **Layer 0.2, the Riemann hypothesis up to height `H`.** Every zero `ρ` of `ζ` in the open
critical strip `0 < Re ρ < 1` with `|Im ρ| ≤ H` lies on the critical line. The open strip
excludes the trivial zeros and the junk value of `riemannZeta` at `1`; for `H < 0` the statement
is vacuous. -/
def RiemannHypothesisUpTo (H : ℝ) : Prop :=
  ∀ ρ : ℂ, riemannZeta ρ = 0 → 0 < ρ.re → ρ.re < 1 → |ρ.im| ≤ H → ρ.re = 1 / 2

/-- **Layer 0.2, the generalized Riemann hypothesis modulo `q` up to height `H`.** For every
primitive `χ` modulo `q`, every zero `ρ` of `L(s, χ)` with `0 < Re ρ < 1` and `|Im ρ| ≤ H` lies on
the critical line. -/
def DirichletGRHUpTo (q : ℕ) [NeZero q] (H : ℝ) : Prop :=
  ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → ∀ ρ : ℂ, DirichletCharacter.LFunction χ ρ = 0 →
    0 < ρ.re → ρ.re < 1 → |ρ.im| ≤ H → ρ.re = 1 / 2

/-- **Layer 0.3, Platt's heights.** `H(q) = max(10⁸/q, 7.5·10⁷/q + 200)` for even `q` and
`max(10⁸/q, 3.75·10⁷/q + 200)` for odd `q`, the parity being that of the modulus. -/
noncomputable def plattHeight (q : ℕ) : ℝ :=
  if Even q then max (10 ^ 8 / q) (7.5 * 10 ^ 7 / q + 200)
  else max (10 ^ 8 / q) (3.75 * 10 ^ 7 / q + 200)

/-- **Layer 0.4b, Platt's record.** `GRH(q, H(q))` for every modulus `2 ≤ q ≤ 400 000`
(`platt2016grh` Theorem 7.1); the modulus `1`, whose primitive character has L-function `ζ`, is not
part of it. -/
def PlattRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], 2 ≤ q → q ≤ 400000 → DirichletGRHUpTo q (plattHeight q)

/-- **Layer 0.4b, Platt's central record.** `L(1/2, χ) ≠ 0` for every primitive `χ` modulo
`2 ≤ q ≤ 2·10⁶` (`platt2016grh` Theorem 7.2). -/
def PlattCentralRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], 2 ≤ q → q ≤ 2000000 → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    DirichletCharacter.LFunction χ (1 / 2) ≠ 0

/-- **Layer 0.3, no real zeros for conductors up to `400 000`.** Given Platt's records, for `χ`
primitive modulo `2 ≤ q ≤ 400 000` and real `0 < s < 1`, `L(s, χ) ≠ 0`: a real zero has height
`0 ≤ H(q)`, so it would be `1/2`, which the central record excludes. -/
theorem LFunction_ne_zero_of_platt (hP : PlattRecord) (hC : PlattCentralRecord) {q : ℕ}
    [NeZero q] (hq₀ : 2 ≤ q) (hq₁ : q ≤ 400000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    (s : ℝ) (hs₀ : 0 < s) (hs₁ : s < 1) :
    DirichletCharacter.LFunction χ s ≠ 0 := sorry

/-- **Layer 0.4, no zeros of `ζ` up to height `H`.** No zero `ρ` of `ζ` in the open critical
strip has `|Im ρ| ≤ H`. The record is `ZetaZeroFreeUpTo 14` (`kadiri2005`, `thornerzaman2024`). -/
def ZetaZeroFreeUpTo (H : ℝ) : Prop :=
  ∀ ρ : ℂ, riemannZeta ρ = 0 → 0 < ρ.re → ρ.re < 1 → H < |ρ.im|

/-- **Layer 0.4a, the Riemann–Siegel theta function.**
`ϑ(T) = ∫₀^T (Re ψ(1/4 + it/2) − log π)/2 dt`, with `ψ = Complex.digamma` the logarithmic
derivative of `Γ`. It is `Im log Γ(1/4 + iT/2) − (T/2) log π` for the continuous branch of
`log Γ` that is real on the positive axis (both vanish at `0` and have the same derivative), and
`N(T) = ϑ(T)/π + 1 + S(T)` with `S(T)` the argument of `ζ` along the usual path (README 2.9). -/
noncomputable def riemannSiegelTheta (T : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..T, ((Complex.digamma (1 / 4 + (t : ℂ) / 2 * I)).re - Real.log π) / 2

/-- **Layers 0.4 and 5.2, the counting function `N(T)`.** The number of zeros `ρ` of `ζ` with
`0 < Re ρ < 1` and `0 < Im ρ ≤ T`, counted with multiplicity (the meromorphic order of
`riemannZeta` at `ρ`). The set of such zeros is finite, so the finite sum is the count. It agrees
with the count of `ZerosOfLFunctions` 4.5, written there for the completed function on the closed
strip. -/
noncomputable def zetaZeroCount (T : ℝ) : ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | 0 < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im ≤ T},
    ((meromorphicOrderAt riemannZeta ρ).untop₀).toNat

/-- **Layer 0.4, the bound for `S(T)` up to height `H`.** `|N(T) − ϑ(T)/π − 1| ≤ A` for
`0 ≤ T ≤ H`. The record is `ZetaArgumentBoundUpTo 30610046000 2.5167` (`bellottiwong2025` (1.2)). -/
def ZetaArgumentBoundUpTo (H A : ℝ) : Prop :=
  ∀ T : ℝ, 0 ≤ T → T ≤ H → |(zetaZeroCount T : ℝ) - riemannSiegelTheta T / π - 1| ≤ A

/-- **Layer 0.4b, Hiary, Patel and Yang's record.** `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for
`3 ≤ t < 5.5·10⁷` (`hiarypatelyang2024` §3). -/
def HiaryPatelYangRecord : Prop :=
  ∀ t : ℝ, 3 ≤ t → t < 5.5 * 10 ^ 7 →
    ‖riemannZeta (1 / 2 + t * I)‖ ≤ 0.618 * t ^ ((1 : ℝ) / 6) * Real.log t

/-- **Layer 0.4b, Hiary's record.** `|ζ(1/2 + it)| ≤ 1.461` for `0 ≤ t ≤ 3` (`hiary2016zeta`
Lemma 2.2). -/
def HiaryRecord : Prop :=
  ∀ t : ℝ, 0 ≤ t → t ≤ 3 → ‖riemannZeta (1 / 2 + t * I)‖ ≤ 1.461

/-- **Layer 0.4b, Patel's record.** `|ζ(1 + it)| ≤ log t` for `3 ≤ t ≤ 50` (`patel2022`, the
first branch of Theorem 1.1 on that range). -/
def PatelRecord : Prop :=
  ∀ t : ℝ, 3 ≤ t → t ≤ 50 → ‖riemannZeta (1 + t * I)‖ ≤ Real.log t

/-- **Layer 0.4b, Hiary, Leong and Yang's record.** `1/|ζ(1 + it)| ≤ 431.7 log t/log log t` for
`3 ≤ t ≤ 500` (`hiaryleongyang2025`). -/
def HiaryLeongYangRecord : Prop :=
  ∀ t : ℝ, 3 ≤ t → t ≤ 500 →
    ‖riemannZeta (1 + t * I)‖⁻¹ ≤ 431.7 * Real.log t / Real.log (Real.log t)

/-- **Layer 0.4b, Leong's record.** For `t ≤ 500`: `1/|ζ(1 + it)| ≤ 29.388 log t` if `t ≥ 2`; and,
if `t ≥ 13`, `1/|ζ(σ + it)| ≤ 30.812 log t` for `σ ≥ 1` and
`1/|ζ(σ + it)| ≤ 7.59·10³¹ log t` for `σ ≥ 1 − 1/(5.56 log t)` (`leong2026` (49)). -/
def LeongRecord : Prop :=
  (∀ t : ℝ, 2 ≤ t → t ≤ 500 → ‖riemannZeta (1 + t * I)‖⁻¹ ≤ 29.388 * Real.log t) ∧
    (∀ σ t : ℝ, 1 ≤ σ → 13 ≤ t → t ≤ 500 →
      ‖riemannZeta (σ + t * I)‖⁻¹ ≤ 30.812 * Real.log t) ∧
    ∀ σ t : ℝ, 13 ≤ t → t ≤ 500 → 1 - 1 / (5.56 * Real.log t) ≤ σ →
      ‖riemannZeta (σ + t * I)‖⁻¹ ≤ 7.59 * 10 ^ 31 * Real.log t

/-- **Layer 0.4b, the sum `Σ_{γ > 0} γ⁻²`.** The sum of `m_ρ/γ²` over the zeros `ρ = β + iγ` of
`ζ` in the open critical strip with `γ > 0`, `m_ρ` the multiplicity. -/
noncomputable def zetaOrdinateInvSqSum : ℝ :=
  ∑' ρ : {ρ : ℂ // 0 < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im},
    (((meromorphicOrderAt riemannZeta ρ.1).untop₀).toNat : ℝ) / ρ.1.im ^ 2

/-- **Layer 0.4b, Brent, Platt and Trudgian's record.**
`Σ_{γ>0} γ⁻² = 0.0231049931154189707889338104 + O*(5·10⁻²⁸)` (`brentplatttrudgian2021`
Corollary 1). -/
def BrentPlattTrudgianRecord : Prop :=
  |zetaOrdinateInvSqSum - 0.0231049931154189707889338104| ≤ 5 / 10 ^ 28

/-- **Layer 0.4b, Lu, Zaman and Zhao's real-zero record.** For `q ≤ 10¹⁰` and every quadratic
character `χ` modulo `q`, primitive or not, `L(σ, χ) ≠ 0` for real `σ ≥ 1 − 1/(5 log q)`
(`luzamanzhao2026` Theorem 1.1). -/
def LuZamanZhaoRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], q ≤ 10 ^ 10 → ∀ χ : DirichletCharacter ℂ q, MulChar.IsQuadratic χ →
    χ ≠ 1 → ∀ σ : ℝ, 1 - 1 / (5 * Real.log q) ≤ σ → DirichletCharacter.LFunction χ σ ≠ 0

/-- **Layer 0.4b, Lu, Zaman and Zhao's record for `L(1, χ)`.** `L(1, χ) ≥ 1/(8 log q)` for
`q ≤ 10⁶` and `χ` primitive, quadratic and non-trivial modulo `q` (`luzamanzhao2026`
Corollary 1.3). -/
def LuZamanZhaoLOneRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], q ≤ 10 ^ 6 → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    MulChar.IsQuadratic χ → χ ≠ 1 → 1 / (8 * Real.log q) ≤ (DirichletCharacter.LFunction χ 1).re

/-- **Layer 0.4b, Mossinghoff, Starichkova and Trudgian's record.**
`|L(1, χ)| ≥ 1/(9.690292 log(q/π))` for `2 ≤ q ≤ 10⁶` and `χ` primitive and not quadratic modulo
`q` (`mossinghoffstarichkovatrudgian2022`). -/
def MossinghoffStarichkovaTrudgianRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], 2 ≤ q → q ≤ 10 ^ 6 → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    ¬ MulChar.IsQuadratic χ →
      1 / (9.690292 * Real.log (q / π)) ≤ ‖DirichletCharacter.LFunction χ 1‖

/-- **Layer 0.4b, Platt and Saad Eddin's record.** For `1 < q ≤ 2·10⁶` and `χ` primitive modulo
`q`: `|L(1, χ)| ≤ (1/3) log q + 0.368296` if `3 ∣ q` and `χ` is even,
`≤ (1/3) log q + 0.838374` if `3 ∣ q` and `χ` is odd, and `≤ (1/2) log q − 0.02012` if `χ` is
even with `χ(2) = 1` (`plattsaadeddin2013` §5, `saadeddin2016`). -/
def PlattSaadEddinRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], 1 < q → q ≤ 2 * 10 ^ 6 → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    (3 ∣ q → χ.Even → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 3 + 0.368296) ∧
      (3 ∣ q → χ.Odd → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 3 + 0.838374) ∧
      (χ.Even → χ 2 = 1 → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 2 - 0.02012)

/-- **Layer 0.4b, the class-number record of Bordignon's bounds.** `L(1, χ) ≥ 12.52/√q` for
every real primitive `χ` of conductor `q > 4·10⁵` (the class-number data of Watkins and of
Bennett et al., as `bordignon2019` uses them). -/
def BordignonRecord : Prop :=
  ∀ (q : ℕ) [NeZero q], 400000 < q → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    MulChar.IsQuadratic χ → 12.52 / Real.sqrt q ≤ (DirichletCharacter.LFunction χ 1).re

/-- **Layer 0.5a, the Euler–Maclaurin formula of first order.** For integers `a < n` and `f`
continuously differentiable on `[a, n]` with values in a real Banach space,
`Σ_{j=a}^{n} f(j) = ∫_a^n f + (f(a) + f(n))/2 + ∫_a^n B̃₁(x) f′(x) dx`, where
`B̃₁(x) = {x} − 1/2` is the periodic Bernoulli function of order one. -/
theorem sum_Icc_eq_integral_add_sawtooth {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [CompleteSpace E] {f : ℝ → E} {a n : ℤ} (han : a < n)
    (hf : ContDiffOn ℝ 1 f (Set.Icc (a : ℝ) n)) :
    ∑ j ∈ Finset.Icc a n, f j =
      (∫ x in (a : ℝ)..n, f x) + (1 / 2 : ℝ) • (f a + f n) +
        ∫ x in (a : ℝ)..n, bernoulliFun 1 (Int.fract x) • derivWithin f (Set.Icc (a : ℝ) n) x :=
  sorry

/-- **Layer 0.5a, the Euler–Maclaurin formula of order `2m`** (DLMF 2.10.1). For integers `a < n`,
`m ≥ 1` and `f` of class `C^{2m}` on `[a, n]` with values in a real Banach space, derivatives
taken within `[a, n]`, with the periodic Bernoulli function `B̃ₖ(x) = Bₖ(x − ⌊x⌋)`:
`Σ_{j=a}^{n} f(j) = ∫_a^n f + (f(a) + f(n))/2 + Σ_{s=1}^{m−1} B_{2s}/(2s)! (f^{(2s−1)}(n) −
f^{(2s−1)}(a)) + ∫_a^n (B_{2m} − B̃_{2m}(x))/(2m)! f^{(2m)}(x) dx`. -/
theorem sum_Icc_eq_eulerMaclaurin {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [CompleteSpace E] {f : ℝ → E} {a n : ℤ} {m : ℕ} (hm : 0 < m) (han : a < n)
    (hf : ContDiffOn ℝ (2 * m) f (Set.Icc (a : ℝ) n)) :
    ∑ j ∈ Finset.Icc a n, f j =
      (∫ x in (a : ℝ)..n, f x) + (1 / 2 : ℝ) • (f a + f n) +
        ∑ s ∈ Finset.Ico 1 m, ((bernoulli (2 * s) : ℝ) / (2 * s).factorial) •
          (iteratedDerivWithin (2 * s - 1) f (Set.Icc (a : ℝ) n) n -
            iteratedDerivWithin (2 * s - 1) f (Set.Icc (a : ℝ) n) a) +
        ∫ x in (a : ℝ)..n, (((bernoulli (2 * m) : ℝ) - bernoulliFun (2 * m) (Int.fract x)) /
          (2 * m).factorial) • iteratedDerivWithin (2 * m) f (Set.Icc (a : ℝ) n) x :=
  sorry

/-! ## Layer 2: the Gamma function in the complex plane -/

/-- **Layer 2.5, the modulus of `Γ` on vertical lines.** For `s = σ + it` with `σ > 0` and
`t ≠ 0`, `√(2π) |s|^{σ − 1/2} e^{−π|t|/2} e^{−σ³/(3t²)} < |Γ(s)|` and
`|Γ(s)| ≤ √(2π) |s|^{σ − 1/2} e^{−π|t|/2} e^{1/(6|s|)}`. From Stirling's formula with Stieltjes'
sector bound for its remainder (2.1) and the positivity of the real part of the remainder on the
right half-plane (Binet, 2.4). -/
theorem norm_Gamma_bounds (s : ℂ) (hσ : 0 < s.re) (ht : s.im ≠ 0) :
    Real.sqrt (2 * π) * ‖s‖ ^ (s.re - 1 / 2) * Real.exp (-(π * |s.im| / 2)) *
        Real.exp (-(s.re ^ 3 / (3 * s.im ^ 2))) < ‖Complex.Gamma s‖ ∧
      ‖Complex.Gamma s‖ ≤ Real.sqrt (2 * π) * ‖s‖ ^ (s.re - 1 / 2) *
        Real.exp (-(π * |s.im| / 2)) * Real.exp (1 / (6 * ‖s‖)) := sorry

/-! ## Layer 3: explicit convexity and pointwise bounds -/

/-- **Layer 3.2 at a primitive Dirichlet character, Rademacher's convexity bound.** For `χ`
primitive modulo `q > 1`, `0 < η ≤ 1/2` and `−η ≤ Re s ≤ 1 + η`,
`|L(s, χ)| ≤ (q |s + 1|/(2π))^{(1 + η − Re s)/2} ζ(1 + η)` (Rademacher 1959, Theorem 3, as quoted
in `bmor2021` Lemma 5.6). -/
theorem norm_LFunction_le_rademacher {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (η : ℝ) (hη₀ : 0 < η) (hη₁ : η ≤ 1 / 2)
    (s : ℂ) (hσ₀ : -η ≤ s.re) (hσ₁ : s.re ≤ 1 + η) :
    ‖DirichletCharacter.LFunction χ s‖ ≤
      ((q : ℝ) * ‖s + 1‖ / (2 * π)) ^ ((1 + η - s.re) / 2) * ‖riemannZeta (1 + (η : ℂ))‖ :=
  sorry

/-! ## Layer 4: explicit exponential sums and the size of `ζ` on vertical lines -/

/-- **Layer 4.5b, Hardy's function through the theta function.** Mathlib's `hardyZ t`, the
quotient `Λ(1/2 + it)/|Γℝ(1/2 + it)|`, equals `e^{iϑ(t)} ζ(1/2 + it)`, with `ϑ` the
Riemann–Siegel theta function of Layer 0.4a. -/
theorem hardyZ_eq_exp_riemannSiegelTheta_mul (t : ℝ) :
    (hardyZ t : ℂ) = Complex.exp (riemannSiegelTheta t * I) * riemannZeta (1 / 2 + t * I) :=
  sorry

/-- **Layer 4.5b, the Riemann–Siegel formula with Gabcke's remainder.** For `t ≥ 200` and
`n₁ = ⌊√(t/2π)⌋`, `Z(t) = 2 Σ_{n ≤ n₁} n^{−1/2} cos(ϑ(t) − t log n) + O*(1.48 t^{−1/4} +
0.127 t^{−3/4})` (Gabcke, Satz 4.2.3, in the form of `hiarypatelyang2024` Lemma 2.1). -/
theorem abs_hardyZ_sub_riemannSiegel_le (t : ℝ) (ht : 200 ≤ t) :
    |hardyZ t - 2 * ∑ n ∈ Finset.Icc 1 ⌊Real.sqrt (t / (2 * π))⌋₊,
        (n : ℝ) ^ (-(1 : ℝ) / 2) * Real.cos (riemannSiegelTheta t - t * Real.log n)| ≤
      1.48 * t ^ (-(1 : ℝ) / 4) + 0.127 * t ^ (-(3 : ℝ) / 4) := sorry

/-- **Layer 4.7, the critical line.** Given Hiary, Patel and Yang's record for
`3 ≤ t < 5.5·10⁷`, `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `t ≥ 3` (Hiary, Patel and Yang,
Theorem 1.1; for `t ≥ 5.5·10⁷` the bound needs no record). -/
theorem norm_riemannZeta_criticalLine_le (hrec : HiaryPatelYangRecord) (t : ℝ) (ht : 3 ≤ t) :
    ‖riemannZeta (1 / 2 + t * I)‖ ≤ 0.618 * t ^ ((1 : ℝ) / 6) * Real.log t := sorry

/-- **Layer 4.8, the line one.** Given Patel's record for `3 ≤ t ≤ 50`, for `t ≥ 3`,
`|ζ(1 + it)| ≤ min(log t, (1/2) log t + 1.93, (1/5) log t + 44.02)` (Patel, Theorem 1.1) and
`|ζ(1 + it)| ≤ 1.731 log t / log log t` (Hiary, Leong and Yang, Theorem 1). -/
theorem norm_riemannZeta_one_add_le (hrec : PatelRecord) (t : ℝ) (ht : 3 ≤ t) :
    ‖riemannZeta (1 + t * I)‖ ≤
        min (Real.log t) (min (Real.log t / 2 + 1.93) (Real.log t / 5 + 44.02)) ∧
      ‖riemannZeta (1 + t * I)‖ ≤ 1.731 * Real.log t / Real.log (Real.log t) := sorry

/-- **Layer 4.9a, Vinogradov's integral as a count.** `J_{s,k}(P)` is the number of pairs of
`s`-tuples `x, y` of integers in `[1, P]` with `Σ_i x_i^j = Σ_i y_i^j` for `1 ≤ j ≤ k`; by
orthogonality it equals `∫_{[0,1]^k} |Σ_{1 ≤ x ≤ P} e(α₁x + ⋯ + α_k x^k)|^{2s} dα`
(`ford2002vinogradov` (1.3)–(1.4)). -/
noncomputable def vinogradovCount (s k : ℕ) (P : ℝ) : ℕ :=
  (((Fintype.piFinset fun _ : Fin s ↦ Finset.Icc 1 ⌊P⌋₊) ×ˢ
      (Fintype.piFinset fun _ : Fin s ↦ Finset.Icc 1 ⌊P⌋₊)).filter
    fun xy ↦ ∀ j ∈ Finset.Icc 1 k, ∑ i, xy.1 i ^ j = ∑ i, xy.2 i ^ j).card

/-- **Layer 4.9a, Ford's explicit Vinogradov mean value theorem.** For integers `k ≥ 1000` and
`2k² ≤ s ≤ (k²/2)(1/2 + log(3k/8))` and every real `P ≥ 1`,
`J_{s,k}(P) ≤ k^{2.055k³ − 5.91k² + 3s} 1.06^{sk + 2s²/k − 9.7278k³} P^{2s − k(k+1)/2 + Δ_s}` with
`Δ_s = (3/8) k² e^{1/2 − 2s/k² + 1.7/k}` (Ford, Theorem 3, first clause). -/
theorem vinogradovCount_le_ford (k s : ℕ) (hk : 1000 ≤ k) (hs₀ : 2 * k ^ 2 ≤ s)
    (hs₁ : (s : ℝ) ≤ (k : ℝ) ^ 2 / 2 * (1 / 2 + Real.log (3 * k / 8))) (P : ℝ) (hP : 1 ≤ P) :
    (vinogradovCount s k P : ℝ) ≤
      (k : ℝ) ^ (2.055 * (k : ℝ) ^ 3 - 5.91 * (k : ℝ) ^ 2 + 3 * s) *
        (1.06 : ℝ) ^ ((s : ℝ) * k + 2 * (s : ℝ) ^ 2 / k - 9.7278 * (k : ℝ) ^ 3) *
        P ^ (2 * (s : ℝ) - (k : ℝ) * (k + 1) / 2 +
          3 / 8 * (k : ℝ) ^ 2 * Real.exp (1 / 2 - 2 * s / (k : ℝ) ^ 2 + 1.7 / k)) := sorry

/-- **Layer 4.10, Richert's bound with Ford's constants.** For `|t| ≥ 3` and `1/2 ≤ σ ≤ 1`,
`|ζ(σ + it)| ≤ 76.2 |t|^{4.45 (1 − σ)^{3/2}} log^{2/3} |t|`, and the same bound holds for
`|ζ(σ + it, u) − u^{−s}|` for every `0 < u ≤ 1`, where `ζ(s, u) = Σ_{n ≥ 0} (n + u)^{−s}` is
Mathlib's `HurwitzZeta.hurwitzZeta` at the class of `u` (Ford, Theorem 1, stated there for
`t ≥ 3`; the conjugation symmetry gives `t ≤ −3`). -/
theorem norm_riemannZeta_le_richert (s : ℂ) (ht : 3 ≤ |s.im|) (hσ₀ : 1 / 2 ≤ s.re)
    (hσ₁ : s.re ≤ 1) :
    ‖riemannZeta s‖ ≤
        76.2 * |s.im| ^ (4.45 * (1 - s.re) ^ ((3 : ℝ) / 2)) * Real.log |s.im| ^ ((2 : ℝ) / 3) ∧
      ∀ u : ℝ, 0 < u → u ≤ 1 →
        ‖HurwitzZeta.hurwitzZeta (u : UnitAddCircle) s - (u : ℂ) ^ (-s)‖ ≤
          76.2 * |s.im| ^ (4.45 * (1 - s.re) ^ ((3 : ℝ) / 2)) *
            Real.log |s.im| ^ ((2 : ℝ) / 3) := sorry

/-! ## Layer 5: zero counting with explicit errors -/

/-- **Layer 5.3, the count `N(T, χ)`.** The number of zeros `ρ` of `L(s, χ)` with
`0 < Re ρ < 1` and `|Im ρ| ≤ T`, counted with multiplicity. -/
noncomputable def dirichletZeroCount {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (T : ℝ) :
    ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | 0 < ρ.re ∧ ρ.re < 1 ∧ |ρ.im| ≤ T},
    ((meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ).untop₀).toNat

/-- **Layer 5.2, the explicit Riemann–von Mangoldt formula on its analytic range.** For
`T ≥ 30 610 046 000`, `|N(T) − (T/2π) log(T/(2πe))| ≤ 0.10076 log T + 0.24460 log log T + 8.08344`
and `≤ 0.11200 log T + 0.12567 log log T + 3.77417` (Bellotti and Wong, Theorem 1.1, proved there
on this range by their Theorem 1.2 with the first and third rows of Table 2, from bounds for `ζ`
on vertical lines and no input about the location of the zeros). Their range `T ≥ e` is
`abs_zetaZeroCount_sub_le_of_recorded`. -/
theorem abs_zetaZeroCount_sub_le (T : ℝ) (hT : 30610046000 ≤ T) :
    |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.10076 * Real.log T + 0.24460 * Real.log (Real.log T) + 8.08344 ∧
      |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.11200 * Real.log T + 0.12567 * Real.log (Real.log T) + 3.77417 := sorry

/-- **Layer 5.2, the explicit Riemann–von Mangoldt formula from `T = e`.** Given the record
`ZetaArgumentBoundUpTo 30610046000 2.5167` (README 0.4), the two bounds of
`abs_zetaZeroCount_sub_le` hold for every `T ≥ e` (Bellotti and Wong, Theorem 1.1 as stated).
Below `30 610 046 000` they follow from the record and
`7/8 < ϑ(T)/π + 1 − (T/2π) log(T/(2πe)) < 7/8 + 1/(40T)`, since `2.5167 + 7/8 + 1/(40e) = 3.4009`
is below both right sides at `T = e`. -/
theorem abs_zetaZeroCount_sub_le_of_recorded (hS : ZetaArgumentBoundUpTo 30610046000 2.5167)
    (T : ℝ) (hT : Real.exp 1 ≤ T) :
    |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.10076 * Real.log T + 0.24460 * Real.log (Real.log T) + 8.08344 ∧
      |(zetaZeroCount T : ℝ) - T / (2 * π) * Real.log (T / (2 * π * Real.exp 1))| ≤
        0.11200 * Real.log T + 0.12567 * Real.log (Real.log T) + 3.77417 := sorry

/-- **Layer 5.3, the explicit zero count for primitive Dirichlet L-functions.** For `χ` primitive
modulo `q > 1` and `T ≥ 5/7`, with `ℓ = log(q(T + 2)/(2π))`: if `ℓ ≤ 1.567` then `N(T, χ) = 0`,
and if `ℓ > 1.567` then
`|N(T, χ) − ((T/π) log(qT/(2πe)) − χ(−1)/4)| ≤ 0.22737 ℓ + 2 log(1 + ℓ) − 0.5`
(Bennett, Martin, O'Bryant and Rechnitzer, Theorem 1.1). -/
theorem dirichletZeroCount_explicit {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (T : ℝ) (hT : 5 / 7 ≤ T) :
    (Real.log (q * (T + 2) / (2 * π)) ≤ 1.567 → dirichletZeroCount χ T = 0) ∧
      (1.567 < Real.log (q * (T + 2) / (2 * π)) →
        ‖(dirichletZeroCount χ T : ℂ) -
            ((T / π * Real.log (q * T / (2 * π * Real.exp 1)) : ℝ) - χ (-1) / 4)‖ ≤
          0.22737 * Real.log (q * (T + 2) / (2 * π)) +
            2 * Real.log (1 + Real.log (q * (T + 2) / (2 * π))) - 0.5) := sorry

/-! ## Layer 7: zero-free regions with explicit constants -/

/-- **Layer 7.3, the classical region with `R₀ = 5.558691`.** Given the Riemann hypothesis up to
height `3·10¹²` and the record for `Σ_{γ>0} γ⁻²`, on which the starting region `R = 5.573412` of
Mossinghoff and Trudgian rests, `ζ(σ + it) ≠ 0` for `|t| ≥ 2` and `σ ≥ 1 − 1/(5.558691 log |t|)`
(Mossinghoff, Trudgian and Yang, Theorem 1.3). -/
theorem riemannZeta_ne_zero_classical (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12))
    (hBPT : BrentPlattTrudgianRecord) (s : ℂ) (ht : 2 ≤ |s.im|)
    (hσ : 1 - 1 / (5.558691 * Real.log |s.im|) ≤ s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.4, the Littlewood-type region.** Given the Riemann hypothesis up to height
`30 610 046 000` and the record for `Σ_{γ>0} γ⁻²`, `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and
`σ > 1 − log log |t|/(21.233 log |t|)` (Yang, Corollary 1.2). Yang's proof takes the verification
only up to `5.45·10⁸` and Ford's region in a simplified form from there, which contains this
region only for `log |t| ≥ 50.13`; the verification up to `30 610 046 000`, the classical region
with `R₀ = 5.573412` up to `|t| = e^{41}` and Ford's region in its exact form from there to
`e^{170.2}` cover the range (README 7.4). -/
theorem riemannZeta_ne_zero_littlewood (hRH : RiemannHypothesisUpTo 30610046000)
    (hBPT : BrentPlattTrudgianRecord) (s : ℂ) (ht : 3 ≤ |s.im|)
    (hσ : 1 - Real.log (Real.log |s.im|) / (21.233 * Real.log |s.im|) < s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.5, McCurley's region in Thorner and Zaman's form.** For `q ≥ 3` let `R_q` be the
region `Re s ≥ 1 − 1/(9.645908801 log max(q, q |Im s|))`. The product of the `L(s, χ)` over all
characters `χ` modulo `q` has at most one zero in `R_q`, counted with multiplicity: a zero of some
`L(s, χ)` in `R_q` is real and simple, occurs only when `q > 400 000`, and `χ` is quadratic; and
two such zeros, of the same or of different characters, coincide (Thorner and Zaman, Lemma 2.3,
sharpening McCurley, Theorem 1). Zeros are read through the meromorphic order, so the pole of the
principal character at `1` is never one. The principal characters carry the zeros of `ζ`, which
Platt's record does not cover: the Riemann hypothesis up to `545 439 823` with Ford's region
`σ ≥ 1 − 1/(8.464 log |t|)` for `|t| ≥ 3` (README 7.2) keeps them out of `R_q`, since
`log max(q, q |t|) ≥ log |t|` and `8.464 < 9.645908801`; Platt's record puts the real zeros of the
quadratic characters of conductor at most `400 000` on `Re s = 1/2`, outside `R_q`. -/
theorem LFunction_zeroFree_mcCurley (hRH : RiemannHypothesisUpTo 545439823)
    (hP : PlattRecord) (q : ℕ) [NeZero q] (hq : 3 ≤ q) :
    (∀ (χ : DirichletCharacter ℂ q) (ρ : ℂ),
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ.im|))) ≤ ρ.re →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ →
        400000 < q ∧ ρ.im = 0 ∧ MulChar.IsQuadratic χ ∧ χ ≠ 1 ∧
          meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ = 1) ∧
      ∀ (χ₁ χ₂ : DirichletCharacter ℂ q) (ρ₁ ρ₂ : ℂ),
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ₁.im|))) ≤ ρ₁.re →
        1 - 1 / (9.645908801 * Real.log (max (q : ℝ) (q * |ρ₂.im|))) ≤ ρ₂.re →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ₁) ρ₁ →
        0 < meromorphicOrderAt (DirichletCharacter.LFunction χ₂) ρ₂ → χ₁ = χ₂ ∧ ρ₁ = ρ₂ :=
  sorry

/-- **Layer 7.5, Kadiri's region for conductors up to `400 000`.** Given the Riemann hypothesis up
to height `545 439 823` and Platt's record `GRH(q, H(q))`, for `3 ≤ q ≤ 400 000` and `χ` primitive
modulo `q` (hence non-principal), `L(s, χ) ≠ 0` for `Re s ≥ 1 − 1/(5.60 log(q max(1, |Im s|)))`
(Kadiri, Theorem 1.1). The proof sums over the powers `χᵏ`, the principal one included, and places
their zeros with McCurley's region, whose principal part concerns the zeros of `ζ`. -/
theorem LFunction_ne_zero_kadiri (hRH : RiemannHypothesisUpTo 545439823) (hP : PlattRecord)
    {q : ℕ} [NeZero q] (hq₀ : 3 ≤ q) (hq₁ : q ≤ 400000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℂ)
    (hσ : 1 - 1 / (5.60 * Real.log (q * max 1 |s.im|)) ≤ s.re) :
    DirichletCharacter.LFunction χ s ≠ 0 := sorry

/-- **Layer 7.6, the Vinogradov–Korobov region with `c = 55.241`.** Given the Riemann hypothesis
up to height `3·10¹²` and the record for `Σ_{γ>0} γ⁻²` (through the regions of 7.3 and 7.4 below
the threshold), `ζ(σ + it) ≠ 0` for `|t| ≥ 3` and
`σ ≥ 1 − 1/(55.241 (log |t|)^{2/3} (log log |t|)^{1/3})` (Mossinghoff, Trudgian and Yang,
Theorem 1.1). -/
theorem riemannZeta_ne_zero_vinogradovKorobov (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12))
    (hBPT : BrentPlattTrudgianRecord) (s : ℂ) (ht : 3 ≤ |s.im|)
    (hσ : 1 - 1 / (55.241 * Real.log |s.im| ^ ((2 : ℝ) / 3) *
      Real.log (Real.log |s.im|) ^ ((1 : ℝ) / 3)) ≤ s.re) :
    riemannZeta s ≠ 0 := sorry

/-- **Layer 7.7, real zeros of quadratic L-functions of large conductor.** Given the record
`L(1, χ) ≥ 12.52/√q` for `q > 4·10⁵`, for `χ` primitive and quadratic modulo `q > 400 000`, every
real zero `β` of `L(s, χ)` satisfies `β ≤ 1 − 800/(√q log² q)` if `χ` is odd,
`β ≤ 1 − 515/(√q log² q)` if `χ` is even and `q ≤ 10⁷`, and `β ≤ 1 − 80/(√q log² q)` if `χ` is
even and `q > 10⁷` (Bordignon, Theorem 1.3). The trivial zeros `β ≤ 0` satisfy the bounds
trivially. -/
theorem LFunction_real_zero_le_bordignon (hrec : BordignonRecord) {q : ℕ} [NeZero q]
    (hq : 400000 < q) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    (hχq : MulChar.IsQuadratic χ) (β : ℝ) (hβ : DirichletCharacter.LFunction χ β = 0) :
    (χ.Odd → β ≤ 1 - 800 / (Real.sqrt q * Real.log q ^ 2)) ∧
      (χ.Even → q ≤ 10 ^ 7 → β ≤ 1 - 515 / (Real.sqrt q * Real.log q ^ 2)) ∧
      (χ.Even → 10 ^ 7 < q → β ≤ 1 - 80 / (Real.sqrt q * Real.log q ^ 2)) := sorry

/-- **Layer 7.9, the real-zero gap up to a conductor cap.** `HasLandauSiegelGap c Q`: for every
primitive real nonprincipal character `χ` of conductor `q` with `3 ≤ q ≤ Q` and every real zero
`β ∈ (0, 1)` of `L(s, χ)`, `(1 − β) log q ≥ c`; the cap `Q = ⊤` is no cap. -/
def HasLandauSiegelGap (c : ℝ) (Q : ℕ∞) : Prop :=
  ∀ (q : ℕ) [NeZero q], 3 ≤ q → (q : ℕ∞) ≤ Q → ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
    MulChar.IsQuadratic χ → χ ≠ 1 → ∀ β : ℝ, 0 < β → β < 1 →
      DirichletCharacter.LFunction χ β = 0 → c ≤ (1 - β) * Real.log q

/-- **Layer 7.9, the gap `1/5` up to conductor `10¹⁰`.** Given Lu, Zaman and Zhao's real-zero
record (README 0.4b and 7.8), every real zero `β ∈ (0, 1)` of a primitive real character of
conductor `3 ≤ q ≤ 10¹⁰` has `(1 − β) log q ≥ 1/5`. -/
theorem hasLandauSiegelGap_one_fifth (hrec : LuZamanZhaoRecord) :
    HasLandauSiegelGap (1 / 5) (10 ^ 10) := sorry

/-- **Layer 7.10, the reciprocal of `ζ` on the line one.** Given the Riemann hypothesis up to
height `30 610 046 000` and the record for `Σ_{γ>0} γ⁻²`, the hypotheses of the region of 7.4,
and Hiary, Leong and Yang's record for `3 ≤ t ≤ 500`, `1/|ζ(1 + it)| ≤ 431.7 log t / log log t`
for `t ≥ 3` (Hiary, Leong and Yang, Theorem 2, whose proof uses the region of 7.4 at every height
from `500` on). -/
theorem inv_norm_riemannZeta_one_add_le (hRH : RiemannHypothesisUpTo 30610046000)
    (hBPT : BrentPlattTrudgianRecord) (hrec : HiaryLeongYangRecord) (t : ℝ) (ht : 3 ≤ t) :
    ‖riemannZeta (1 + t * I)‖⁻¹ ≤ 431.7 * Real.log t / Real.log (Real.log t) := sorry

/-! ## Layer 8: zero-density estimates -/

/-- **Layer 8.1, Kadiri's count `N(σ, T)`.** The number of zeros `ρ` of `ζ` with `σ ≤ Re ρ < 1`
and `0 < Im ρ ≤ T`, counted with multiplicity: the closed condition `σ ≤ Re ρ` of
`kadiri2013density` (lines 42–43), whose `0 ≤ Im ρ` adds nothing since `ζ` has no zero in
`(0, 1)`. -/
noncomputable def zetaZeroCountRight (σ T : ℝ) : ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | σ ≤ ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im ≤ T},
    ((meromorphicOrderAt riemannZeta ρ).untop₀).toNat

/-- **Layer 8.1, Kadiri's density bounds.** Given the Riemann hypothesis up to height
`30 610 046 000`, which contains Kadiri's `H₀ = 3.061·10¹⁰`, for every `T ≥ 3.061·10¹⁰`:
`N(σ, T) ≤ 0.5561 T + 0.7586 log T − 268 658` for `σ ≥ 17/20`, and
`N(σ, T) ≤ 0.4421 T + 0.6443 log T − 363 301` for `σ ≥ 9/10` (Kadiri, Theorem 1.1 with the rows
`σ = 0.85` and `σ = 0.90` of its Table 1). -/
theorem zetaZeroCountRight_le_kadiri (hRH : RiemannHypothesisUpTo 30610046000) (σ T : ℝ)
    (hT : 30610000000 ≤ T) :
    (17 / 20 ≤ σ →
        (zetaZeroCountRight σ T : ℝ) ≤ 0.5561 * T + 0.7586 * Real.log T - 268658) ∧
      (9 / 10 ≤ σ →
        (zetaZeroCountRight σ T : ℝ) ≤ 0.4421 * T + 0.6443 * Real.log T - 363301) := sorry

/-- **Layer 8.3, the density count `N°(σ, T)` of Kadiri–Lumley–Ng.** The number of zeros `ρ` of
`ζ` with `σ < Re ρ < 1` and `0 < Im ρ < T`, counted with multiplicity: both inequalities strict,
as in `kadirilumleyng2018` (1.1). -/
noncomputable def zetaZeroDensityCount (σ T : ℝ) : ℕ :=
  ∑ᶠ ρ ∈ {ρ : ℂ | σ < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im < T},
    ((meromorphicOrderAt riemannZeta ρ).untop₀).toNat

/-- **Layer 8.3, the Kadiri–Lumley–Ng density bound at `σ = 9/10`.** Given the Riemann hypothesis
up to height `H₀ = 30 610 046 000` and Hiary, Patel and Yang's record (the critical-line bound
that the argument uses from height `1002` on), for every `T ≥ H₀`,
`N°(9/10, T) < 11.499 (log T)^{16/5} T^{4/15} + 3.186 log² T`, the count being that of
`zetaZeroDensityCount` (Kadiri, Lumley and Ng, Theorem 1.1 with the parameters of their §5). -/
theorem zetaZeroDensityCount_nine_tenths_lt (hRH : RiemannHypothesisUpTo 30610046000)
    (hrec : HiaryPatelYangRecord) (T : ℝ) (hT : 30610046000 ≤ T) :
    (zetaZeroDensityCount (9 / 10) T : ℝ) <
      11.499 * Real.log T ^ ((16 : ℝ) / 5) * T ^ ((4 : ℝ) / 15) + 3.186 * Real.log T ^ 2 :=
  sorry

/-- **Layer 8.4, zeros of the primitive L-functions of conductor at most `Q`.** For real `Q` and
`S ⊆ ℂ`, the number of zeros in `S` of the product `𝓛(s, Q)` of the `L(s, χ)` over the primitive
characters `χ` of conductor at most `Q`, counted with multiplicity: the sum, over the moduli
`q + 1 ≤ Q` and the primitive `χ` modulo `q + 1`, of the orders of `L(s, χ)` at the points of `S`
(Thorner and Zaman (1.1)–(1.2)). The trivial character modulo `1` contributes the zeros of `ζ`,
and its pole at `1` has order `−1` and counts `0`. A factor with infinitely many zeros in `S`
contributes `0`; the sets used below contain finitely many zeros of each factor. -/
noncomputable def primitiveLZeroCount (Q : ℝ) (S : Set ℂ) : ℕ :=
  ∑ q ∈ Finset.range ⌊Q⌋₊, ∑ᶠ (χ : DirichletCharacter ℂ (q + 1)) (_ : χ.IsPrimitive),
    ∑ᶠ ρ ∈ S, ((meromorphicOrderAt (DirichletCharacter.LFunction χ) ρ).untop₀).toNat

/-- **Layer 8.4, the largest real zero `β₁(Q)`.** The supremum of the real zeros of the
`L(s, χ)`, `χ` primitive of conductor at most `Q` (Thorner and Zaman (1.1)). For `Q ≥ 3` the set
contains the trivial zero `−2` of `ζ` and is bounded above by `1`, so the supremum is the largest
real zero of `𝓛(s, Q)`; for `Q ≥ 5` it lies in `[0, 1)`. -/
noncomputable def largestRealZero (Q : ℝ) : ℝ :=
  sSup {β : ℝ | ∃ q < ⌊Q⌋₊, ∃ χ : DirichletCharacter ℂ (q + 1), χ.IsPrimitive ∧
    0 < meromorphicOrderAt (DirichletCharacter.LFunction χ) β}

/-- **Layer 8.4, Thorner and Zaman's explicit log-free densities.** Given the Riemann hypothesis
up to height `3·10¹²`, for real `Q ≥ 3` and `σ ≥ 39/40`, with `N(σ, Q)` the number of zeros of
`𝓛(s, Q)` with `Re ρ > σ` and `|Im ρ| ≤ Q` and `N*(σ, Q)` the same count without `β₁(Q)`:
`N(σ, Q) ≤ 10⁸⁸ (10⁴²¹ Q⁹⁹)^{1−σ}` and
`N*(σ, Q) ≤ 10⁹³ min(1, (1 − β₁(Q)) log Q) (10⁴⁶⁶ Q¹⁷⁰)^{1−σ}` (Thorner and Zaman, Theorem 1.2,
whose proof uses the verification up to `3·10¹²` through their Lemma 2.1). -/
theorem primitiveLZeroCount_le_thornerZaman (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12)) (Q : ℝ)
    (hQ : 3 ≤ Q) (σ : ℝ) (hσ : 39 / 40 ≤ σ) :
    (primitiveLZeroCount Q {ρ | σ < ρ.re ∧ |ρ.im| ≤ Q} : ℝ) ≤
        10 ^ 88 * (10 ^ 421 * Q ^ 99) ^ (1 - σ) ∧
      (primitiveLZeroCount Q {ρ | σ < ρ.re ∧ |ρ.im| ≤ Q ∧ ρ ≠ (largestRealZero Q : ℂ)} : ℝ) ≤
        10 ^ 93 * min 1 ((1 - largestRealZero Q) * Real.log Q) *
          (10 ^ 466 * Q ^ 170) ^ (1 - σ) := sorry

/-- **Layer 8.5, a log-free density near `σ = 1`.** Given the Riemann hypothesis up to height
`3·10¹²`, the record for `Σ_{γ>0} γ⁻²` (through the regions of 7.3, 7.4 and 7.6) and the
critical-line records of Hiary and of Hiary, Patel and Yang, for `3·10¹² < T ≤ exp(6.7·10¹²)` and
`0.9927 ≤ σ ≤ 1`, `N°(σ, T) ≤ 1.62·10¹¹ T^{1.448 (1 − σ)}` (Bellotti, Theorem 1.1, the uniform
constants). -/
theorem zetaZeroDensityCount_le_bellotti (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12))
    (hBPT : BrentPlattTrudgianRecord) (hHPY : HiaryPatelYangRecord) (hH : HiaryRecord)
    (σ T : ℝ) (hσ₀ : 0.9927 ≤ σ) (hσ₁ : σ ≤ 1) (hT₀ : 3 * 10 ^ 12 < T)
    (hT₁ : T ≤ Real.exp (6.7 * 10 ^ 12)) :
    (zetaZeroDensityCount σ T : ℝ) ≤ 1.62 * 10 ^ 11 * T ^ (1.448 * (1 - σ)) := sorry

/-! ## Layer 9: the size of `L(1, χ)` -/

/-- **Layer 9.1, Ramaré's upper bounds.** For `χ` primitive modulo `q > 1`,
`|L(1, χ)| ≤ (1/2) log q` if `χ` is even and `≤ (1/2) log q + 5/2 − log 6` if `χ` is odd; and if
`q` is even, `|L(1, χ)| ≤ (1/4) log q + (1/2) log 2` for even `χ` and
`≤ (1/4) log q + 5/4 − (1/2) log 3` for odd `χ` (Ramaré 2001, Corollary 1). -/
theorem norm_LFunction_one_le_ramare {q : ℕ} [NeZero q] (hq : 1 < q)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) :
    (χ.Even → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 2) ∧
      (χ.Odd → ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 2 + 5 / 2 - Real.log 6) ∧
      (2 ∣ q → χ.Even →
        ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 4 + Real.log 2 / 2) ∧
      (2 ∣ q → χ.Odd →
        ‖DirichletCharacter.LFunction χ 1‖ ≤ Real.log q / 4 + 5 / 4 - Real.log 3 / 2) := sorry

/-- **Layer 9.3, the lower bound for non-quadratic characters.** Given Mossinghoff, Starichkova and
Trudgian's record for `q ≤ 10⁶`, for `χ` primitive modulo `q ≥ 2` and not quadratic,
`|L(1, χ)| ≥ 1/(9.690292 log(q/π))` (Mossinghoff, Starichkova and Trudgian, Theorem 1.1).
Primitive non-quadratic characters exist only for `q ≥ 5`, where `log(q/π) > 0`. -/
theorem norm_LFunction_one_ge (hrec : MossinghoffStarichkovaTrudgianRecord) {q : ℕ} [NeZero q]
    (hq : 2 ≤ q) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    (hχq : ¬ MulChar.IsQuadratic χ) :
    1 / (9.690292 * Real.log (q / π)) ≤ ‖DirichletCharacter.LFunction χ 1‖ := sorry

/-- **Layer 9.3, the lower bound for quadratic characters up to `10¹⁰`.** Given Lu, Zaman and
Zhao's records (the values for `q ≤ 10⁶` and the real-zero check up to `10¹⁰`), for `q ≤ 10¹⁰`
and `χ` primitive, quadratic and non-trivial modulo `q`, `L(1, χ) ≥ 1/(8 log q)`, the value
`L(1, χ)` being real (Lu, Zaman and Zhao, Corollary 1.3). Such `χ` exist only for `q ≥ 3`, where
`log q > 0`. -/
theorem LFunction_one_ge_luZamanZhao (hrec₁ : LuZamanZhaoLOneRecord)
    (hrec₂ : LuZamanZhaoRecord) {q : ℕ} [NeZero q] (hq : q ≤ 10 ^ 10)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hχq : MulChar.IsQuadratic χ)
    (hχ₁ : χ ≠ 1) :
    1 / (8 * Real.log q) ≤ (DirichletCharacter.LFunction χ 1).re := sorry

end TauCetiRoadmap.ExplicitZetaBounds
