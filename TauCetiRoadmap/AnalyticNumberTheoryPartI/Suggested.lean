module

import Mathlib

/-!
# Analytic number theory, Part I: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its headline results.

Layer 0 states the uniform exclusion of Landau–Siegel zeros with its Kronecker-character,
Landau-deduction and inert-prime targets (§0.34), the lower bound `L(1, χ) ≥ c / log q` (§0.9),
which strengthens ImaginaryQuadraticClassNumber's `quadratic_LFunction_siegel`, finite-order
Hadamard factorization, Siegel–Walfisz, Chebyshev's factorial identity and factorial bounds,
Mertens's von Mangoldt sum with its constant `γ`, and the local expansion of `ζ′/ζ` with its
half-plane bounds. Layer 1 states Davenport cancellation, the half-interval explicit formula,
Dirichlet-polynomial means, Selberg density, Mestre's general Weil formula, the `C¹` explicit
formula for `ζ` with Gauss's digamma integral, and the conditional RH/GRH prime estimates. Layer 2
states Louboutin's residue bound and bounded-degree Brauer–Siegel. Layer 3 states the
Landau–Ramanujan and restricted Sathe–Selberg counts, Shiu's bound, both Halász mean theorems, the
Dickman limit, Atkinson's formula, the second and fourth zeta moments with the divisor-square Euler
identity and the Beurling prime/integer remainder equivalence.
All arithmetic cutoffs and zero multiplicities use the native library carriers.

Published finite computations are named propositions here (`SchoenfeldFiniteRangeInput`,
`BMORFiniteInput`, `ZamanDigammaInput`, `BBRFiniteInput` and the others) and enter every theorem
that rests on them as explicit hypotheses; nothing below proves or performs such a computation.

The entire-function layer states this roadmap's own Weierstrass primary products and
equal-divisor factorization (§§0.15–0.15a, consumed by GlobalHolomorphicFunctions) and
finite-order Hadamard factorization (§0.23); the paired Hadamard theorem is
AutomorphicLFunctionsAndLocalFactors AL.2.5's and is not restated. The canonical globally
continued Hecke and finite-image Artin functions, their completed normalizations and general
Artin conductors are supplied by other roadmaps (AutomorphicLFunctionsAndLocalFactors,
AdelicAlgebraicGroups, ArithmeticGaloisRepresentations) and are absent at the pins, as is the
K-Bessel kernel of AutomorphicFormsOnReductiveGroups §4.5 and AutomorphicLFunctionsAndLocalFactors
AL.0.5.1. Layer 2 states this roadmap's level-one nonholomorphic Eisenstein series and its
completed continuation (§2.1b, consumed by AutomorphicSpectralTheory); the real quadratic Nielsen
surfaces of §2.1c have no carrier at the pins and are not stated. Thus the arithmetic
comparisons of §§2.3,2.18, the CM endpoint estimates of §§2.33–2.51, the ray-character density
theorem and the number-field effective Chebotarev theorem are deferred as Lean statements, and so
are the quadratic period identities and Weyl bounds of §§2.23–2.47, which need the quadratic
geodesics and oriented Nielsen surfaces. The Hecke
character carrier and qualitative prime counts alone do not supply these analytic objects. The
generic Weil formula below uses actual meromorphic functions; its automorphic specialization needs
the suppliers' completed Rankin–Selberg functions. None of these missing objects is replaced by a
free predicate or a choice of unrelated analytic functions.
-/

noncomputable section

open Filter Topology Asymptotics Complex
open scoped BigOperators Classical

namespace TauCetiRoadmap.AnalyticNumberTheoryPartI

/-! ## Layer 0: Entire functions and quantitative primes -/

section LandauSiegel

/-! ### Uniform exclusion of Landau–Siegel zeros (§0.34) and the value at one (§0.9)

A real character is a Mathlib Dirichlet character with `MulChar.IsQuadratic`; primitivity is
`DirichletCharacter.IsPrimitive`, so the modulus `q` is the conductor. The README requires every
constant below to be effective; effectivity is part of the specification and is not expressed by
these signatures. -/

/-- A primitive nonprincipal real character is a Kronecker character at odd primes (§0.34a). -/
theorem quadratic_character_kronecker :
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
        ∃ d : ℤ, Squarefree d ∧ d ≠ 1 ∧ |d| ≤ q ∧
          ∀ p : ℕ, p.Prime → p ≠ 2 → ¬ p ∣ q → χ (p : ZMod q) = (jacobiSym d p : ℂ) := by
  sorry

