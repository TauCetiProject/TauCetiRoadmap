import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Analytic
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic

/-!
# AnalyticNumberTheoryPartI: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. The choices made explicit
are inclusive arithmetic cutoffs, analytic pole cancellation, conductor-aware conditional
hypotheses, actual ideal counts, weighted Hilbert spacing, unit-disc prime data, indexed
Beurling primes, the half-endpoint divisor remainder, and quantitative zeta moments. The
remaining definitions and arithmetic-geometric constructions are mathematical targets in README.md.
-/

noncomputable section

open Filter Topology Asymptotics Complex HurwitzZeta
open scoped BigOperators nonZeroDivisors NumberField

namespace TauCetiRoadmap.AnalyticNumberTheoryPartI

/-! ## Conventions

Arithmetic sums use inclusive real cutoffs. Smooth counts include 1. The pretentious distance
uses prime values in the unit disc. Moment integrals use Mathlib's continued zeta function;
the explicit second-moment bounds carry the finite divisor inequalities they require.
-/

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- `D(f, g; x)`, a distance on prime data. -/
def pretentiousDist (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (f p * starRingEnd ℂ (g p)).re) / (p : ℝ))

/-- `Ψ(x, y)`, the number of `1 ≤ n ≤ x` with every prime factor `≤ y`. -/
def smoothCount (x y : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p ∈ n.primeFactors, (p : ℝ) ≤ y).card

