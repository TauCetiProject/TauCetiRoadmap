module

import Mathlib

/-!
# Dirac scattering and the non-linear Fourier transform: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need: the Dirac coefficient, the predicate "solves the Dirac
system", the structure bundling the Neumann and Dirichlet solutions, the Hermite–Biehler and
scattering functions read from it, the Paley–Wiener function of a square-integrable density,
spectral measures as Poisson representations of the imaginary parts of the Weyl approximants,
and resonance-free points. The fundamental solutions are characterised by their integral
equations rather than constructed, so that no definition here depends on an existence theorem;
`existsUnique_diracFundamentalSystem` says that the characterisation determines them. Every API
bullet, Check and worked example lives in the README.

Headline theorems stated here: the linear Carathéodory theorem with an integrable coefficient
(§1.2); existence, uniqueness and entire dependence of the Dirac fundamental system (§3.1); the
finite-interval non-linear Plancherel identity (§4.4); the non-linear Fourier transform on `ℝ` as
the `L²` limit of its truncations, with the rate of §5.5 and the Plancherel identity at infinity
(§5.4); existence of the Neumann and Dirichlet spectral measures (§6.5); the isometric embedding of
the Paley–Wiener spaces into `L²` of the spectral measures and uniqueness of the spectral measure
(§6.6); the Szegő condition for square-integrable potentials (§6.8); and pointwise convergence of
the non-linear Fourier transform at almost every resonance-free point, with its strong form, the
convergence of the moduli of the scattering functions and the boundedness of the generalised
eigenfunctions (§9.6).

Every headline theorem of the roadmap is statable at the pins. That almost every point is
resonance-free for every real square-integrable potential, which together with §9.6 would give
convergence almost everywhere, is not a target of the roadmap (README, Scope and ownership).
-/

namespace TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform

noncomputable section

open MeasureTheory Filter Set Complex
open scoped Topology ENNReal Matrix Real

/-! ## Layer 1: Carathéodory linear systems with a holomorphic parameter -/