/-- The Landau deduction (§0.34b): a real zero leaves few primes with `χ p = 1`. -/
theorem split_prime_sum_le_of_real_zero :
    ∃ A : ℝ, 0 < A ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      3 ≤ q → χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
      ∀ β : ℝ, 0 < β → β < 1 → DirichletCharacter.LFunction χ (β : ℂ) = 0 →
      ∀ X : ℝ, 3 ≤ X →
        ∑ p ∈ (Nat.primesLE ⌊X⌋₊).filter (fun p : ℕ => χ (p : ZMod q) = 1),
          Real.log p / p ≤
          A * (Real.log q + (1 - β) * Real.log X ^ 2) := by
  sorry

/-- The inert-prime estimate (§0.34c): at `X = q ^ C` the primes with `χ p = -1` carry at most
three quarters of the Mertens mass `log X`, up to a constant depending on `C`. -/
theorem inert_prime_sum_le :
    ∃ C₀ : ℕ, ∀ C : ℕ, C₀ ≤ C → 3 ∣ C → ∃ K : ℝ,
      ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
        3 ≤ q → χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
          ∑ p ∈ (Nat.primesLE (q ^ C)).filter (fun p : ℕ => χ (p : ZMod q) = -1),
            Real.log p / p ≤
            3 / 4 * Real.log ((q : ℝ) ^ C) + K := by
  sorry

/-- The uniform exclusion of Landau–Siegel zeros (§0.34): one absolute constant serves every
primitive nonprincipal real character of modulus `q ≥ 3` and every real zero in `(0, 1)`. -/
theorem landau_siegel_exclusion :
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      3 ≤ q → χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
      ∀ β : ℝ, 0 < β → β < 1 → DirichletCharacter.LFunction χ (β : ℂ) = 0 →
        (1 - β) * Real.log q ≥ c := by
  sorry

/-- The lower bound `L(1, χ) ≥ c / log q` (§0.9). Since `log q ≤ q ^ ε / (e ε)`, it gives Siegel's
bound `L(1, χ) ≥ c_ε q ^ (-ε)` with `c_ε = e c ε`. -/
theorem quadratic_LFunction_one_lower_bound :
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      3 ≤ q → χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
        c / Real.log q ≤ (DirichletCharacter.LFunction χ 1).re := by
  sorry

end LandauSiegel

/-- The von Mangoldt sum `ψ(x; a, q)` over `n ≤ x` with `n ≡ a mod q`. -/
def psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n

/-- The number `π(x; a, q)` of primes `p ≤ x` with `p ≡ a mod q`. -/
def primeCountAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℕ :=
  ((Finset.Ioc 0 ⌊x⌋₊).filter fun p : ℕ => p.Prime ∧ (p : ZMod q) = a).card

/-- The Chebyshev sum `θ(x; a, q)` of `log p` over primes `p ≤ x` with `p ≡ a mod q` (§0.2). -/
def thetaAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ :=
  ∑ p ∈ (Nat.primesLE ⌊x⌋₊).filter (fun p : ℕ => (p : ZMod q) = a), Real.log p

/-! ### Computational hypotheses of Layer 0

Each proposition records a published finite computation; the theorems that rest on it carry it as
an explicit hypothesis. The cutoff `exp 10000` separates the finite ranges from analytic tails. -/

/-- Schoenfeld's finite range (§0.3): `θ(x) < 1.000081 x` for `0 < x < exp 10000`. -/
def SchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 0 < x → x < Real.exp 10000 → Chebyshev.theta x < 1.000081 * x

/-- Rosser–Schoenfeld's finite range (§0.5): both prime-count bounds for `59 ≤ x < exp 10000`. -/
def RosserSchoenfeldFiniteRangeInput : Prop :=
  ∀ x : ℝ, 59 ≤ x → x < Real.exp 10000 →
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < (Nat.primeCounting ⌊x⌋₊ : ℝ) ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x))

