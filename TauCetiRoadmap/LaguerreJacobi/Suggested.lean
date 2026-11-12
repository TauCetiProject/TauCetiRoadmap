/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.InnerProductSpace.WeightedOrthogonalBasis

/-!
# The Laguerre and Jacobi polynomials and their L² bases: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib and Tau Ceti, with `sorry`, and every
definition has its real body.

The headline targets are:

* Layer 1: the generalized Laguerre polynomials over a `ℚ`-algebra, their degree, recurrences,
  derivative identity, analytic Rodrigues formula, and special values;
* Layer 2: the Laguerre measure, its finite exponential moment, the orthogonality relation with
  its exact constant, and the two Hilbert bases of `L²`;
* Layer 3: the Jacobi polynomials over a `ℚ`-algebra, the Beta integral in interval form, their
  degree, recurrences, reflection symmetry, derivative identity and analytic Rodrigues formula;
* Layer 4: the Jacobi measure, its finite exponential moment, the orthogonality relation with a
  uniformly positive norm sequence (including the case `n = 0`, `α + β = -1`), and the two
  Hilbert bases of `L²`;
* Layer 5: the tensor Laguerre and Jacobi bases;
* Layer 6: Legendre orthogonality and the shifted Legendre transport, the Gegenbauer polynomials
  with their degree, Jacobi relation and orthogonality, and the Chebyshev consistency check
  against Mathlib's `Polynomial.Chebyshev.measureT`.

Conventions: the base ring is `[CommRing R] [Algebra ℚ R]`, every rational coefficient enters as
a `ℚ`-scalar, and no division in `R` is used. Measures are built in the shape of
`TauCeti.hilbertBasisOfWeightedMeasure`, namely `(volume.restrict s).withDensity` of
`ENNReal.ofReal` of the weight. The roadmap's own declarations live in the namespaces
`Polynomial` and `ProbabilityTheory`, in which Mathlib has no declaration of the same name.

All headline targets of the roadmap are statable at the pins.
-/

open MeasureTheory Filter Topology Set
open scoped Real

/-! ## Layer 1: the Laguerre polynomials -/

namespace Polynomial

/-- **Layer 1.** The generalized Laguerre polynomial `Lₙ^{(α)}` over a `ℚ`-algebra,
`∑ k ≤ n, (-1)^k (α + k + 1)_{n-k} / ((n-k)! k!) • X^k`. The rational factorial coefficients are
`ℚ`-scalars acting on the elements `(α + k + 1)_{n-k}` of `R` (DLMF 18.5.12). -/
noncomputable def laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      (ascPochhammer R (n - k)).smeval (α + k + 1))) • X ^ k

/-- **Layer 1.** `L₀^{(α)} = 1`. -/
theorem laguerre_zero {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) : laguerre α 0 = 1 :=
  sorry

/-- **Layer 1.** `L₁^{(α)} = (α + 1) - X`. -/
theorem laguerre_one {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) :
    laguerre α 1 = C (α + 1) - X :=
  sorry

/-- **Layer 1.** The coefficients of `Lₙ^{(α)}`: for `k ≤ n` the coefficient of `X^k` is
`(-1)^k (α + k + 1)_{n-k} / ((n-k)! k!)`, and the higher coefficients vanish. -/
theorem coeff_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n k : ℕ) :
    (laguerre α n).coeff k =
      if k ≤ n then
        (-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
          (ascPochhammer R (n - k)).smeval (α + k + 1))
      else 0 :=
  sorry

/-- **Layer 1.** `Lₙ^{(α)}` has degree exactly `n` (DLMF Table 18.3.1: `kₙ = (-1)^n / n!`). -/
theorem degree_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] [Nontrivial R] (α : R) (n : ℕ) :
    (laguerre α n).degree = n :=
  sorry

/-- **Layer 1.** `natDegree (Lₙ^{(α)}) = n`. -/
theorem natDegree_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] [Nontrivial R] (α : R)
    (n : ℕ) : (laguerre α n).natDegree = n :=
  sorry

/-- **Layer 1.** The leading coefficient of `Lₙ^{(α)}` is `(-1)^n / n!`. -/
theorem leadingCoeff_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    (laguerre α n).leadingCoeff = algebraMap ℚ R ((-1) ^ n / n.factorial) :=
  sorry