/-- The inclusive summatory divisor function, using the native finite divisor set. -/
def divisorSummatory (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, (n.divisors.card : ℝ)

/-- The usual inclusive divisor remainder; the analytic statements assume `x ≥ 1`. -/
def divisorError (x : ℝ) : ℝ :=
  divisorSummatory x - x * (Real.log x + 2 * Real.eulerMascheroniConstant - 1)

/-- The coprime-divisor error obtained from the ordinary error by finite Möbius inversion. -/
def divisorCoprimeError (D : ℕ) (x : ℝ) : ℝ :=
  ∑ δ ∈ D.divisors, (ArithmeticFunction.moebius δ : ℝ) * divisorError (x / (δ : ℝ) ^ 2)

/-- The integrated coprime-divisor error; its analytic domain has positive D and T. -/
def divisorRemainderIntegral (D : ℕ) (T σ : ℝ) : ℝ :=
  ∫ u : ℝ in (1 : ℝ)..T, divisorCoprimeError D u * u ^ (-σ)

/-- Finite divisor and integral inequalities for the BBR estimates, with the scaled
`7/4` tail bound starting at `T = 2`. -/
def BBRFiniteInput : Prop :=
  let κ₇ : ℝ := (riemannZeta (3 / 4)).re ^ 2 / (3 / 4) +
    8 * Real.eulerMascheroniConstant - 20
  let κ₃ : ℝ := 2 * (riemannZeta (1 / 2)).re ^ 2 +
    4 * Real.eulerMascheroniConstant - 6
  (∀ x : ℝ, 1 ≤ x → x ≤ (10 : ℝ) ^ 10 → |divisorError x| ≤ 0.961 * Real.sqrt x) ∧
  (∀ x : ℝ, 9995 ≤ x → x ≤ (10 : ℝ) ^ 10 →
    |divisorError x| ≤ 0.764 * x ^ (1 / 3 : ℝ) * Real.log x) ∧
  (∀ x : ℝ, 3 ≤ x → x ≤ (10 : ℝ) ^ 6 →
    |divisorError x| ≤ 1.146 * x ^ (1 / 3 : ℝ) * Real.log x) ∧
  (∀ x : ℝ, 4033 ≤ x → x ≤ (10 : ℝ) ^ 10 →
    |divisorError x| ≤ 0.475 * Real.sqrt x) ∧
  (∀ x : ℝ, 1 ≤ x → x ≤ (10 : ℝ) ^ 7 →
    |divisorCoprimeError 2 x| ≤ 0.883 * Real.sqrt x ∧
    |divisorCoprimeError 6 x| ≤ 0.927 * Real.sqrt x) ∧
  (∀ T : ℝ, 2 ≤ T → T ≤ (10 : ℝ) ^ 5 →
    T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 0.302) ∧
  (∀ T : ℝ, 1260 ≤ T → T ≤ (10 : ℝ) ^ 7 →
    T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 0.00979) ∧
  (∀ T : ℝ, 1 ≤ T → T ≤ (10 : ℝ) ^ 7 →
    |divisorRemainderIntegral 1 T (7 / 4)| ≤ 0.4077 ∧
    |divisorRemainderIntegral 1 T (3 / 2)| ≤ κ₃ ∧
    |divisorRemainderIntegral 2 T (7 / 4)| ≤ 0.902 ∧
    |divisorRemainderIntegral 6 T (7 / 4)| ≤ 0.0945 ∧
    |divisorRemainderIntegral 6 T (3 / 2)| ≤ 0.131) ∧
  |divisorRemainderIntegral 6 ((10 : ℝ) ^ 7) (3 / 2) + 0.056667| ≤ (10 : ℝ) ^ (-6 : ℤ)

namespace zetaSecondMoment

/-- The second-moment error with the full `2π` and Euler-constant normalization. -/
def error (T : ℝ) : ℝ :=
  (∫ t : ℝ in (0 : ℝ)..T, ‖riemannZeta (1 / 2 + (t : ℂ) * Complex.I)‖ ^ 2) -
    T * Real.log (T / (2 * Real.pi)) - (2 * Real.eulerMascheroniConstant - 1) * T

end zetaSecondMoment

/-! ## Headline theorems

These state the quantitative prime estimates, explicit formula, arithmetic Euler-series
comparison, bounded-degree Brauer–Siegel estimate, multiplicative mean bound, smooth-number
limit and zeta moments specified in the README.
-/

section Headlines

open _root_.NumberField

/-- Siegel–Walfisz in ψ form, uniformly for q ≤ (log x)^B; the constant can be ineffective. -/
theorem siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |psiAP q a x - x / q.totient| ≤ C * x * Real.log x ^ (-A) := by
  sorry

/-- Siegel–Walfisz transfers to prime counts with the logarithmic-integral main term. -/
theorem siegel_walfisz_primeCount (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |(primeCountAP q a x : ℝ) - (∫ t : ℝ in (2 : ℝ)..x, 1 / Real.log t) / q.totient| ≤
          C * x * Real.log x ^ (-A) := by
  sorry

/-- The subtracted explicit formula counts zeros with analytic multiplicity and inclusive height. -/
theorem half_interval_explicit_formula : ∃ C > 0,
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → χ ≠ 1 →
    ∀ k : ℕ, 4 ≤ k → ∀ T : ℝ, 2 ≤ T → T ≤ k →
      ‖(∑ n ∈ Finset.Icc (k / 2 + 1) k,
          χ n * (ArithmeticFunction.vonMangoldt n : ℂ)) +
        ∑ᶠ z : {z : ℂ // 0 < z.re ∧ z.re < 1 ∧ |z.im| ≤ T ∧
          DirichletCharacter.LFunction χ z = 0},
          ((analyticOrderAt (DirichletCharacter.LFunction χ) z.val).toNat : ℂ) *
            (((k : ℂ) ^ z.val - ((k : ℂ) / 2) ^ z.val) / z.val)‖ ≤
        C * ((k : ℝ) * Real.log (q * (k : ℝ)) ^ 2 / T + Real.log (q * (k : ℝ)) ^ 2) := by
  sorry

/-- Bounded-degree local polynomials with unit-disc inverse roots have multiplicative ideal
coefficients, absolutely convergent norm series and the prescribed reciprocal Euler product.
Zero inverse roots include missing inertia factors and deleted primes. -/
theorem artin_euler_series_eq (K : Type*) [Field K] [NumberField K] (d : ℕ)
    (P : IsDedekindDomain.HeightOneSpectrum (𝓞 K) → Polynomial ℂ)
    (hP : ∀ v, ∃ α : Fin d → ℂ, (∀ i, ‖α i‖ ≤ 1) ∧
      P v = ∏ i, (1 - Polynomial.C (α i) * Polynomial.X)) :
    ∃ D : _root_.TauCeti.EulerProductData K,
      (∀ v, D.localPowerSeries v * (P v).toPowerSeries = 1) ∧
      ∀ s : ℂ, 1 < s.re →
        Summable (_root_.TauCeti.idealTerm K D.toIdealArithmeticFunction s) ∧
        LSeriesSummable (_root_.TauCeti.normCoeff K D.toIdealArithmeticFunction) s ∧
        HasProd (fun v => ((P v).eval
          ((Ideal.absNorm v.asIdeal : ℂ) ^ (-s)))⁻¹)
          (LSeries (_root_.TauCeti.normCoeff K D.toIdealArithmeticFunction) s) := by
  sorry

/-- In fixed degree, hR has discriminant exponent one half, with any positive power loss. -/
theorem bounded_degree_brauer_siegel (n : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L = n →
      C⁻¹ * |(discr L : ℝ)| ^ (1 / 2 - ε) ≤ classNumber L * Units.regulator L ∧
        classNumber L * Units.regulator L ≤ C * |(discr L : ℝ)| ^ (1 / 2 + ε) := by
  sorry

/-- Halász's bound uses the infimum over twists and allows ordinary multiplicativity. -/
theorem halasz_mean : ∃ C > 0, ∀ f : ArithmeticFunction ℂ, f.IsMultiplicative →
    (∀ n : ℕ, 0 < n → ‖f n‖ ≤ 1) → ∀ x T : ℝ, 2 ≤ x → 1 ≤ T →
    let M := sInf {m : ℝ | ∃ t ∈ Set.Icc (-2 * T) (2 * T),
      m = pretentiousDist f (fun n => (n : ℂ) ^ (I * (t : ℂ))) x ^ 2}
    ‖∑ n ∈ Finset.Icc 1 ⌊x⌋₊, f n‖ / x ≤
      C * ((1 + M) * Real.exp (-M) + T ^ (-1 / 2 : ℝ)) := by
  sorry

/-- The normalized smooth count tends to the delay-equation solution for each fixed u. -/
theorem smoothCount_dickman (ρ : ℝ → ℝ)
    (hinit : ∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1)
    (hcont : ContinuousOn ρ (Set.Ici 0))
    (hdelay : ∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u) {u : ℝ} (hu : 0 < u) :
    Tendsto (fun x : ℝ => (smoothCount x (x ^ (1 / u)) : ℝ) / x) atTop (𝓝 (ρ u)) := by
  sorry

namespace zetaSecondMoment

/-- The BBR finite input supplies the explicit second-moment bound at the stated endpoint. -/
theorem atkinson_bound (hBBR : BBRFiniteInput) {T : ℝ} (hT : (10 : ℝ) ^ 30 ≤ T) :
    |error T| ≤ 110 * Real.sqrt T * Real.log T := by
  sorry

/-- The second-moment asymptotic from the BBR finite input has an absolute constant. -/
theorem mean_square (hBBR : BBRFiniteInput) : error =O[atTop] (fun T : ℝ => Real.sqrt T * Real.log T) := by
  sorry

end zetaSecondMoment

namespace zetaFourthMoment

/-- The fourth moment has leading coefficient one over twice pi squared. -/
theorem asymptotic :
    (fun T : ℝ => (∫ t : ℝ in (0 : ℝ)..T,
      ‖riemannZeta (1 / 2 + (t : ℂ) * I)‖ ^ 4) - T * Real.log T ^ 4 / (2 * Real.pi ^ 2))
        =O[atTop] (fun T => T * Real.log T ^ 3) := by
  sorry

end zetaFourthMoment

end Headlines

/-! ## Layer 0: Entire functions and quantitative prime estimates -/

section AN2

/-- The Chebyshev sum `θ(x; a, q)` over primes `p ≤ x` with `p ≡ a mod q`,
inclusive real cutoff. No coprimality is built in; asymptotic theorems assume it. -/
def thetaAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ p ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p

/-- At level one the progression sum is Mathlib's `θ`. -/
theorem thetaAP_one (x : ℝ) : thetaAP 1 0 x = Chebyshev.theta x := by
  sorry

/-- Summing over all residue classes recovers `θ`. -/
theorem sum_thetaAP (q : ℕ) [NeZero q] (x : ℝ) :
    ∑ a : ZMod q, thetaAP q a x = Chebyshev.theta x := by
  sorry

/-- The noncoprime class `0 mod 2` contains only the prime `2`. -/
theorem thetaAP_two_zero {x : ℝ} (hx : 2 ≤ x) : thetaAP 2 0 x = Real.log 2 := by
  sorry

/-- `β` is a `c`-exceptional real zero of the primitive
nonprincipal quadratic character `χ` of conductor `N > 1`. No zero is asserted to exist. -/
def IsExceptionalRealZero (c : ℝ) {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) (β : ℝ) :
    Prop :=
  0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
    1 - c / Real.log N < β ∧ β < 1 ∧ DirichletCharacter.LFunction χ β = 0

/-- Increasing the positive width parameter enlarges the exceptional-zero region. -/
theorem IsExceptionalRealZero.mono {c c' : ℝ} {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    {β : ℝ} (h : IsExceptionalRealZero c χ β) (hc : c ≤ c') : IsExceptionalRealZero c' χ β := by
  sorry

/-- Conductor one is excluded before any logarithmic denominator is used. -/
example (c β : ℝ) (χ : DirichletCharacter ℂ 1) :
    ¬ IsExceptionalRealZero c χ β := by
  simp [IsExceptionalRealZero]

/-- In the bounded-height Landau–Page region, every zero belongs to one primitive real
character and is the same simple real zero; the region may contain no zero. -/
theorem landau_page : ∃ c > 0, ∀ T : ℝ, 2 ≤ T →
    ∃ q₀ : ℕ, ∃ χ₀ : ℕ → ℂ, ∃ β : ℝ,
      ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
        χ.IsPrimitive → (q : ℝ) ≤ T → ∀ z : ℂ,
        0 < z.re → z.re < 1 → 1 - c / Real.log T < z.re → |z.im| ≤ T →
        DirichletCharacter.LFunction χ z = 0 →
          q = q₀ ∧ (∀ n : ℕ, χ n = χ₀ n) ∧ z = (β : ℂ) ∧ χ ^ 2 = 1 ∧
            analyticOrderAt (DirichletCharacter.LFunction χ) z = 1 := by
  sorry

/-- The effective primitive-character prime estimate isolates the exceptional real-zero
term and has absolute constants; its threshold may depend on the character. -/
theorem effective_character_pnt : ∃ c₀ > 0, ∃ c > 0, ∃ C > 0,
    ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N),
      1 < N → χ.IsPrimitive → χ ≠ 1 → ∀ᶠ x : ℝ in atTop,
        ‖(∑ n ∈ Finset.Icc 1 ⌊x⌋₊, χ n * (ArithmeticFunction.vonMangoldt n : ℂ)) +
          ∑ᶠ β : {β : ℝ // IsExceptionalRealZero c₀ χ β},
            ((x ^ β.val / β.val : ℝ) : ℂ)‖ ≤
          C * x * Real.exp (-c * Real.log x / (Real.sqrt (Real.log x) + Real.log N)) *
            Real.log N ^ 4 := by
  sorry

/-- The entire Riemann `ξ`, written through Mathlib's entire
`completedRiemannZeta₀`, so that no junk value at `s = 0, 1` enters. -/
def riemannXi (s : ℂ) : ℂ :=
  1 / 2 + 1 / 2 * s * (s - 1) * completedRiemannZeta₀ s

/-- Away from `0` and `1`, `ξ(s) = s(s-1)Λ(s)/2`. -/
theorem riemannXi_eq {s : ℂ} (hs₀ : s ≠ 0) (hs₁ : s ≠ 1) :
    riemannXi s = 1 / 2 * s * (s - 1) * completedRiemannZeta s := by
  sorry

/-- The pole-cancelled xi function is invariant under s ↦ 1 − s. -/
theorem riemannXi_one_sub (s : ℂ) : riemannXi (1 - s) = riemannXi s := by
  sorry

/-- Finite-range theta inequalities below the analytic cutoff `exp 10000`. -/
def SchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 0 < x → x < Real.exp 10000 → Chebyshev.theta x < 1.000081 * x

/-- Finite-range prime-count inequalities below the analytic cutoff `exp 10000`. -/
def RosserSchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 59 ≤ x → x < Real.exp 10000 →
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x))

/-- The analytic prime-count bounds above the fixed cutoff. -/
theorem rosser_schoenfeld_primeCounting_tail {x : ℝ} (hx : Real.exp 10000 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- Explicit two-sided prime-count bounds from the finite-range input and the analytic tail. -/
theorem rosser_schoenfeld_primeCounting (hfinite : RosserSchoenfeldFiniteRangeInput)
    {x : ℝ} (hx : 59 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < Nat.primeCounting ⌊x⌋₊ ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- The analytic theta upper bound above the fixed cutoff. -/
theorem theta_lt_tail {x : ℝ} (hx : Real.exp 10000 ≤ x) :
    Chebyshev.theta x < 1.000081 * x := by
  sorry

/-- The theta upper bound from the finite-range input and the analytic tail. -/
theorem theta_lt (hfinite : SchoenfeldFiniteRangeInput) {x : ℝ} (hx : 0 < x) :
    Chebyshev.theta x < 1.000081 * x := by
  sorry

/-- The mod-eight finite theta inequalities and the bounded-height zero input for the tail. -/
def ModEightFiniteInput : Prop :=
  (∀ a : ZMod 8, a = 3 ∨ a = 5 → ∀ x : ℝ,
    (10 : ℝ) ^ 10 ≤ x → x < Real.exp 10000 →
      |thetaAP 8 a x - x / 4| ≤ 0.002811 * x / 4) ∧
    ∀ (χ : DirichletCharacter ℂ 8) (s : ℂ), 0 < s.re → s.re < 1 →
      |s.im| ≤ 10000 → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- Subtracting the mod-eight estimates gives the interval mass from the finite-range input. -/
theorem thetaAP_mod_eight_mass (hfinite : ModEightFiniteInput) {a : ZMod 8}
    (ha : a = 3 ∨ a = 5) {k : ℝ} (hk : 2 * (10 : ℝ) ^ 10 ≤ k) :
    (1 - 3 * 0.002811) * k / 8 ≤ thetaAP 8 a k - thetaAP 8 a (k / 2) := by
  sorry

/-- Pole cancellation makes xi entire, including both former poles. -/
theorem riemannXi_entire : Differentiable ℂ riemannXi := by
  sorry

/-- Siegel's lower bound is uniform over primitive nonprincipal quadratic characters. -/
theorem siegel_lower_bound {ε : ℝ} (hε : 0 < ε) :
    ∃ c > 0, ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N),
      χ.IsPrimitive → χ ≠ 1 → χ ^ 2 = 1 →
      c * (N : ℝ) ^ (-ε) ≤ (DirichletCharacter.LFunction χ 1).re := by
  sorry

/-- The logarithmically weighted prime sum has bounded remainder. -/
theorem mertens_first :
    (fun x : ℝ => (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime,
      Real.log p / p) - Real.log x) =O[atTop] (fun _ => (1 : ℝ)) := by
  sorry

/-- The reciprocal-prime sum has a constant term and logarithmic error. -/
theorem mertens_second : ∃ B : ℝ,
    (fun x : ℝ => (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 : ℝ) / p) -
      Real.log (Real.log x) - B) =O[atTop] (fun x => 1 / Real.log x) := by
  sorry

/-- The reciprocal prime Euler product has Euler's constant in its leading coefficient. -/
theorem mertens_third :
    (fun x : ℝ => (∏ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (p : ℝ)⁻¹)⁻¹) -
      Real.exp Real.eulerMascheroniConstant * Real.log x) =O[atTop] (fun _ => (1 : ℝ)) := by
  sorry

