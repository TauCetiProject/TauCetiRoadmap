import Mathlib

/-!
# Zeros of L-functions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the two definitions they
need: the zero count `zeroCount` (the natural-number count of Layer 4) and the entire completion
`riemannXi` of the Riemann zeta function (the `ζ` instance of the entire completion of Layer 0).

Stated here, for the instances whose carriers exist at the pins (the Riemann zeta function and
Dirichlet L-functions, which are the finite-order Hecke L-functions over `ℚ`):

* Layer 3, the convexity bound on the critical line, uniform in the conductor;
* Layer 5, Hadamard's factorization of `riemannXi`;
* Layer 6, the de la Vallée Poussin region for `ζ`, and the uniform region for Dirichlet
  L-functions with its exceptional-zero clause and the normalization `c ≤ log 3 / 2`;
* Layer 7, the Riemann–von Mangoldt formula for `ζ`, and its conductor-uniform form for
  primitive Dirichlet characters;
* Layer 8, the truncated explicit formula for `Chebyshev.psi`, the effective prime number
  theorem in arithmetic progressions (the `K = ℚ` case of the ray-class count of 8.7), and the
  effective prime ideal theorem over an arbitrary number field (8.5).

Not statable at the pins:

* every zero statement about the Dedekind zeta function of a number field `K ≠ ℚ` or about a
  Hecke L-function over such a `K` (Layers 6.2–6.4, 7.6 in the Dedekind and Hecke cases, the
  Weil explicit formula 8.4 and 8.6, and the prime sums 8.6): Mathlib's
  `NumberField.dedekindZeta` is the Dirichlet series itself, a junk value off `Re s > 1`, and
  neither library has its meromorphic continuation, its completion, or a Hecke L-function;
* the general ray-class count of 8.7 and its abelian Chebotarev transport 8.8: Mathlib has no
  ray class group, no Artin map and no Frobenius-class prime count.

The general growth, counting, rectangle-contour and certificate layers (0, 1, 2, 4, 7.1–7.3,
9) are README targets: their statements are about arbitrary meromorphic functions or about the
L-functions roadmap's analytic data, so they are not headline theorems about this roadmap's
objects.
-/

namespace TauCetiRoadmap.ZerosOfLFunctions

open Complex Filter Asymptotics Set
open scoped Real

/-- **Layer 4.1, the zero count.** The number of zeros of `f` in `R`, with multiplicity: the
finite sum over `R` of the positive part of the divisor of `f` on `U`. Poles contribute `0`,
and the sum is meaningful when `f` is meromorphic on `U ⊇ R` and its divisor has finite support
in `R` (a finsum over an infinite support is `0`). -/
noncomputable def zeroCount (f : ℂ → ℂ) (U R : Set ℂ) : ℕ :=
  ∑ᶠ ρ ∈ R, (MeromorphicOn.divisor f U ρ).toNat

/-- **Layer 0.2 at the `ζ` instance, the entire completion.** `riemannXi s = s (s − 1) Λ(s)`,
where `Λ = completedRiemannZeta`; it is written through the entire function
`completedRiemannZeta₀ = Λ + 1/s + 1/(1 − s)`, so that it is a genuine entire function with
the correct value `1` at `s = 0` and `s = 1`, where `Λ` has simple poles. It is twice Riemann's
`ξ`. -/
noncomputable def riemannXi (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s + 1

/-! ## Layer 3: convexity -/

/-- **Layer 3.3, the convexity bound, uniform in the conductor.** For every `ε > 0` there is
`C` such that every primitive Dirichlet character `χ` modulo `q` satisfies
`‖L(1/2 + it, χ)‖ ≤ C (q (|t| + 3))^{1/4 + ε}` for all real `t`. At `q = 1` this is
`ζ(1/2 + it) ≪ |t|^{1/4 + ε}` (Titchmarsh §5.1); the general form is the convexity bound of
Iwaniec–Kowalski §5.2 for the analytic conductor `q(|t| + 3)`. -/
theorem dirichletLFunction_convexity (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → ∀ t : ℝ,
      ‖DirichletCharacter.LFunction χ (1 / 2 + t * I)‖ ≤
        C * ((q : ℝ) * (|t| + 3)) ^ (1 / 4 + ε) := sorry

/-! ## Layer 5: Hadamard factorization -/

/-- **Layer 5.6 at the `ζ` instance, Hadamard's factorization.** There are constants `A, B`
with `riemannXi s = exp (A + B s) ∏_ρ ((1 − s/ρ) e^{s/ρ})^{m_ρ}` for every `s`, the product
over the zeros `ρ` of `riemannXi` with their multiplicities `m_ρ`, and the product is
unconditionally convergent (Davenport, *Multiplicative Number Theory*, §12). The index is all
of `ℂ`, the exponent being `0` off the zeros; `riemannXi 0 = 1`, so `ρ = 0` contributes `1`. -/
theorem riemannXi_hadamard :
    ∃ A B : ℂ, ∀ s : ℂ,
      Multipliable (fun ρ : ℂ ↦
        ((1 - s / ρ) * cexp (s / ρ)) ^ (MeromorphicOn.divisor riemannXi univ ρ).toNat) ∧
      riemannXi s = cexp (A + B * s) *
        ∏' ρ : ℂ, ((1 - s / ρ) * cexp (s / ρ)) ^ (MeromorphicOn.divisor riemannXi univ ρ).toNat :=
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
`|N±(T, χ) − (T/π) log (qT/2πe)| ≤ C log (qT)` for `T ≥ 2` (Trudgian, Theorem 1, and Davenport
§16). The conductor enters as `q`, not `q^{1/2}`; at `q = 1` this is twice the count of
`riemannVonMangoldt`. -/
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

/-- **Layer 8.7 at `K = ℚ`, the effective prime number theorem in arithmetic progressions.**
There is an absolute `c > 0` such that for every modulus `q ≥ 1` and residue `a` prime to `q`,
`π(x; q, a) = Li(x)/φ(q) + O(x exp(−c √log x))`, the implied constant depending on `q`
(Davenport §20; for fixed `q` the possible exceptional term `Li(x^β)/φ(q)` is absorbed). The
main term is the offset logarithmic integral `∫₂ˣ dt / log t`, not `x / log x`. At `q = 1` this
is de la Vallée Poussin's `π(x) = Li(x) + O(x exp(−c √log x))`. -/
theorem primeCounting_progression_effective :
    ∃ c : ℝ, 0 < c ∧ ∀ q a : ℕ, 0 < q → Nat.Coprime a q →
      (fun x : ℝ ↦ ((((Nat.primesBelow (⌊x⌋₊ + 1)).filter (· ≡ a [MOD q])).card : ℕ) : ℝ) -
          (∫ t in (2 : ℝ)..x, (Real.log t)⁻¹) / q.totient)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

/-- **Layer 8.5, the effective prime ideal theorem.** For a number field `K` there is `c > 0`
such that the number of nonzero prime ideals of `𝓞 K` of norm at most `x` is
`Li(x) + O(x exp(−c √log x))`, the constants depending on `K`. For fixed `K` a possible
exceptional zero `β` of `ζ_K` contributes `Li(x^β)`, which the error absorbs. -/
theorem primeIdealCount_effective (K : Type*) [Field K] [NumberField K] :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ ↦ (Set.ncard
            {P : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) |
              (Ideal.absNorm P.asIdeal : ℝ) ≤ x} : ℝ) -
          ∫ t in (2 : ℝ)..x, (Real.log t)⁻¹)
        =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x)) := sorry

end TauCetiRoadmap.ZerosOfLFunctions