/-- **Layer 1.** The three-term recurrence (DLMF 18.9.13 shifted by two):
`(n+2) Lₙ₊₂^{(α)} = (2n + α + 3 - X) Lₙ₊₁^{(α)} - (n + α + 1) Lₙ^{(α)}`. -/
theorem laguerre_succ_succ {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    (n + 2) • laguerre α (n + 2) =
      (C (2 * n + α + 3) - X) * laguerre α (n + 1) - C (n + α + 1) * laguerre α n :=
  sorry

/-- **Layer 1.** The derivative moves the parameter: `(Lₙ₊₁^{(α)})' = -Lₙ^{(α+1)}`. Stated at
`n + 1` because the `n` form is false at `n = 0`, where `L₀^{(α)}' = 0` but `-L₋₁^{(α+1)}` is
read with truncated subtraction as `-1`. -/
theorem derivative_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    derivative (laguerre α (n + 1)) = -laguerre (α + 1) n :=
  sorry

/-- **Layer 1.** DLMF 18.9.13: `Lₙ₊₁^{(α)} = Lₙ₊₁^{(α+1)} - Lₙ^{(α+1)}`. -/
theorem laguerre_add_one_sub {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    laguerre α (n + 1) = laguerre (α + 1) (n + 1) - laguerre (α + 1) n :=
  sorry

/-- **Layer 1.** Special value at the origin: `Lₙ^{(α)}(0) = (α + 1)_n / n!`. -/
theorem eval_zero_laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) :
    (laguerre α n).eval 0 = ((1 : ℚ) / n.factorial) • (ascPochhammer R n).smeval (α + 1) :=
  sorry

/-- **Layer 1.** The Rodrigues formula (DLMF 18.5.5, Table 18.5.1), as an identity of real
functions on `(0, ∞)`:
`Lₙ^{(α)}(x) = x^{-α} eᵡ / n! · dⁿ/dxⁿ (e^{-x} x^{n+α})`. For real `α` the function
`x ^ (n + α)` is not a polynomial, so this is an analytic statement and not an identity of
polynomials. -/
theorem laguerre_rodrigues (α : ℝ) (n : ℕ) {x : ℝ} (hx : 0 < x) :
    (laguerre α n).eval x =
      x ^ (-α) * Real.exp x / n.factorial *
        iteratedDeriv n (fun t : ℝ => Real.exp (-t) * t ^ ((n : ℝ) + α)) x :=
  sorry

/-! ## Layer 2: Laguerre orthogonality and the `L²` bases -/

/-- **Layer 2.** The Laguerre measure `x^α e^{-x} dx` on `(0, ∞)`, in the shape
`μ.withDensity (ENNReal.ofReal ∘ w)` of `TauCeti.hilbertBasisOfWeightedMeasure` with
`μ = volume.restrict (Ioi 0)`. -/
noncomputable def laguerreMeasure (α : ℝ) : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun x => ENNReal.ofReal (x ^ α * Real.exp (-x))

/-- **Layer 2.** For `-1 < α` the Laguerre measure is finite; its total mass is `Γ(α + 1)`. -/
theorem isFiniteMeasure_laguerreMeasure {α : ℝ} (hα : -1 < α) :
    IsFiniteMeasure (laguerreMeasure α) :=
  sorry

/-- **Layer 2.** Integration against the Laguerre measure, in the shape of
`Polynomial.Chebyshev.integral_measureT`. -/
theorem integral_laguerreMeasure (α : ℝ) (f : ℝ → ℝ) :
    ∫ x, f x ∂laguerreMeasure α = ∫ x in Ioi 0, x ^ α * Real.exp (-x) * f x :=
  sorry

/-- **Layer 2.** The finite exponential moment of the Laguerre measure: for `-1 < α` and
`0 < a < 1`, `exp (a |x|)` is integrable. This is the completeness hypothesis of
`TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`. -/
theorem integrable_exp_mul_abs_laguerreMeasure {α a : ℝ} (hα : -1 < α) (ha0 : 0 < a)
    (ha1 : a < 1) : Integrable (fun x : ℝ => Real.exp (a * |x|)) (laguerreMeasure α) :=
  sorry

/-- **Layer 2.** The boundary terms of the integration by parts at the origin: for `-1 < α` and
`j < n`, the `j`-th derivative of `e^{-t} t^{n+α}` tends to `0` as `t → 0⁺`. -/
theorem tendsto_nhdsGT_zero_iteratedDeriv_laguerreWeight {α : ℝ} (hα : -1 < α) {j n : ℕ}
    (hj : j < n) :
    Tendsto (iteratedDeriv j (fun t : ℝ => Real.exp (-t) * t ^ ((n : ℝ) + α))) (𝓝[>] 0)
      (𝓝 0) :=
  sorry

/-- **Layer 2.** The boundary terms of the integration by parts at infinity: for every `j` the
`j`-th derivative of `e^{-t} t^{n+α}` tends to `0` as `t → ∞`. -/
theorem tendsto_atTop_iteratedDeriv_laguerreWeight (α : ℝ) (j n : ℕ) :
    Tendsto (iteratedDeriv j (fun t : ℝ => Real.exp (-t) * t ^ ((n : ℝ) + α))) atTop
      (𝓝 0) :=
  sorry

/-- **Layer 2.** The Laguerre orthogonality relation (DLMF Table 18.3.1):
`∫ Lₘ^{(α)} Lₙ^{(α)} x^α e^{-x} dx = δₘₙ Γ(n + α + 1) / n!` for `-1 < α`. -/
theorem integral_laguerre_mul_laguerre_laguerreMeasure (α : ℝ) (hα : -1 < α) (m n : ℕ) :
    ∫ x, (laguerre α m).eval x * (laguerre α n).eval x ∂(laguerreMeasure α) =
      if m = n then Real.Gamma (n + α + 1) / n.factorial else 0 :=
  sorry

/-- **Layer 2.** The Hilbert basis of `L²(laguerreMeasure α)`, with its element-level pin: the
`n`-th vector is `Lₙ^{(α)} / √(Γ(n + α + 1) / n!)`. It is
`TauCeti.hilbertBasisOfWeightedMeasure` applied to `degree_laguerre`,
`integrable_exp_mul_abs_laguerreMeasure`, the orthogonality relation above and
`TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`. -/
theorem exists_hilbertBasis_laguerreMeasure {𝕜 : Type*} [RCLike 𝕜] {α : ℝ} (hα : -1 < α) :
    ∃ b : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (laguerreMeasure α)), ∀ n : ℕ,
      (b n : ℝ → 𝕜) =ᵐ[laguerreMeasure α] fun x =>
        algebraMap ℝ 𝕜
          ((laguerre α n).eval x / Real.sqrt (Real.Gamma (n + α + 1) / n.factorial)) :=
  sorry