/-- A finite upper order gives a canonical product with polynomial exponential factor. -/
theorem finite_order_hadamard (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hgrowth : ∀ b : ℝ, ρ < b → ∃ C > 0, ∀ z : ℂ,
      ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)) :
    ∃ P : Polynomial ℂ, P.natDegree ≤ ⌊ρ⌋₊ ∧ ∀ z : ℂ, ∃ v : ℂ,
      HasProd (fun α : {a : ℂ // a ≠ 0} =>
        ((1 - z / α.val) * Complex.exp
          (∑ j ∈ Finset.Icc 1 ⌊ρ⌋₊, (z / α.val) ^ j / (j : ℂ))) ^
            (analyticOrderAt f α.val).toNat) v ∧
      f z = z ^ (analyticOrderAt f 0).toNat * Complex.exp (P.eval z) * v := by
  sorry

/-- Finite upper order makes the nonzero zero divisor summable at the canonical genus. -/
theorem finite_order_zero_summable (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hgrowth : ∀ b : ℝ, ρ < b → ∃ C > 0, ∀ z : ℂ,
      ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)) :
    Summable (fun α : {a : ℂ // a ≠ 0} =>
      (analyticOrderAt f α.val).toNat * ‖α.val‖ ^ (-(⌊ρ⌋₊ + 1 : ℝ))) := by
  sorry

/-- Paired imaginary zeros and nonpolynomiality make every positive-axis derivative positive. -/
theorem paired_derivatives_positive (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0)
    (hgrowth : ∀ b : ℝ, 1 < b → ∃ C > 0, ∀ z : ℂ,
      ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b))
    (hparity : ∀ z : ℂ, f (-z) = (-1) ^ (analyticOrderAt f 0).toNat * f z)
    (hzeros : ∀ z : ℂ, f z = 0 → z.re = 0)
    (hpositive : ∀ᶠ x : ℝ in atTop, (f x).im = 0 ∧ 0 < (f x).re)
    (hpoly : ¬ ∃ P : Polynomial ℂ, ∀ z, P.eval z = f z) (k : ℕ) {x : ℝ} (hx : 0 < x) :
    (iteratedDeriv k f x).im = 0 ∧ 0 < (iteratedDeriv k f x).re := by
  sorry

end AN2

/-! ## Layer 1: Explicit formulas, mean values and conditional prime estimates -/

section AN3

/-- The Riemann hypothesis for one Dirichlet `L`-function.
`0 < re s` removes trivial zeros and the zeros of missing Euler factors; the pole of the principal
character is excluded. -/
def DirichletGRH {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The generalized Riemann hypothesis for all Dirichlet characters. A statement only. -/
def GRH : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), DirichletGRH χ

/-- At conductor one, Dirichlet GRH is Mathlib’s Riemann hypothesis. -/
theorem dirichletGRH_one_iff_riemannHypothesis :
    DirichletGRH (1 : DirichletCharacter ℂ 1) ↔ RiemannHypothesis := by
  sorry

/-- GRH for all Dirichlet characters implies the Riemann hypothesis. -/
theorem GRH.riemannHypothesis (h : GRH) : RiemannHypothesis := by
  sorry