/-- The BMOR finite inputs (§0.7): no real zero in `(0, 1)` for conductors `3 ≤ q ≤ 400000`, and
`√q L(1, χ) > 12` (that is, `h⁺ log η > 12`) for even conductors `400000 ≤ q < 2.65 · 10¹⁰`. -/
def BMORFiniteInput : Prop :=
  (∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 3 ≤ q → q ≤ 400000 →
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
      ∀ β : ℝ, 0 < β → β < 1 → DirichletCharacter.LFunction χ (β : ℂ) ≠ 0) ∧
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 400000 ≤ q → q < 26500000000 →
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 → χ (-1) = 1 →
        12 < Real.sqrt q * (DirichletCharacter.LFunction χ 1).re

/-- The class-number input of BMOR (§0.7): `h(ℚ(√−q)) ≥ 46` for every negative fundamental
discriminant `−q < −319867`, stated through the class-number formula as `√q L(1, χ) ≥ 46π`. -/
def BMORClassNumberInput : Prop :=
  ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 319867 < q →
    χ.IsPrimitive → χ.IsQuadratic → χ (-1) = -1 →
      46 * Real.pi ≤ Real.sqrt q * (DirichletCharacter.LFunction χ 1).re

/-- The mod-eight inputs (§0.16): Ramaré–Rumely's theta bound for the classes `3, 5` on
`10¹⁰ ≤ x < exp 10000`, and the Riemann hypothesis to height `10000` for characters modulo 8. -/
def ModEightFiniteInput : Prop :=
  (∀ a : ZMod 8, (a = 3 ∨ a = 5) → ∀ x : ℝ, (10 : ℝ) ^ 10 ≤ x → x < Real.exp 10000 →
      |thetaAP 8 a x - x / 4| ≤ 0.002811 * x / 4) ∧
    ∀ χ : DirichletCharacter ℂ 8, ∀ s : ℂ, 0 < s.re → s.re < 1 → |s.im| ≤ 10000 →
      DirichletCharacter.LFunction χ s = 0 → s.re = 1 / 2

/-- The reciprocal-prime range of Rosser–Schoenfeld (§0.25) on `10⁸ ≤ x < exp 10000`. -/
def PrimeProductFiniteInput : Prop :=
  ∀ x : ℝ, (10 : ℝ) ^ 8 ≤ x → x < Real.exp 10000 →
    ∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p ≤ Real.log (Real.log x) + 0.27 + 5 / Real.log x

/-- Schoenfeld's explicit Chebyshev bound (§0.3). -/
theorem theta_lt_of_schoenfeld (h : SchoenfeldFiniteRangeInput) {x : ℝ} (hx : 0 < x) :
    Chebyshev.theta x < 1.000081 * x := by
  sorry

/-- Rosser–Schoenfeld's two-sided prime-count bound for `x ≥ 59` (§0.5). -/
theorem primeCounting_bounds_of_rosserSchoenfeld (h : RosserSchoenfeldFiniteRangeInput) {x : ℝ}
    (hx : 59 ≤ x) :
    x / Real.log x * (1 + 1 / (2 * Real.log x)) < (Nat.primeCounting ⌊x⌋₊ : ℝ) ∧
      (Nat.primeCounting ⌊x⌋₊ : ℝ) < x / Real.log x * (1 + 3 / (2 * Real.log x)) := by
  sorry

/-- Separation of a real quadratic zero from one with the literal constant `40` (§0.7). -/
theorem quadratic_real_zero_le_of_bmor (h₁ : BMORFiniteInput) (h₂ : BMORClassNumberInput) :
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 3 ≤ q → χ.IsQuadratic → χ ≠ 1 →
      ∀ β : ℝ, 0 < β → DirichletCharacter.LFunction χ (β : ℂ) = 0 →
        β ≤ 1 - 40 / (Real.sqrt q * Real.log q ^ 2) := by
  sorry

/-- The mod-eight prime mass on `(k/2, k]` (§0.16). -/
theorem thetaAP_eight_interval_ge (h : ModEightFiniteInput) (a : ZMod 8) (ha : a = 3 ∨ a = 5)
    {k : ℝ} (hk : 2 * (10 : ℝ) ^ 10 ≤ k) :
    (1 - 3 * 0.002811) * k / 8 ≤ thetaAP 8 a k - thetaAP 8 a (k / 2) := by
  sorry

/-- The explicit prime Euler-product bound (§0.25). -/
theorem prod_one_add_inv_prime_le (h : PrimeProductFiniteInput) {x : ℝ} (hx : (10 : ℝ) ^ 8 ≤ x) :
    ∏ p ∈ Nat.primesLE ⌊x⌋₊, (1 + (1 : ℝ) / p) ≤ 2 * Real.log x := by
  sorry