/-- **Layer 2.** The Hilbert basis of `L²((0, ∞))` of Laguerre functions, with its pin: the
`n`-th vector is `Lₙ^{(α)}(x) x^{α/2} e^{-x/2} / √(Γ(n + α + 1) / n!)`. It is
`TauCeti.hilbertBasisOfOrthogonalSystem` applied to the same inputs. -/
theorem exists_hilbertBasis_laguerreFunction {𝕜 : Type*} [RCLike 𝕜] {α : ℝ} (hα : -1 < α) :
    ∃ b : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (volume.restrict (Ioi (0 : ℝ)))), ∀ n : ℕ,
      (b n : ℝ → 𝕜) =ᵐ[volume.restrict (Ioi (0 : ℝ))] fun x =>
        algebraMap ℝ 𝕜
          ((laguerre α n).eval x * Real.sqrt (x ^ α * Real.exp (-x)) /
            Real.sqrt (Real.Gamma (n + α + 1) / n.factorial)) :=
  sorry

end Polynomial

/-! ## Layer 3: the Jacobi polynomials -/

namespace ProbabilityTheory

/-- **Layer 3.** The Beta integral in Bochner interval form, a corollary of Mathlib's
`ProbabilityTheory.lintegral_betaPDF_eq_one` and `ProbabilityTheory.beta`:
`∫₀¹ x^{u-1} (1-x)^{v-1} dx = B(u, v)` for `0 < u`, `0 < v`, with `Real.rpow` powers. -/
theorem intervalIntegral_rpow_mul_rpow_one_sub_eq_beta {u v : ℝ} (hu : 0 < u) (hv : 0 < v) :
    ∫ x in (0 : ℝ)..1, x ^ (u - 1) * (1 - x) ^ (v - 1) = beta u v :=
  sorry

end ProbabilityTheory

namespace Polynomial

/-- **Layer 3.** The Jacobi polynomial `Pₙ^{(α,β)}` over a `ℚ`-algebra,
`2⁻ⁿ ∑ k ≤ n, (β + k + 1)_{n-k} (α + n - k + 1)_k / ((n-k)! k!) • (X - 1)^{n-k} (X + 1)^k`
(DLMF 18.5.8). The factor `(β + k + 1)_{n-k} / (n-k)!` is `(n+β).choose (n-k)` and
`(α + n - k + 1)_k / k!` is `(n+α).choose k`: `β` travels with `X - 1` and `α` with `X + 1`. -/
noncomputable def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-- **Layer 3.** `P₀^{(α,β)} = 1`. -/
theorem jacobi_zero {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) : jacobi α β 0 = 1 :=
  sorry

/-- **Layer 3.** `P₁^{(α,β)} = (α + 1) + (α + β + 2)(X - 1) / 2`. -/
theorem jacobi_one {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) :
    jacobi α β 1 = C (α + 1) + ((1 : ℚ) / 2) • (C (α + β + 2) * (X - 1)) :=
  sorry

