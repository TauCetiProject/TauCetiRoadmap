/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Chebyshev.ChebyshevGauss
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Orthogonality
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Chebyshev.RootsExtrema
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Polynomial.Smeval
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.MeasureTheory.Measure.Dirac.Basic
import Mathlib.MeasureTheory.Measure.Typeclasses.Probability
import Mathlib.RingTheory.Polynomial.Hermite.Basic
import Mathlib.RingTheory.Polynomial.Pochhammer
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Topology.Order.LocalExtr
import TauCeti.Probability.Distributions.Arcsine.Basic

/-!
# Zeros of orthogonal polynomials, electrostatics and the arcsine law: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` whose
carriers exist at the pins: the second derivative of a nodal polynomial at a node and the
root-counting measure (Layer 1), the Jacobi differential equation and Stieltjes' equilibrium
theorems (Layer 2), Chebyshev–Gauss quadrature in measure form (Layer 3), and the arcsine limit
(Layer 4). Every name declared here is the name `README.md` uses for the same statement.

`jacobi` and `monicThreeTerm` are roadmap-local copies, verbatim, of the definitions of
`Polynomial.jacobi` in LaguerreJacobi and of `Polynomial.monicThreeTerm` in
SpecialFunctionsOrthogonalPolynomialsGeneral. The arcsine law on `[0, 1]` is Tau Ceti's
`TauCeti.Probability.arcsineMeasure`. The targets of `README.md` stated through
`IsOrthogonalityMeasure`, `monic`, `zeros`, `christoffelNumber`, `alpha` and `beta` of
SpecialFunctionsOrthogonalPolynomialsGeneral, and through `Polynomial.jacobiMeasure` and
`Polynomial.laguerre` of LaguerreJacobi, are stated in `README.md` in prose.

Conventions: zeros are `Polynomial.roots`, a multiset; a configuration of `n` points is
`x : Fin n → ℝ`; the Chebyshev weight is Mathlib's `Polynomial.Chebyshev.measureT`, of total mass
`π`, so the arcsine law on `[-1, 1]` integrates `f` to `π⁻¹ * ∫ x, f x ∂measureT`; the Hermite
polynomials are Mathlib's probabilists' `Polynomial.hermite`.
-/

namespace TauCetiRoadmap.ZerosOfOrthogonalPolynomials

open Polynomial MeasureTheory Filter Topology Finset Real
open scoped ENNReal

noncomputable section

/-! ## Copies of the consumed definitions -/

/-- Copy of `Polynomial.jacobi` (DLMF 18.5.8), owned by LaguerreJacobi. -/
def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-- Copy of `Polynomial.monicThreeTerm` (DLMF 18.2.11_5), owned by
SpecialFunctionsOrthogonalPolynomialsGeneral: `p₀ = 1`, `p₁ = X − α₀`,
`p_{n+2} = (X − α_{n+1}) p_{n+1} − β_{n+1} p_n`. -/
def monicThreeTerm {R : Type*} [CommRing R] (α β : ℕ → R) : ℕ → R[X]
  | 0 => 1
  | 1 => X - C (α 0)
  | n + 2 => (X - C (α (n + 1))) * monicThreeTerm α β (n + 1) - C (β (n + 1)) * monicThreeTerm α β n

/-! ## Layer 1: nodes, second derivatives and the root-counting measure -/

/-- **Layer 1.** The second derivative of a nodal polynomial at a node:
`f''(xᵢ) = 2 f'(xᵢ) ∑_{j ≠ i} 1 / (xᵢ − xⱼ)`. -/
theorem eval_derivative_derivative_nodal {K ι : Type*} [Field K] [DecidableEq ι] {s : Finset ι}
    {v : ι → K} (hv : Set.InjOn v s) {i : ι} (hi : i ∈ s) :
    eval (v i) (derivative (derivative (Lagrange.nodal s v))) =
      2 * eval (v i) (derivative (Lagrange.nodal s v)) * ∑ j ∈ s.erase i, (v i - v j)⁻¹ := by
  sorry

