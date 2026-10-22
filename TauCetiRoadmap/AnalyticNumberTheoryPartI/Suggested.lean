import Mathlib

/-!
# Analytic number theory, Part I: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its headline results.

Layer 0 states finite-order Hadamard factorization, Siegel's lower bound and
Siegel–Walfisz. Layer 1 states Davenport cancellation, the half-interval explicit
formula, Dirichlet-polynomial means, Selberg density, Mestre's general Weil formula
and the conditional RH/GRH prime estimates. Layer 2 states Louboutin's residue bound
and bounded-degree Brauer–Siegel. Layer 3 states the Landau–Ramanujan and restricted
Sathe–Selberg counts, Shiu's bound, both Halász mean theorems, the Dickman limit, Atkinson's formula,
the second and fourth zeta moments and the Beurling prime/integer remainder equivalence.
All arithmetic cutoffs and zero multiplicities use the native library carriers.

The canonical globally continued Hecke and finite-image Artin functions, their completed
normalizations and general Artin conductors are absent at the pins. Thus the
arithmetic comparisons of §§2.3,2.18, the CM endpoint estimates of §§2.33–2.51,
the ray-character density theorem and the number-field effective Chebotarev theorem
are deferred as Lean statements. The Hecke character carrier and qualitative prime
counts alone do not supply these analytic objects. The quadratic period identities
and Weyl bounds of §§2.23–2.47 also need the normalized nonholomorphic Eisenstein
family, quadratic geodesics and oriented Nielsen surfaces. The generic Weil formula
below uses actual meromorphic functions; its automorphic specialization needs the
suppliers' completed Rankin–Selberg functions. None of these missing objects is
replaced by a free predicate or a choice of unrelated analytic functions.
-/

noncomputable section

open Filter Topology Asymptotics Complex
open scoped BigOperators Classical

namespace TauCetiRoadmap.AnalyticNumberTheoryPartI

/-! ## Layer 0: Entire functions and quantitative primes -/

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- Siegel's lower bound is uniform over primitive nonprincipal quadratic characters. -/
theorem siegel_lower_bound {ε : ℝ} (hε : 0 < ε) :
    ∃ c > 0, ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N),
      χ.IsPrimitive → χ ≠ 1 → χ ^ 2 = 1 →
      c * (N : ℝ) ^ (-ε) ≤ (DirichletCharacter.LFunction χ 1).re := by
  sorry

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

