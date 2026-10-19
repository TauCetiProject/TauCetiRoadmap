import Mathlib
import TauCeti.Analysis.Complex.Pick.Nevanlinna

/-!
# AutomorphicSpectralTheory: representative target signatures

The roadmap is `README.md`. This file records light definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive. In particular,
it keeps native analytic functions, measures and the upper half-plane; the adelic spaces,
trace distributions and relative cohomology belong to the README. Measurable Hilbert fields,
direct-integral carriers and measure transport are supplied by VonNeumannAlgebras V4.0.Fields;
generic complex traces are supplied by V4.Core. README §0.7 constructs the spectral
representation with measurable multiplicity. OperatorTheory/UnboundedOperators UO-A01–UO-A02
supplies the generic unbounded integral and exact domain used by the automorphic
realization and resolvent-convention transport in §0.6.
AutomorphicFormsOnReductiveGroups supplies the test-function topology, real representation
constructions, smooth globalizations, algebraic restricted tensors and constant-term
transitivity used by the spectral adapters of README §§0.11 and 0.48–0.51.
Its §2.6 supplies the real/complex unitary block classification used by README §7.0b.
Its §3.2 supplies the minimal cuspidal Eisenstein family, meromorphic continuation,
finite-block denominators and constant terms. README §§1.2–1.5 identify that family
with the chamber construction; §§2.4–2.4a extend it to discrete and smooth inducing data.
README §§1.15a–1.15c provide the general reductive Fredholm continuation route,
the GL₂ scattering ratio and the Eisenstein construction of the all-unitary Hecke
functional equation. The last uses ArithmeticGaloisRepresentations §2.7's finite-sum
root-number product and AutomorphicLFunctionsAndLocalFactors AL.1's rank-one local
functional equation, and identifies its completion with that supplier's canonical
Hecke endpoint by agreement of the full initial products. README §3.6a proves the
global Eisenstein/intertwining strip estimates for AL.3's canonical completed
Rankin–Selberg function; the local test realization is supplied by AL.3.

Complex inner products conjugate the first slot. Positive real powers use the real logarithm.
The modular Laplacian has the positive spectral sign. Integrals and sums denote analytic
functions only in their stated convergence regions; continuation is an existence theorem,
with agreement there, rather than evaluation of a divergent integral.
-/

noncomputable section
open MeasureTheory Filter Set
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.AutomorphicSpectralTheory

/-- The invertible-point form of README §0.16's analytic_fredholm gives a meromorphic
bounded inverse, isolated singularities, and finite-rank Laurent principal parts. -/
theorem analytic_fredholm {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]
    [CompleteSpace V] (U : Set ℂ) (hU : IsOpen U) (hconn : IsConnected U)
    (K : ℂ → V →L[ℂ] V) (hK : AnalyticOnNhd ℂ K U)
    (hcompact : ∀ z ∈ U, IsCompactOperator (K z))
    (z₀ : ℂ) (hz₀ : z₀ ∈ U) (hinv : IsUnit (1 - K z₀)) :
    ∃ R : ℂ → V →L[ℂ] V, MeromorphicOn R U ∧
      AnalyticOnNhd ℂ R {z ∈ U | IsUnit (1 - K z)} ∧
      (∀ z ∈ U, IsUnit (1 - K z) →
        R z * (1 - K z) = 1 ∧ (1 - K z) * R z = 1) ∧
      (∀ z ∈ U, ∀ᶠ w in 𝓝[≠] z, IsUnit (1 - K w)) ∧
      ∀ z ∈ U, ∃ n : ℕ, ∃ A : Fin n → V →L[ℂ] V,
        (∀ j, Module.Finite ℂ (LinearMap.range (A j).toLinearMap)) ∧
        ∃ g : ℂ → V →L[ℂ] V, AnalyticAt ℂ g z ∧
          ∀ᶠ w in 𝓝[≠] z,
            R w = g w + ∑ j, (((w - z) ^ (j.val + 1))⁻¹ • A j) := by sorry

/-! ## Layer 0: Hilbert fields, vector analysis and rank-one kernels -/