/-! ### Logarithmic factorials and Mertens's constants (§§0.11d, 0.26a) -/

/-- Chebyshev's identity `log ⌊x⌋! = Σ_{n ≤ x} Λ(n) ⌊x / n⌋ = Σ_{m ≤ x} ψ(x / m)` (§0.11d). -/
theorem log_floor_factorial_eq_sum_vonMangoldt (x : ℝ) :
    Real.log (⌊x⌋₊.factorial : ℝ) =
        ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, ArithmeticFunction.vonMangoldt n * (⌊x / n⌋₊ : ℝ) ∧
      Real.log (⌊x⌋₊.factorial : ℝ) = ∑ m ∈ Finset.Icc 1 ⌊x⌋₊, Chebyshev.psi (x / m) := by
  sorry

/-- Bounds for `log ⌊x⌋!` at real `x ≥ 1` with half-logarithm terms, sharpening Mathlib's
`Real.le_sum_log` and `Real.sum_log_le` (§0.11d). -/
theorem log_floor_factorial_bounds {x : ℝ} (hx : 1 ≤ x) :
    x * Real.log x - x - Real.log x / 2 + Real.log Real.pi / 2 ≤
        Real.log (⌊x⌋₊.factorial : ℝ) ∧
      Real.log (⌊x⌋₊.factorial : ℝ) ≤ x * Real.log x - x + Real.log x / 2 + 1 := by
  sorry

/-- Mertens's second theorem in von Mangoldt form, with Euler's constant (§0.26a). -/
theorem mertens_vonMangoldt_eulerGamma :
    ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
      |∑ n ∈ Finset.Icc 2 ⌊x⌋₊, ArithmeticFunction.vonMangoldt n / (n * Real.log n) -
          Real.log (Real.log x) - Real.eulerMascheroniConstant| ≤ C / Real.log x := by
  sorry

/-- The reciprocal-prime constant of Mertens's second theorem is
`γ + Σ_p (log (1 - 1/p) + 1/p)` (§0.26a). -/
theorem mertens_reciprocal_prime_constant :
    Summable (fun p : Nat.Primes => Real.log (1 - 1 / ((p : ℕ) : ℝ)) + 1 / ((p : ℕ) : ℝ)) ∧
      ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
        |∑ p ∈ Nat.primesLE ⌊x⌋₊, (1 : ℝ) / p - Real.log (Real.log x) -
            (Real.eulerMascheroniConstant + ∑' p : Nat.Primes,
              (Real.log (1 - 1 / ((p : ℕ) : ℝ)) + 1 / ((p : ℕ) : ℝ)))| ≤ C / Real.log x := by
  sorry

/-! ### The local expansion of `ζ′/ζ` and its half-plane bounds (§§0.30a, 0.33a) -/

