import Mathlib

/-!
# Lévy processes: target signatures

This file is not the roadmap: the roadmap is `README.md`. Against the pinned Mathlib, it states
the roadmap's headline theorems, each with `sorry`, together with the few definitions their
statements need, each with a real body.

A process is `X : ℝ≥0 → Ω → ℝ` on a measure space `(Ω, P)`. A Lévy process in law has
measurable coordinates, starts at `0` almost surely, has independent increments (Mathlib's
`HasIndepIncrements`), stationary increments (`IdentDistrib`) and is continuous in probability
(`TendstoInMeasure`); a Lévy process also has almost surely càdlàg paths. The triplet is never
part of the process: theorems take a Lévy–Khintchine triplet `T` of the law of `X 1`, with the
truncation `1{|x| ≤ 1}` and the exponent `ψ` of `charFun μ = exp ∘ ψ`, with no minus sign.

The triplet, its integrand, its exponent and the predicate `HasLevyTriplet` belong to the
roadmap InfinitelyDivisibleLawsAndTriangularArrays (§3.1); the statements here use verbatim
local copies of them, in the namespace `InfinitelyDivisibleLawsAndTriangularArrays` below.

Every headline theorem of the README is stated here.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology Complex
open scoped ENNReal NNReal BoundedContinuousFunction

namespace TauCetiRoadmap.LevyProcesses

/-! ## Local copy: InfinitelyDivisibleLawsAndTriangularArrays, §3.1

The four definitions below are copied verbatim from that roadmap's §3.1. Its theorems that the
README's routes use, among them `LevyTriplet.exists_hasLevyTriplet` (§3.2),
`HasLevyTriplet.map_affine` (§3.3), `HasLevyTriplet.memLp_two_iff` (§3.4) and
`HasLevyTriplet.measure_Iio_zero_eq_zero_iff` (§3.6), are statements of that roadmap and are not
copied here. -/

namespace InfinitelyDivisibleLawsAndTriangularArrays

/-- A Lévy–Khintchine triplet: a drift, a Gaussian variance and a Lévy measure, with the
truncation `1{|x| ≤ 1}`. -/
structure LevyTriplet where
  /-- The drift `b`. -/
  drift : ℝ
  /-- The Gaussian variance `σ²`. -/
  gaussVar : ℝ≥0
  /-- The Lévy measure `ν`. -/
  levyMeasure : Measure ℝ
  /-- `ν` has no atom at `0`. -/
  measure_zero : levyMeasure {0} = 0
  /-- `∫ min 1 x² dν < ∞`. -/
  lintegral_min_lt_top : ∫⁻ x, ENNReal.ofReal (min 1 (x ^ 2)) ∂levyMeasure < ∞

/-- The integrand `e^{itx} - 1 - i t x 1{|x| ≤ 1}` of the Lévy–Khintchine exponent. -/
def levyIntegrand (t x : ℝ) : ℂ :=
  cexp (t * x * I) - 1 - (if |x| ≤ 1 then (t * x : ℂ) * I else 0)

/-- The Lévy–Khintchine exponent
`ψ(t) = i b t - σ² t² / 2 + ∫ (e^{itx} - 1 - itx 1{|x| ≤ 1}) dν`. -/
def LevyTriplet.exponent (T : LevyTriplet) (t : ℝ) : ℂ :=
  T.drift * t * I - (T.gaussVar : ℂ) * t ^ 2 / 2 + ∫ x, levyIntegrand t x ∂T.levyMeasure

/-- `μ` has Lévy–Khintchine triplet `T` when `charFun μ = exp ∘ T.exponent`. -/
def HasLevyTriplet (μ : Measure ℝ) (T : LevyTriplet) : Prop :=
  ∀ t, charFun μ t = cexp (T.exponent t)

end InfinitelyDivisibleLawsAndTriangularArrays

open InfinitelyDivisibleLawsAndTriangularArrays

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] {P : Measure Ω} {X : ℝ≥0 → Ω → ℝ}

/-! ## Layer 1: Lévy processes and their laws -/

/-- 1.1 A Lévy process in law: measurable coordinates, `X 0 = 0` almost surely, independent
increments, stationary increments (`X (s + t) - X s` has the law of `X t`) and continuity in
probability. No condition is put on the paths. -/
structure IsLevyProcessInLaw (X : ℝ≥0 → Ω → ℝ) (P : Measure Ω) : Prop where
  measurable : ∀ t, Measurable (X t)
  ae_zero : ∀ᵐ ω ∂P, X 0 ω = 0
  hasIndepIncrements : HasIndepIncrements X P
  identDistrib_sub : ∀ s t, IdentDistrib (fun ω ↦ X (s + t) ω - X s ω) (X t) P P
  tendstoInMeasure : ∀ t, TendstoInMeasure P X (𝓝 t) (X t)

/-- 1.1 A Lévy process: a Lévy process in law whose paths are almost surely càdlàg. -/
structure IsLevyProcess (X : ℝ≥0 → Ω → ℝ) (P : Measure Ω) : Prop
    extends IsLevyProcessInLaw X P where
  ae_isCadlag : ∀ᵐ ω ∂P, IsCadlag fun t ↦ X t ω