/-- **Layer 3.** The leading coefficient of `Pₙ^{(α,β)}` is `(n + α + β + 1)_n / (2ⁿ n!)`
(DLMF Table 18.3.1), when that value is nonzero. -/
theorem leadingCoeff_jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ)
    (h : (ascPochhammer R n).smeval (n + α + β + 1) ≠ 0) :
    (jacobi α β n).leadingCoeff =
      ((1 : ℚ) / (2 ^ n * n.factorial)) • (ascPochhammer R n).smeval (n + α + β + 1) :=
  sorry

/-- **Layer 3.** The coefficient of `X^n` in `Pₙ^{(α,β)}` is `(n + α + β + 1)_n / (2ⁿ n!)`. -/
theorem coeff_jacobi_self {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) :
    (jacobi α β n).coeff n =
      ((1 : ℚ) / (2 ^ n * n.factorial)) • (ascPochhammer R n).smeval (n + α + β + 1) :=
  sorry

/-- **Layer 3.** Degree over a `ℚ`-algebra: `Pₙ^{(α,β)}` has degree `n` as soon as
`(n + α + β + 1)_n ≠ 0`. With `z = n + α + β + 1` this vanishes exactly for
`n ≥ 1` and `z ∈ {0, -1, …, -(n-1)}`; for `n = 0` it is `1`. -/
theorem degree_jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ)
    (h : (ascPochhammer R n).smeval (n + α + β + 1) ≠ 0) : (jacobi α β n).degree = n :=
  sorry

/-- **Layer 3.** The real corollary: for `-1 < α` and `-1 < β` the degree is `n` for every `n`,
the hypothesis of `degree_jacobi` being discharged because `n + α + β + 1 > n - 1`. -/
theorem degree_jacobi_real {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    (jacobi α β n).degree = n :=
  sorry

/-- **Layer 3.** Reflection symmetry: `Pₙ^{(α,β)}(-X) = (-1)^n Pₙ^{(β,α)}(X)`. -/
theorem jacobi_neg_comp {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) :
    (jacobi α β n).comp (-X) = (-1 : R) ^ n • jacobi β α n :=
  sorry

/-- **Layer 3.** The value at `1`: `Pₙ^{(α,β)}(1) = (α + 1)_n / n!`. -/
theorem eval_one_jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) :
    (jacobi α β n).eval 1 = ((1 : ℚ) / n.factorial) • (ascPochhammer R n).smeval (α + 1) :=
  sorry

/-- **Layer 3.** The three-term recurrence (DLMF 18.9.2 shifted by one, so that no truncated
subtraction appears). With `s = 2n + α + β`:
`2(n+2)(n+α+β+2)(s+2) Pₙ₊₂ = (s+3)((s+4)(s+2) X + α² - β²) Pₙ₊₁ - 2(n+1+α)(n+1+β)(s+4) Pₙ`. -/
theorem jacobi_succ_succ {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) :
    C (2 * (n + 2) * (n + α + β + 2) * (2 * n + α + β + 2)) * jacobi α β (n + 2) =
      C (2 * n + α + β + 3) *
          (C ((2 * n + α + β + 4) * (2 * n + α + β + 2)) * X + C (α ^ 2 - β ^ 2)) *
          jacobi α β (n + 1) -
        C (2 * (n + 1 + α) * (n + 1 + β) * (2 * n + α + β + 4)) * jacobi α β n :=
  sorry

/-- **Layer 3.** The derivative moves both parameters, stated at `n + 1` because the `n` form is
false at `n = 0`: `(Pₙ₊₁^{(α,β)})' = (n + α + β + 2) / 2 · Pₙ^{(α+1,β+1)}`. -/
theorem derivative_jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) :
    derivative (jacobi α β (n + 1)) =
      ((1 : ℚ) / 2) • (C (n + α + β + 2) * jacobi (α + 1) (β + 1) n) :=
  sorry

/-- **Layer 3.** The Rodrigues formula (DLMF 18.5.5, Table 18.5.1), as an identity of real
functions on `(-1, 1)`:
`Pₙ^{(α,β)}(x) = (-1)^n / (2ⁿ n!) · (1-x)^{-α} (1+x)^{-β} · dⁿ/dxⁿ ((1-x)^{n+α} (1+x)^{n+β})`. -/
theorem jacobi_rodrigues (α β : ℝ) (n : ℕ) {x : ℝ} (hx₁ : -1 < x) (hx₂ : x < 1) :
    (jacobi α β n).eval x =
      (-1) ^ n / (2 ^ n * n.factorial) * (1 - x) ^ (-α) * (1 + x) ^ (-β) *
        iteratedDeriv n
          (fun t : ℝ => (1 - t) ^ ((n : ℝ) + α) * (1 + t) ^ ((n : ℝ) + β)) x :=
  sorry