/-- **The linear Carathéodory theorem** (README §1.2). On a compact interval `[a, b]`, for a
coefficient `P` with values in the bounded operators of a real Banach space that is integrable on
`[a, b]` (almost everywhere strongly measurable with `‖P‖` integrable, not necessarily essentially
bounded) and an integrable forcing term `F`, the integral equation
`Y t = y₀ + ∫_{t₀}^{t} (P s (Y s) + F s) ds` has a solution continuous on `[a, b]`, and any two
such solutions agree on `[a, b]`. A complex Banach space with a complex-linear coefficient is the
case obtained by restriction of scalars. -/
theorem linear_caratheodory {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {a b t₀ : ℝ} (ht₀ : t₀ ∈ Icc a b) (y₀ : E) (P : ℝ → E →L[ℝ] E) (hP : IntegrableOn P (Icc a b))
    (F : ℝ → E) (hF : IntegrableOn F (Icc a b)) :
    (∃ Y : ℝ → E, ContinuousOn Y (Icc a b) ∧
      ∀ t ∈ Icc a b, Y t = y₀ + ∫ s in t₀..t, (P s (Y s) + F s)) ∧
    ∀ Y₁ Y₂ : ℝ → E, ContinuousOn Y₁ (Icc a b) → ContinuousOn Y₂ (Icc a b) →
      (∀ t ∈ Icc a b, Y₁ t = y₀ + ∫ s in t₀..t, (P s (Y₁ s) + F s)) →
      (∀ t ∈ Icc a b, Y₂ t = y₀ + ∫ s in t₀..t, (P s (Y₂ s) + F s)) →
      EqOn Y₁ Y₂ (Icc a b) := by
  sorry

/-! ## Layer 2: Function theory of the upper half-plane -/

/-- The Paley–Wiener function `F(z) = ∫_{−t}^{t} φ(s) e^{isz} ds` of a density `φ` (README §2.7). -/
def paleyWienerFunction (t : ℝ) (φ : ℝ → ℂ) (z : ℂ) : ℂ :=
  ∫ s in -t..t, φ s * exp (I * s * z)

/-! ## Layer 3: Dirac systems and their Hermite–Biehler functions -/

/-- The coefficient `−Ω(z − Q_q(t)) = [[f, −z − g], [z − g, −f]]` of the Dirac system
`ΩX′ = zX − Q_q X`, where `Ω = [[0, 1], [−1, 0]]`, `Q_q = [[g, f], [f, −g]]`, `f = Re q` and
`g = Im q` (README, Conventions). -/
def diracCoeff (q : ℝ → ℂ) (z : ℂ) (t : ℝ) : Matrix (Fin 2) (Fin 2) ℂ :=
  !![((q t).re : ℂ), -z - ((q t).im : ℂ); z - ((q t).im : ℂ), -((q t).re : ℂ)]

/-- `X` solves the Dirac system with potential `q` at the spectral parameter `z` on `[0, ∞)`:
`X` is continuous there and `X t = X 0 + ∫₀ᵗ −Ω(z − Q_q(s)) X s ds` for every `t ≥ 0`. -/
def IsDiracSolution (q : ℝ → ℂ) (z : ℂ) (X : ℝ → Fin 2 → ℂ) : Prop :=
  ContinuousOn X (Ici 0) ∧ ∀ t, 0 ≤ t → X t = X 0 + ∫ s in (0 : ℝ)..t, diracCoeff q z s *ᵥ X s

/-- The fundamental system of the Dirac system with potential `q`: for every spectral parameter
`z`, the Neumann solution `Θ(t, z) = (A(t, z), C(t, z))` with `Θ(0, z) = (1, 0)` and the
Dirichlet solution `Φ(t, z) = (B(t, z), D(t, z))` with `Φ(0, z) = (0, 1)`, the columns of the
fundamental matrix `M = [[A, B], [C, D]]` (README §3.1). Only the values at `t ≥ 0` are
constrained. -/
structure DiracFundamentalSystem (q : ℝ → ℂ) where
  /-- The Neumann solution `Θ(t, z)`. -/
  neumann : ℝ → ℂ → Fin 2 → ℂ
  /-- The Dirichlet solution `Φ(t, z)`. -/
  dirichlet : ℝ → ℂ → Fin 2 → ℂ
  /-- The Neumann initial value `Θ(0, z) = (1, 0)`. -/
  neumann_zero : ∀ z, neumann 0 z = ![1, 0]
  /-- The Dirichlet initial value `Φ(0, z) = (0, 1)`. -/
  dirichlet_zero : ∀ z, dirichlet 0 z = ![0, 1]
  /-- At every spectral parameter `z`, `t ↦ Θ(t, z)` solves the Dirac system on `[0, ∞)`. -/
  isDiracSolution_neumann : ∀ z, IsDiracSolution q z fun t => neumann t z
  /-- At every spectral parameter `z`, `t ↦ Φ(t, z)` solves the Dirac system on `[0, ∞)`. -/
  isDiracSolution_dirichlet : ∀ z, IsDiracSolution q z fun t => dirichlet t z

namespace DiracFundamentalSystem

variable {q : ℝ → ℂ}

/-- The Hermite–Biehler function `E(t, z) = A(t, z) − i C(t, z)` (README §3.2). -/
def hermiteBiehler (S : DiracFundamentalSystem q) (t : ℝ) (z : ℂ) : ℂ :=
  S.neumann t z 0 - I * S.neumann t z 1

/-- The Hermite–Biehler function `Ẽ(t, z) = B(t, z) − i D(t, z)` (README §3.2). -/
def hermiteBiehlerDirichlet (S : DiracFundamentalSystem q) (t : ℝ) (z : ℂ) : ℂ :=
  S.dirichlet t z 0 - I * S.dirichlet t z 1

/-- The scattering function `a(t, z) = e^{itz}(E + iẼ)/2`, the lower right entry of the
scattering matrix (README §4.1). -/
def scatteringA (S : DiracFundamentalSystem q) (t : ℝ) (z : ℂ) : ℂ :=
  exp (I * t * z) * (S.hermiteBiehler t z + I * S.hermiteBiehlerDirichlet t z) / 2

/-- The scattering function `b(t, z) = e^{itz}(E − iẼ)/2`, the lower left entry of the
scattering matrix (README §4.1). -/
def scatteringB (S : DiracFundamentalSystem q) (t : ℝ) (z : ℂ) : ℂ :=
  exp (I * t * z) * (S.hermiteBiehler t z - I * S.hermiteBiehlerDirichlet t z) / 2

/-- `s ∈ ℝ` is a resonance-free point (README §9.4): for every `C > 0`, for all large `t` the box
`Q(s, C/t) = {z : |Re z − s| ≤ C/t, |Im z| ≤ C/t}` contains no zero of `E(t, ·)` and no zero of
`Ẽ(t, ·)`. -/
def IsResonanceFree (S : DiracFundamentalSystem q) (s : ℝ) : Prop :=
  ∀ C : ℝ, 0 < C → ∃ T₀ : ℝ, ∀ t, T₀ < t → ∀ z : ℂ, |z.re - s| ≤ C / t → |z.im| ≤ C / t →
    S.hermiteBiehler t z ≠ 0 ∧ S.hermiteBiehlerDirichlet t z ≠ 0

end DiracFundamentalSystem

open DiracFundamentalSystem

/-- **The Dirac fundamental system exists, is unique and is entire in the spectral parameter**
(README §3.1). For a potential `q` integrable on every `[0, T]`, there is a fundamental system
whose solutions are, at every time `t ≥ 0`, entire functions of `z`, and any two fundamental
systems agree at every `t ≥ 0`. -/
theorem existsUnique_diracFundamentalSystem (q : ℝ → ℂ)
    (hq : ∀ T, 0 ≤ T → IntervalIntegrable q volume 0 T) :
    (∃ S : DiracFundamentalSystem q, ∀ t, 0 ≤ t →
      Differentiable ℂ (S.neumann t) ∧ Differentiable ℂ (S.dirichlet t)) ∧
    ∀ S S' : DiracFundamentalSystem q, ∀ t, 0 ≤ t →
      S.neumann t = S'.neumann t ∧ S.dirichlet t = S'.dirichlet t := by
  sorry

/-! ## Layer 4: Scattering data on a finite interval -/

/-- **The finite-interval non-linear Plancherel identity** (README §4.4). For a potential `q`
square-integrable on `[0, t]`, the function `x ↦ log |a(t, x)|` is integrable on `ℝ` and
`∫_ℝ log |a(t, x)| dx = (π/2) ∫₀ᵗ |q|²`. -/
theorem nonlinear_plancherel (q : ℝ → ℂ) (hq : ∀ T, 0 ≤ T → IntervalIntegrable q volume 0 T)
    (S : DiracFundamentalSystem q) (t : ℝ) (ht : 0 ≤ t)
    (hq₂ : MemLp q 2 (volume.restrict (Ioc 0 t))) :
    Integrable (fun x : ℝ => Real.log ‖S.scatteringA t x‖) ∧
    ∫ x : ℝ, Real.log ‖S.scatteringA t x‖ = π / 2 * ∫ s in (0 : ℝ)..t, ‖q s‖ ^ 2 := by
  sorry

/-! ## Layer 5: The square-integrable scattering limit and the non-linear Fourier transform -/

/-- **The non-linear Fourier transform on `ℝ` and the non-linear Plancherel identity at
infinity** (README §5.4 and §5.5). For a potential `q` square-integrable on `(0, ∞)` there is a
measurable `F : ℝ → ℂ` (the boundary function `q⌃*` of the non-linear Fourier transform, determined
almost everywhere) with `|F| < 1` almost everywhere, with
`‖F − b(T, ·)/a(T, ·)‖²_{L²(ℝ)} ≤ 4π ∫_T^∞ |q|²` for every `T ≥ 0`, and with
`∫_ℝ −log(1 − |F(x)|²) dx = π ∫₀^∞ |q|²`. -/
theorem exists_nonlinearFourier_plancherel (q : ℝ → ℂ)
    (hq : MemLp q 2 (volume.restrict (Ioi 0))) (S : DiracFundamentalSystem q) :
    ∃ F : ℝ → ℂ, AEStronglyMeasurable F volume ∧ (∀ᵐ x : ℝ, ‖F x‖ < 1) ∧
      (∀ T, 0 ≤ T → ∫⁻ x : ℝ, ‖F x - S.scatteringB T x / S.scatteringA T x‖ₑ ^ 2 ≤
        ENNReal.ofReal (4 * π * ∫ s in Ioi T, ‖q s‖ ^ 2)) ∧
      Integrable (fun x => Real.log (1 - ‖F x‖ ^ 2)) ∧
      ∫ x, -Real.log (1 - ‖F x‖ ^ 2) = π * ∫ s in Ioi 0, ‖q s‖ ^ 2 := by
  sorry

/-! ## Layer 6: de Branges spaces, Weyl functions and spectral measures -/

/-- `μ` is the spectral measure of the family of Weyl approximants `m t` (README §6.5): `μ` is
Poisson-finite, `∫ dμ/(1 + x²) < ∞`, and for some `β` the imaginary parts `Im m t z` tend, as
`t → ∞`, to `β Im z + ∫ P(z, x) dμ(x)` at every `z ∈ ℂ₊`, where `P(z, x) = Im z/(π|x − z|²)`.
For `m t = −Ẽ(t, ·)/E(t, ·)` this is the Neumann spectral measure `μ_q`, for `m t = E(t, ·)/Ẽ(t, ·)`
the Dirichlet spectral measure `μ̃_q`. -/
def IsSpectralMeasureOf (m : ℝ → ℂ → ℂ) (μ : Measure ℝ) : Prop :=
  ∫⁻ x, ENNReal.ofReal (1 / (1 + x ^ 2)) ∂μ < ∞ ∧
    ∃ β : ℝ, ∀ z : ℂ, 0 < z.im → Tendsto (fun t => (m t z).im) atTop
      (𝓝 (β * z.im + ∫ x, z.im / (π * normSq ((x : ℂ) - z)) ∂μ))

/-- **The spectral measures exist** (README §6.4 and §6.5). For every potential the Weyl
approximants `−Ẽ(t, ·)/E(t, ·)` and `E(t, ·)/Ẽ(t, ·)` have spectral measures. -/
theorem exists_isSpectralMeasureOf (q : ℝ → ℂ)
    (hq : ∀ T, 0 ≤ T → IntervalIntegrable q volume 0 T) (S : DiracFundamentalSystem q) :
    (∃ μ, IsSpectralMeasureOf (fun t z => -S.hermiteBiehlerDirichlet t z / S.hermiteBiehler t z) μ) ∧
    ∃ μ, IsSpectralMeasureOf (fun t z => S.hermiteBiehler t z / S.hermiteBiehlerDirichlet t z) μ := by
  sorry

/-- **The isometric embedding of the Paley–Wiener spaces** (README §6.6). For every `t > 0` and
`φ ∈ L²(−t, t)`, the Paley–Wiener function `F` of `φ` satisfies
`∫ |F|² dμ_q = ∫_ℝ |F(x)/E(t, x)|² dx` and `∫ |F|² dμ̃_q = ∫_ℝ |F(x)/Ẽ(t, x)|² dx`. -/
theorem spectralMeasure_isometry (q : ℝ → ℂ)
    (hq : ∀ T, 0 ≤ T → IntervalIntegrable q volume 0 T) (S : DiracFundamentalSystem q)
    (μ μ' : Measure ℝ)
    (hμ : IsSpectralMeasureOf (fun t z => -S.hermiteBiehlerDirichlet t z / S.hermiteBiehler t z) μ)
    (hμ' : IsSpectralMeasureOf (fun t z => S.hermiteBiehler t z / S.hermiteBiehlerDirichlet t z) μ')
    (t : ℝ) (ht : 0 < t) (φ : ℝ → ℂ) (hφ : MemLp φ 2 (volume.restrict (Ioc (-t) t))) :
    ∫⁻ x, ‖paleyWienerFunction t φ x‖ₑ ^ 2 ∂μ =
        ∫⁻ x : ℝ, ‖paleyWienerFunction t φ x / S.hermiteBiehler t x‖ₑ ^ 2 ∧
      ∫⁻ x, ‖paleyWienerFunction t φ x‖ₑ ^ 2 ∂μ' =
        ∫⁻ x : ℝ, ‖paleyWienerFunction t φ x / S.hermiteBiehlerDirichlet t x‖ₑ ^ 2 := by
  sorry

/-- **Uniqueness of the spectral measure** (README §6.6). The Neumann spectral measure `μ_q` is the
only Poisson-finite measure `ν` with `∫ |F|² dν = ∫_ℝ |F(x)/E(t, x)|² dx` for every `t > 0` and
every Paley–Wiener function `F` of a density in `L²(−t, t)`. -/
theorem spectralMeasure_unique (q : ℝ → ℂ)
    (hq : ∀ T, 0 ≤ T → IntervalIntegrable q volume 0 T) (S : DiracFundamentalSystem q)
    (μ : Measure ℝ)
    (hμ : IsSpectralMeasureOf (fun t z => -S.hermiteBiehlerDirichlet t z / S.hermiteBiehler t z) μ)
    (ν : Measure ℝ) (hν : ∫⁻ x, ENNReal.ofReal (1 / (1 + x ^ 2)) ∂ν < ∞)
    (h : ∀ t, 0 < t → ∀ φ : ℝ → ℂ, MemLp φ 2 (volume.restrict (Ioc (-t) t)) →
      ∫⁻ x, ‖paleyWienerFunction t φ x‖ₑ ^ 2 ∂ν =
        ∫⁻ x : ℝ, ‖paleyWienerFunction t φ x / S.hermiteBiehler t x‖ₑ ^ 2) :
    ν = μ := by
  sorry

/-- **The Szegő condition for square-integrable potentials** (README §6.8). For a potential `q`
square-integrable on `(0, ∞)`, the density `w = dμ/dx` of the Neumann or of the Dirichlet spectral
measure is positive almost everywhere, `log w` is integrable against `dΠ = dx/(1 + x²)`, and
`∫ log w dΠ ≥ −2π log 2 − π ∫₀^∞ |q|²`. -/
theorem szego_condition (q : ℝ → ℂ) (hq : MemLp q 2 (volume.restrict (Ioi 0)))
    (S : DiracFundamentalSystem q) (μ : Measure ℝ)
    (hμ : IsSpectralMeasureOf
        (fun t z => -S.hermiteBiehlerDirichlet t z / S.hermiteBiehler t z) μ ∨
      IsSpectralMeasureOf (fun t z => S.hermiteBiehler t z / S.hermiteBiehlerDirichlet t z) μ) :
    (∀ᵐ x : ℝ, 0 < (μ.rnDeriv volume x).toReal) ∧
      Integrable (fun x : ℝ => Real.log (μ.rnDeriv volume x).toReal / (1 + x ^ 2)) ∧
      -2 * π * Real.log 2 - π * ∫ s in Ioi 0, ‖q s‖ ^ 2 ≤
        ∫ x : ℝ, Real.log (μ.rnDeriv volume x).toReal / (1 + x ^ 2) := by
  sorry

/-! ## Layer 9: Pointwise convergence of the non-linear Fourier transform -/

/-- **Pointwise convergence of the non-linear Fourier transform at resonance-free points**
(README §9.6). Let `f` be a real potential square-integrable on `(0, ∞)` and let `F` be the
`L²(ℝ)` limit of the truncated transforms `b(T, ·)/a(T, ·)` (by
`exists_nonlinearFourier_plancherel`, the boundary function `f⌃*` up to a null set). At almost
every resonance-free point `s`: `b(T, s)/a(T, s) → F(s)`; for every `C > 0`, `a(T, ·)` has no zero
in the disc `|z − s| < C/T` for large `T` and `b(T, ·)/a(T, ·) → F(s)` uniformly there; the moduli
`|a(T, s)|` and `|b(T, s)|` converge; and the generalised eigenfunctions `t ↦ Θ(t, s)`,
`t ↦ Φ(t, s)` are bounded on `[0, ∞)`. -/
theorem tendsto_truncation_of_isResonanceFree (f : ℝ → ℝ)
    (hf : MemLp f 2 (volume.restrict (Ioi 0))) (S : DiracFundamentalSystem fun t => (f t : ℂ))
    (F : ℝ → ℂ) (hFm : AEStronglyMeasurable F volume)
    (hF : Tendsto (fun T => ∫⁻ x : ℝ, ‖F x - S.scatteringB T x / S.scatteringA T x‖ₑ ^ 2)
      atTop (𝓝 0)) :
    ∀ᵐ s : ℝ, S.IsResonanceFree s →
      Tendsto (fun T => S.scatteringB T s / S.scatteringA T s) atTop (𝓝 (F s)) ∧
      (∀ C : ℝ, 0 < C → ∀ ε : ℝ, 0 < ε → ∀ᶠ T in atTop, ∀ z : ℂ, ‖z - s‖ < C / T →
        S.scatteringA T z ≠ 0 ∧ ‖S.scatteringB T z / S.scatteringA T z - F s‖ < ε) ∧
      (∃ La Lb : ℝ, Tendsto (fun T => ‖S.scatteringA T s‖) atTop (𝓝 La) ∧
        Tendsto (fun T => ‖S.scatteringB T s‖) atTop (𝓝 Lb)) ∧
      ∃ K : ℝ, ∀ t, 0 ≤ t → ‖S.neumann t s‖ ≤ K ∧ ‖S.dirichlet t s‖ ≤ K := by
  sorry

end

end TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform
