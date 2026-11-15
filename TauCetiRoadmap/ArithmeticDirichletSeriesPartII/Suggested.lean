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
Layer 0 also states the rule for the transform of a derivative (README §0.1a), and Layer 2 the
smoothed and interval forms of Wiener–Ikehara at a simple pole for complex coefficients
(README §2.2a). The final layer states the Dirichlet series of the divisor functions `ζ ^ k` and
the leading term of their counts; the dyadic counterexample of README §5.2
is a negative control (a README target with its Checks) and is not an acceptance theorem here.

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

/-! ## Layer 0: convergent Laplace transforms and boundary continuation -/

section Laplace

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMul ℂ E]

/-- `HasLaplace f s z μ`: the integrand `t ↦ exp (-s t) • f t` is integrable for `μ` and its
integral is `z`. With the default measure this is the one-sided Laplace transform of `f` at the
complex parameter `s`. Belongs to Layer 0; it follows the
ordinary transform predicate `HasLaplace` in Osele, “The Laplace transform”, lines 121–123
(osele-laplace line 125). -/
def HasLaplace (f : ℝ → E) (s : ℂ) (z : E) (μ : Measure ℝ := volume.restrict (Ioi 0)) : Prop :=
  Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • f t) μ ∧
    ∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ = z

end Laplace

section LaplaceDeriv

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- The transform of a derivative, primitive form (README §0.1a): if `f` is a primitive of `g`
on `[0, ∞)`, `f` has transform `z` at `s` and `exp (-s t) • g t` is integrable on `(0, ∞)`, then
`g` has transform `s • z - f 0`. No condition on `Re s` is imposed. The textbook rule assumes
exponential order and real `s` beyond it (Lebl, *Notes on Diffy Qs*, version 6.11, §6.2.1,
p. 300); this integrability-only form is derived in the README's proof sketch. -/
theorem hasLaplace_deriv_of_primitive {f g : ℝ → E} {s : ℂ} {z : E}
    (hfg : ∀ t ∈ Ici (0 : ℝ), f t = f 0 + ∫ u in (0 : ℝ)..t, g u)
    (hf : HasLaplace f s z)
    (hg : Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • g t) (volume.restrict (Ioi 0))) :
    HasLaplace g s (s • z - f 0) := by
  sorry