/-! ## Layer 4: Jacobi orthogonality and the `L²` bases -/

/-- **Layer 4.** The Jacobi measure `(1-x)^α (1+x)^β dx` on `(-1, 1)`, in the shape
`μ.withDensity (ENNReal.ofReal ∘ w)` of `TauCeti.hilbertBasisOfWeightedMeasure` with
`μ = volume.restrict (Ioo (-1) 1)`. -/
noncomputable def jacobiMeasure (α β : ℝ) : Measure ℝ :=
  (volume.restrict (Ioo (-1) 1)).withDensity
    fun x => ENNReal.ofReal ((1 - x) ^ α * (1 + x) ^ β)

/-- **Layer 4.** For `-1 < α` and `-1 < β` the Jacobi measure is finite; its total mass is
`2^{α+β+1} B(α + 1, β + 1)`. -/
theorem isFiniteMeasure_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) :
    IsFiniteMeasure (jacobiMeasure α β) :=
  sorry

/-- **Layer 4.** The finite exponential moment of the Jacobi measure: `jacobiMeasure α β` is
supported in `[-1, 1]` and finite, so `exp (a |x|)` is integrable for every `a`. This is the
completeness hypothesis of `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`. -/
theorem integrable_exp_mul_abs_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (a : ℝ) :
    Integrable (fun x : ℝ => Real.exp (a * |x|)) (jacobiMeasure α β) :=
  sorry

/-- **Layer 4.** The squared norm of `Pₙ^{(α,β)}` in `L²(jacobiMeasure α β)`: for `n = 0` it is
`2^{α+β+1} B(α + 1, β + 1)`, and for `n ≥ 1`
`2^{α+β+1} / (2n+α+β+1) · Γ(n+α+1) Γ(n+β+1) / (Γ(n+α+β+1) n!)`. The case `n = 0` is separate
because `2n + α + β + 1 = 0` happens exactly there, at `α + β = -1`. -/
noncomputable def jacobiNormSq (α β : ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 2 ^ (α + β + 1) * ProbabilityTheory.beta (α + 1) (β + 1)
  else
    2 ^ (α + β + 1) / (2 * n + α + β + 1) *
      (Real.Gamma (n + α + 1) * Real.Gamma (n + β + 1) /
        (Real.Gamma (n + α + β + 1) * n.factorial))

/-- **Layer 4.** The norm sequence is positive for `-1 < α`, `-1 < β`, including `n = 0` with
`α + β = -1`. -/
theorem jacobiNormSq_pos {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    0 < jacobiNormSq α β n :=
  sorry

/-- **Layer 4.** Away from `2n + α + β + 1 = 0` the `n = 0` value agrees with the generic
quotient (DLMF Table 18.3.1), since `Γ(z + 1) = z Γ(z)`. -/
theorem jacobiNormSq_zero_eq_quotient {α β : ℝ} (hα : -1 < α) (hβ : -1 < β)
    (h : α + β + 1 ≠ 0) :
    jacobiNormSq α β 0 =
      2 ^ (α + β + 1) / (α + β + 1) * (Real.Gamma (α + 1) * Real.Gamma (β + 1) /
        Real.Gamma (α + β + 1)) :=
  sorry

/-- **Layer 4.** For `-1 < α` and `-1 < β`, `t ↦ dʲ/dtʲ ((1-t)^{n+α} (1+t)^{n+β})` with `j < n`
extends continuously to `[-1, 1]` with value `0` at `±1`. These are the boundary values of the
integration by parts in the orthogonality proof. -/
theorem exists_continuousOn_iteratedDeriv_jacobiWeight {α β : ℝ} (hα : -1 < α) (hβ : -1 < β)
    {j n : ℕ} (hj : j < n) :
    ∃ g : ℝ → ℝ, ContinuousOn g (Icc (-1) 1) ∧ g (-1) = 0 ∧ g 1 = 0 ∧
      EqOn g (iteratedDeriv j
        (fun t : ℝ => (1 - t) ^ ((n : ℝ) + α) * (1 + t) ^ ((n : ℝ) + β))) (Ioo (-1) 1) :=
  sorry

/-- **Layer 4.** The Jacobi orthogonality relation (DLMF Table 18.3.1):
`∫ Pₘ^{(α,β)} Pₙ^{(α,β)} (1-x)^α (1+x)^β dx = δₘₙ hₙ` for `-1 < α`, `-1 < β`, where `hₙ` is
`jacobiNormSq α β n`. -/
theorem integral_jacobi_mul_jacobi_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β)
    (m n : ℕ) :
    ∫ x, (jacobi α β m).eval x * (jacobi α β n).eval x ∂(jacobiMeasure α β) =
      if m = n then jacobiNormSq α β n else 0 :=
  sorry

/-- **Layer 4.** The Hilbert basis of `L²(jacobiMeasure α β)`, with its element-level pin: the
`n`-th vector is `Pₙ^{(α,β)} / √(hₙ)`. It is `TauCeti.hilbertBasisOfWeightedMeasure` applied to
`degree_jacobi_real`, `integrable_exp_mul_abs_jacobiMeasure`, the orthogonality relation above and
`TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`. -/
theorem exists_hilbertBasis_jacobiMeasure {𝕜 : Type*} [RCLike 𝕜] {α β : ℝ} (hα : -1 < α)
    (hβ : -1 < β) :
    ∃ b : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (jacobiMeasure α β)), ∀ n : ℕ,
      (b n : ℝ → 𝕜) =ᵐ[jacobiMeasure α β] fun x =>
        algebraMap ℝ 𝕜 ((jacobi α β n).eval x / Real.sqrt (jacobiNormSq α β n)) :=
  sorry