/-- **Layer 1.** The root-counting measure of a real polynomial: the average of the Dirac masses
at its real roots, counted with multiplicity. It is the zero measure when there is no real
root. -/
def rootMeasure (p : ℝ[X]) : Measure ℝ :=
  (p.roots.card : ℝ≥0∞)⁻¹ • (p.roots.map Measure.dirac).sum

/-- **Layer 1.** Integration against the root-counting measure is the average over the roots. -/
theorem integral_rootMeasure (p : ℝ[X]) (f : ℝ → ℝ) :
    ∫ x, f x ∂rootMeasure p = (p.roots.map f).sum / p.roots.card := by
  sorry

/-- **Layer 1.** The root-counting measure of a polynomial with a real root is a probability
measure. -/
theorem isProbabilityMeasure_rootMeasure {p : ℝ[X]} (hp : p.roots ≠ 0) :
    IsProbabilityMeasure (rootMeasure p) := by
  sorry

/-- **Layer 1.** For `α, β > -1` the Jacobi polynomial `Pₙ^{(α,β)}` has `n` simple real zeros, all
in `(-1, 1)`. -/
theorem roots_jacobi {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    (jacobi α β n).roots.Nodup ∧ (jacobi α β n).roots.card = n ∧
      ∀ x ∈ (jacobi α β n).roots, x ∈ Set.Ioo (-1 : ℝ) 1 := by
  sorry

/-! ## Layer 2: Stieltjes' electrostatics -/

/-- **Layer 2.** The differential equation of the Jacobi polynomials (DLMF Table 18.8.1):
`(1 − x²) y'' + (β − α − (α + β + 2) x) y' + n (n + α + β + 1) y = 0`. -/
theorem one_sub_X_sq_mul_derivative_derivative_jacobi {R : Type*} [CommRing R] [Algebra ℚ R]
    (α β : R) (n : ℕ) :
    (1 - X ^ 2) * derivative (derivative (jacobi α β n)) +
        (C (β - α) - C (α + β + 2) * X) * derivative (jacobi α β n) +
        C ((n : R) * (n + α + β + 1)) * jacobi α β n = 0 := by
  sorry

/-- **Layer 2.** A polynomial of degree at most `n` solving the Jacobi equation of index `n` is a
multiple of `Pₙ^{(α,β)}`. -/
theorem eq_C_mul_jacobi_of_ode {α β : ℝ} (h : -2 < α + β) {n : ℕ} {p : ℝ[X]}
    (hp : p.natDegree ≤ n)
    (hode : (1 - X ^ 2) * derivative (derivative p) +
        (C (β - α) - C (α + β + 2) * X) * derivative p +
        C ((n : ℝ) * (n + α + β + 1)) * p = 0) :
    p = C (p.coeff n / (jacobi α β n).coeff n) * jacobi α β n := by
  sorry

/-- **Layer 2 (Stieltjes).** With charges `(α + 1) / 2` at `1` and `(β + 1) / 2` at `-1`, a
configuration of `n` distinct unit charges in `(-1, 1)` is in equilibrium for the logarithmic
interaction exactly when its points are the zeros of `Pₙ^{(α,β)}` (Szegő, Theorem 6.7.1). -/
theorem jacobi_equilibrium_iff {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) {n : ℕ} {x : Fin n → ℝ}
    (hx : Function.Injective x) (hx' : ∀ i, x i ∈ Set.Ioo (-1 : ℝ) 1) :
    (∀ i, ∑ j ∈ univ.erase i, (x i - x j)⁻¹ + (α + 1) / 2 / (x i - 1) +
        (β + 1) / 2 / (x i + 1) = 0) ↔
      ∏ i, (X - C (x i)) = C ((jacobi α β n).leadingCoeff)⁻¹ * jacobi α β n := by
  sorry

/-- **Layer 2.** The exponential of minus the energy of `n` unit charges at `y` with charges `p`
at `1` and `q` at `-1`: `∏ᵢ (1 − yᵢ)^p (1 + yᵢ)^q ∏_{i<j} |yᵢ − yⱼ|`. -/
def stieltjesEnergy (p q : ℝ) {n : ℕ} (y : Fin n → ℝ) : ℝ :=
  (∏ i, (1 - y i) ^ p * (1 + y i) ^ q) * ∏ i, ∏ j ∈ Finset.Ioi i, |y i - y j|

/-- **Layer 2 (Stieltjes).** On the cube `[-1, 1]ⁿ` the energy functional is maximal exactly at
the configurations whose points are the zeros of `Pₙ^{(α,β)}` (Szegő, Theorem 6.7.1). -/
theorem isMaxOn_stieltjesEnergy_iff {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) {n : ℕ}
    {x : Fin n → ℝ} (hx : x ∈ Set.pi Set.univ fun _ : Fin n => Set.Icc (-1 : ℝ) 1) :
    IsMaxOn (stieltjesEnergy ((α + 1) / 2) ((β + 1) / 2))
        (Set.pi Set.univ fun _ : Fin n => Set.Icc (-1 : ℝ) 1) x ↔
      ∏ i, (X - C (x i)) = C ((jacobi α β n).leadingCoeff)⁻¹ * jacobi α β n := by
  sorry

/-- **Layer 2.** The discriminant of the Jacobi polynomial (Szegő, (6.71.5)). -/
theorem discr_jacobi {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    (jacobi α β n).discr = (2 : ℝ) ^ (-(n * (n - 1) : ℤ)) *
      ∏ ν ∈ Finset.Icc 1 n, ((ν : ℝ) ^ ((ν : ℤ) - 2 * n + 2) * (ν + α) ^ (ν - 1) *
        (ν + β) ^ (ν - 1) * (n + ν + α + β) ^ (n - ν)) := by
  sorry

/-- **Layer 2 (Stieltjes).** A configuration of `n` distinct unit charges on the line, in the
external field `x² / 4`, is in equilibrium exactly when its points are the zeros of the Hermite
polynomial `Heₙ` (Szegő, Theorem 6.7.2). -/
theorem hermite_equilibrium_iff {n : ℕ} {x : Fin n → ℝ} (hx : Function.Injective x) :
    (∀ i, ∑ j ∈ univ.erase i, (x i - x j)⁻¹ = x i / 2) ↔
      ∏ i, (X - C (x i)) = (hermite n).map (Int.castRingHom ℝ) := by
  sorry

/-! ## Layer 3: the Chebyshev quadrature bridge -/

/-- **Layer 3.** Chebyshev–Gauss quadrature in measure form: the root-counting measure of `Tₙ` and
the arcsine law integrate every polynomial of degree below `2n` alike. -/
theorem integral_eval_rootMeasure_T {n : ℕ} (hn : n ≠ 0) {P : ℝ[X]} (hP : P.degree < 2 * n) :
    ∫ x, P.eval x ∂rootMeasure (Chebyshev.T ℝ n) = π⁻¹ * ∫ x, P.eval x ∂Chebyshev.measureT := by
  sorry

/-! ## Layer 4: the arcsine law -/

/-- **Layer 4.** The moments of the Chebyshev weight: `π · C(k, k/2) / 2^k` for even `k`, zero for
odd `k`. -/
theorem integral_pow_measureT (k : ℕ) :
    ∫ x, x ^ k ∂Chebyshev.measureT = if Even k then π * (k.choose (k / 2)) / 2 ^ k else 0 := by
  sorry

/-- **Layer 4.** The Chebyshev weight is `π` times the image of the arcsine law on `[0, 1]` under
`t ↦ 2 t − 1`. -/
theorem measureT_eq_smul_map_arcsineMeasure :
    Chebyshev.measureT =
      ENNReal.ofReal π • TauCeti.Probability.arcsineMeasure.map fun t : ℝ => 2 * t - 1 := by
  sorry

/-- **Layer 4.** The zeros of the Chebyshev polynomials `Tₙ` are distributed by the arcsine
law. -/
theorem tendsto_integral_rootMeasure_T {f : ℝ → ℝ} (hf : Continuous f) :
    Tendsto (fun n : ℕ => ∫ x, f x ∂rootMeasure (Chebyshev.T ℝ n)) atTop
      (𝓝 (π⁻¹ * ∫ x, f x ∂Chebyshev.measureT)) := by
  sorry

/-- **Layer 4.** Weyl's criterion on `[-1, 1]`: probability measures carried by `[-1, 1]`
converge to the arcsine law exactly when their Chebyshev coefficients of every positive index
tend to zero. -/
theorem tendsto_integral_measureT_iff {μ : ℕ → Measure ℝ} [∀ n, IsProbabilityMeasure (μ n)]
    (hμ : ∀ n, μ n (Set.Icc (-1 : ℝ) 1)ᶜ = 0) :
    (∀ f : ℝ → ℝ, Continuous f →
        Tendsto (fun n => ∫ x, f x ∂μ n) atTop (𝓝 (π⁻¹ * ∫ x, f x ∂Chebyshev.measureT))) ↔
      ∀ k : ℕ, k ≠ 0 →
        Tendsto (fun n => ∫ x, (Chebyshev.T ℝ k).eval x ∂μ n) atTop (𝓝 0) := by
  sorry

/-- **Layer 4.** If the recurrence coefficients converge, `αₙ → a` and `βₙ → b²`, the zeros of the
recurrence polynomials are distributed by the arcsine law of `[a − 2b, a + 2b]`. -/
theorem tendsto_integral_rootMeasure_monicThreeTerm {α β : ℕ → ℝ} {a b : ℝ}
    (hβ : ∀ k, 0 < β (k + 1)) (hb : 0 ≤ b) (hα' : Tendsto α atTop (𝓝 a))
    (hβ' : Tendsto β atTop (𝓝 (b ^ 2))) {f : ℝ → ℝ} (hf : Continuous f) :
    Tendsto (fun n : ℕ => ∫ x, f x ∂rootMeasure (monicThreeTerm α β n)) atTop
      (𝓝 (π⁻¹ * ∫ x, f (a + 2 * b * x) ∂Chebyshev.measureT)) := by
  sorry

/-- **Layer 4.** The monic three-term recurrence of the Jacobi polynomials (DLMF 18.9.2 divided by
the leading coefficients). -/
theorem jacobi_eq_C_mul_monicThreeTerm {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    jacobi α β n = C (jacobi α β n).leadingCoeff *
      monicThreeTerm
        (fun k : ℕ => if k = 0 then (β - α) / (α + β + 2)
          else (β ^ 2 - α ^ 2) / ((2 * k + α + β) * (2 * k + α + β + 2)))
        (fun k : ℕ => if k = 1 then 4 * (1 + α) * (1 + β) / ((α + β + 2) ^ 2 * (α + β + 3))
          else 4 * k * (k + α) * (k + β) * (k + α + β) /
            ((2 * k + α + β) ^ 2 * ((2 * k + α + β) ^ 2 - 1))) n := by
  sorry

/-- **Layer 4.** For `α, β > -1` the zeros of the Jacobi polynomials `Pₙ^{(α,β)}` are distributed
by the arcsine law. -/
theorem tendsto_integral_rootMeasure_jacobi {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) {f : ℝ → ℝ}
    (hf : Continuous f) :
    Tendsto (fun n : ℕ => ∫ x, f x ∂rootMeasure (jacobi α β n)) atTop
      (𝓝 (π⁻¹ * ∫ x, f x ∂Chebyshev.measureT)) := by
  sorry

end

end TauCetiRoadmap.ZerosOfOrthogonalPolynomials