/-- Finite-order Hadamard factorization, including multiplicities, genus summability,
locally uniform convergence and the degree of the polynomial exponential factor (§0.23). -/
theorem finite_order_hadamard (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hgrowth : ∀ b : ℝ, ρ < b → ∃ C > 0, ∀ z : ℂ,
      ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)) :
    let E := fun (α : {a : ℂ // a ≠ 0}) (z : ℂ) =>
      ((1 - z / α.val) * Complex.exp
        (∑ j ∈ Finset.Icc 1 ⌊ρ⌋₊, (z / α.val) ^ j / (j : ℂ))) ^
          (analyticOrderAt f α.val).toNat
    Summable (fun α : {a : ℂ // a ≠ 0} =>
      (analyticOrderAt f α.val).toNat * ‖α.val‖ ^ (-(⌊ρ⌋₊ + 1 : ℝ))) ∧
    ∃ (P : Polynomial ℂ) (g : ℂ → ℂ), P.natDegree ≤ ⌊ρ⌋₊ ∧
      TendstoLocallyUniformly
        (fun S : Finset {a : ℂ // a ≠ 0} => fun z => ∏ α ∈ S, E α z) g atTop ∧
      ∀ z : ℂ, f z = z ^ (analyticOrderAt f 0).toNat * Complex.exp (P.eval z) * g z := by
  sorry

/-! ## Layer 1: Explicit formulas and mean values -/

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

/-- Davenport cancellation is uniform in the real additive frequency. -/
theorem davenport_moebius {A : ℝ} (hA : 0 < A) :
    ∃ C > 0, ∀ y : ℝ, 2 ≤ y → ∀ α : ℝ,
      ‖∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (ArithmeticFunction.moebius n : ℂ) *
        Complex.exp (I * ((n : ℝ) * α : ℝ))‖ ≤ C * y * Real.log y ^ (-A) := by
  sorry

/-- The Dirichlet-polynomial mean square has the Montgomery–Vaughan weighted error. -/
theorem dirichlet_polynomial_mean_square :
    ∀ (N : ℕ) (a : ℕ → ℂ) (T : ℝ), 0 ≤ T →
      |(∫ t in (-T)..T, ‖∑ n ∈ Finset.Icc 1 N, a n * (n : ℂ) ^ (-((t : ℂ) * I))‖ ^ 2) -
          2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2| ≤
        (6 * Real.pi) * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by
  sorry

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

/-- The Riemann hypothesis for one Dirichlet `L`-function.
`0 < re s` removes trivial zeros and the zeros of missing Euler factors; the pole of the principal
character is excluded. -/
def DirichletGRH {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

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

/-- Mestre's symmetric-tail test condition (§1.3), on native real functions. -/
def WeilTestFunction (c : ℝ) (F : ℝ → ℝ) : Prop :=
  0 ≤ c ∧ ∃ ε > 0,
    MeasureTheory.Integrable (fun x => F x * Real.exp ((1 / 2 + c + ε) * |x|)) ∧
    BoundedVariationOn (fun x => F x * Real.exp ((1 / 2 + c + ε) * |x|)) Set.univ ∧
    (∀ x, F x = (Function.leftLim F x + Function.rightLim F x) / 2) ∧
    BoundedVariationOn (fun x => (F x - F 0) / x) Set.univ

/-- The bilateral transform on the strip of the Weil formula. -/
def weilTransform (F : ℝ → ℝ) (s : ℂ) : ℂ :=
  ∫ x : ℝ, (F x : ℂ) * Complex.exp ((s - 1 / 2) * (x : ℂ))

/-- Combined Gamma subtraction; a zero slope contributes zero (§1.8). -/
def weilGammaTerm (F : ℝ → ℝ) (a : ℝ) (b : ℂ) : ℂ :=
  if a = 0 then 0 else (a : ℂ) * ∫ x : ℝ in Set.Ioi 0,
    (F (a * x) : ℂ) * Complex.exp (-((a / 2 : ℝ) + b) * (x : ℂ)) /
      (1 - Complex.exp (-(x : ℂ))) - (F 0 : ℂ) * Complex.exp (-(x : ℂ)) / (x : ℂ)

/-- Mestre's formula for paired meromorphic functions of arbitrary degree (§1.8).
The strip hypothesis subtracts finite principal parts before bounding. Reflection is an
identity of punctured germs; the signed native divisor counts zeros minus poles. -/
theorem weil_explicit_formula (c : ℝ) (F : ℝ → ℝ) (hF : WeilTestFunction c F)
    (M d : ℕ) (A : Fin 2 → ℝ) (a : Fin 2 → Fin M → ℝ)
    (b : Fin 2 → Fin M → ℂ) (α : Fin 2 → Nat.Primes → Fin d → ℂ)
    (Λ : Fin 2 → ℂ → ℂ) (w : ℂ)
    (hA : ∀ i, 0 < A i) (ha : ∀ i j, 0 ≤ a i j)
    (hb : ∀ i j, 0 ≤ (b i j).re) (hb₀ : ∀ i j, a i j = 0 → b i j ≠ 0)
    (hslope : ∑ j, a 0 j = ∑ j, a 1 j)
    (hα : ∀ i p j, ‖α i p j‖ ≤ (p.val : ℝ) ^ c)
    (hΛ : ∀ i, MeromorphicOn (Λ i) Set.univ) (hw : w ≠ 0)
    (hreflection : ∀ z : ℂ,
      (fun s => Λ 0 (1 - s)) =ᶠ[𝓝[≠] z] (fun s => w * Λ 1 s))
    (hstrip : ∀ i, ∃ (S : Finset ℂ) (m : ℂ → ℕ) (B : ℂ → ℕ → ℂ),
      (∀ z ∉ S, AnalyticAt ℂ (Λ i) z) ∧
      ∀ u v : ℝ, ∃ C : ℝ, ∀ z : ℂ, u ≤ z.re → z.re ≤ v → z ∉ S →
        ‖Λ i z - ∑ p ∈ S, ∑ k ∈ Finset.Icc 1 (m p), B p k / (z - p) ^ k‖ ≤ C)
    (hEuler : ∀ i s, 1 + c < s.re →
      HasProd (fun p : Nat.Primes => ∏ j : Fin d,
        (1 - α i p j * Complex.exp (-s * (Real.log p.val : ℂ)))⁻¹)
        (Λ i s / ((A i : ℂ) ^ s * ∏ j : Fin M, Complex.Gamma ((a i j : ℂ) * s + b i j)))) :
    Tendsto (fun T : ℝ =>
      ∑ᶠ ρ : {z : ℂ // -c ≤ z.re ∧ z.re ≤ 1 + c ∧ |z.im| < T},
        ((MeromorphicOn.divisor (Λ 0) Set.univ) ρ.val : ℂ) * weilTransform F ρ.val)
      atTop (𝓝 (
        (F 0 * Real.log (A 0 * A 1) : ℂ) -
        (∑' p : Nat.Primes, ∑ j : Fin d, ∑' k : ℕ,
          ((α 0 p j ^ (k + 1) * (F (((k : ℝ) + 1) * Real.log p.val) : ℂ) +
            α 1 p j ^ (k + 1) * (F (-((k : ℝ) + 1) * Real.log p.val) : ℂ)) *
            (Real.log p.val : ℂ) / (p.val : ℂ) ^ (((k : ℂ) + 1) / 2))) -
        (∑ j, weilGammaTerm F (a 0 j) (b 0 j)) -
        ∑ j, weilGammaTerm (fun x => F (-x)) (a 1 j) (b 1 j))) := by
  sorry

/-! ## Layer 2: Number-field estimates -/

open _root_.NumberField

/-- Louboutin's bound for the Dedekind residue retains the degree and discriminant. -/
theorem dedekindZeta_residue_le (K : Type*) [Field K] [NumberField K]
    (hd : 1 < Module.finrank ℚ K) :
    dedekindZeta_residue K ≤
      (Real.exp 1 * Real.log |(discr K : ℝ)| / (2 * (Module.finrank ℚ K - 1))) ^
        (Module.finrank ℚ K - 1) := by
  sorry

/-- In bounded degree, hR has discriminant exponent one half, with any positive power loss. -/
theorem bounded_degree_brauer_siegel (n : ℕ) (hn : 1 ≤ n) {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L ≤ n →
      C⁻¹ * |(discr L : ℝ)| ^ (1 / 2 - ε) ≤ classNumber L * Units.regulator L ∧
        classNumber L * Units.regulator L ≤ C * |(discr L : ℝ)| ^ (1 / 2 + ε) := by
  sorry

/-! ## Layer 3: Multiplicative means, smooth numbers and moments -/

/-- `D(f, g; x)`, a distance on prime data. -/
def pretentiousDist (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter Nat.Prime, (1 - (f p * starRingEnd ℂ (g p)).re) / (p : ℝ))

/-- The logarithmic-derivative coefficient class of §3.19, including its Euler logarithm. -/
def HalaszCoefficientClass (κ : ℝ) (f : ArithmeticFunction ℂ) : Prop :=
  0 < κ ∧ f.IsMultiplicative ∧ ∃ b : ArithmeticFunction ℂ,
    (∀ n, ‖b n‖ ≤ κ * ArithmeticFunction.vonMangoldt n) ∧
    ∀ s : ℂ, 1 < s.re →
      LSeriesSummable f s ∧ LSeriesSummable b s ∧
      LSeriesSummable (fun n => b n / (Real.log n : ℂ)) s ∧
      LSeries f s = Complex.exp (LSeries (fun n => b n / (Real.log n : ℂ)) s) ∧
      -deriv (LSeries f) s / LSeries f s = LSeries b s

/-- Shiu's short-interval progression bound, uniformly in the coefficient class (§3.37). -/
theorem shiu_bound (κ ε : ℝ) (hκ : 0 < κ) (hε : 0 < ε) (hε₁ : ε < 1) :
    ∃ C > 0, ∃ X > 1, ∀ f : ArithmeticFunction ℂ, HalaszCoefficientClass κ f →
      ∀ x z : ℝ, X ≤ x → x ^ ε ≤ z → z ≤ x →
      ∀ q : ℕ, 0 < q → (q : ℝ) ≤ z ^ (1 - ε) → ∀ a : ZMod q, IsUnit a →
        (∑ n ∈ (Finset.Icc ⌈x - z⌉₊ ⌊x⌋₊).filter
          (fun n : ℕ => 0 < n ∧ (n : ZMod q) = a), ‖f n‖) ≤
        C * z / (q.totient * Real.log x) * Real.exp
          (∑ p ∈ (Finset.Iic ⌊x⌋₊).filter (fun p : ℕ => p.Prime ∧ ¬p ∣ q),
            ‖f p‖ / p) := by
  sorry

/-- The Halász integral theorem with one constant and threshold for the whole class (§3.45). -/
theorem halasz_integral_mean (κ : ℝ) (hκ : 0 < κ) :
    ∃ C > 0, ∀ᶠ x : ℝ in atTop, ∀ f : ArithmeticFunction ℂ, HalaszCoefficientClass κ f →
      ‖∑ n ∈ Finset.Icc 1 ⌊x⌋₊, f n‖ ≤
        C * x / Real.log x * (∫ σ : ℝ in (1 / Real.log x)..1,
          sSup ((fun t : ℝ =>
            ‖LSeries f (1 + (σ : ℂ) + (t : ℂ) * I) /
              (1 + (σ : ℂ) + (t : ℂ) * I)‖) ''
            Set.Icc (-(Real.log x ^ κ)) (Real.log x ^ κ)) / σ) +
        C * x * Real.log (Real.log x) ^ κ / Real.log x := by
  sorry

/-- Halász's bound uses the infimum over twists and allows ordinary multiplicativity. -/
theorem halasz_mean : ∃ C > 0, ∀ f : ArithmeticFunction ℂ, f.IsMultiplicative →
    (∀ n : ℕ, 0 < n → ‖f n‖ ≤ 1) → ∀ x T : ℝ, 2 ≤ x → 1 ≤ T →
    let M := sInf {m : ℝ | ∃ t ∈ Set.Icc (-2 * T) (2 * T),
      m = pretentiousDist f (fun n => (n : ℂ) ^ (I * (t : ℂ))) x ^ 2}
    ‖∑ n ∈ Finset.Icc 1 ⌊x⌋₊, f n‖ / x ≤
      C * ((1 + M) * Real.exp (-M) + T ^ (-1 / 2 : ℝ)) := by
  sorry

/-- `Ψ(x, y)`, the number of `1 ≤ n ≤ x` with every prime factor `≤ y`. -/
def smoothCount (x y : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ => ∀ p ∈ n.primeFactors, (p : ℝ) ≤ y).card

/-- Dickman's unique delay-equation solution and the smooth-number limit, uniformly
on every fixed compact interval of positive parameters (§§3.21,3.34). -/
theorem smoothCount_dickman : ∃! ρ : ℝ → ℝ,
    (∀ u < 0, ρ u = 0) ∧ (∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1) ∧
    ContinuousOn ρ (Set.Ici 0) ∧
    (∀ u > 1, HasDerivAt ρ (-ρ (u - 1) / u) u) ∧
    ∀ a U : ℝ, 0 < a → a ≤ U → ∀ ε > 0, ∀ᶠ x : ℝ in atTop,
      ∀ u ∈ Set.Icc a U, |(smoothCount x (x ^ (1 / u)) : ℝ) / x - ρ u| < ε := by
  sorry

/-- Positive integers represented as a sum of two integer squares, counted once. -/
def sumsOfTwoSquaresCount (x : ℝ) : ℕ :=
  ((Finset.Icc 1 ⌊x⌋₊).filter fun n : ℕ =>
    ∃ u v : ℤ, (n : ℤ) = u ^ 2 + v ^ 2).card

/-- Landau–Ramanujan with its positive Euler-product constant (§3.13). -/
theorem landau_ramanujan : ∃ C > 0,
    HasProd (fun p : {p : Nat.Primes // p.val % 4 = 3} =>
      (1 - (p.val.val : ℝ) ^ (-2 : ℤ)) ^ (-1 / 2 : ℝ)) (Real.sqrt 2 * C) ∧
    (fun x : ℝ => (sumsOfTwoSquaresCount x : ℝ)) ~[atTop]
      (fun x => C * x / Real.sqrt (Real.log x)) := by
  sorry

/-- The strict-cutoff squarefree family with exactly `r` prime factors (§3.41). -/
def restrictedSquarefreeCount (x : ℝ) (r : ℕ) : ℕ :=
  ((Finset.Icc 1 ⌈x⌉₊).filter fun n : ℕ => (n : ℝ) < x ∧ Squarefree n ∧
    (∀ p ∈ n.primeFactors, p = 2 ∨ p % 4 = 1) ∧ n.primeFactors.card = r).card

/-- Restricted Sathe–Selberg uniformly throughout every fixed `A log log x` range (§3.41). -/
theorem restricted_sathe_selberg (A : ℝ) (hA : 0 < A) :
    ∃ C₁ > 0, ∃ C₂ > 0, ∀ᶠ x : ℝ in atTop, ∀ r : ℕ,
      1 ≤ r → (r : ℝ) ≤ A * Real.log (Real.log x) →
      let S := x / Real.log x * (Real.log (Real.log x) / 2) ^ (r - 1) /
        ((r - 1).factorial : ℝ)
      C₁ * S ≤ restrictedSquarefreeCount x r ∧ restrictedSquarefreeCount x r ≤ C₂ * S := by
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

/-- The norm of an indexed generalized integer retains the prime indices. -/
def BeurlingPrimeSystem.integerNorm (P : BeurlingPrimeSystem) (a : ℕ →₀ ℕ) : ℝ :=
  a.prod (fun j k => P.p j ^ k)

/-- Generalized integers are counted as exponent vectors, including the empty vector. -/
def BeurlingPrimeSystem.integerCount (P : BeurlingPrimeSystem) (x : ℝ) : ℕ :=
  Nat.card {a : ℕ →₀ ℕ // P.integerNorm a ≤ x}

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

namespace atkinson

/-- Real moving cutoff; analytic identities use positive `T` and `b`. -/
def cutoff (T b : ℝ) : ℝ := (Real.sqrt (b + 2 * T / Real.pi) - Real.sqrt b) ^ 2 / 4

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

end atkinson

namespace zetaSecondMoment

/-- The second-moment error with the full `2π` and Euler-constant normalization. -/
def error (T : ℝ) : ℝ :=
  (∫ t : ℝ in (0 : ℝ)..T, ‖riemannZeta (1 / 2 + (t : ℂ) * Complex.I)‖ ^ 2) -
    T * Real.log (T / (2 * Real.pi)) - (2 * Real.eulerMascheroniConstant - 1) * T

/-- Proportional truncations in Atkinson's formula have logarithmic-square remainder. -/
theorem atkinson_formula {A B : ℝ} (hA : 0 < A) (hAB : A ≤ B) :
    ∃ C > 0, ∀ᶠ T in atTop, ∀ N : ℕ, A * T ≤ N → (N : ℝ) ≤ B * T →
      |error T - atkinson.firstSum T N -
        atkinson.secondSum T (atkinson.cutoff T (N + 1 / 2))| ≤ C * Real.log T ^ 2 := by
  sorry

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

end TauCetiRoadmap.AnalyticNumberTheoryPartI