/-- **Layer 4.** The Hilbert basis of `L²((-1, 1))` of Jacobi functions, with its pin: the
`n`-th vector is `Pₙ^{(α,β)}(x) √((1-x)^α (1+x)^β) / √(hₙ)`. It is
`TauCeti.hilbertBasisOfOrthogonalSystem` applied to the same inputs. -/
theorem exists_hilbertBasis_jacobiFunction {𝕜 : Type*} [RCLike 𝕜] {α β : ℝ} (hα : -1 < α)
    (hβ : -1 < β) :
    ∃ b : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (volume.restrict (Ioo (-1 : ℝ) 1))), ∀ n : ℕ,
      (b n : ℝ → 𝕜) =ᵐ[volume.restrict (Ioo (-1 : ℝ) 1)] fun x =>
        algebraMap ℝ 𝕜
          ((jacobi α β n).eval x * Real.sqrt ((1 - x) ^ α * (1 + x) ^ β) /
            Real.sqrt (jacobiNormSq α β n)) :=
  sorry

/-! ## Layer 5: the tensor bases -/

/-- **Layer 5.** The multi-index Laguerre basis of `L²` of the product of Laguerre measures, with
its pin: the vector of index `k` is the product over `i` of the one-variable vectors at `k i`.
It is `TauCeti.piHilbertBasis` applied to `exists_hilbertBasis_laguerreMeasure`. -/
theorem exists_hilbertBasis_pi_laguerreMeasure {𝕜 : Type*} [RCLike 𝕜] {ι : Type*} [Fintype ι]
    {α : ℝ} (hα : -1 < α) :
    ∃ b : HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi fun _ : ι => laguerreMeasure α)),
      ∀ k : ι → ℕ, (b k : (ι → ℝ) → 𝕜) =ᵐ[Measure.pi fun _ : ι => laguerreMeasure α]
        fun x => ∏ i, algebraMap ℝ 𝕜
          ((laguerre α (k i)).eval (x i) /
            Real.sqrt (Real.Gamma (k i + α + 1) / (k i).factorial)) :=
  sorry

/-- **Layer 5.** The multi-index Jacobi basis of `L²` of the product of Jacobi measures, with its
pin. It is `TauCeti.piHilbertBasis` applied to `exists_hilbertBasis_jacobiMeasure`. -/
theorem exists_hilbertBasis_pi_jacobiMeasure {𝕜 : Type*} [RCLike 𝕜] {ι : Type*} [Fintype ι]
    {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) :
    ∃ b : HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi fun _ : ι => jacobiMeasure α β)),
      ∀ k : ι → ℕ, (b k : (ι → ℝ) → 𝕜) =ᵐ[Measure.pi fun _ : ι => jacobiMeasure α β]
        fun x => ∏ i, algebraMap ℝ 𝕜
          ((jacobi α β (k i)).eval (x i) / Real.sqrt (jacobiNormSq α β (k i))) :=
  sorry

/-! ## Layer 6: Legendre, Gegenbauer and the Chebyshev consistency check -/

/-- **Layer 6.** Legendre orthogonality on `[-1, 1]` (DLMF 14.17.6 at `m = 0`), the case
`α = β = 0` of the Jacobi relation:
`∫₋₁¹ Pₘ Pₙ = δₘₙ 2 / (2n + 1)` for `Pₙ = jacobi 0 0 n`. -/
theorem integral_jacobi_zero_zero_mul_jacobi_zero_zero (m n : ℕ) :
    ∫ x in (-1 : ℝ)..1, (jacobi (0 : ℝ) 0 m).eval x * (jacobi (0 : ℝ) 0 n).eval x =
      if m = n then 2 / (2 * n + 1) else 0 :=
  sorry

