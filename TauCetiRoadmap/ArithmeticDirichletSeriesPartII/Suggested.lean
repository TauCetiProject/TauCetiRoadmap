import Mathlib
import TauCeti.Order.Northcott.Basic

/-!
# ArithmeticDirichletSeriesPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs. All headline theorems below are statable at these pins.

The end theorems are Delange's integer-order Laplace theorem and its Dirichlet counting forms,
with finite changes and errors dominated by a lower-order pole. The analytic stages establish
the kernel mass and Fourier formula, weight normalisation and shift limit,
regularised boundary convergence, smoothing, unsmoothing and the logarithmic counting bridge.
The Gamma model is supplied by AnalyticNumberTheoryPartII §4.5c.
The final layer states the divisor-counting application and the dyadic boundary counterexample.

`HasLaplace` uses the ordinary one-sided integral of a function with convergence included.
Its argument order follows Dennj Osele, “The Laplace transform”, declarations
`LaplaceConvergent`, `laplace`, and `HasLaplace`.
`PoleBoundary` requires agreement only on the open half-plane, independently of boundary values.
Pole orders are `k + 1`; the counting constant at positive abscissa `a` is `A / (a * k!)`.
The squared-sinc kernel has mass one; the polynomial weight uses cutoff one.
-/

noncomputable section

open Filter MeasureTheory Set
open scoped Topology

namespace TauCetiRoadmap.ArithmeticDirichletSeriesPartII

/-- The identity height on `ℕ` has finite sublevel sets. This is the instance that
`TauCeti.summatory (fun n : ℕ ↦ n)` needs to sum over the integers `n ≤ X`. -/
instance northcott_natId : Northcott (fun n : ℕ ↦ n) where
  finite_le b := Set.finite_Iic b

/-! ## Layer HP.0: convergent Laplace transforms and boundary continuation -/

section Laplace

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMul ℂ E]

/-- `HasLaplace f s z μ`: the integrand `t ↦ exp (-s t) • f t` is integrable for `μ` and its
integral is `z`. With the default measure this is the one-sided Laplace transform of `f` at the
complex parameter `s`. Belongs to Layer HP.0; it follows the
ordinary transform predicate `HasLaplace` in Osele, “The Laplace transform”, lines 121–123
(osele-laplace line 125). -/
def HasLaplace (f : ℝ → E) (s : ℂ) (z : E) (μ : Measure ℝ := volume.restrict (Ioi 0)) : Prop :=
  Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • f t) μ ∧
    ∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ = z

end Laplace

/-- `PoleBoundary F a k A`: `F` is holomorphic on `Re s > a`; near `a` it equals
`g s / (s - a) ^ (k + 1)` with `g` holomorphic on a disc about `a` and `g a = A`; and at every
other point `a + i y` of the line `Re s = a` it extends holomorphically. All agreements are on
the open half-plane. With `A ≠ 0` the pole has order exactly `k + 1`; the main theorems assume
`0 < A`. This is the integer-exponent case of the hypothesis of Delange's Theorem III
(Delange 1954, §5.2.1, pp. 235–236). Belongs to Layer HP.0. -/
structure PoleBoundary (F : ℂ → ℂ) (a : ℝ) (k : ℕ) (A : ℝ) : Prop where
  /-- `F` is holomorphic on the open half-plane `Re s > a`. -/
  interior : AnalyticOnNhd ℂ F {s : ℂ | a < s.re}
  /-- Near `a`, `F` is a holomorphic numerator with value `A` over `(s - a) ^ (k + 1)`. -/
  pole : ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ, AnalyticOnNhd ℂ g (Metric.ball (a : ℂ) r) ∧
    g a = A ∧ ∀ s ∈ Metric.ball (a : ℂ) r, a < s.re → F s = g s / (s - a) ^ (k + 1)
  /-- `F` extends holomorphically across every point `a + i y` with `y ≠ 0`. -/
  away : ∀ y : ℝ, y ≠ 0 → ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ,
    AnalyticOnNhd ℂ g (Metric.ball ((a : ℂ) + y * Complex.I) r) ∧
      ∀ s ∈ Metric.ball ((a : ℂ) + y * Complex.I) r, a < s.re → F s = g s

/-! ## Layer HP.1: squared-sinc smoothing and the polynomial weight -/

/-- The squared-sinc kernel `K_λ(v) = (λ / π) sinc (λ v)²`, written `squaredSinc ell v` with
`ell = λ`. For `λ > 0` it is a probability density whose Fourier transform, in angular frequency,
is the triangle `1 - |y| / (2λ)` on `[-2λ, 2λ]`. Belongs to Layer HP.1. -/
def squaredSinc (ell v : ℝ) : ℝ :=
  ell / Real.pi * Real.sinc (ell * v) ^ 2

/-- Layer HP.1 milestone: the kernel has total mass one. -/
theorem squaredSinc_mass {ell : ℝ} (hell : 0 < ell) : ∫ v : ℝ, squaredSinc ell v = 1 := by
  sorry