/-- 1.2 **The law at time `t`.** If the law of `X 1` has triplet `T`, the characteristic function
of `X t` is `exp (t ψ)`, `ψ` the exponent of `T`. -/
theorem IsLevyProcessInLaw.charFun_map {T : LevyTriplet} (hX : IsLevyProcessInLaw X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) (t : ℝ≥0) (u : ℝ) :
    charFun (P.map (X t)) u = cexp ((t : ℂ) * T.exponent u) := by
  sorry

/-- 1.3 **Uniqueness in law.** Two Lévy processes in law, on any two measure spaces, whose values
at time `1` have the same law have the same law as processes, on `ℝ≥0 → ℝ` with the product
σ-algebra. -/
theorem IsLevyProcessInLaw.map_path_eq {Ω' : Type*} [MeasurableSpace Ω'] {P' : Measure Ω'}
    {X' : ℝ≥0 → Ω' → ℝ} (hX : IsLevyProcessInLaw X P) (hX' : IsLevyProcessInLaw X' P')
    (h1 : P.map (X 1) = P'.map (X' 1)) :
    P.map (fun ω t ↦ X t ω) = P'.map (fun ω t ↦ X' t ω) := by
  sorry

/-- 1.4 **Existence in law.** For every triplet `T` there is a probability measure on the path
space `ℝ≥0 → ℝ`, with the product σ-algebra, under which the coordinate process is a Lévy process
in law and the law of the coordinate at time `1` has triplet `T`. -/
theorem exists_isLevyProcessInLaw (T : LevyTriplet) :
    ∃ Q : Measure (ℝ≥0 → ℝ), IsProbabilityMeasure Q ∧
      IsLevyProcessInLaw (fun t ω ↦ ω t) Q ∧ HasLevyTriplet (Q.map fun ω ↦ ω 1) T := by
  sorry

/-! ## Layer 2: small times and continuous paths -/

/-- 2.1 **Small-time behaviour.** For a bounded continuous `f` vanishing on a neighbourhood of
`0`, `t⁻¹ E f(X t) → ∫ f dν` as `t ↓ 0`, `ν` the Lévy measure of `T`. -/
theorem IsLevyProcessInLaw.tendsto_integral_div {T : LevyTriplet} (hX : IsLevyProcessInLaw X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) (f : ℝ →ᵇ ℝ) (hf : ∃ ε > 0, ∀ x, |x| < ε → f x = 0) :
    Tendsto (fun t : ℝ≥0 ↦ (t : ℝ)⁻¹ * ∫ ω, f (X t ω) ∂P) (𝓝[>] 0)
      (𝓝 (∫ x, f x ∂T.levyMeasure)) := by
  sorry

/-- 2.2 **Continuous paths.** A Lévy process has almost surely continuous paths iff its Lévy
measure is `0`; then, if moreover `σ² > 0`, `(X t - b t) / σ` is a standard Brownian motion. -/
theorem IsLevyProcess.ae_continuous_iff {T : LevyTriplet} (hX : IsLevyProcess X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) :
    ((∀ᵐ ω ∂P, Continuous fun t ↦ X t ω) ↔ T.levyMeasure = 0) ∧
      (T.levyMeasure = 0 → 0 < T.gaussVar →
        IsBrownianReal (fun t ω ↦ (X t ω - T.drift * t) / Real.sqrt T.gaussVar) P) := by
  sorry

/-! ## Layer 3: subordinators -/

/-- 3.1 **Subordinators.** A Lévy process has almost surely nondecreasing paths iff `σ² = 0`,
`ν` is carried by `(0, ∞)`, `∫ min 1 x dν < ∞` and `b - ∫_{(0,1]} x dν ≥ 0`. -/
theorem IsLevyProcess.ae_monotone_iff {T : LevyTriplet} (hX : IsLevyProcess X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) :
    (∀ᵐ ω ∂P, Monotone fun t ↦ X t ω) ↔ T.gaussVar = 0 ∧ T.levyMeasure (Iic 0) = 0 ∧
      ∫⁻ x, ENNReal.ofReal (min 1 x) ∂T.levyMeasure < ∞ ∧
      0 ≤ T.drift - ∫ x in Ioc 0 1, x ∂T.levyMeasure := by
  sorry

/-- 3.2 The Laplace exponent `Φ(s) = b₀ s + ∫ (1 - e^{-sx}) dν`, with the drift
`b₀ = b - ∫_{(0,1]} x dν`. It is meaningful for the triplets of laws carried by `[0, ∞)`. -/
def laplaceExponent (T : LevyTriplet) (s : ℝ) : ℝ :=
  (T.drift - ∫ x in Ioc 0 1, x ∂T.levyMeasure) * s +
    ∫ x, (1 - Real.exp (-(s * x))) ∂T.levyMeasure