/-- **Layer 6.** Mathlib's `shiftedLegendre` is the Legendre polynomial transported along
`x ↦ 1 - 2x`: `P̃ₙ = Pₙ(1 - 2X)`, with the orientation fixed (it is `Pₙ(2X - 1)` only for even
`n`). -/
theorem shiftedLegendre_map_eq_jacobi_comp {R : Type*} [CommRing R] [Algebra ℚ R] (n : ℕ) :
    (shiftedLegendre n).map (Int.castRingHom R) = (jacobi (0 : R) 0 n).comp (1 - C 2 * X) :=
  sorry

/-- **Layer 6.** Orthogonality of the shifted Legendre polynomials on `[0, 1]`, which Mathlib
does not have: `∫₀¹ P̃ₘ P̃ₙ = δₘₙ / (2n + 1)`. -/
theorem integral_shiftedLegendre_mul_shiftedLegendre (m n : ℕ) :
    ∫ x in (0 : ℝ)..1, aeval x (shiftedLegendre m) * aeval x (shiftedLegendre n) =
      if m = n then 1 / (2 * n + 1) else 0 :=
  sorry

/-- **Layer 6.** The Gegenbauer polynomial `Cₙ^{(λ)}` over a `ℚ`-algebra, by its own explicit sum
`∑ k ≤ n/2, (-1)^k (λ)_{n-k} / (k! (n-2k)!) • (2X)^{n-2k}` (DLMF 18.5.10), so that no division by a
parameter-dependent element of `R` occurs. -/
noncomputable def gegenbauer {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n / 2 + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / (k.factorial * (n - 2 * k).factorial)) •
      (ascPochhammer R (n - k)).smeval lam)) • (C 2 * X) ^ (n - 2 * k)

/-- **Layer 6.** `C₁^{(λ)} = 2λ X`. -/
theorem gegenbauer_one {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) :
    gegenbauer lam 1 = C (2 * lam) * X :=
  sorry

/-- **Layer 6.** `C₂^{(λ)} = 2λ(λ + 1) X² - λ`. -/
theorem gegenbauer_two {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) :
    gegenbauer lam 2 = C (2 * lam * (lam + 1)) * X ^ 2 - C lam :=
  sorry

/-- **Layer 6.** The leading coefficient of `Cₙ^{(λ)}` is `2ⁿ (λ)ₙ / n!` (DLMF Table 18.3.1). -/
theorem coeff_gegenbauer_self {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) (n : ℕ) :
    (gegenbauer lam n).coeff n =
      ((2 : ℚ) ^ n / n.factorial) • (ascPochhammer R n).smeval lam :=
  sorry

/-- **Layer 6.** Degree: `Cₙ^{(λ)}` has degree `n` as soon as `(λ)ₙ ≠ 0`; over `ℝ` this holds for
`-1/2 < λ`, `λ ≠ 0`. The hypothesis is `(λ)ₙ`, and not `(2λ)ₙ`: at `λ = -1`, `n = 2`, `(2λ)₂ = 2 ≠ 0` but
`(λ)₂ = 0`, `C₂^{(-1)} = 1`, and the degree is `0`. -/
theorem degree_gegenbauer {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) (n : ℕ)
    (h : (ascPochhammer R n).smeval lam ≠ 0) : (gegenbauer lam n).degree = n :=
  sorry

/-- **Layer 6.** The negative control for the degree hypothesis: `C₂^{(-1)} = 1`. -/
theorem gegenbauer_neg_one_two : gegenbauer (-1 : ℚ) 2 = 1 :=
  sorry

/-- **Layer 6.** `Cₙ^{(0)} = 0` for `n ≥ 1`: the family is degenerate at `λ = 0`. -/
theorem gegenbauer_zero_param {R : Type*} [CommRing R] [Algebra ℚ R] (n : ℕ) (hn : 1 ≤ n) :
    gegenbauer (0 : R) n = 0 :=
  sorry

/-- **Layer 6.** The multiplied-out relation to the Jacobi family, valid over any `ℚ`-algebra
and without invertibility hypotheses (DLMF 18.7.1):
`(λ + 1/2)ₙ • Cₙ^{(λ)} = (2λ)ₙ • Pₙ^{(λ-1/2, λ-1/2)}`. -/
theorem ascPochhammer_smeval_smul_gegenbauer {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R)
    (n : ℕ) :
    (ascPochhammer R n).smeval (lam + algebraMap ℚ R (1 / 2)) • gegenbauer lam n =
      (ascPochhammer R n).smeval (2 * lam) •
        jacobi (lam - algebraMap ℚ R (1 / 2)) (lam - algebraMap ℚ R (1 / 2)) n :=
  sorry