/-- The nested-disc expansion of `ζ′/ζ` about a centre right of one, keeping the pole term and
counting every zero of the disc, trivial ones included, with its analytic order (§0.30a). -/
theorem riemannZeta_local_logDeriv {σ₀ r r' : ℝ} (hσ₀ : 1 < σ₀) (hr : 0 < r) (hrr' : r < r') :
    ∃ C : ℝ, ∀ s₀ s : ℂ, s₀.re = σ₀ → ‖s - s₀‖ ≤ r → s ≠ 1 → riemannZeta s ≠ 0 →
      ‖deriv riemannZeta s / riemannZeta s + 1 / (s - 1) -
          ∑ᶠ ρ : {z : ℂ // ‖z - s₀‖ ≤ r' ∧ riemannZeta z = 0},
            ((analyticOrderAt riemannZeta ρ.val).toNat : ℂ) / (s - ρ.val)‖ ≤
        C * Real.log (|s₀.im| + 2) := by
  sorry

/-- The window form of the local expansion for `ζ`, the conductor-one case of §0.30a. -/
theorem riemannZeta_logDeriv_window :
    ∃ C : ℝ, ∀ s : ℂ, -1 ≤ s.re → s.re ≤ 2 → s ≠ 1 → riemannZeta s ≠ 0 →
      ‖deriv riemannZeta s / riemannZeta s + 1 / (s - 1) -
          ∑ᶠ ρ : {z : ℂ // 0 < z.re ∧ z.re < 1 ∧ |z.im - s.im| ≤ 1 ∧ riemannZeta z = 0},
            ((analyticOrderAt riemannZeta ρ.val).toNat : ℂ) / (s - ρ.val)‖ ≤
        C * Real.log (|s.im| + 2) := by
  sorry

/-- Every unit interval of heights contains one on which `ζ′/ζ` is `O(log² T)` across
`-1 ≤ re s ≤ 2`, on both horizontal edges (§0.30a). -/
theorem riemannZeta_safe_height :
    ∃ C : ℝ, ∀ T : ℝ, 2 ≤ T → ∃ T' ∈ Set.Icc T (T + 1), ∀ σ : ℝ, -1 ≤ σ → σ ≤ 2 →
      ∀ s ∈ ({(σ : ℂ) + (T' : ℂ) * I, (σ : ℂ) - (T' : ℂ) * I} : Set ℂ),
        riemannZeta s ≠ 0 ∧
          ‖deriv riemannZeta s / riemannZeta s‖ ≤ C * Real.log (T + 2) ^ 2 := by
  sorry

/-- Pole-subtracted bounds for `ζ′` and `ζ′/ζ` on the whole half-plane right of the classical
curve `re s = 1 - β / log (|im s| + 2)` (§0.33a). -/
theorem riemannZeta_deriv_logDeriv_bound :
    ∃ β C : ℝ, 0 < β ∧ β < 1 ∧ ∀ s : ℂ, s ≠ 1 →
      1 - β / Real.log (|s.im| + 2) ≤ s.re →
        riemannZeta s ≠ 0 ∧
          ‖deriv riemannZeta s + 1 / (s - 1) ^ 2‖ ≤ C * Real.log (|s.im| + 2) ^ 2 ∧
          ‖deriv riemannZeta s / riemannZeta s + 1 / (s - 1)‖ ≤ C * Real.log (|s.im| + 2) := by
  sorry

/-- Siegel–Walfisz in ψ form, uniformly for `q ≤ (log x) ^ B` (§0.32). The README requires an
effective constant and threshold, obtained from §0.34 through §0.18. -/
theorem siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |psiAP q a x - x / q.totient| ≤ C * x * Real.log x ^ (-A) := by
  sorry

/-- Siegel–Walfisz transfers to prime counts with the logarithmic-integral main term, with the
same effective constant and threshold (§0.32). -/
theorem siegel_walfisz_primeCount (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B →
      ∀ a : ZMod q, IsUnit a →
        |(primeCountAP q a x : ℝ) - (∫ t : ℝ in (2 : ℝ)..x, 1 / Real.log t) / q.totient| ≤
          C * x * Real.log x ^ (-A) := by
  sorry

/-! ### Primary factors, products and the paired Hadamard theorem (§§0.15, 0.29) -/

/-- Weierstrass's primary factor `E_p(w) = (1 - w) exp(w + ⋯ + w^p / p)`; `E₀(w) = 1 - w`. -/
def elementaryFactor (p : ℕ) (w : ℂ) : ℂ :=
  (1 - w) * Complex.exp (∑ k ∈ Finset.range p, w ^ (k + 1) / (k + 1))

/-- Primary products over an arbitrary countable index with variable genera converge locally
uniformly to an entire function whose analytic orders are the zero-fibre cardinalities (§0.15). -/
theorem exists_entire_primary_product_exact (ι : Type*) [Countable ι]
    (a : ι → ℂ) (p : ι → ℕ) (ha : ∀ i, a i ≠ 0)
    (hEscape : Tendsto (fun i => ‖a i‖) (Filter.cofinite : Filter ι) atTop)
    (hsum : ∀ R : ℝ, 0 < R → Summable (fun i => (R / ‖a i‖) ^ (p i + 1))) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn (fun i z => elementaryFactor (p i) (z / a i)) F Set.univ ∧
      DifferentiableOn ℂ F Set.univ ∧
      ∀ z, analyticOrderAt F z = (Nat.card {i // a i = z} : ℕ∞) := by
  sorry

/-- Two nonzero entire functions with the same divisor differ by an entire exponential
factor (§0.15a). -/
theorem exists_entire_exp_mul_of_divisor_eq (f F : ℂ → ℂ)
    (hf : Differentiable ℂ f) (hF : Differentiable ℂ F)
    (hf_ne : ∃ z, f z ≠ 0) (hF_ne : ∃ z, F z ≠ 0)
    (hdiv : MeromorphicOn.divisor f Set.univ = MeromorphicOn.divisor F Set.univ) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ ∀ z, f z = Complex.exp (g z) * F z := by
  sorry

/-- Finite-order Hadamard factorization, including multiplicities, genus summability,
locally uniform convergence and the degree of the polynomial exponential factor (§0.23). -/
theorem finite_order_hadamard (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hgrowth : ∀ b : ℝ, ρ < b → ∃ C > 0, ∀ z : ℂ,
      ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)) :
    let E := fun (α : {a : ℂ // a ≠ 0}) (z : ℂ) =>
      elementaryFactor ⌊ρ⌋₊ (z / α.val) ^ (analyticOrderAt f α.val).toNat
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

/-- The log-free primitive-character density estimate (Jutila's bound for `σ ≥ 4/5` and
Montgomery's for `σ ≤ 4/5` imply it); the bound is at least one, so every exceptional zero is
counted without a separate term. -/
theorem selberg_zero_density {ε : ℝ} (hε : 0 < ε) :
    ∃ C > 0, ∀ Q T σ : ℝ, 2 ≤ Q → 2 ≤ T → 1 / 2 ≤ σ → σ ≤ 1 →
      (∑ q : Fin ⌊Q⌋₊, ∑ χ : DirichletCharacter ℂ (q.val + 1),
        if χ.IsPrimitive then
          ∑ᶠ z : {z : ℂ // σ ≤ z.re ∧ z.re < 1 ∧ |z.im| ≤ T ∧
            DirichletCharacter.LFunction χ z = 0},
            ((analyticOrderAt (DirichletCharacter.LFunction χ) z.val).toNat : ℝ)
        else 0) ≤ C * (Q ^ (5 + ε) * T ^ (3 + ε)) ^ (1 - σ) := by
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

/-! ### Weil's explicit formula for `ζ` with `C¹` test functions (§1.8a) -/

/-- `C¹` test functions whose values and derivatives are integrable against
`exp ((1/2 + ε) |x|)` for some `ε > 0` (§1.8a). -/
def WeilC1TestFunction (F : ℝ → ℂ) : Prop :=
  ContDiff ℝ 1 F ∧ ∃ ε > 0,
    MeasureTheory.Integrable (fun x => Real.exp ((1 / 2 + ε) * |x|) • F x) ∧
    MeasureTheory.Integrable (fun x => Real.exp ((1 / 2 + ε) * |x|) • deriv F x)

/-- Gauss's integral for the digamma function on the right half-plane, with absolutely
integrable combined integrand (§1.8a). -/
theorem digamma_eq_integral {z : ℂ} (hz : 0 < z.re) :
    let g : ℝ → ℂ := fun t =>
      Complex.exp (-(t : ℂ)) / (t : ℂ) - Complex.exp (-z * (t : ℂ)) / (1 - Complex.exp (-(t : ℂ)))
    MeasureTheory.IntegrableOn g (Set.Ioi 0) ∧ Complex.digamma z = ∫ t in Set.Ioi 0, g t := by
  sorry

/-- Weil's explicit formula for `ζ` with `C¹` test functions (§1.8a): the archimedean integrand
is integrable, the prime series converges absolutely, and the symmetric zero sum, with analytic
orders, converges to `Φ(0) + Φ(1) - W_∞(F)` minus the prime series. -/
theorem zeta_weil_explicit_formula (F : ℝ → ℂ) (hF : WeilC1TestFunction F) :
    let Φ : ℂ → ℂ := fun s => ∫ x : ℝ, F x * Complex.exp ((s - 1 / 2) * (x : ℂ))
    let g : ℝ → ℂ := fun x =>
      (F (x / 2) + F (-x / 2)) * Complex.exp (-(x : ℂ) / 4) / (1 - Complex.exp (-(x : ℂ))) -
        2 * F 0 * Complex.exp (-(x : ℂ)) / (x : ℂ)
    let P : ℕ → ℂ := fun n => (ArithmeticFunction.vonMangoldt n : ℂ) / (Real.sqrt n : ℂ) *
      (F (Real.log n) + F (-Real.log n))
    MeasureTheory.IntegrableOn g (Set.Ioi 0) ∧ Summable (fun n => ‖P n‖) ∧
      Tendsto (fun T : ℝ =>
        ∑ᶠ ρ : {z : ℂ // 0 < z.re ∧ z.re < 1 ∧ |z.im| < T ∧ riemannZeta z = 0},
          ((analyticOrderAt riemannZeta ρ.val).toNat : ℂ) * Φ ρ.val)
        atTop (𝓝 (Φ 0 + Φ 1 - (F 0 * (Real.log Real.pi : ℂ) + (1 / 2 : ℂ) * ∫ x in Set.Ioi 0, g x) -
          ∑' n, P n)) := by
  sorry

/-! ## Layer 2: Number-field estimates -/

open _root_.NumberField

/-! ### The level-one Eisenstein series (§2.1b) -/

/-- The primitive-pair Eisenstein series for `PSL₂(ℤ)`, initially for `1 < re s`; the factor
`1 / 2` counts each pair of opposite primitive vectors once (§2.1b). -/
def nonholomorphic_eisenstein (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  1 / 2 * (z.im : ℂ) ^ s *
    ∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1},
      (‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ : ℂ) ^ (-2 * s)

/-- The completed Eisenstein series `E* = Λ(2s) E` continues meromorphically with simple poles at
`0, 1`, residues `−1/2, 1/2`, and `E*(z, 1 − s) = E*(z, s)` (§2.1b). -/
theorem completed_eisenstein_continuation :
    ∃ E : UpperHalfPlane → ℂ → ℂ,
      (∀ z, MeromorphicOn (E z) Set.univ) ∧
      (∀ z, AnalyticOnNhd ℂ (E z) ({0, 1}ᶜ : Set ℂ)) ∧
      (∀ z s, 1 < s.re →
        E z s = completedRiemannZeta (2 * s) * nonholomorphic_eisenstein z s) ∧
      (∀ z s, s ∉ ({0, 1} : Set ℂ) → E z (1 - s) = E z s) ∧
      (∀ z, Tendsto (fun s => s * E z s) (𝓝[≠] 0) (𝓝 (-1 / 2))) ∧
      (∀ z, Tendsto (fun s => (s - 1) * E z s) (𝓝[≠] 1) (𝓝 (1 / 2))) := by
  sorry

/-! ### Zaman's digamma input and the 35/19 prime-ideal count (§§2.9–2.9a) -/

/-- `δ(x, t) = Re ψ((x + i t) / 2)` for the digamma function `ψ = Γ′/Γ` (§2.9a). -/
def zamanDelta (x t : ℝ) : ℝ :=
  (deriv Complex.Gamma (((x : ℂ) + (t : ℂ) * I) / 2) /
    Complex.Gamma (((x : ℂ) + (t : ℂ) * I) / 2)).re

/-- `G₁(α, t)` of §2.9a. -/
def zamanG₁ (α t : ℝ) : ℝ :=
  (zamanDelta (α + 1) 0 + zamanDelta (α + 1) t) / 2 - Real.log Real.pi

/-- `G₂(α, t)` of §2.9a. -/
def zamanG₂ (α t : ℝ) : ℝ :=
  (zamanDelta (α + 1) 0 + zamanDelta (α + 2) 0 + zamanDelta (α + 1) t + zamanDelta (α + 2) t) / 4 -
    Real.log Real.pi

/-- `Q(α, t)` of §2.9a, with `W₁(α) = Σ (α + 1 + 2k)⁻²` and `W₂(α) = Σ (α + 1 + k)⁻²`. -/
def zamanQ (α t : ℝ) : ℝ :=
  (α + 1 / 2) ^ 2 / α * (1 / α + max 0 (max
    ((zamanG₁ α t + α * ∑' k : ℕ, (α + 1 + 2 * k)⁻¹ ^ 2) / (α * Real.log 60))
    ((zamanG₂ α t + α * (∑' k : ℕ, (α + 1 + k)⁻¹ ^ 2) / 2) / (α * Real.log 22))))

/-- Zaman's finitely many digamma inequalities (§2.9a): `Q(α, T) < C/24` at the eleven listed
`(T, α, C)` and the real-secondary-zero inequality at `α = 5.8`. -/
def ZamanDigammaInput : Prop :=
  (∀ r ∈ ([(1, 3.50, 31.4), (3.5, 3.77, 32.7), (8.7, 5.39, 35), (22, 7.30, 38.4),
      (54, 8.92, 42), (134, 10.17, 45.9), (332, 11.21, 49.7), (825, 12.26, 53.6),
      (2048, 13.22, 57.4), (5089, 14.17, 61.2), (12646, 15.23, 65)] : List (ℝ × ℝ × ℝ)),
      zamanQ r.2.1 r.1 < r.2.2 / 24) ∧
    (5.8 + 1) ^ 2 / (2 * 5.8) * (1 / 5.8 + max 0 (max
      (zamanG₁ 5.8 0 / (5.8 * Real.log 60)) (zamanG₂ 5.8 0 / (5.8 * Real.log 22)))) < (0.6882 : ℝ)

/-- Zaman's effective lower bound for prime ideals with the exponents `35` and `19` (§2.9): the
threshold `D₀` is absolute and `c_n` depends only on the degree. -/
theorem primeIdeal_lower_thirtyfive_nineteen (h : ZamanDigammaInput) :
    ∃ D₀ : ℝ, 2 ≤ D₀ ∧ ∀ n : ℕ, 1 ≤ n → ∃ c : ℝ, 0 < c ∧
      ∀ (k : Type) [Field k] [NumberField k], Module.finrank ℚ k = n →
        D₀ ≤ |(discr k : ℝ)| → ∀ Y : ℝ, |(discr k : ℝ)| ^ (35 : ℝ) ≤ Y →
          c * |(discr k : ℝ)| ^ (-19 : ℝ) * Y / Real.log Y ≤
            (Nat.card {P : Ideal (𝓞 k) // P.IsPrime ∧ P ≠ ⊥ ∧
              (Ideal.absNorm P : ℝ) ≤ Y} : ℝ) := by
  sorry

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

/-- The small-conductor input (§3.2): every primitive quadratic conductor `1 < N < 1.2 · 10¹⁰`
has largest prime factor exceeding `0.94 log N`. -/
def QuadraticConductorFiniteInput : Prop :=
  ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), 1 < N → N < 12000000000 →
    χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 → 0.94 * Real.log N < ((N.primeFactors.sup id : ℕ) : ℝ)

/-- The largest prime factor of a primitive quadratic conductor exceeds `0.94 log N` (§3.2). -/
theorem largest_prime_factor_quadratic_conductor (h₁ : SchoenfeldFiniteRangeInput)
    (h₂ : QuadraticConductorFiniteInput) :
    ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), 1 < N →
      χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 → 0.94 * Real.log N < ((N.primeFactors.sup id : ℕ) : ℝ) := by
  sorry

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

/-- The BBR finite divisor and integral inequalities (§3.23a), with the scaled `7/4` tail bound
on `[1, 2]` and from `T = 2`. -/
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
  (∀ T : ℝ, 1 ≤ T → T ≤ 2 →
    T ^ (1 / 4 : ℝ) * |divisorRemainderIntegral 1 T (7 / 4) - κ₇| ≤ 1 / 2) ∧
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

/-- Ingham's unconditional second-moment asymptotic with an absolute constant; it follows from
`atkinson_formula` and the weighted divisor sums alone. -/
theorem mean_square : error =O[atTop] (fun T : ℝ => Real.sqrt T * Real.log T) := by
  sorry

end zetaSecondMoment

/-- The divisor-square Euler identity `ζ(s)⁴ = ζ(2s) Σ τ(n)² n^{-s}` on `re s > 1`, with
absolute convergence of the divisor-square series (§3.24a). -/
theorem riemannZeta_pow_four_eq_mul_LSeries_divisor_sq {s : ℂ} (hs : 1 < s.re) :
    LSeriesSummable (fun n : ℕ => (n.divisors.card : ℂ) ^ 2) s ∧
      riemannZeta s ^ 4 =
        riemannZeta (2 * s) * LSeries (fun n : ℕ => (n.divisors.card : ℂ) ^ 2) s := by
  sorry

namespace zetaFourthMoment

/-- The fourth moment has leading coefficient one over twice pi squared. -/
theorem asymptotic :
    (fun T : ℝ => (∫ t : ℝ in (0 : ℝ)..T,
      ‖riemannZeta (1 / 2 + (t : ℂ) * I)‖ ^ 4) - T * Real.log T ^ 4 / (2 * Real.pi ^ 2))
        =O[atTop] (fun T => T * Real.log T ^ 3) := by
  sorry

end zetaFourthMoment

end TauCetiRoadmap.AnalyticNumberTheoryPartI