/-- Layer HP.1 milestone: the kernel is the inverse Fourier transform, in angular frequency, of the
triangle supported on `[-2λ, 2λ]`. -/
theorem squaredSinc_fourier {ell : ℝ} (hell : 0 < ell) (v : ℝ) :
    (squaredSinc ell v : ℂ) = 1 / (2 * Real.pi) *
      ∫ y : ℝ in (-(2 * ell))..(2 * ell),
        ((1 - |y| / (2 * ell) : ℝ) : ℂ) * Complex.exp (Complex.I * y * v) := by
  sorry

/-- Delange's regularising weight `w_k(t) = t ∫₀¹ exp (-u t) u ^ k / k! du`. It vanishes at `0`,
is positive for `t > 0`, and `w_k(t) t ^ k → 1`. The definition is total in `t`. Belongs to
Layer HP.1. -/
def delangeWeight (k : ℕ) (t : ℝ) : ℝ :=
  t * ∫ u : ℝ in (0 : ℝ)..1, Real.exp (-u * t) * u ^ k / (k.factorial : ℝ)

/-- Layer HP.1 milestone: `w_k(t) t ^ k → 1` as `t → ∞`. -/
theorem delangeWeight_normalization (k : ℕ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k t * t ^ k) atTop (𝓝 1) := by
  sorry

/-- Layer HP.1 milestone: the weight varies slowly, `w_k(t + h) / w_k(t) → 1` for fixed `h`. -/
theorem delangeWeight_shift (k : ℕ) (h : ℝ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k (t + h) / delangeWeight k t) atTop (𝓝 1) := by
  sorry

/-! ## Layer HP.2: regularised transforms and the smoothed limit -/

/-- Locally integrable boundary values of the regularised remainder. With
`R = F - A / (s - a) ^ (k + 1)` and `H(s) = -∫₀¹ R'(s + u) u ^ k / k! du`, the functions
`y ↦ H(a + ε + i y)` converge in `L¹` on every compact interval as `ε → 0⁺`. The derivative is
only evaluated in the open half-plane. -/
theorem regularizedBoundaryL1 {F : ℂ → ℂ} {a A : ℝ} {k : ℕ} (h : PoleBoundary F a k A) :
    let R := fun s : ℂ ↦ F s - (A : ℂ) / (s - a) ^ (k + 1)
    let H := fun s : ℂ ↦ -∫ u : ℝ in (0 : ℝ)..1,
      deriv R (s + u) * ((u ^ k / (k.factorial : ℝ) : ℝ) : ℂ)
    ∃ b : ℝ → ℂ, ∀ L : ℝ, 0 < L →
      IntegrableOn b (Icc (-L) L) ∧
      Tendsto (fun ε : ℝ ↦ ∫ y in Icc (-L) L, ‖H ((a : ℂ) + ε + y * Complex.I) - b y‖)
        (𝓝[>] 0) (𝓝 0) := by
  sorry

/-- Layer HP.2 milestone: the smoothed limit. The weighted function
`w_k(t) exp (-a t) α(t)`, convolved with the squared-sinc kernel at any bandwidth, tends to
`A / k!`. No growth bound on `α` is assumed. -/
theorem delangeSmoothedLimit {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) {ell : ℝ} (hell : 0 < ell) :
    (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
    Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ),
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-! ## Layer HP.3: Delange's theorem for integer pole orders -/

/-- Monotone removal of the smoothing: smoothed limits `C` at every bandwidth, for a nonnegative
nondecreasing `α`, give `α(t) / (exp (a t) t ^ k) → C`. A single bandwidth does not suffice. -/
theorem monotoneUnsmoothing {α : ℝ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hC : 0 ≤ C)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hsmooth : ∀ ell : ℝ, 0 < ell →
      (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
      Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ),
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
        atTop (𝓝 C)) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k)) atTop (𝓝 C) := by
  sorry

/-- **Delange's theorem for a pole of integer order `k + 1`.** Let `α ≥ 0` be nondecreasing on
`[0, ∞)` with Laplace transform `F` on `Re s > a > 0`, and let `F` satisfy `PoleBoundary F a k A`
with `A > 0`. Then `α(t) ~ (A / k!) exp (a t) t ^ k` (Delange 1954, Theorem III, §5.2.1,
pp. 235–238, with exponent `k + 1`). -/
theorem delangeLaplace {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hA : 0 < A)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-! ## Layer HP.4: counting functions of Dirichlet series and perturbations -/

/-- The logarithmic counting function `α(t) = ∑_{1 ≤ n ≤ eᵗ} c n` of a nonnegative Dirichlet
series has Laplace transform `F(s) / s` wherever the series converges absolutely with
`Re s > 0`; it is nonnegative, nondecreasing, and `α 0 = c 1`. -/
theorem logSummatory_hasLaplace {c : ℕ → ℝ} {F : ℂ → ℂ} {s : ℂ}
    (hc : ∀ n, 0 ≤ c n) (hs : 0 < s.re)
    (hF : LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)) :
    let α := fun t : ℝ ↦
      TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n) (Real.exp t)
    HasLaplace (fun t ↦ (α t : ℂ)) s (F s / s) ∧
      (∀ t ∈ Ici (0 : ℝ), 0 ≤ α t) ∧ MonotoneOn α (Ici 0) ∧ α 0 = c 1 := by
  sorry