/-- README §0.4's Gram-preserving map extends uniquely to a closed-range linear isometry;
density of the original image characterizes surjectivity. -/
theorem isometric_integration_map {E H : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (D : Submodule ℂ E) (hD : Dense (D : Set E)) (W₀ : D →ₗ[ℂ] H)
    (hgram : ∀ u v, inner ℂ (W₀ u) (W₀ v) = inner ℂ u v) :
    ∃! W : E →ₗᵢ[ℂ] H,
      (∀ u : D, W u = W₀ u) ∧ IsClosed (Set.range W) ∧
        (Function.Surjective W ↔ Dense (Set.range W₀)) := by sorry

section VectorAnalysis
variable {V : Type*} [NormedAddCommGroup V]

/-- Finite order on closed vertical strips to the right of `C`, with any larger exponent.
This is the normed specialization of the locally convex condition in the README. -/
def StripOrder (f : ℂ → V) (d C : ℝ) : Prop :=
  ∀ d' : ℝ, d < d' → ∀ a b : ℝ, C < a → a ≤ b →
    ∃ M : ℝ, ∀ s : ℂ, a ≤ s.re → s.re ≤ b →
      Real.exp (-(‖s‖ ^ d')) * ‖f s‖ ≤ M

/-- An order exponent is common to all strips, while their bounding constants may differ.
For scalar functions, AutomorphicLFunctionsAndLocalFactors AL.3's `BoundedOnStrips`
implies this growth condition on every right half-plane. -/
def FiniteStripOrder (f : ℂ → V) (C : ℝ) : Prop :=
  ∃ d : ℝ, 0 < d ∧ StripOrder f d C

/-- README §0.18's strip-order bound persists when the order is increased. -/
theorem StripOrder.mono_order (f : ℂ → V) (d e C : ℝ)
    (hf : StripOrder f d C) (hde : d ≤ e) : StripOrder f e C := by sorry

/-- README §0.18's sum has the larger of the two positive strip orders. -/
theorem StripOrder.add (f g : ℂ → V) (d e C : ℝ) (hd : 0 < d) (he : 0 < e)
    (hf : StripOrder f d C) (hg : StripOrder g e C) :
    StripOrder (fun z => f z + g z) (max d e) C := by sorry

/-- README §0.18's finite strip order is preserved by continuous linear postcomposition. -/
theorem FiniteStripOrder.postcomp [NormedSpace ℂ V]
    {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    (f : ℂ → V) (C : ℝ) (hf : FiniteStripOrder f C) (L : V →L[ℂ] W) :
    FiniteStripOrder (fun z => L (f z)) C := by sorry

/-- Native Banach-valued meromorphy is equivalent to local analytic regularization
on balls in the open domain, independently of the value at the centre. -/
theorem meromorphicOn_iff_local_regularization [NormedSpace ℂ V] [CompleteSpace V]
    (U : Set ℂ) (hU : IsOpen U) (f : ℂ → V) :
    MeromorphicOn f U ↔
      ∀ z ∈ U, ∃ n : ℕ, ∃ r : ℝ, 0 < r ∧ Metric.ball z r ⊆ U ∧
        ∃ g : ℂ → V, AnalyticOnNhd ℂ g (Metric.ball z r) ∧
          ∀ s ∈ Metric.ball z r, s ≠ z → g s = (s - z) ^ n • f s := by sorry

/-- Continuous linear postcomposition preserves native vector-valued meromorphy. -/
theorem meromorphicOn_postcomp [NormedSpace ℂ V]
    {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    (U : Set ℂ) (f : ℂ → V) (hf : MeromorphicOn f U) (ell : V →L[ℂ] W) :
    MeromorphicOn (fun z => ell (f z)) U := by sorry

/-- The double exponential in README §0.18 exceeds every finite vertical-strip order. -/
theorem not_finiteStripOrder_double_exp : ¬ FiniteStripOrder (fun z : ℂ => Complex.exp (Complex.exp (-Complex.I * z))) (-1) := by sorry
end VectorAnalysis

namespace Herglotz

#check TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add

/-- Convert the library's finite Nevanlinna measure to the subtracted-kernel measure. -/
def weightedMeasure (rho : Measure ℝ) : Measure ℝ :=
  rho.withDensity (fun t => ENNReal.ofReal (1 + t ^ 2))

/-- The converted measure has finite reciprocal-quadratic moment, equal to the original mass. -/
theorem weighted_mass (rho : Measure ℝ) [IsFiniteMeasure rho] :
    Integrable (fun t : ℝ => (1 + t ^ 2)⁻¹) (weightedMeasure rho) ∧
      ∫ t : ℝ, (1 + t ^ 2)⁻¹ ∂weightedMeasure rho = ∫ _ : ℝ, (1 : ℝ) ∂rho := by sorry

/-- The subtraction convention agrees with Tau Ceti's bounded Nevanlinna kernel. -/
theorem integral_conversion (rho : Measure ℝ) [IsFiniteMeasure rho]
    (z : ℂ) (hz : 0 < z.im) :
    Integrable (fun t : ℝ => ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ))
      (weightedMeasure rho) ∧
      ∫ t : ℝ, ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ) ∂weightedMeasure rho =
        ∫ t : ℝ, (1 + (t : ℂ) * z) / ((t : ℂ) - z) ∂rho := by sorry

/-- Uniqueness, including the linear coefficient, in the subtracted-kernel convention. -/
theorem herglotz_representation (F : ℂ → ℂ)
    (hF : AnalyticOnNhd ℂ F {z : ℂ | 0 < z.im})
    (hIm : ∀ z : ℂ, 0 < z.im → 0 ≤ (F z).im) :
    ∃! p : ℝ × ℝ × Measure ℝ,
      p.1 = (F Complex.I).re ∧ 0 ≤ p.2.1 ∧
      Integrable (fun t : ℝ => (1 + t ^ 2)⁻¹) p.2.2 ∧
      ∀ z : ℂ, 0 < z.im → F z = (p.1 : ℂ) + (p.2.1 : ℂ) * z +
        ∫ t : ℝ, ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ) ∂p.2.2 := by sorry

end Herglotz

namespace SpecialFunctions

/-- Real-logarithm complex power; the analytic formulas below require a positive base. -/
def rpowC (x : ℝ) (s : ℂ) : ℂ := Complex.exp (s * (Real.log x : ℂ))

-- The first-kind Bessel function and its integral-order symmetry are library suppliers.
#check Complex.besselJ
#check Complex.besselJ_neg_int

/-- I differs from J by the sign of the hypergeometric argument. -/
def bessel_i (nu : ℂ) (y : ℝ) : ℂ :=
  ((y : ℂ) / 2) ^ nu * Complex.regularizedHGFun 0 {nu + 1} ((y : ℂ) ^ 2 / 4)

/-- Reciprocal gamma, as totalized in the library, handles negative integral orders. -/
theorem bessel_j_series (nu : ℂ) (y : ℝ) :
    HasSum (fun k : ℕ => (-1 : ℂ) ^ k * ((y : ℂ) / 2) ^ (nu + 2 * k) /
      ((k.factorial : ℂ) * Complex.Gamma (nu + k + 1))) (Complex.besselJ nu y) := by sorry

/-- The modified Bessel series has no alternating sign. -/
theorem bessel_i_series (nu : ℂ) (y : ℝ) :
    HasSum (fun k : ℕ => ((y : ℂ) / 2) ^ (nu + 2 * k) /
      ((k.factorial : ℂ) * Complex.Gamma (nu + k + 1))) (bessel_i nu y) := by sorry

/-- Bessel's differential equation on the positive real axis. -/
theorem bessel_j_ode (nu : ℂ) (y : ℝ) (hy : 0 < y) :
    (y : ℂ) ^ 2 * deriv (deriv (fun y : ℝ => Complex.besselJ nu y)) y +
      (y : ℂ) * deriv (fun y : ℝ => Complex.besselJ nu y) y +
      ((y : ℂ) ^ 2 - nu ^ 2) * Complex.besselJ nu y = 0 := by sorry

/-- Modified Bessel's differential equation fixes both signs. -/
theorem bessel_i_ode (nu : ℂ) (y : ℝ) (hy : 0 < y) :
    (y : ℂ) ^ 2 * deriv (deriv (bessel_i nu)) y + (y : ℂ) * deriv (bessel_i nu) y -
      ((y : ℂ) ^ 2 + nu ^ 2) * bessel_i nu y = 0 := by sorry

/-- M uses the entire regularized series, with gamma poles excluded from its analytic domain. -/
def whittaker_m (mu nu : ℂ) (y : ℝ) : ℂ :=
  Complex.Gamma (1 + 2 * nu) * Complex.exp (-(y : ℂ) / 2) * rpowC y (nu + 1 / 2) *
    Complex.regularizedHGFun {nu - mu + 1 / 2} {1 + 2 * nu} y

/-- Euler's integral agrees with M only in its initial convergence region. -/
theorem whittaker_m_euler (mu nu : ℂ) (y : ℝ) (hy : 0 < y)
    (hp : 0 < (nu + mu + 1 / 2).re) (hm : 0 < (nu - mu + 1 / 2).re) :
    whittaker_m mu nu y = rpowC y (nu + 1 / 2) * Complex.exp ((y : ℂ) / 2) *
      Complex.Gamma (1 + 2 * nu) /
        (Complex.Gamma (nu + mu + 1 / 2) * Complex.Gamma (nu - mu + 1 / 2)) *
      ∫ t in (0 : ℝ)..1,
        rpowC t (nu + mu - 1 / 2) * rpowC (1 - t) (nu - mu - 1 / 2) *
          Complex.exp (-(y : ℂ) * t) := by sorry

/-- The M–I normalization, with every factor of two retained. -/
theorem whittaker_bessel_comparison (nu : ℂ) (y : ℝ) (hy : 0 < y)
    (hnu : 0 < (nu + 1 / 2).re) :
    bessel_i nu y = rpowC 2 (-2 * nu - 1 / 2) / Complex.Gamma (nu + 1) *
      rpowC y (-1 / 2) * whittaker_m 0 nu (2 * y) := by sorry

/-- Whittaker's ODE and the growing normalization in the convergent Euler region. -/
theorem whittaker_asymptotics (mu nu : ℂ)
    (hp : 0 < (nu + mu + 1 / 2).re) (hm : 0 < (nu - mu + 1 / 2).re) :
    (∀ y : ℝ, 0 < y → deriv (deriv (whittaker_m mu nu)) y +
      (-1 / 4 + mu / y + (1 / 4 - nu ^ 2) / (y : ℂ) ^ 2) * whittaker_m mu nu y = 0) ∧
    Tendsto (fun y : ℝ => whittaker_m mu nu y / rpowC y (nu + 1 / 2))
      (𝓝[>] 0) (𝓝 1) ∧
    Tendsto (fun y : ℝ => whittaker_m mu nu y /
      (rpowC y (-mu) * Complex.exp ((y : ℂ) / 2)))
      atTop (𝓝 (Complex.Gamma (1 + 2 * nu) / Complex.Gamma (nu - mu + 1 / 2))) := by sorry

/-- Corrected sine-power integral; reciprocal gamma interprets exceptional denominator values. -/
theorem sine_power_integral (nu beta : ℂ) (hnu : 0 < nu.re) :
    (∫ theta in (0 : ℝ)..Real.pi,
      Complex.exp (Complex.I * beta * theta) * rpowC (Real.sin theta) (nu - 1)) =
      Real.pi * Complex.exp (Complex.I * Real.pi * beta / 2) * Complex.Gamma nu /
        (rpowC 2 (nu - 1) * Complex.Gamma ((nu + beta + 1) / 2) *
          Complex.Gamma ((nu - beta + 1) / 2)) := by sorry

/-- The branch `Q_{s−1}(t)` for `t>1`, initially `Re(s)>0`. -/
def legendre_q (s : ℂ) (t : ℝ) : ℂ :=
  ∫ u in Set.Ioi (0 : ℝ), rpowC (t + Real.sqrt (t ^ 2 - 1) * Real.cosh u) (-s)

/-- Integral–hypergeometric comparison in the common convergence region. -/
theorem legendre_q_hypergeometric (s : ℂ) (hs : 0 < s.re) (t : ℝ) (ht : 1 < t) :
    legendre_q s t = Complex.Gamma s ^ 2 / (2 * Complex.Gamma (2 * s)) *
      rpowC (2 / (1 + t)) s * (Complex.Gamma (2 * s) *
        Complex.regularizedHGFun {s, s} {2 * s} (2 / (1 + t))) := by sorry

/-- The logarithmic singularity and large-distance decay of the initial Q branch. -/
theorem legendre_q_asymptotics (s : ℝ) (hs : 1 < s) :
    (∃ C eps : ℝ, 0 < eps ∧ ∀ t : ℝ, 1 < t → t < 1 + eps →
      ‖legendre_q s t + (1 / 2 * Real.log (t - 1) : ℝ)‖ ≤ C) ∧
    ∃ C : ℝ, ∀ t : ℝ, 2 ≤ t → ‖legendre_q s t‖ ≤ C * t ^ (-s) := by sorry

/-- The analytic point-pair kernel; the diagonal is excluded in its smooth API. -/
def point_pair_invariant (s : ℂ) (z z' : UpperHalfPlane) : ℂ :=
  -2 * legendre_q s (1 + ‖(z : ℂ) - (z' : ℂ)‖ ^ 2 / (2 * z.im * z'.im))

/-- Simultaneous Möbius transformations preserve the point-pair coordinate. -/
theorem point_pair_invariant_invariant (s : ℂ)
    (g : Matrix.SpecialLinearGroup (Fin 2) ℝ) (z z' : UpperHalfPlane) :
    point_pair_invariant s (g • z) (g • z') = point_pair_invariant s z z' := by sorry

/-- The point-pair kernel at order one is the logarithmic Green seed of README §0.37. -/
theorem point_pair_invariant_s_one (z z' : UpperHalfPlane) (hne : z ≠ z') :
    point_pair_invariant 1 z z' = (Real.log (‖(z : ℂ) - (z' : ℂ)‖ ^ 2 /
      ‖star (z : ℂ) - (z' : ℂ)‖ ^ 2) : ℝ) := by sorry

/-- Fourier integral V_s(t), absolutely convergent for Re(s)>1−k and k≥1. -/
def archimedean_v_integral (k : ℕ) (s : ℂ) (t : ℝ) : ℂ :=
  ∫ x : ℝ, Complex.exp (-2 * Real.pi * Complex.I * x * t) /
    (((x : ℂ) + Complex.I) ^ (2 * k - 1) * rpowC (x ^ 2 + 1) s)

/-- The strict convergence threshold includes all derivatives on compact sub-half-planes. -/
theorem archimedean_v_integrable_iff (k : ℕ) (hk : 1 ≤ k) (s : ℂ) :
    Integrable (fun x : ℝ => (((x : ℂ) + Complex.I) ^ (2 * k - 1) *
      rpowC (x ^ 2 + 1) s)⁻¹) ↔ 1 - (k : ℝ) < s.re := by sorry

/-- The zero-frequency gamma formula, with the initial domain retained. -/
theorem archimedean_v_at_zero (k : ℕ) (hk : 1 ≤ k) (s : ℂ)
    (hs : 1 - (k : ℝ) < s.re) :
    archimedean_v_integral k s 0 = (-1 : ℂ) ^ k * Real.pi * Complex.I *
      rpowC 2 (-2 * s - 2 * k + 3) * Complex.Gamma (2 * s + 2 * k - 2) /
        (Complex.Gamma s * Complex.Gamma (s + 2 * k - 1)) := by sorry

/-- Entire continuation at nonzero frequency is supplied by a function agreeing on the half-plane. -/
theorem archimedean_v_holomorphic (k : ℕ) (hk : 1 ≤ k) (t : ℝ) (ht : t ≠ 0) :
    ∃ F : ℂ → ℂ, AnalyticOnNhd ℂ F Set.univ ∧
      ∀ s : ℂ, 1 - (k : ℝ) < s.re → F s = archimedean_v_integral k s t := by sorry

end SpecialFunctions

/-! ## Layer 1: Normalized induction and convergent Eisenstein families -/

namespace Modular
open SpecialFunctions

/-- Classical weight-k Laplacian on ambient functions restricted to Im(z)>0.
The real derivatives use the horizontal and vertical affine lines through z. -/
def weight_laplacian (k : ℝ) (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  -(z.im ^ 2 : ℂ) *
      (deriv (deriv (fun t : ℝ => f (z + t))) 0 +
        deriv (deriv (fun t : ℝ => f (z + t * Complex.I))) 0) +
    k * Complex.I * z.im * deriv (fun t : ℝ => f (z + t)) 0 -
    k * z.im * deriv (fun t : ℝ => f (z + t * Complex.I)) 0

/-- On y^s the classical weight-k operator has eigenvalue s(1−k−s). -/
theorem weight_laplacian_power (k : ℝ) (s z : ℂ) (hz : 0 < z.im) :
    weight_laplacian k (fun w => rpowC w.im s) z =
      s * (1 - k - s) * rpowC z.im s := by sorry

/-- The finite Kloosterman sum uses units modulo a positive modulus. -/
def kloosterman_sum (m n : ℤ) (c : ℕ) [NeZero c] : ℂ :=
  ∑ d : (ZMod c)ˣ,
    Complex.exp (2 * Real.pi * Complex.I *
      (((m : ℂ) * (d.val.val : ℂ) + n * (d⁻¹).val.val) / c))

/-- Inversion of units interchanges the two frequencies. -/
theorem kloosterman_sum_symm (m n : ℤ) (c : ℕ) [NeZero c] :
    kloosterman_sum m n c = kloosterman_sum n m c := by sorry

/-- The SL₂ spherical translate at s = 2 is smooth and has an infinite-dimensional
rotation-orbit span whenever the translating diagonal element is nontrivial. -/
theorem spherical_translate_not_k_finite (t : ℝ) (ht : t ≠ 0) :
    let F : ℝ → ℂ := fun θ =>
      (((Real.exp (2 * t) * Real.sin θ ^ 2 +
        Real.exp (-2 * t) * Real.cos θ ^ 2 : ℝ) : ℂ) ^ 2)⁻¹
    ContDiff ℝ ⊤ F ∧
      ¬ Module.Finite ℂ (Submodule.span ℂ
        (Set.range (fun a : ℝ => fun θ : ℝ => F (θ + a)))) := by sorry

/-- Primitive-pair expression for the full modular Eisenstein series; ± pairs count once. -/
def nonholomorphic_eisenstein (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  1 / 2 * rpowC z.im s *
    ∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1},
      rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)

/-- Absolute convergence, not merely totalized summability, in the standard half-plane. -/
theorem nonholomorphic_eisenstein_summable (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    Summable (fun p : {p : ℤ × ℤ // p.1.gcd p.2 = 1} =>
      rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)) := by sorry

/-- The initial Eisenstein function is modular invariant. -/
theorem nonholomorphic_eisenstein_automorphy
    (g : Matrix.SpecialLinearGroup (Fin 2) ℤ) (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    nonholomorphic_eisenstein (g • z) s = nonholomorphic_eisenstein z s := by sorry

/-- Ambient extensions agreeing on the open upper half-plane have the same eigen-equation. -/
theorem nonholomorphic_eisenstein_eigenfunction (f : ℂ → ℂ)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re)
    (hf : ∀ w : UpperHalfPlane, f w = nonholomorphic_eisenstein w s) :
    weight_laplacian 0 f z = s * (1 - s) * nonholomorphic_eisenstein z s := by sorry

/-- README §1.29's Eisenstein remainder is uniform in the real part of z at every real s > 1. -/
theorem eisenstein_growth (s : ℝ) (hs : 1 < s) :
    ∃ C Y : ℝ, 0 ≤ C ∧ 0 < Y ∧ ∀ z : UpperHalfPlane, Y ≤ z.im →
      ‖nonholomorphic_eisenstein z s - rpowC z.im s‖ ≤ C * z.im ^ (1 - s) := by sorry
/-- At s = 1 the primitive-pair series of README §1.14 fails to converge. -/
theorem nonholomorphic_eisenstein_not_summable_at_one (z : UpperHalfPlane) :
    ¬ Summable (fun p : {p : ℤ × ℤ // p.1.gcd p.2 = 1} =>
      rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2)) := by sorry

/-- The infinity-cusp Eisenstein series at positive level N, in the primitive-pair model. -/
def level_eisenstein (N : ℕ) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  1 / 2 * rpowC z.im s *
    ∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1 ∧ (N : ℤ) ∣ p.1},
      rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)

/-- Absolute convergence at a positive level. -/
theorem level_eisenstein_summable (N : ℕ) (hN : 0 < N)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    Summable (fun p : {p : ℤ × ℤ // p.1.gcd p.2 = 1 ∧ (N : ℤ) ∣ p.1} =>
      rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)) := by sorry

/-- The positive-level series is invariant under its native congruence subgroup. -/
theorem level_eisenstein_automorphy (N : ℕ) (hN : 0 < N)
    (g : CongruenceSubgroup.Gamma0 N) (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    level_eisenstein N ((g : Matrix.SpecialLinearGroup (Fin 2) ℤ) • z) s = level_eisenstein N z s := by sorry

end Modular

/-! ## Layer 2: Meromorphic continuation, local normalization and residues -/

namespace Modular
open SpecialFunctions

/-- Completed E has a meromorphic continuation, reflection, and residues −1/2 and 1/2.
Point values at the poles carry no residue information. -/
theorem completed_eisenstein_continuation :
    ∃ E : UpperHalfPlane → ℂ → ℂ,
      (∀ z, MeromorphicOn (E z) Set.univ) ∧
      (∀ z, AnalyticOnNhd ℂ (E z) ({0, 1}ᶜ : Set ℂ)) ∧
      (∀ z s, 1 < s.re → E z s = completedRiemannZeta (2 * s) * nonholomorphic_eisenstein z s) ∧
      (∀ z s, s ∉ ({0, 1} : Set ℂ) → E z (1 - s) = E z s) ∧
      (∀ z, Tendsto (fun s => s * E z s) (𝓝[≠] 0) (𝓝 (-1 / 2))) ∧
      (∀ z, Tendsto (fun s => (s - 1) * E z s) (𝓝[≠] 1) (𝓝 (1 / 2))) := by sorry

/-- The uncompleted full modular Eisenstein function has residue 3/π at one. -/
theorem nonholomorphic_eisenstein_continuation :
    ∃ E : UpperHalfPlane → ℂ → ℂ,
      (∀ z, MeromorphicOn (E z) Set.univ) ∧
      (∀ z s, 1 < s.re → E z s = nonholomorphic_eisenstein z s) ∧
      (∀ z, Tendsto (fun s => (s - 1) * E z s) (𝓝[≠] 1) (𝓝 (3 / Real.pi : ℂ))) := by sorry
end Modular

/-! ## Layer 6: Paley–Wiener theory and trace distributions -/

/-- The rank-one regularized sum retains the coroot-lattice covolume.
Wall agreement cancels the pole, leaving the covolume times the derivative difference. -/
theorem gm_family_rank_one_limit (cPlus cMinus : ℂ → ℂ) (dPlus dMinus : ℂ)
    (v : ℝ) (hv : 0 < v)
    (hPlus : HasDerivAt cPlus dPlus 0) (hMinus : HasDerivAt cMinus dMinus 0)
    (hwall : cPlus 0 = cMinus 0) :
    Tendsto (fun z : ℂ => cPlus z / (z / (v : ℂ)) + cMinus z / (-z / (v : ℂ)))
      (𝓝[≠] 0) (𝓝 ((v : ℂ) * (dPlus - dMinus))) := by sorry

/-- The scalar rank-one weighted character is the negative logarithmic derivative
times the scalar test operator. The reference chamber is P, R maps I_P to I_P̄,
and the coroot coordinate z gives denominators z and −z with covolume one. -/
theorem weighted_character_rank_one_scalar (R : ℂ → ℂ) (lam R' a : ℂ)
    (hR : HasDerivAt R R' lam) (hne : R lam ≠ 0) :
    Tendsto (fun z : ℂ => (1 / z + (R lam)⁻¹ * R (lam + z) / (-z)) * a)
      (𝓝[≠] 0) (𝓝 (-(R lam)⁻¹ * R' * a)) := by sorry

/-! ## Layer 7: Cyclic transfer and degree-one comparison

The signatures below give the ordered norm, normalized intertwiner, scalar transfer,
finite spectral isolation, analytic tail, and arithmetic splitting interfaces of §§7.0–7.1d.
The full automorphic trace comparison, cuspidal Hecke-root bound, cohomological extension
construction and descent statements are specified in the README.
The local unitary and residual-Speh Shintani theorem of §7.0b supplies individual
constituent character identities. Induction gives such an identity on irreducible products
only when both products are irreducible. General norm-twisted isobaric base change in §7.1
uses the Langlands-quotient construction without asserting that character identity.
Finite-place quotient constructions retain SR.3.3's Harish–Chandra tempered-support hypothesis.
The unitary classification constructed in §7.0b concerns finite places only;
AutomorphicFormsOnReductiveGroups §2.6 supplies the real/complex Speh and complementary
blocks, their unitarity, product irreducibility, exhaustion and block uniqueness.
Section 7.0b constructs the archimedean Shintani and normalized-operator comparisons.
-/

/-- The cyclic norm is an ordered product, also for a noncommutative group. -/
def cyclic_twisted_norm {G : Type*} [Group G] (σ : G ≃* G) (l : ℕ) (δ : G) : G :=
  (List.ofFn (fun i : Fin l => (σ ^ i.val) δ)).prod

/-- Twisted conjugation becomes ordinary conjugation of the cyclic norm. -/
theorem cyclic_twisted_norm_conjugacy {G : Type*} [Group G]
    (σ : G ≃* G) (l : ℕ) (hl : σ ^ l = 1) (δ x : G) :
    cyclic_twisted_norm σ l (x⁻¹ * δ * σ x) =
      x⁻¹ * cyclic_twisted_norm σ l δ * x := by sorry

/-- A preserved nonzero Whittaker line fixes the scalar ambiguity in the intertwiner.
The scalar commutant is the Schur hypothesis used here; the functional is not a zero line. -/
theorem whittaker_intertwiner_unique {G V : Type*} [Group G]
    [AddCommGroup V] [Module ℂ V] (ρ : Representation ℂ G V)
    (σ : G ≃* G) (l : ℕ) (hl : σ ^ l = 1)
    (Λ : V →ₗ[ℂ] ℂ) (hΛ : Λ ≠ 0)
    (hSchur : ∀ T : V →ₗ[ℂ] V,
      (∀ g, T.comp (ρ g) = (ρ g).comp T) → ∃ c : ℂ, T = c • LinearMap.id)
    (B : V ≃ₗ[ℂ] V) (hB : ∀ g v, B (ρ g v) = ρ (σ g) (B v))
    (c : ℂ) (hc : c ≠ 0) (hline : Λ.comp B.toLinearMap = c • Λ) :
    ∃! A : V ≃ₗ[ℂ] V,
      (∀ g v, A (ρ g v) = ρ (σ g) (A v)) ∧
      Λ.comp A.toLinearMap = Λ ∧ A ^ l = 1 := by sorry

/-- Norm-pushforward of the measure gives the scalar transfer character identity. -/
theorem norm_transfer_character {G H : Type*} [Group G] [Group H]
    [MeasurableSpace G] [MeasurableSpace H] (N : G →* H) (hN : Measurable N)
    (μ : Measure G) (ν : Measure H) (hμ : Measure.map N μ = ν)
    (χ : H →* ℂˣ) (f : H → ℂ)
    (hf : Integrable (fun x => f x * (χ x : ℂ)) ν) :
    (∫ x, f (N x) * (χ (N x) : ℂ) ∂μ) =
      ∫ x, f x * (χ x : ℂ) ∂ν := by sorry

/-- The unramified trace after residue degree f is the power sum of the Satake roots.
GL2AutomorphicRepresentationsAndTransfer R17.4.1 uses the diagonal complex specialization
to compare its trace-and-determinant recurrence. At f = 0 the trace is n. -/
theorem satake_power_sum {n : ℕ} (α : Fin n → ℂ) (f : ℕ) :
    Matrix.trace ((Matrix.diagonal α) ^ f) = ∑ i, (α i) ^ f := by sorry

/-- Independent character distributions determine every coefficient in a finite spectral sum. -/
theorem trace_coefficient_isolation {ι T : Type*} [Fintype ι]
    (χ : ι → T → ℂ) (hχ : LinearIndependent ℂ χ) (a b : ι → ℂ)
    (h : ∀ t, ∑ i, a i * χ i t = ∑ i, b i * χ i t) : a = b := by sorry

/-- A constituent LRS bound implies the common total-rank bound after unitary normalization. -/
theorem lrs_isobaric_root_bound (m n : ℕ) (hm : 0 < m) (hmn : m ≤ n)
    (q : ℝ) (hq : 1 < q) (α : ℂ)
    (hα : ‖α‖ ≤ q ^ (1 / 2 - 1 / ((m : ℝ) ^ 2 + 1))) :
    ‖α‖ ≤ q ^ (1 / 2 - 1 / ((n : ℝ) ^ 2 + 1)) := by sorry

/-- The first omitted residue degree gives a strictly summable Rankin–Selberg exponent. -/
theorem lrs_degree_margin (n d : ℕ) (hd : (n ^ 2 + 1) / 2 < d) :
    1 < (d : ℝ) * (2 / ((n : ℝ) ^ 2 + 1)) := by sorry

/-- The LRS high-degree logarithmic majorant is summable, including every prime power.
Summing over all integers at least two also majorizes the prime sum. -/
theorem lrs_rankin_selberg_tail (n d : ℕ) (hd : (n ^ 2 + 1) / 2 < d) :
    Summable (fun k : ℕ => ∑' r : ℕ,
      (((k : ℝ) + 2) ^ (-(d : ℝ) * (2 / ((n : ℝ) ^ 2 + 1)))) ^ (r + 1) /
        ((r : ℝ) + 1)) := by sorry

open scoped NumberField in
/-- Every prime above P has ramification index and residue degree one. -/
def split_at (F L : Type) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] (P : Ideal (𝓞 F)) : Prop :=
  ∀ Q : Ideal (𝓞 L), Q.IsMaximal → Q.LiesOver P →
    Q.ramificationIdx (𝓞 F) = 1 ∧ Q.inertiaDeg (𝓞 F) = 1

open scoped NumberField in
/-- A cyclic degree-p field, disjoint from K, with the prescribed primes split. -/
structure AuxiliaryCyclicSplitData (F K : Type) [Field F] [NumberField F]
    [Field K] [NumberField K] [Algebra F K] (p : ℕ) (T : Finset (Ideal (𝓞 F))) where
  E : Type
  [fieldE : Field E]
  [numberFieldE : NumberField E]
  [algebraFE : Algebra F E]
  [galoisFE : IsGalois F E]
  [cyclic : IsCyclic (E ≃ₐ[F] E)]
  degree : Module.finrank F E = p
  disjoint : IsDomain (TensorProduct F K E)
  split : ∀ P ∈ T, split_at F E P

open scoped NumberField in
/-- Prime-order Grunwald prescriptions give a disjoint cyclic field split at finite good primes.
This is the splitting substatement of the auxiliary construction, with no H² assertion. -/
theorem auxiliary_cyclic_split (F K : Type) [Field F] [NumberField F]
    [Field K] [NumberField K] [Algebra F K] (p : ℕ) (hp : p.Prime)
    (T : Finset (Ideal (𝓞 F))) (hT : ∀ P ∈ T, P.IsMaximal ∧ P ≠ ⊥) :
    Nonempty (AuxiliaryCyclicSplitData F K p T) := by sorry

/-- In a cyclic p² group, a Frobenius nontrivial modulo its order-p subgroup has order p². -/
theorem cyclic_square_order {G : Type*} [Group G] [Finite G] [IsCyclic G]
    (p : ℕ) (hp : p.Prime) (hG : Nat.card G = p ^ 2)
    (H : Subgroup G) (hH : Nat.card H = p) (x : G) (hx : x ∉ H) :
    orderOf x = p ^ 2 := by sorry

/-- A width bounded by D, decreasing strictly until zero, reaches zero within D steps. -/
theorem width_iteration (D : ℕ) (w : ℕ → ℕ) (hD : w 0 ≤ D)
    (hstep : ∀ k, 0 < w k → w (k + 1) < w k)
    (hzero : ∀ k, w k = 0 → w (k + 1) = 0) : w D = 0 := by sorry

/-- Distinct self-twist characters of an irreducible m-dimensional representation number at most m².
Each witness is an actual invertible intertwiner, with the character carried in its equation. -/
theorem self_twist_card_bound {G : Type*} [Group G] (m : ℕ)
    (ρ : Representation ℂ G (Fin m → ℂ)) [Representation.IsIrreducible ρ]
    (X : Finset (G →* ℂˣ))
    (hX : ∀ χ ∈ X, ∃ A : (Fin m → ℂ) ≃ₗ[ℂ] (Fin m → ℂ),
      ∀ g v, A (ρ g v) = (χ g : ℂ) • ρ g (A v)) :
    X.card ≤ m ^ 2 := by sorry

/-
README constructions needing the adelic, representation-theoretic, direct-integral or
locally convex carriers:
Layer 0: hilbert_schmidt_kernel, unbounded_selfadjoint_spectral, spectral_representation,
nuclear_lf_space, nuclear_function_kernel, vector_schwartz, operator_meromorphic, archimedean_v_normalized_entire,
spectral_cycle_coordinates, compact_cover_transfer, whittaker_w,
vector_schwartz_entire, locally_convex_integration, vector_phragmen_lindelof,
real_representation_foundations, smooth_frechet_globalization, restricted_tensor_factorization,
constant_term_transitivity. The nuclear_lf_space target adds nuclearity and distribution duals
to the test-function topology supplied by AutomorphicFormsOnReductiveGroups §0.2.
The real_representation_foundations and smooth_frechet_globalization adapters identify the
spectral compact picture and smooth-vector topology with that supplier's §§2.1–2.4 and 2.7.
The restricted_tensor_factorization adapter uses its §§3.4–3.5 algebraic factorization and
identifies the unitary Hilbert tensor realization. The constant_term_transitivity adapter
uses its §4.1 quotient disintegration for P ⊆ Q, with N_P = N_Q ⋊ N_{P∩M_Q}.
Completed projective tensors are supplied by NoncommutativeGeometry N1.
The strip-order API target StripOrder.mono_order is in README §0.18.

Layer 1: function_field_adelic_data, function_field_eisenstein_theory, modular_laplacian_realization,
induced_family, eisenstein_series, convergent_intertwiner, euclidean_paley_wiener, pseudo_eisenstein,
cuspidal_datum_space, unramified_character_torus, induced_spherical_section,
induction_normalization_transport, bessel_kloosterman_coefficient, poincare_family,
poincare_one_form, character_eisenstein, genus_eisenstein.

README §§1.15a–1.15c specify three intended theorem interfaces:
eisensteinSeries_meromorphicContinuation_fredholm continues E and the unnormalised M
for a number-field connected reductive group and a smooth, finite-level, K-finite,
moderate-growth automorphic inducing form finite under the Levi infinitesimal centre,
with Weyl functional and
composition equations and affine-root singularities. The proof uses the §0.16 Fredholm
input and Bernstein's locally finite analytic systems; smooth operator bounds and
finite spectral-strip order have the separate hypotheses and targets listed there.
borelIntertwining_constant_eq_heckeRatio identifies the GL₂ Borel intertwiner for a
unitary character pair with L^S(s, χ) / L^S(s + 1, χ) times the actual local operators
at S, in the normalized induction with exponents s/2 and -s/2. Scalar extraction uses
a nonzero local matrix-coefficient germ, with a nonzero holomorphic value in Re s > 0.
Its Whittaker comparison uses AL.1's
rank-one local functional equation with the arithmetic Tate constant.
unitaryHeckeFunctionalEquation constructs the primitive conductor-balanced completion
from Eisenstein scattering for every unitary idele-class character of every number
field, derives its inverse-character equation with the Gauss-sum root number, and
identifies it with AL.1's canonical Hecke continuation. Agreement uses the full
primitive Euler product, archimedean factors and conductor power on Re u > 1;
scattering ratios alone do not fix the normalization. The comparison identifies
polar principal parts: only pure imaginary norm characters have poles, simple at
-i r and 1 - i r. The character parameter uses
TauCeti.GlobalNumberFields.HeckeCharacter with the explicit unitary hypothesis.
The adelic inducing, intertwining and completed Hecke-function carriers are
specified in the README.

README §3.6a consumes AL.3's canonical completed Rankin–Selberg endpoint for every
positive rank pair. Its global Eisenstein/intertwining strip estimates use the
continued families, truncation and local normalizing-factor comparison. Agreement
of the full initial products, including ramified and archimedean factors, identifies
the spectral scalar with the supplied continuation and all polar principal parts.
The local realization is AL.3's: finite K-finite tests for equal or adjacent ranks,
and smooth completed projective tensors for arbitrary gaps. These local bounds
are separate from the global strip estimates constructed here.

The cuspidal restrictions of eisenstein_series, convergent_intertwiner and
cuspidal_constant_term identify the minimal analytic family supplied by
AutomorphicFormsOnReductiveGroups §3.2 in the same normalized compact picture and measures.
The eisenstein_continuation target extends that family to discrete inducing data, with
hyperplane control, functional equations and unitary-axis regularity.

Layer 2: local_intertwiner, mu_function, residue_calculus, generic_packet, shahidi_normalization,
isobaric_sum, operator_intertwiner_family, resolvent_kernel, automorphic_green,
normalized_intertwiner, continued_intertwiner, smooth_eisenstein_extension.

The induced Hilbert family carries the full group action. Its K-finite carrier supports
only the (𝔤∞, K∞) and finite-adelic actions in flat_section, right_equivariant and intertwines.
Arbitrary translates of finite-dimensional test sections are holomorphic on the smooth
compact-picture carrier and can leave the K-finite space, as spherical_translate_not_k_finite shows.
The smooth_eisenstein_extension target constructs continuous E and M maps, chamber seminorm
bounds and local common pole-clearing products in the topology of uniform convergence on
bounded source sets. It supplies full-group equivariance on smooth inputs and agreement
with the K-finite maps and the unitary-axis Hilbert intertwiner. The eisenstein_wave_packet
and spectral_map constructions use that smooth domain before Hilbert completion.

Layer 3: truncation_cones, arthur_truncation, eisenstein_wave_packet, gln_relative_roots,
chamber_height_functions, auxiliary_chamber_selector, degree_cone_series, floor_monomial_family,
gamma_cutoffs (general alternating cones and the GL_n slope/prefix specialization).

Layer 4: associate_parameter_fields, spectral_map, residual_spectrum, discrete_spherical_spectrum,
discrete_pair, good_discrete_pair, quadratic_weyl_domains.

Layer 5: weighted_l2_complex, compatible_module_category, finite_character_functor, franke_filtration,
core_finite_character_acyclic,
eisenstein_principal_value.

Layer 6: adelic_bundle_dictionary, higgs_flag_dictionary, higgs_harder_narasimhan,
spectral_multiplier, automorphic_kernel, coarse_truncated_kernel, gm_family,
orbital_integral, weighted_orbital_integral, weighted_character, almost_compact_test_space,
invariant_recursion, discrete_functional_trace, pseudo_coefficient, general_euler_poincare,
fixed_degree_trace, charpoly_kernel_refinement, weyl_fixed_levi, torus_pairing,
multiplicative_gm_family, finite_fibre_trace, root_basis_identity, root_coordinate_haar,
root_product_derivative.

The higgs_flag_dictionary constructs separate rational flag-counting and integral Arthur
kernels, with characteristic-polynomial refinements and the fixed-degree quotient measures.
The higgs_harder_narasimhan cone cancellation counts T-semistable pairs through the rational
kernel, and its restricted comparison identifies the truncated rational and integral kernels
under the explicit deep-chamber bound. The higgs_fourier_comparison supplies divisor duality
for the integrated Arthur distributions. The canonical_higgs_mass construction uses Serre duality
on the two-term Higgs extension complex: strict Higgs slope separation kills its degree-two
obstruction. The resulting Harder-Narasimhan stratum masses prove quasipolynomiality of the
separate canonical counting function, which agrees with the Arthur integral in the deep chamber
and hence at T = 0.
It gives stable canonical Higgs mass when rank and degree are coprime.
At genus two, divisor zero and E = O(P) ⊕ O, the rational truncated kernel is zero while the
integral kernel is q²(q - 1); this distinguishes the two constructions even in coprime degree.

The normalized V* family and continued W, Green and modular Eisenstein kernels are
separate continuation targets. The measurable Hilbert fields, direct integrals, decomposable
operators and measure transport are supplied by VonNeumannAlgebras V4.0.Fields; V4.Core
supplies complex trace on OperatorTheory/OperatorIdeals carriers. The spectral_representation
target constructs the representation-to-multiplicity model and its PVM compatibility in §0.7.
OperatorTheory/UnboundedOperators UO-A01–UO-A02 supplies the generic unbounded integral,
exact domain and self-adjoint recovery. The unbounded_selfadjoint_spectral target applies
that contract to automorphic realizations, transporting domains and the negative of the
native resolvent convention. The measurable Hilbert–Schmidt kernel comparison is a target here.
Franke comparison, Kostant support weights,
Maass–Selberg, spectral completeness and the trace formulas require the README constructions.

-/

end TauCetiRoadmap.AutomorphicSpectralTheory

/-! ## Residual scalar prototypes for §§4.15a–4.15d

The residual quotient and telescoping targets belong to this roadmap; their cuspidal pair
factors are supplied by AutomorphicLFunctionsAndLocalFactors AL.3. The normalizing scalar
and its Weyl composition API are specified in this roadmap's §4.15d.
-/

namespace TauCeti.AutomorphicLFunctions.AL3

/-- Meromorphic quotient represented by polynomials. Numerator and denominator retain pole data. -/
def RsNormalizingScalar (P Q : Polynomial ℂ) (q : ℝ) (g Ni Nj : ℕ) :
    Polynomial ℂ × Polynomial ℂ :=
  (Polynomial.C ((q : ℂ)^(((1 : ℤ)-(g : ℤ))*(Ni : ℤ)*(Nj : ℤ))) * P *
      Q.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X),
    Q * P.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X))

/-- Equality at regular points; the polynomial pair retains its pole data. -/
theorem RsNormalizingScalar.root (P Q : Polynomial ℂ) (q : ℝ) (g Ni Nj : ℕ)
    (z : ℂ) (hQ : Q.eval z ≠ 0) (hQ' : Q.eval ((q : ℂ)⁻¹*z) ≠ 0)
    (hP' : P.eval ((q : ℂ)⁻¹*z) ≠ 0) :
    (RsNormalizingScalar P Q q g Ni Nj).1.eval z /
      (RsNormalizingScalar P Q q g Ni Nj).2.eval z =
      (q : ℂ)^(((1 : ℤ)-(g : ℤ))*(Ni : ℤ)*(Nj : ℤ)) *
      (P.eval z/Q.eval z)/(P.eval ((q : ℂ)⁻¹*z)/Q.eval ((q : ℂ)⁻¹*z)) := by sorry

/-- The algebraic telescoping underlying residual Rankin–Selberg products. -/
theorem ResidualRsTelescoping (L : ℤ → ℂˣ) (a : ℤ) (ν₁ ν₂ : ℕ) :
    (∏ i : Fin ν₁, ∏ j : Fin ν₂, L (a-i.val-j.val)/L (a-i.val-j.val-1)) =
      ∏ j : Fin ν₂, L (a-j.val)/L (a-ν₁-j.val) := by sorry

/-
The full Weyl-group API is specified in README §4.15d:
`RsNormalizingScalar.identity_weyl`, `RsNormalizingScalar.weyl_product` and
`RsNormalizingScalar.one_root` specify the inversion-root product and its Weyl composition.
-/

end TauCeti.AutomorphicLFunctions.AL3