/-- The transform of a derivative (README §0.1a): for `f` continuous at `0` from the right and
differentiable on `(0, ∞)`, if `f` has transform `z` at `s` and the transform integral of `f'`
converges absolutely, then `f'` has transform `s • z - f 0` (compare Lebl, *Notes on Diffy Qs*,
version 6.11, §6.2.1, p. 300, under exponential order). -/
theorem hasLaplace_deriv {f f' : ℝ → E} {s : ℂ} {z : E}
    (hf0 : ContinuousWithinAt f (Ici 0) 0)
    (hderiv : ∀ t ∈ Ioi (0 : ℝ), HasDerivAt f (f' t) t)
    (hf : HasLaplace f s z)
    (hf' : Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • f' t) (volume.restrict (Ioi 0))) :
    HasLaplace f' s (s • z - f 0) := by
  sorry

end LaplaceDeriv

/-- `PoleBoundary F a k A`: `F` is holomorphic on `Re s > a`; near `a` it equals
`g s / (s - a) ^ (k + 1)` with `g` holomorphic on a disc about `a` and `g a = A`; and at every
other point `a + i y` of the line `Re s = a` it extends holomorphically. All agreements are on
the open half-plane. With `A ≠ 0` the pole has order exactly `k + 1`; the main theorems assume
`0 < A`. This is the integer-exponent case of the hypothesis of Delange's Theorem III
(Delange 1954, §5.2.1, pp. 235–236). Belongs to Layer 0. -/
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

/-! ## Layer 1: squared-sinc smoothing and the polynomial weight -/

/-- The squared-sinc kernel `K_λ(v) = (λ / π) sinc (λ v)²`, written `squaredSinc ell v` with
`ell = λ`. For `λ > 0` it is a probability density whose Fourier transform, in angular frequency,
is the triangle `1 - |y| / (2λ)` on `[-2λ, 2λ]`. Belongs to Layer 1. -/
def squaredSinc (ell v : ℝ) : ℝ :=
  ell / Real.pi * Real.sinc (ell * v) ^ 2

/-- Layer 1 milestone: the kernel has total mass one. -/
theorem squaredSinc_mass {ell : ℝ} (hell : 0 < ell) : ∫ v : ℝ, squaredSinc ell v = 1 := by
  sorry

/-- Layer 1 milestone: the kernel is the inverse Fourier transform, in angular frequency, of the
triangle supported on `[-2λ, 2λ]`. -/
theorem squaredSinc_fourier {ell : ℝ} (hell : 0 < ell) (v : ℝ) :
    (squaredSinc ell v : ℂ) = 1 / (2 * Real.pi) *
      ∫ y : ℝ in (-(2 * ell))..(2 * ell),
        ((1 - |y| / (2 * ell) : ℝ) : ℂ) * Complex.exp (Complex.I * y * v) := by
  sorry

/-- Delange's regularising weight `w_k(t) = t ∫₀¹ exp (-u t) u ^ k / k! du`. It vanishes at `0`,
is positive for `t > 0`, and `w_k(t) t ^ k → 1`. The definition is total in `t`. Belongs to
Layer 1. -/
def delangeWeight (k : ℕ) (t : ℝ) : ℝ :=
  t * ∫ u : ℝ in (0 : ℝ)..1, Real.exp (-u * t) * u ^ k / (k.factorial : ℝ)

/-- Layer 1 milestone: `w_k(t) t ^ k → 1` as `t → ∞`. -/
theorem delangeWeight_normalization (k : ℕ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k t * t ^ k) atTop (𝓝 1) := by
  sorry

/-- Layer 1 milestone: the weight varies slowly, `w_k(t + h) / w_k(t) → 1` for fixed `h`. -/
theorem delangeWeight_shift (k : ℕ) (h : ℝ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k (t + h) / delangeWeight k t) atTop (𝓝 1) := by
  sorry

/-! ## Layer 2: regularised transforms and the smoothed limit -/

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

/-- Layer 2 milestone: the smoothed limit. The weighted function
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

/-- **Smoothed Wiener–Ikehara for complex coefficients** (README §2.2a). Under the Chebyshev
bound `∑_{1 ≤ n ≤ x} ‖f n‖ = O(x)` and continuous boundary data `G = LSeries f - A / (s - 1)` on
`Re s ≥ 1`, for every continuous compactly supported `ψ`,
`(1 / x) ∑_{n ≥ 1} f n ψ (n / x) → A ∫₀^∞ ψ`. No sign of `f` is assumed. Compare
`wiener_ikehara_smooth` in PrimeNumberTheoremAnd, `Wiener.lean` (revision `2667e414`), for smooth
`ψ` supported away from `0`, a real residue and a separate summability hypothesis. -/
theorem wienerIkehara_smoothed {f : ℕ → ℂ} {G : ℂ → ℂ} {A : ℂ}
    (hcheby : Asymptotics.IsBigO atTop
      (fun x : ℝ ↦ ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, ‖f n‖) (fun x : ℝ ↦ x))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hG' : ∀ s : ℂ, 1 < s.re → G s = LSeries f s - A / (s - 1))
    {ψ : ℝ → ℂ} (hψ : Continuous ψ) (hψc : HasCompactSupport ψ) :
    Tendsto (fun x : ℝ ↦ (∑' n : ℕ, (if n = 0 then 0 else f n) * ψ (n / x)) / x)
      atTop (𝓝 (A * ∫ y in Ioi (0 : ℝ), ψ y)) := by
  sorry

/-- **Interval form of Wiener–Ikehara for complex coefficients** (README §2.2a). If `‖f n‖ ≤ g n`
for a majorant `g` that has its own summability and continuous boundary data on `Re s ≥ 1`, and
`f` has boundary data `G = LSeries f - A / (s - 1)`, then
`(S_f (b x) - S_f (a x)) / x → A (b - a)` for `0 ≤ a ≤ b`. A Chebyshev bound on `f` alone does
not suffice. Compare `WienerIkeharaInterval` in PrimeNumberTheoremAnd, `Wiener.lean` (revision
`2667e414`), for `f ≥ 0` and `0 < a ≤ b`. -/
theorem wienerIkehara_interval {f : ℕ → ℂ} {g : ℕ → ℝ} {G H : ℂ → ℂ} {A B : ℂ} {a b : ℝ}
    (hfg : ∀ n, ‖f n‖ ≤ g n)
    (hgsum : ∀ σ : ℝ, 1 < σ → LSeriesSummable (fun n ↦ (g n : ℂ)) σ)
    (hH : ContinuousOn H {s : ℂ | 1 ≤ s.re})
    (hH' : ∀ s : ℂ, 1 < s.re → H s = LSeries (fun n ↦ (g n : ℂ)) s - B / (s - 1))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hG' : ∀ s : ℂ, 1 < s.re → G s = LSeries f s - A / (s - 1))
    (ha : 0 ≤ a) (hab : a ≤ b) :
    Tendsto (fun x : ℝ ↦
      (TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else f n) (b * x) -
        TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else f n) (a * x)) / x)
      atTop (𝓝 (A * ((b - a : ℝ) : ℂ))) := by
  sorry

/-! ## Layer 3: Delange's theorem for integer pole orders -/

/-- Monotone removal of the smoothing: smoothed limits `C` at every bandwidth, for a nonnegative
nondecreasing `α`, give `α(t) / (exp (a t) t ^ k) → C`. No sign of `C` is assumed (the integrands
are nonnegative, so `C ≥ 0` follows). A single bandwidth does not suffice. -/
theorem monotoneUnsmoothing {α : ℝ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a)
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

/-! ## Layer 4: counting functions of Dirichlet series and perturbations -/

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

/-! ## Layer 5: zeta checks and the necessity of the boundary hypothesis -/

/-- The divisor functions `d_k = ζ ^ k` (Dirichlet powers of the arithmetic function `ζ`): for
every `k` and `Re s > 1`, `∑ d_k(n) n⁻ˢ` converges absolutely with sum `riemannZeta s ^ k`.
At `k = 0` both sides are `1`. Compare `LSeries_d_summable` and `LSeries_d_eq_riemannZeta_pow` in
PrimeNumberTheoremAnd, `IwaniecKowalskiCh1.lean` (revision `127b50e3`), which state summability
of the terms and the value of `LSeries`. -/
theorem LSeriesHasSum_zeta_pow (k : ℕ) {s : ℂ} (hs : 1 < s.re) :
    Summable (fun n : ℕ ↦ ‖LSeries.term
      (fun n ↦ ((ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) n : ℂ)) s n‖) ∧
    LSeriesHasSum (fun n ↦ ((ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) n : ℂ)) s
      (riemannZeta s ^ k) := by
  sorry

/-- `ζ ^ (k + 1)` has a pole of order `k + 1` at `1` with numerator value `1`, and
`∑_{n ≤ X} d_(k+1)(n) ~ X (log X) ^ k / k!`. At `k = 1` this is `∑_{n ≤ X} d(n) ~ X log X`.
Only the leading term is stated, derived through `delangeDirichlet` as the test of its factorial
normalisation; the expansion with error terms is AnalyticNumberTheoryPartI §3.12a and §3.22. -/
theorem zetaPow_counting (k : ℕ) :
    PoleBoundary (fun s ↦ riemannZeta s ^ (k + 1)) 1 k 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ ((ArithmeticFunction.zeta ^ (k + 1) : ArithmeticFunction ℕ) n : ℝ)) X /
        (X * Real.log X ^ k)) atTop (𝓝 (1 / (k.factorial : ℝ))) := by
  sorry

end TauCetiRoadmap.ArithmeticDirichletSeriesPartII