/-- 3.2 **The Laplace transform of a subordinator.** If `X 1 ≥ 0` almost surely, then
`E e^{-s X t} = e^{-t Φ(s)}` for every `t` and every `s ≥ 0`. -/
theorem IsLevyProcessInLaw.integral_exp_neg {T : LevyTriplet} (hX : IsLevyProcessInLaw X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) (h0 : ∀ᵐ ω ∂P, 0 ≤ X 1 ω) (t : ℝ≥0) {s : ℝ}
    (hs : 0 ≤ s) :
    ∫ ω, Real.exp (-(s * X t ω)) ∂P = Real.exp (-(t * laplaceExponent T s)) := by
  sorry

/-! ## Layer 4: martingales -/

/-- 4.1 **Martingales of a Lévy process.** For a filtration to which `X` is adapted and whose
`F s` is independent of every increment after `s`: the exponential martingales
`exp (i u X t - t ψ(u))`; if `X 1` is integrable, `X t - t E X 1`; if `X 1` is square-integrable,
`(X t - t E X 1)² - t Var X 1`. -/
theorem IsLevyProcessInLaw.martingale_of_indep {T : LevyTriplet} (hX : IsLevyProcessInLaw X P)
    (hT : HasLevyTriplet (P.map (X 1)) T) (F : Filtration ℝ≥0 mΩ) (hF : StronglyAdapted F X)
    (hind : ∀ s t, s ≤ t →
      Indep (MeasurableSpace.comap (fun ω ↦ X t ω - X s ω) (borel ℝ)) (F s) P) :
    (∀ u : ℝ, Martingale (fun t ω ↦ cexp (u * X t ω * I - t * T.exponent u)) F P) ∧
      (Integrable (X 1) P →
        Martingale (fun t ω ↦ X t ω - t * ∫ ω, X 1 ω ∂P) F P) ∧
      (MemLp (X 1) 2 P →
        Martingale (fun t ω ↦ (X t ω - t * ∫ ω, X 1 ω ∂P) ^ 2 - t * variance (X 1) P) F P) := by
  sorry

/-! ## Layer 5: the strong Markov property and the generator -/

/-- 5.1 **Strong Markov property.** Let every path of `X` be right-continuous, `X` adapted to `F`
with `F s` independent of every increment after `s`, and `τ` an almost surely finite stopping
time. The restarted process `X (τ + t) - X τ` is a Lévy process in law with the law of `X`, and
it is independent of the σ-algebra `F_τ`. -/
theorem IsLevyProcessInLaw.strongMarkov (hX : IsLevyProcessInLaw X P)
    (hrc : ∀ ω, IsRightContinuous fun t ↦ X t ω) (F : Filtration ℝ≥0 mΩ)
    (hF : StronglyAdapted F X)
    (hind : ∀ s t, s ≤ t →
      Indep (MeasurableSpace.comap (fun ω ↦ X t ω - X s ω) (borel ℝ)) (F s) P)
    (τ : Ω → WithTop ℝ≥0) (hτ : IsStoppingTime F τ) (hfin : ∀ᵐ ω ∂P, τ ω ≠ ⊤) :
    IsLevyProcessInLaw (fun t ω ↦ X ((τ ω).untopA + t) ω - X (τ ω).untopA ω) P ∧
      P.map (fun ω t ↦ X ((τ ω).untopA + t) ω - X (τ ω).untopA ω) =
        P.map (fun ω t ↦ X t ω) ∧
      Indep (MeasurableSpace.comap
        (fun ω t ↦ X ((τ ω).untopA + t) ω - X (τ ω).untopA ω)
        (inferInstance : MeasurableSpace (ℝ≥0 → ℝ))) hτ.measurableSpace P := by
  sorry

/-- 5.2 The Lévy generator
`L f (x) = b f'(x) + σ² f''(x) / 2 + ∫ (f (x + y) - f x - y f'(x) 1{|y| ≤ 1}) ν(dy)`. -/
def levyGenerator (T : LevyTriplet) (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  T.drift * deriv f x + (T.gaussVar : ℝ) / 2 * iteratedDeriv 2 f x +
    ∫ y, (f (x + y) - f x - (if |y| ≤ 1 then y * deriv f x else 0)) ∂T.levyMeasure

/-- 5.2 **The generator on Schwartz functions.** For a Schwartz function `f`,
`t⁻¹ (E f (x + X t) - f x) → L f (x)` as `t ↓ 0`, uniformly in `x`. -/
theorem IsLevyProcessInLaw.tendstoUniformly_generator {T : LevyTriplet}
    (hX : IsLevyProcessInLaw X P) (hT : HasLevyTriplet (P.map (X 1)) T) (f : SchwartzMap ℝ ℝ) :
    TendstoUniformly (fun (t : ℝ≥0) (x : ℝ) ↦ (t : ℝ)⁻¹ * ((∫ ω, f (x + X t ω) ∂P) - f x))
      (levyGenerator T f) (𝓝[>] 0) := by
  sorry

end TauCetiRoadmap.LevyProcesses