/-- **Layer 6.** Gegenbauer orthogonality for `-1/2 < λ`, `λ ≠ 0` against the weight
`(1-x²)^{λ-1/2}` (the Jacobi measure with `α = β = λ - 1/2`), with the constant of DLMF
Table 18.3.1: `δₘₙ π 2^{1-2λ} Γ(n+2λ) / (n! (n+λ) Γ(λ)²)`. -/
theorem integral_gegenbauer_mul_gegenbauer {lam : ℝ} (hlam : -1 / 2 < lam) (h0 : lam ≠ 0)
    (m n : ℕ) :
    ∫ x, (gegenbauer lam m).eval x * (gegenbauer lam n).eval x
        ∂(jacobiMeasure (lam - 1 / 2) (lam - 1 / 2)) =
      if m = n then
        Real.pi * 2 ^ (1 - 2 * lam) * Real.Gamma (n + 2 * lam) /
          (n.factorial * (n + lam) * Real.Gamma lam ^ 2)
      else 0 :=
  sorry

/-- **Layer 6.** The Gegenbauer Hilbert basis of `L²` of the weight `(1-x²)^{λ-1/2}` for
`-1/2 < λ`, `λ ≠ 0` (where `(λ)ₙ ≠ 0` for every `n`), with its pin: the `n`-th vector is
`Cₙ^{(λ)}` normalized by the constant above. -/
theorem exists_hilbertBasis_gegenbauer {𝕜 : Type*} [RCLike 𝕜] {lam : ℝ} (hlam : -1 / 2 < lam)
    (h0 : lam ≠ 0) :
    ∃ b : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (jacobiMeasure (lam - 1 / 2) (lam - 1 / 2))), ∀ n : ℕ,
      (b n : ℝ → 𝕜) =ᵐ[jacobiMeasure (lam - 1 / 2) (lam - 1 / 2)] fun x =>
        algebraMap ℝ 𝕜
          ((gegenbauer lam n).eval x / Real.sqrt (Real.pi * 2 ^ (1 - 2 * lam) *
            Real.Gamma (n + 2 * lam) / (n.factorial * (n + lam) * Real.Gamma lam ^ 2))) :=
  sorry

/-- **Layer 6.** The Chebyshev consistency check, polynomial side:
`Pₙ^{(-1/2,-1/2)} = ((1/2)ₙ / n!) • Tₙ`. The scale is part of the statement; the unscaled
equality fails at `n = 1`, where `P₁ = X / 2` and `T₁ = X`. -/
theorem jacobi_neg_half_neg_half_eq_T {R : Type*} [CommRing R] [Algebra ℚ R] (n : ℕ) :
    jacobi (algebraMap ℚ R (-1 / 2)) (algebraMap ℚ R (-1 / 2)) n =
      (((1 : ℚ) / n.factorial) • (ascPochhammer R n).smeval (algebraMap ℚ R (1 / 2))) •
        Chebyshev.T R n :=
  sorry

/-- **Layer 6.** The Chebyshev consistency check, measure side: `jacobiMeasure (-1/2) (-1/2)` is
Mathlib's `Polynomial.Chebyshev.measureT`. The two are built over `Ioo (-1) 1` and `Ioc (-1) 1`
and agree because `{1}` is `volume`-null; the identity of the densities is
`(1-x)^{-1/2} (1+x)^{-1/2} = (√(1-x²))⁻¹`. -/
theorem jacobiMeasure_neg_half_neg_half_eq_measureT :
    jacobiMeasure (-1 / 2) (-1 / 2) = Chebyshev.measureT :=
  sorry

/-- **Layer 6.** The Chebyshev consistency check, constants: `h₀ = π`. -/
theorem jacobiNormSq_neg_half_neg_half_zero : jacobiNormSq (-1 / 2) (-1 / 2) 0 = π :=
  sorry

/-- **Layer 6.** The Chebyshev consistency check, constants: for `n ≥ 1`,
`hₙ = ((1/2)ₙ / n!)² π / 2`, the value forced by `Tₙ` having norm `π / 2` under `measureT`. -/
theorem jacobiNormSq_neg_half_neg_half_succ (n : ℕ) :
    jacobiNormSq (-1 / 2) (-1 / 2) (n + 1) =
      ((ascPochhammer ℝ (n + 1)).eval (1 / 2) / (n + 1).factorial) ^ 2 * (π / 2) :=
  sorry

end Polynomial