/-- **Higher-pole counting at abscissa one.** For `c ≥ 0` with Dirichlet series `F` on
`Re s > 1` and `PoleBoundary F 1 k A`, `A > 0`:
`∑_{1 ≤ n ≤ X} c n ~ (A / k!) X (log X) ^ k`. -/
theorem delangeDirichlet {c : ℕ → ℝ} {F : ℂ → ℂ} {A : ℝ} {k : ℕ}
    (hc : ∀ n, 0 ≤ c n) (hA : 0 < A)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F 1 k A) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X * Real.log X ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-- **Higher-pole counting at a positive abscissa.** For `a > 0`:
`∑_{1 ≤ n ≤ X} c n ~ (A / (a k!)) X ^ a (log X) ^ k`. -/
theorem delangeDirichlet_positiveAbscissa {c : ℕ → ℝ} {F : ℂ → ℂ}
    {a A : ℝ} {k : ℕ} (hc : ∀ n, 0 ≤ c n) (ha : 0 < a) (hA : 0 < A)
    (hF : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 (A / (a * (k.factorial : ℝ)))) := by
  sorry

/-- Altering finitely many coefficients, of any sign, does not change a counting asymptotic at the
scale `X ^ a (log X) ^ k` with `a > 0`. -/
theorem finiteChange_asymptotic {c d : ℕ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hcd : ∀ᶠ n in cofinite, c n = d n)
    (hc : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by
  sorry

/-- A signed perturbation dominated coefficientwise by a nonnegative series whose pole has strictly
lower order `l + 1 < k + 1` is negligible at the scale `X ^ a (log X) ^ k`. The majorant carries
its own convergence and boundary hypotheses. -/
theorem lowerPole_perturbation {c d b : ℕ → ℝ} {G : ℂ → ℂ} {a B C : ℝ} {k l : ℕ}
    (ha : 0 < a) (hB : 0 < B) (hlk : l < k) (hb : ∀ n, 0 ≤ b n)
    (hbound : ∀ n, |d n - c n| ≤ b n)
    (hG : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n ↦ (b n : ℂ)) s (G s))
    (hboundary : PoleBoundary G a l B)
    (hc : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by
  sorry

/-! ## Layer HP.5: zeta checks and the necessity of the boundary hypothesis -/

/-- The divisor function: `∑ d(n) n⁻ˢ = ζ(s)²` on `Re s > 1`, `ζ²` has a double pole at `1` with
numerator value `1`, and `∑_{n ≤ X} d(n) ~ X log X`. -/
theorem zetaSquare_counting :
    (∀ s : ℂ, 1 < s.re →
      LSeriesHasSum (fun n ↦ (n.divisors.card : ℂ)) s (riemannZeta s ^ 2)) ∧
    PoleBoundary (fun s ↦ riemannZeta s ^ 2) 1 1 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ (n.divisors.card : ℝ)) X / (X * Real.log X)) atTop (𝓝 1) := by
  sorry

/-- **A local pole is not enough.** The coefficients `c n = n` on powers of two and `0`
elsewhere have Dirichlet series `1 / (1 - 2 ^ (1 - s))` on `Re s > 1`, with a simple pole at `1`
and numerator value `1 / log 2` there, yet `PoleBoundary` fails because of the other poles on
`Re s = 1`, and `X⁻¹ ∑_{n ≤ X} c n` has the two limit points `2` and `4 / 3`. -/
theorem dyadicLocalPoleCounterexample :
    let c : ℕ → ℝ := (Set.range fun j : ℕ ↦ (2 : ℕ) ^ j).indicator fun n ↦ (n : ℝ)
    let F : ℂ → ℂ := fun s ↦ 1 / (1 - Complex.exp ((1 - s) * Real.log 2))
    (∀ n, 0 ≤ c n) ∧
    (∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)) ∧
    (∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ, AnalyticOnNhd ℂ g (Metric.ball 1 r) ∧
      g 1 = ((1 / Real.log 2 : ℝ) : ℂ) ∧
      ∀ s ∈ Metric.ball (1 : ℂ) r, 1 < s.re → F s = g s / (s - 1)) ∧
    ¬ PoleBoundary F 1 0 (1 / Real.log 2) ∧
    Tendsto (fun j : ℕ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c ((2 : ℝ) ^ j) / (2 : ℝ) ^ j)
      atTop (𝓝 2) ∧
    Tendsto (fun j : ℕ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c (3 * (2 : ℝ) ^ j) /
      (3 * (2 : ℝ) ^ j)) atTop (𝓝 (4 / 3)) ∧
    ¬ Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c X / X) atTop
      (𝓝 (1 / Real.log 2)) := by
  sorry

end TauCetiRoadmap.ArithmeticDirichletSeriesPartII