/-- Under Dirichlet GRH, every nontrivial zero has real part one half. -/
theorem DirichletGRH.re_eq_half {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (h : DirichletGRH χ) {s : ℂ} (hs : 0 < s.re) (hχ : χ ≠ 1 ∨ s ≠ 1)
    (hz : DirichletCharacter.LFunction χ s = 0) : s.re = 1 / 2 :=
  by
    sorry

/-- Under RH, ψ has square-root error with any positive power loss. -/
theorem psi_sub_self_isBigO_of_riemannHypothesis (h : RiemannHypothesis) {ε : ℝ} (hε : 0 < ε) :
    (fun x => Chebyshev.psi x - x) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- For a fixed modulus, character-wise GRH gives the corresponding progression error. -/
theorem psiAP_isBigO_of_dirichletGRH (q : ℕ) [NeZero q]
    (h : ∀ χ : DirichletCharacter ℂ q, DirichletGRH χ) (a : ZMod q) (ha : IsUnit a) {ε : ℝ}
    (hε : 0 < ε) :
    (fun x => psiAP q a x - x / q.totient) =O[atTop] fun x => x ^ (1 / 2 + ε) := by
  sorry

/-- The Dirichlet-polynomial mean square has the Montgomery–Vaughan weighted error. -/
theorem dirichlet_polynomial_mean_square :
    ∀ (N : ℕ) (a : ℕ → ℂ) (T : ℝ), 0 ≤ T →
      |(∫ t in (-T)..T, ‖∑ n ∈ Finset.Icc 1 N, a n * (n : ℂ) ^ (-((t : ℂ) * I))‖ ^ 2) -
          2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2| ≤
        (6 * Real.pi) * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by
  sorry

/-- The weighted Hilbert inequality for distinct real frequencies, with any positive lower
bounds for their nearest-neighbour spacings. Empty and singleton families are allowed. -/
theorem weighted_hilbert_inequality (n : ℕ) (lam delta : Fin n → ℝ) (u : Fin n → ℂ)
    (hdelta : ∀ r, 0 < delta r)
    (hgap : ∀ r s, r ≠ s → delta r ≤ |lam r - lam s|) :
    ‖∑ r : Fin n, ∑ s ∈ Finset.univ.erase r,
        u r * star (u s) / ((lam r - lam s : ℝ) : ℂ)‖ ≤
      (3 * Real.pi / 2) * ∑ r : Fin n, ‖u r‖ ^ 2 / delta r := by
  sorry

/-- Passing to the inducing primitive character preserves Dirichlet GRH. -/
theorem DirichletGRH.of_primitive {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
    DirichletGRH χ ↔ DirichletGRH χ.primitiveCharacter := by
  sorry

/-- Davenport cancellation is uniform in the real additive frequency. -/
theorem davenport_moebius {A : ℝ} (hA : 0 < A) :
    ∃ C > 0, ∀ y : ℝ, 2 ≤ y → ∀ α : ℝ,
      ‖∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (ArithmeticFunction.moebius n : ℂ) *
        Complex.exp (I * ((n : ℝ) * α : ℝ))‖ ≤ C * y * Real.log y ^ (-A) := by
  sorry

open scoped Classical in
/-- Selberg's primitive-character density estimate includes every exceptional zero. -/
theorem selberg_zero_density {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ Q T σ : ℝ, 2 ≤ Q → 2 ≤ T → 1 / 2 ≤ σ → σ ≤ 1 →
      (∑ q : Fin ⌊Q⌋₊, ∑ χ : DirichletCharacter ℂ (q.val + 1),
        if χ.IsPrimitive then
          ∑ᶠ z : {z : ℂ // σ ≤ z.re ∧ z.re < 1 ∧ |z.im| ≤ T ∧
            DirichletCharacter.LFunction χ z = 0},
            ((analyticOrderAt (DirichletCharacter.LFunction χ) z.val).toNat : ℝ)
        else 0) ≤ C * ((Q ^ (5 + ε) * T ^ (3 + ε)) ^ (1 - σ) + 1) := by
  sorry

end AN3

/-! ## Layer 2: Hecke and Artin comparisons and quantitative number-field estimates -/

section AN4

open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- The native norm coefficients of the ordinary-class indicator used by LFunctions Layer 2. -/
abbrev partialIdealZetaCoeff (A : ClassGroup (𝓞 K)) : ArithmeticFunction ℂ := by
  classical
  exact _root_.TauCeti.normCoeff K (fun I => if ClassGroup.mk0 I = A then 1 else 0)

/-- Each class-indicator norm coefficient counts the corresponding finite ideal fibre. -/
theorem partialIdealZetaCoeff_eq_card (A : ClassGroup (𝓞 K)) (n : ℕ) :
    partialIdealZetaCoeff K A n =
      (Nat.card {I : (Ideal (𝓞 K))⁰ //
        Ideal.absNorm (I : Ideal (𝓞 K)) = n ∧ ClassGroup.mk0 I = A} : ℂ) := by
  sorry

/-- Every primitive quadratic Dirichlet character has root number one, including conductor one. -/
theorem rootNumber_eq_one_of_isPrimitive_of_sq_eq_one {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (hsq : χ ^ 2 = 1) :
    DirichletCharacter.rootNumber χ = 1 := by
  sorry

/-- Summing class coefficients recovers all nonzero integral ideals of each norm. -/
theorem sum_partialIdealZetaCoeff (n : ℕ) :
    ∑ A : ClassGroup (𝓞 K), partialIdealZetaCoeff K A n =
      _root_.TauCeti.normCoeff K (fun _ => 1) n := by
  sorry

/-- The ordinary-class partial ideal series sum to the native Dedekind zeta function
on the half-plane of absolute convergence. -/
theorem sum_partialIdealZeta_series {s : ℂ} (hs : 1 < s.re) :
    (∑ A : ClassGroup (𝓞 K), LSeries (partialIdealZetaCoeff K A) s) =
      dedekindZeta K s := by
  sorry

open scoped Classical in
/-- The narrow-class ideal series also sum to Dedekind zeta, retaining the positivity
condition on principal generators at real places. -/
theorem sum_narrowPartialIdealZeta_series {s : ℂ} (hs : 1 < s.re) :
    (∑' A : NarrowClassGroup K, LSeries (_root_.TauCeti.normCoeff K
      (fun J => if NarrowClassGroup.mk0 J = A then 1 else 0)) s) =
      dedekindZeta K s := by
  sorry

/-- Deleting finitely many Artin Euler factors multiplies the norm-regrouped series
by their local polynomials, including at ramified primes. -/
theorem artin_euler_series_deleted (d : ℕ)
    (P : IsDedekindDomain.HeightOneSpectrum (𝓞 K) → Polynomial ℂ)
    (hP : ∀ v, ∃ α : Fin d → ℂ, (∀ i, ‖α i‖ ≤ 1) ∧
      P v = ∏ i, (1 - Polynomial.C (α i) * Polynomial.X))
    (D : _root_.TauCeti.EulerProductData K)
    (hD : ∀ v, D.localPowerSeries v * (P v).toPowerSeries = 1)
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    {s : ℂ} (hs : 1 < s.re) :
    LSeries (_root_.TauCeti.normCoeff K
      (_root_.TauCeti.IdealArithmeticFunction.supportedPart D.toIdealArithmeticFunction
        ((↑S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))ᶜ))) s =
      LSeries (_root_.TauCeti.normCoeff K D.toIdealArithmeticFunction) s *
        ∏ v ∈ S, (P v).eval ((Ideal.absNorm v.asIdeal : ℂ) ^ (-s)) := by
  sorry

/-- Louboutin's bound for the Dedekind residue retains the degree and discriminant. -/
theorem dedekindZeta_residue_le (hd : 1 < Module.finrank ℚ K) :
    dedekindZeta_residue K ≤
      (Real.exp 1 * Real.log |(discr K : ℝ)| / (2 * (Module.finrank ℚ K - 1))) ^
        (Module.finrank ℚ K - 1) := by
  sorry

/-- Dedekind residues have two-sided subpower bounds uniform in bounded degree. -/
theorem dedekindZeta_residue_subpower (n : ℕ) (hn : 1 ≤ n) {ε : ℝ} (hε : 0 < ε) :
    ∃ c > 0, ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L ≤ n →
      c * |(discr L : ℝ)| ^ (-ε) ≤ dedekindZeta_residue L ∧
        dedekindZeta_residue L ≤ C * |(discr L : ℝ)| ^ ε := by
  sorry

end AN4

/-! ## Layer 3: Multiplicative means, smooth numbers and moments -/

section AN5

/-- The prime-data distance satisfies the multiplicative triangle inequality for disk-valued functions. -/
theorem pretentiousDist_mul_le (f₁ f₂ g₁ g₂ : ℕ → ℂ) (x : ℝ)
    (hf₁ : ∀ p, p.Prime → ‖f₁ p‖ ≤ 1) (hf₂ : ∀ p, p.Prime → ‖f₂ p‖ ≤ 1)
    (hg₁ : ∀ p, p.Prime → ‖g₁ p‖ ≤ 1) (hg₂ : ∀ p, p.Prime → ‖g₂ p‖ ≤ 1) :
    pretentiousDist (f₁ * f₂) (g₁ * g₂) x ≤ pretentiousDist f₁ g₁ x + pretentiousDist f₂ g₂ x := by
  sorry

/-- Comparison with Mathlib's strict-cutoff `smoothNumbers`. -/
theorem smoothCount_eq (x y : ℝ) (hy : 0 ≤ y) :
    smoothCount x y = ((Finset.Icc 1 ⌊x⌋₊).filter (· ∈ Nat.smoothNumbers (⌊y⌋₊ + 1))).card := by
  sorry

/-- Largest-prime partition of the integers retains repeated largest prime factors. -/
theorem smoothCount_decomposition {x y : ℝ} (hx : 1 ≤ x) (hy : 2 ≤ y) :
    smoothCount x y + ∑ p ∈ (Finset.Iic ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ y < p),
      smoothCount (x / p) p = ⌊x⌋₊ := by
  sorry

/-- Rankin's smooth-number bound holds for every positive real exponent. -/
theorem smoothCount_rankin {x y σ : ℝ} (hx : 1 ≤ x) (hy : 2 ≤ y) (hσ : 0 < σ) :
    (smoothCount x y : ℝ) ≤ x ^ σ *
      ∏ p ∈ (Finset.Iic ⌊y⌋₊).filter Nat.Prime, (1 - (p : ℝ) ^ (-σ))⁻¹ := by
  sorry

/-- The delay equation and fixed initial extension determine Dickman's function uniquely. -/
theorem existsUnique_dickman : ∃! ρ : ℝ → ℝ,
    (∀ u < 0, ρ u = 0) ∧ (∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1) ∧
    ContinuousOn ρ (Set.Ici 0) ∧
    ∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u := by
  sorry

/-- The continuous Dickman solution is positive at every finite nonnegative argument
and is nonincreasing on the nonnegative real axis. -/
theorem dickman_positive_antitone (ρ : ℝ → ℝ)
    (hinit : ∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1)
    (hcont : ContinuousOn ρ (Set.Ici 0))
    (hdelay : ∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u) :
    (∀ u ≥ 0, 0 < ρ u) ∧ AntitoneOn ρ (Set.Ici 0) := by
  sorry

/-- With the zero negative extension, Dickman's delay equation gives the unit-interval
integral identity on the whole real line. -/
theorem dickman_interval_identity (ρ : ℝ → ℝ)
    (hneg : ∀ u < 0, ρ u = 0)
    (hinit : ∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1)
    (hcont : ContinuousOn ρ (Set.Ici 0))
    (hdelay : ∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u) (u : ℝ) :
    u * ρ u = ∫ v : ℝ in (u - 1)..u, ρ v := by
  sorry

/-- Smooth-number ratios converge to Dickman's solution uniformly on each fixed
compact interval of positive parameters. -/
theorem dickman_compact_limit (ρ : ℝ → ℝ)
    (hinit : ∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1)
    (hcont : ContinuousOn ρ (Set.Ici 0))
    (hdelay : ∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u)
    {a U : ℝ} (ha : 0 < a) (haU : a ≤ U) :
    ∀ ε > 0, ∀ᶠ x : ℝ in atTop, ∀ u ∈ Set.Icc a U,
      |(smoothCount x (x ^ (1 / u)) : ℝ) / x - ρ u| < ε := by
  sorry

/-- For each positive exponent, the divisor count has a uniform subpower bound. -/
theorem card_divisors_le (ε : ℝ) (hε : 0 < ε) :
    ∃ C ≥ 1, ∀ n : ℕ, 0 < n → (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε := by
  sorry

/-- A discrete Beurling prime system, repeated values allowed. -/
structure BeurlingPrimeSystem where
  /-- The generalized primes `p₀ ≤ p₁ ≤ ⋯`. -/
  p : ℕ → ℝ
  one_lt : ∀ j, 1 < p j
  mono : Monotone p
  tendsto : Tendsto p atTop atTop

/-- The prime-counting function `π_P(x)` of a Beurling system, counted with multiplicity. -/
def BeurlingPrimeSystem.primeCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {j : ℕ // P.p j ≤ x}

/-- The rational primes form a Beurling system. -/
theorem exists_beurlingPrimeSystem_nth_prime :
    ∃ P : BeurlingPrimeSystem, ∀ j, P.p j = Nat.nth Nat.Prime j := by
  sorry

/-- Repeated prime values contribute separate indices at their inclusive endpoint. -/
theorem BeurlingPrimeSystem.primeCount_repeated_two (P : BeurlingPrimeSystem) (h₀ : P.p 0 = 2) (h₁ : P.p 1 = 2)
    (h₂ : 2 < P.p 2) : P.primeCount 2 = 2 := by
  sorry

/-- The norm of an indexed generalized integer retains the prime indices. -/
def BeurlingPrimeSystem.integerNorm (P : BeurlingPrimeSystem) (a : ℕ →₀ ℕ) : ℝ :=
  a.prod (fun j k => P.p j ^ k)

/-- Bounded generalized-integer norm fibres are finite even with repeated prime values. -/
theorem BeurlingPrimeSystem.finite_integerNorm_le (P : BeurlingPrimeSystem) (x : ℝ) :
    Set.Finite {a : ℕ →₀ ℕ | P.integerNorm a ≤ x} := by
  sorry

/-- Generalized integers are counted as exponent vectors, including the empty vector. -/
def BeurlingPrimeSystem.integerCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {a : ℕ →₀ ℕ // P.integerNorm a ≤ x}

/-- The generalized Euler series is absolutely summable in its specified half-plane. -/
theorem BeurlingPrimeSystem.zeta_summable (P : BeurlingPrimeSystem)
    (hconv : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.integerNorm a ^ (-σ)))
    {s : ℂ} (hs : 1 < s.re) :
    Summable (fun a : ℕ →₀ ℕ => Complex.exp (-s * (Real.log (P.integerNorm a) : ℂ))) := by
  sorry

/-- The generalized integer series is the Euler product over indexed primes. -/
theorem BeurlingPrimeSystem.eulerProduct (P : BeurlingPrimeSystem)
    (hconv : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.integerNorm a ^ (-σ)))
    {s : ℂ} (hs : 1 < s.re) :
    HasProd (fun j : ℕ => (1 - Complex.exp (-s * (Real.log (P.p j) : ℂ)))⁻¹)
      (∑' a : ℕ →₀ ℕ, Complex.exp (-s * (Real.log (P.integerNorm a) : ℂ))) := by
  sorry

/-- Beurling prime and integer counts have all logarithmic remainders simultaneously. -/
theorem BeurlingPrimeSystem.pnt_iff_integerCount (P : BeurlingPrimeSystem)
    (hconv : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.integerNorm a ^ (-σ))) :
    (∀ m : ℕ, 1 ≤ m →
      (fun x : ℝ => (P.primeCount x : ℝ) - ∫ t : ℝ in (2 : ℝ)..x, 1 / Real.log t)
        =O[atTop] (fun x => x / Real.log x ^ m)) ↔
    ∃ a > 0, ∀ m : ℕ, 1 ≤ m →
      (fun x : ℝ => (P.integerCount x : ℝ) - a * x)
        =O[atTop] (fun x => x / Real.log x ^ m) := by
  sorry

/-- The inclusive divisor average has a square-root remainder. -/
theorem divisorError_isBigO : divisorError =O[atTop] (fun x : ℝ => Real.sqrt x) := by
  sorry

/-- The integrated coprime-divisor error vanishes at its lower endpoint. -/
theorem divisorRemainderIntegral_one (D : ℕ) (σ : ℝ) :
    divisorRemainderIntegral D 1 σ = 0 := by
  simp [divisorRemainderIntegral]

/-- The limiting `7/4` divisor integral lies strictly between `0.400` and `0.415`. -/
theorem divisorRemainderIntegral_kappa7_bounds :
    let κ₇ : ℝ := (riemannZeta (3 / 4)).re ^ 2 / (3 / 4) +
      8 * Real.eulerMascheroniConstant - 20
    0.400 < κ₇ ∧ κ₇ < 0.415 := by
  sorry

/-- On the first unit interval the exact divisor integral gives a scaled tail bound
of one half, independently of the finite BBR input. -/
theorem divisorRemainderIntegral_initial {T : ℝ} (hT : 1 ≤ T) (hT₂ : T ≤ 2) :
    let κ₇ : ℝ := (riemannZeta (3 / 4)).re ^ 2 / (3 / 4) +
      8 * Real.eulerMascheroniConstant - 20
    divisorRemainderIntegral 1 T (7 / 4) =
      (4 / 3 : ℝ) * (1 - T ^ (-3 / 4 : ℝ)) -
        4 * T ^ (1 / 4 : ℝ) * (Real.log T + 2 * Real.eulerMascheroniConstant - 5) +
        8 * Real.eulerMascheroniConstant - 20 ∧
      T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 1 / 2 := by
  sorry

/-- The explicit square-root divisor bound combines the finite input with its analytic tail. -/
theorem divisorError_sqrt_bound (hBBR : BBRFiniteInput) {x : ℝ} (hx : 1 ≤ x) :
    |divisorError x| ≤ Real.sqrt x := by
  sorry

/-- The cubic divisor bound has the full stated lower endpoint. -/
theorem divisorError_cubic_bound (hBBR : BBRFiniteInput) {x : ℝ} (hx : 9995 ≤ x) :
    |divisorError x| ≤ 0.764 * x ^ (1 / 3 : ℝ) * Real.log x := by
  sorry

/-- The Voronoi remainder has half weight at positive integral endpoints and subtracts `1/4`. -/
def divisorErrorStar (x : ℝ) : ℝ :=
  divisorError x -
    (if 1 ≤ x ∧ x = (⌊x⌋₊ : ℝ) then (⌊x⌋₊.divisors.card : ℝ) / 2 else 0) - 1 / 4

/-- Capped inverse distance with the correct value one at an exact endpoint saddle. -/
def endpointCap (u : ℝ) : ℝ := 1 / max 1 |u|

example : endpointCap 0 = 1 ∧ min (1 : ℝ) |(0 : ℝ)|⁻¹ = 0 := by
  norm_num [endpointCap]

/-- The endpoint cap is bounded by one, including at zero. -/
theorem endpointCap.le_one (u : ℝ) : endpointCap u ≤ 1 := by
  sorry

/-- Outside the central band the endpoint cap is the reciprocal absolute distance. -/
theorem endpointCap.eq_inv_abs {u : ℝ} (hu : 1 ≤ |u|) : endpointCap u = |u|⁻¹ := by
  sorry

/-- Schläfli's second-kind integral, with complex order and argument.
Its analytic domain is `0 < z.re`; no convergence is asserted outside that domain. -/
def besselY (ν z : ℂ) : ℂ :=
  (∫ θ : ℝ in (0 : ℝ)..Real.pi,
    Complex.sin (z * (Real.sin θ : ℂ) - ν * (θ : ℂ))) / (Real.pi : ℂ) -
  (∫ t : ℝ in Set.Ioi 0,
    (Complex.exp (ν * (t : ℂ)) + Complex.cos ((Real.pi : ℂ) * ν) *
      Complex.exp (-ν * (t : ℂ))) * Complex.exp (-z * (Real.sinh t : ℂ))) / (Real.pi : ℂ)

/-- The second-kind integral is holomorphic in its argument on the right half-plane. -/
theorem besselY_differentiableOn (ν : ℂ) :
    DifferentiableOn ℂ (besselY ν) {z : ℂ | 0 < z.re} := by
  sorry

/-- The second-kind integral agrees with the first-kind connection formula off integral order. -/
theorem besselY_connection {ν z : ℂ} (hz : 0 < z.re)
    (hν : Complex.sin ((Real.pi : ℂ) * ν) ≠ 0) :
    besselY ν z = (Complex.cos ((Real.pi : ℂ) * ν) * Complex.besselJ ν z -
      Complex.besselJ (-ν) z) / Complex.sin ((Real.pi : ℂ) * ν) := by
  sorry

/-- The second-kind integral satisfies Bessel's equation on the right half-plane. -/
theorem besselY_ode (ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    z ^ 2 * iteratedDeriv 2 (besselY ν) z + z * deriv (besselY ν) z +
      (z ^ 2 - ν ^ 2) * besselY ν z = 0 := by
  sorry

/-- Adjacent orders of the second-kind function satisfy the three-term recurrence. -/
theorem besselY_recurrence (ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    besselY (ν - 1) z + besselY (ν + 1) z = 2 * ν / z * besselY ν z := by
  sorry

/-- Half-order second-kind functions fix both signs in the oscillatory normalization. -/
theorem besselY_half {x : ℝ} (hx : 0 < x) :
    besselY (1 / 2) x = (-Real.sqrt (2 / (Real.pi * x)) * Real.cos x : ℝ) ∧
    besselY (-1 / 2) x = (Real.sqrt (2 / (Real.pi * x)) * Real.sin x : ℝ) := by
  sorry

/-- Coefficients of the positive-axis Bessel expansion; the empty product is one. -/
def besselAsymptoticCoeff (ν : ℝ) (j : ℕ) : ℝ :=
  (∏ r ∈ Finset.range j, (4 * ν ^ 2 - (2 * (r : ℝ) + 1) ^ 2)) /
    ((8 : ℝ) ^ j * (j.factorial : ℝ))

/-- Positive-axis second-kind expansions admit real first-omitted-term remainder bounds. -/
theorem besselY_positive_axis_remainders (ν : ℝ) {x : ℝ} (hx : 0 < x)
    (r s : ℕ) (hr : 1 ≤ r) (hs : 1 ≤ s)
    (hν : |ν| < min (2 * r + 1 / 2 : ℝ) (2 * s + 3 / 2 : ℝ)) :
    ∃ U V : ℝ,
      |U| ≤ |besselAsymptoticCoeff ν (2 * r)| * x ^ (-(2 * r : ℝ)) ∧
      |V| ≤ |besselAsymptoticCoeff ν (2 * s + 1)| * x ^ (-(2 * s + 1 : ℝ)) ∧
      besselY ν x = (Real.sqrt (2 / (Real.pi * x)) *
        (Real.sin (x - Real.pi * ν / 2 - Real.pi / 4) *
          ((∑ j ∈ Finset.range r, (-1 : ℝ) ^ j * besselAsymptoticCoeff ν (2 * j) *
            x ^ (-(2 * j : ℝ))) + U) +
        Real.cos (x - Real.pi * ν / 2 - Real.pi / 4) *
          ((∑ j ∈ Finset.range s, (-1 : ℝ) ^ j * besselAsymptoticCoeff ν (2 * j + 1) *
            x ^ (-(2 * j + 1 : ℝ))) + V)) : ℝ) := by
  sorry

/-- Half-integral orders terminate the Bessel expansion after the constant term. -/
theorem besselAsymptoticCoeff_half (j : ℕ) (hj : 1 ≤ j) :
    besselAsymptoticCoeff (1 / 2) j = 0 ∧ besselAsymptoticCoeff (-1 / 2) j = 0 := by
  sorry

/-- Numerical saddle constants `(β, B₁, B₂, B₃, B₄)` of README §3.23c.
The theorem's strict parameter domain is essential for these totalized formulas. -/
def saddleConstants (A₂ A₃ η : ℝ) : ℝ × ℝ × ℝ × ℝ × ℝ :=
  let β := 2 * η * Real.sqrt 2 * A₂ * A₃ / (3 * (1 - η * Real.sqrt 2))
  let w₁ := Real.pi * η ^ 3 * A₂ *
    (4 * Real.sqrt 2 / 3 + 27 * η / (128 * (1 - η * Real.sqrt 2)))
  let w₂ := Real.exp w₁ * (4 * Real.pi * A₂ / 3) ^ 2 *
    (1 + 3 * η / (Real.sqrt 2 - 2 * η) *
      (1 + 3 * Real.sqrt 2 * η / (8 * (1 - η * Real.sqrt 2))))
  let w₃ := 4 * Real.pi * Real.sqrt 2 * A₂ / 3 +
    2 * Real.pi * η * A₂ / (1 - η * Real.sqrt 2) + η ^ 3 * w₂
  (β,
    1 / (1 - β) + Real.exp (-Real.pi / (2 * (1 - β))) / Real.pi,
    2 * Real.pi * η ^ 2 * (1 - β) / (A₃ * (1 + 2 * A₂)),
    48 * Real.sqrt 2 * (1 + (1 - β) ^ (-4 : ℤ)) / (Real.pi ^ 4 * η ^ 7),
    (1 + η ^ 3 * w₃) / ((2 * Real.pi / A₃) * (1 - η * Real.sqrt 2)) +
      3 * (2 * Real.pi * A₂ / (1 - η * Real.sqrt 2) + Real.sqrt 2 * w₃) /
        (4 * Real.pi / A₃) ^ 2 + 15 * w₂ / (4 * Real.pi / A₃) ^ 3)

namespace atkinson

/-- Positive logarithmic ratio on `y > 0`; its value at zero is only a totalization. -/
def logRatio (y : ℝ) : ℝ := Real.log ((1 + y) / y)

/-- Real logarithmic-family weight; the analytic domain has all parameters positive. -/
def logarithmicWeight (α β γ y : ℝ) : ℝ :=
  y ^ (-α) * (1 + y) ^ (-β) * logRatio y ^ (-γ)

/-- The logarithmic saddle has a positive quarter phase and three explicit error terms. -/
theorem logarithmic_saddle (α β γ T k a b sign : ℝ)
    (hα : 0 < α) (hβ : 0 < β) (hγ : 0 < γ) (hα₁ : α ≠ 1)
    (hT : 1 ≤ T) (hk : 1 ≤ k) (ha : 0 < a) (ha₁ : a ≤ 1)
    (haT : a ≤ T / (8 * Real.pi * k)) (hb : T ≤ b) (hsgn : sign = 1 ∨ sign = -1) :
    let y₀ := Real.sqrt (T / (2 * Real.pi * k) + 1 / 4) - 1 / 2
    let η := 129 / (3800 * Real.sqrt 2)
    let A₁ := (2 : ℝ) ^ (α + β - γ) * (3 : ℝ) ^ γ
    let c := saddleConstants (1 / Real.pi) (27 * Real.pi) η
    let Φ := fun x : ℝ => x ^ (-α) * (1 + x) ^ (γ - β)
    let f' := fun x : ℝ => -T / (2 * Real.pi * x * (1 + x))
    let f'' := fun x : ℝ => T * (1 + 2 * x) / (2 * Real.pi * x ^ 2 * (1 + x) ^ 2)
    ∃ R_end R_far R_loc : ℂ,
      (∫ y : ℝ in a..b, (logarithmicWeight α β γ y : ℂ) *
        Complex.exp (I * ((T * logRatio y + sign * 2 * Real.pi * k * y : ℝ) : ℂ))) =
        (if sign = 1 then (logarithmicWeight α β γ y₀ *
          Real.sqrt (1 / f'' y₀) : ℂ) *
          Complex.exp (I * ((T * logRatio y₀ + 2 * Real.pi * k * y₀ + Real.pi / 4 : ℝ) : ℂ))
          else 0) + R_end + R_far + R_loc ∧
      ‖R_end‖ ≤ A₁ * c.2.1 *
        (Φ a / (|f' a + sign * k| + Real.sqrt (f'' a)) +
         Φ b / (|f' b + sign * k| + Real.sqrt (f'' b))) ∧
      ‖R_far‖ ≤ A₁ * ∫ x : ℝ in a..b,
        Φ x * Real.exp (-c.2.2.1 * (k * x / 2 + T / (1 + x))) *
          (1 + η * Real.sqrt 2 / 2) ∧
      ‖R_loc‖ ≤ if sign = 1 then
        A₁ * ((27 * Real.pi) ^ 4 * c.2.2.2.1 +
          Real.sqrt (27 * Real.pi) * c.2.2.2.2) * Φ y₀ * (y₀ / 2) *
            (T / (1 + y₀)) ^ (-3 / 2 : ℝ) else 0 := by
  sorry

/-- At the boundary weight the unpaired complex integral has no ordinary improper limit. -/
theorem logarithmic_boundary_nonconvergence : ¬ ∃ ℓ : ℂ, Tendsto (fun R : ℝ => ∫ y : ℝ in (1 : ℝ)..R,
    (logarithmicWeight (1 / 2) (1 / 2) 1 y : ℂ) *
      Complex.exp (Complex.I * ((4 * Real.pi * logRatio y + 2 * Real.pi * y : ℝ) : ℂ)))
    atTop (𝓝 ℓ) := by
  sorry

/-- Moving-family weight; all analytic statements require `T > 0` and `x > 0`. -/
def movingWeight (T x : ℝ) : ℝ :=
  (Real.arsinh (x * Real.sqrt (Real.pi / (2 * T))) *
    (Real.sqrt (T / (2 * Real.pi * x ^ 2) + 1 / 4) + 1 / 2) *
    (T / (2 * Real.pi * x ^ 2) + 1 / 4) ^ (1 / 4 : ℝ))⁻¹

/-- Moving-family phase before adding its signed square-root frequency. -/
def movingPhase (T x : ℝ) : ℝ :=
  -2 * T * Real.arsinh (x * Real.sqrt (Real.pi / (2 * T))) -
    Real.sqrt (2 * Real.pi * x ^ 2 * T + Real.pi ^ 2 * x ^ 4) + Real.pi * x ^ 2

/-- Real moving cutoff; analytic identities use positive `T` and `b`. -/
def cutoff (T b : ℝ) : ℝ := (Real.sqrt (b + 2 * T / Real.pi) - Real.sqrt b) ^ 2 / 4

/-- The saddle condition includes equality at the lower endpoint. -/
theorem cutoff_saddle_iff {T b n : ℝ} (hT : 0 < T) (hb : 0 < b) (hn : 0 < n) :
    n ≤ cutoff T b ↔ n < T / (2 * Real.pi) ∧ (T / (2 * Real.pi) - n) ^ 2 / n ≥ b := by
  sorry

/-- Extended amplitude, with its continuous positive-temperature value at zero. -/
def amplitude (T n : ℝ) : ℝ :=
  if n = 0 then 1 else
    (1 + Real.pi * n / (2 * T)) ^ (-1 / 4 : ℝ) *
      Real.sqrt (Real.pi * n / (2 * T)) / Real.arsinh (Real.sqrt (Real.pi * n / (2 * T)))

/-- First Atkinson phase, including the negative quarter-period shift. -/
def phase₁ (T n : ℝ) : ℝ :=
  2 * T * Real.arsinh (Real.sqrt (Real.pi * n / (2 * T))) +
    Real.sqrt ((Real.pi * n) ^ 2 + 2 * Real.pi * n * T) - Real.pi / 4

/-- Second Atkinson phase; its analytic domain has `T > 0` and `n > 0`. -/
def phase₂ (T n : ℝ) : ℝ := T * Real.log (T / (2 * Real.pi * n)) - T + Real.pi / 4

/-- The first finite sum has alternating signs and includes its natural cutoff. -/
def firstSum (T : ℝ) (N : ℕ) : ℝ :=
  Real.sqrt 2 * (T / (2 * Real.pi)) ^ (1 / 4 : ℝ) *
    ∑ n ∈ Finset.Icc 1 N,
      (-1 : ℝ) ^ n * (n.divisors.card : ℝ) * (n : ℝ) ^ (-3 / 4 : ℝ) *
        amplitude T n * Real.cos (phase₁ T n)

/-- The second sum has inclusive real cutoff. Its analytic domain is `0 ≤ Z < T/(2π)`. -/
def secondSum (T Z : ℝ) : ℝ :=
  -2 * ∑ n ∈ Finset.Icc 1 ⌊Z⌋₊,
    (n.divisors.card : ℝ) / Real.sqrt n /
      Real.log (T / (2 * Real.pi * n)) * Real.cos (phase₂ T n)

/-- The moving saddle is an improper limit with an inclusive endpoint and capped error. -/
theorem moving_saddle (α A A' T n a η sign : ℝ)
    (hα : 0 < α) (hA : 0 < A) (hAA' : A ≤ A') (hT : 1 ≤ T) (hn : 1 ≤ n)
    (ha : A * Real.sqrt T ≤ a) (ha' : a ≤ A' * Real.sqrt T)
    (hη : 0 < η) (hsgn : sign = 1 ∨ sign = -1)
    (hη₁ : η < 1 / ((1 + 2 * (1 / Real.pi) * (8 / A ^ 2 + 9 * Real.pi) / 3) *
      Real.sqrt 2))
    (hη₂ : η < (8 / A ^ 2 + 9 * Real.pi) * (1 + 2 / Real.pi) / 2)
    (hη₃ : η < (48 * (8 / A ^ 2 + 9 * Real.pi) ^ 3 / Real.pi ^ 3) ^ (1 / 6 : ℝ)) :
    let A₃ := 8 / A ^ 2 + 9 * Real.pi
    let c := saddleConstants (1 / Real.pi) A₃ η
    let A₁ := (2 : ℝ) ^ (α + 1 / 2) / Real.arsinh (A / 2 * Real.sqrt (Real.pi / 2))
    let V₁ := A₁ * c.2.1 * A ^ (-α) *
      (1 - (1 + 1 / (2 * Real.pi * A' ^ 2)) ^ (-1 / 2 : ℝ)) ^ (-1 / 2 : ℝ)
    let V₂ := A₁ / 2 * (A₃ ^ 4 * c.2.2.2.1 + Real.sqrt A₃ * c.2.2.2.2)
    let V₃ := A₁ / c.2.2.1 * A ^ (-α) * (1 + η / Real.sqrt 2)
    let hasSaddle := sign = 1 ∧ n < T / (2 * Real.pi) ∧ (T / (2 * Real.pi) - n) ^ 2 / n ≥ a ^ 2
    ∃ J : ℂ,
      Tendsto (fun b : ℝ => ∫ x : ℝ in a..b, ((x ^ (-α) * movingWeight T x : ℝ) : ℂ) *
        Complex.exp (I * ((sign * 4 * Real.pi * x * Real.sqrt n + movingPhase T x : ℝ) : ℂ)))
        atTop (𝓝 J) ∧
      ‖J - (if hasSaddle then
        ((4 * Real.pi / T * n ^ ((α - 1) / 2) / Real.log (T / (2 * Real.pi * n)) *
          (T / (2 * Real.pi) - n) ^ (3 / 2 - α) : ℝ) : ℂ) *
          Complex.exp (I * ((T - T * Real.log (T / (2 * Real.pi * n)) -
            2 * Real.pi * n + Real.pi / 4 : ℝ) : ℂ)) else 0)‖ ≤
        V₁ * T ^ (-α / 2) * endpointCap
          (sign * 2 * Real.sqrt n + a - Real.sqrt (a ^ 2 + 2 * T / Real.pi)) +
        (if hasSaddle then V₂ * T ^ (-3 / 2 : ℝ) * n ^ ((α - 1) / 2) *
          (T / (2 * Real.pi) - n) ^ (1 - α) else 0) +
        V₃ * T ^ (-α / 2) * n ^ (-1 / 2 : ℝ) *
          Real.exp (-c.2.2.1 * (T + A * Real.sqrt T)) := by
  sorry

/-- The first Atkinson amplitude has its continuous right extension at zero. -/
theorem amplitude_tendsto_zero {T : ℝ} (hT : 0 < T) :
    Tendsto (amplitude T) (𝓝[>] 0) (𝓝 1) := by
  sorry

/-- The moving cutoff stays strictly below the singular second-sum frequency. -/
theorem cutoff_bounds {T b : ℝ} (hT : 0 < T) (hb : 0 < b) :
    0 < cutoff T b ∧ cutoff T b < T / (2 * Real.pi) := by
  sorry

/-- The two main sums at the integer truncation satisfy the explicit square-root budget. -/
theorem main_sum_bound {T : ℝ} (hT : (10 : ℝ) ^ 30 ≤ T) :
    |firstSum T ⌊T⌋₊| + |secondSum T (cutoff T (⌊T⌋₊ + 1 / 2))| ≤
      3.87 * Real.sqrt T * Real.log T - 1.1 * Real.sqrt T := by
  sorry

end atkinson

namespace zetaSecondMoment

/-- The moment error uses the continuous value zero at the lower endpoint. -/
theorem error_zero : error 0 = 0 := by
  simp [error]

/-- The moment error is continuous on the nonnegative real axis. -/
theorem error_continuous : ContinuousOn error (Set.Ici 0) := by
  sorry

/-- Moment-error increments retain the integral and both main-term endpoints. -/
theorem error_increment {S T : ℝ} (hS : 0 < S) (hST : S ≤ T) :
    error T - error S =
      (∫ t : ℝ in S..T, ‖riemannZeta (1 / 2 + (t : ℂ) * I)‖ ^ 2) -
        (T * Real.log (T / (2 * Real.pi)) - S * Real.log (S / (2 * Real.pi))) -
        (2 * Real.eulerMascheroniConstant - 1) * (T - S) := by
  sorry

/-- Proportional truncations in Atkinson's formula have logarithmic-square remainder. -/
theorem atkinson_formula {A B : ℝ} (hA : 0 < A) (hAB : A ≤ B) :
    ∃ C > 0, ∀ᶠ T in atTop, ∀ N : ℕ, A * T ≤ N → (N : ℝ) ≤ B * T →
      |error T - atkinson.firstSum T N -
        atkinson.secondSum T (atkinson.cutoff T (N + 1 / 2))| ≤ C * Real.log T ^ 2 := by
  sorry

/-- Explicit Atkinson remainder from the BBR finite input for proportional truncation. -/
theorem atkinson_remainder_budget (hBBR : BBRFiniteInput) {T : ℝ} (hT : (10 : ℝ) ^ 30 ≤ T) (N : ℕ)
    (hN : (9 / 10 : ℝ) * T ≤ N ∧ (N : ℝ) ≤ (11 / 10 : ℝ) * T) :
    |error T - atkinson.firstSum T N - atkinson.secondSum T (atkinson.cutoff T (N + 1 / 2))| ≤
      95 * Real.log T ^ 2 + 275 * Real.log T + 73 * (10 : ℝ) ^ 17 := by
  sorry

end zetaSecondMoment

/-- Prime-supported logarithmic coefficients satisfy a mean-square estimate with a
single von Mangoldt weight; the lower cutoff is the square of the height. -/
theorem prime_weighted_mean_square : ∃ C > 0, ∀ T x : ℝ, 1 ≤ T → 1 ≤ x →
    ∀ a : ℕ → ℂ,
      (∫ t : ℝ in (-T)..T,
        ‖∑ n ∈ Finset.Icc ⌈T ^ 2⌉₊ ⌊x⌋₊,
          a n * (ArithmeticFunction.vonMangoldt n : ℂ) *
            Complex.exp (-I * ((t * Real.log n : ℝ) : ℂ))‖ ^ 2) ≤
        C * ∑ n ∈ Finset.Icc ⌈T ^ 2⌉₊ ⌊x⌋₊,
          (n : ℝ) * ‖a n‖ ^ 2 * ArithmeticFunction.vonMangoldt n := by
  sorry

end AN5

/-!
The README also specifies the quantitative contour and saddle estimates, the arithmetic Hecke
and Artin dictionaries, quadratic periods and the general automorphic Weil formula. These use
their suppliers' function, divisor, representation and geometric interfaces. The auxiliary targets `atkinson.logarithmic_saddle_uniform`, `atkinson.contour_decomposition`
and `atkinson.budget_bound` specify, respectively, the two uniform error ranges, the four contour
terms with successive improper limits, and the coefficient bounds of the explicit remainder in
§§3.23d,g. The signatures here use native functions, analytic multiplicities, ideal coefficients and indexed exponent vectors.
-/

end TauCetiRoadmap.AnalyticNumberTheoryPartI
