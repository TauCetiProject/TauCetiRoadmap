/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Stochastic calculus: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs, with real definitions only for the objects their statements use.

The headline families are Wiener construction; stochastic integration, brackets and BDG;
Itô and Stratonovich calculus; strong Markov and martingale representation; reflection,
exits, LIL and local time; harmonic Hardy representation; DDS; Novikov and Girsanov;
Cameron–Martin equivalence and singularity; SDE existence, uniqueness and flows; and
diffusion generators, martingale problems and Feynman–Kac.

The general semimartingale Itô/Stratonovich formulas lack a constructed semimartingale
integral and covariation operator at the pins. Hilbert–Schmidt vector integration and the
full finite-dimensional SDE and flow statements lack the vector integral and maximal
solution/flow carriers. Harmonic Hardy boundary representation lacks the Hardy-space
and boundary trace carriers. The general diffusion generator/martingale-problem and
Feynman–Kac comparison lacks the constructed diffusion-law and generator-domain carriers.
The independent-extension branch of DDS lacks the enlarged stochastic-basis construction.
These remain README targets; no arbitrary predicate is substituted for those carriers.
The scalar Brownian integral, bracket, density and strong-solution predicates below are
concrete definitions on native functions, measures and filtrations.

Supporting interfaces follow the headline layers: raw-filtration localization, independent
laws, point-process normalizations, Cameron–Martin grid targets and the autonomous
arcsin–sech ODE.
-/

noncomputable section
open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal ProbabilityTheory
namespace StochasticCalculusSuggested

universe u

section Headlines

variable {Ω : Type*} [mΩ : MeasurableSpace Ω]

/-! ## Layer 0: Process spaces, usual filtrations and stopping -/

/-- Equality on one common full-measure set, stronger than equality of versions. -/
def Indistinguishable (P : Measure Ω) (X Y : ℝ≥0 → Ω → ℝ) : Prop :=
  ∀ᵐ ω ∂P, ∀ t, X t ω = Y t ω

/-- Brownian relative to a specified filtration, not merely Brownian marginal laws. -/
def IsFilteredBrownian (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (B : ℝ≥0 → Ω → ℝ) : Prop :=
  IsBrownianReal B P ∧ StronglyAdapted F B ∧
    ∀ s t, s ≤ t → Indep (MeasurableSpace.comap (fun ω => B t ω - B s ω)
      (borel ℝ)) (F s) P

/-! ## Layer 1: Gaussian processes and constructed Brownian motion -/

/-- Wiener measure on continuous paths: its coordinate process has the native
Brownian finite-dimensional laws and almost-sure continuity (Lalley, Theorem 1). -/
theorem exists_wienerMeasure :
    ∃ W : Measure C(ℝ≥0, ℝ), IsProbabilityMeasure W ∧
      IsBrownianReal (fun t (ω : C(ℝ≥0, ℝ)) => ω t) W := by
  sorry

/-! ## Layer 3: Stochastic integration and finite variation -/

/-- Native localization convention includes the indicator at initial time. -/
abbrev IsLocalMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (M : ℝ≥0 → Ω → ℝ) : Prop :=
  Locally (fun Y => Martingale Y F P) F M P

/-- Lebesgue measure on nonnegative time, using the comap normalization. -/
def nnvolume : Measure ℝ≥0 := Measure.comap ((↑) : ℝ≥0 → ℝ) volume

/-- Lebesgue time measure on a finite positive-time interval. -/
def timeMeasure (T : ℝ≥0) : Measure ℝ≥0 := nnvolume.restrict (Set.Ioc 0 T)

/-- The predictable sigma algebra is a subalgebra of the ambient product algebra. -/
theorem predictable_le_prod (F : Filtration ℝ≥0 mΩ) :
    F.predictable ≤ (inferInstance : MeasurableSpace ℝ≥0).prod mΩ := by
  refine measurableSpace_le_predictable_of_measurableSet ?_ ?_
  · intro A hA
    exact (measurableSet_singleton (0 : ℝ≥0)).prod (F.le 0 A hA)
  · intro t A hA
    exact measurableSet_Ioi.prod (F.le t A hA)

/-- The actual measure on the predictable measurable space, obtained by trimming. -/
def predictableMeasure (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (T : ℝ≥0) : @Measure (ℝ≥0 × Ω) F.predictable :=
  ((timeMeasure T).prod P).trim (predictable_le_prod F)

/-- Given a progressively measurable real process, produce a strongly predictable
representative on every finite horizon, equal almost everywhere for the ambient
Lebesgue-time × probability measure. The equality is deliberately not stated in the
trimmed predictable measure: an ambient-null set need not have a predictable null envelope.
This is only an almost-everywhere representative, not pointwise equality or
indistinguishability. L² integrability is a separate hypothesis when the representative is
used as a Brownian-integral class. -/
theorem exists_stronglyPredictable_ae_of_progressive
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) [IsProbabilityMeasure P]
    (H : ℝ≥0 → Ω → ℝ) (hH : IsProgressive F H) :
    ∃ K : ℝ≥0 → Ω → ℝ, IsStronglyPredictable F K ∧
      ∀ T, Function.uncurry K =ᵐ[(timeMeasure T).prod P] Function.uncurry H := by
  sorry

/-- An elementary predictable integrand: on each interval `(s i, s (i+1)]`, `i < n`, it is
a bounded `F (s i)`-measurable random height `ξ i`. -/
structure ElementaryIntegrand (F : Filtration ℝ≥0 mΩ) where
  /-- The number of steps. -/
  n : ℕ
  /-- The nondecreasing grid of step times. -/
  s : ℕ → ℝ≥0
  mono : Monotone s
  /-- The random height on `(s i, s (i+1)]`. -/
  ξ : ℕ → Ω → ℝ
  measurable : ∀ i, StronglyMeasurable[F (s i)] (ξ i)
  bounded : ∀ i, ∃ C : ℝ, ∀ ω, |ξ i ω| ≤ C

namespace ElementaryIntegrand

variable {F : Filtration ℝ≥0 mΩ}

/-- The process `t ↦ Σ_{i<n} ξ i · 1_(s i, s (i+1)](t)`. -/
def toProcess (K : ElementaryIntegrand F) : ℝ≥0 → Ω → ℝ :=
  fun t ω => ∑ i ∈ Finset.range K.n, (Set.Ioc (K.s i) (K.s (i + 1))).indicator (fun _ => K.ξ i ω) t

/-- The elementary stochastic integral `t ↦ Σ_{i<n} ξ i (B (t ∧ s (i+1)) − B (t ∧ s i))`. -/
def integral (K : ElementaryIntegrand F) (B : ℝ≥0 → Ω → ℝ) : ℝ≥0 → Ω → ℝ :=
  fun t ω => ∑ i ∈ Finset.range K.n, K.ξ i ω * (B (min t (K.s (i + 1))) ω - B (min t (K.s i)) ω)

end ElementaryIntegrand

/-- `I` is an Itô integral of `H` against `B`: its paths are almost surely continuous and, for
every time `t`, some elementary integrands approximate `H` on `(0, t]` in the sense that
`∫_(0,t] |Kₙ − H|² ds → 0` in probability, while their elementary integrals at `t` converge
in probability to `I t`. The integrand is strongly predictable, so its time sections
and the square errors are measurable. A non-integrable square error has infinite
lower Lebesgue integral rather than the Bochner junk value zero. -/
def IsItoIntegral (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B H I : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧
  (∀ᵐ ω ∂P, Continuous fun t => I t ω) ∧
    ∀ t, ∃ K : ℕ → ElementaryIntegrand F,
      (∀ ε : ℝ≥0∞, 0 < ε → Filter.Tendsto (fun n => P {ω | ε ≤
        ∫⁻ s, ‖(K n).toProcess s ω - H s ω‖ₑ ^ 2 ∂timeMeasure t}) Filter.atTop (nhds 0)) ∧
      TendstoInMeasure P (fun n => (K n).integral B t) Filter.atTop (I t)

/-- Predictable processes with finite expected square energy on every finite horizon. -/
def BrownianIntegrable (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (H : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧ ∀ T, MemLp (Function.uncurry H) 2 ((timeMeasure T).prod P)

/-- Itô isometry and martingale property for an L² integrand: a strongly progressive Itô
integral of a Brownian-integrable `H` is a martingale with `E[I_t²] = E ∫_(0,t] H² ds`. -/
theorem itoIntegral_isometry (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H I : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : BrownianIntegrable F P H)
    (hI : IsItoIntegral F P B H I) (hProg : IsStronglyProgressive F I) :
    Martingale I F P ∧
      ∀ t, ∫ ω, (I t ω) ^ 2 ∂P = ∫ p, (H p.1 p.2) ^ 2 ∂(timeMeasure t).prod P := by
  sorry

/-- Local domain: finite energy on every compact time interval, not expectation L². -/
def LocallyBrownianIntegrable (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (H : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧
    ∀ᵐ ω ∂P, ∀ T, Integrable (fun t => (H t ω)^2) (timeMeasure T)

/-- Existence of the local Itô integral: every locally Brownian-integrable integrand has a
strongly progressive Itô integral which is a continuous local martingale. -/
theorem exists_isItoIntegral (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : LocallyBrownianIntegrable F P H) :
    ∃ I, IsItoIntegral F P B H I ∧ IsStronglyProgressive F I ∧ IsLocalMartingale F P I := by
  sorry

/-- Uniqueness: against a filtered Brownian motion, two Itô integrals of the same integrand
are indistinguishable. -/
theorem isItoIntegral_unique (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H I J : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hI : IsItoIntegral F P B H I)
    (hJ : IsItoIntegral F P B H J) :
    Indistinguishable P I J := by
  sorry

/-- Every strongly progressive Itô integral of a locally Brownian-integrable integrand is a
local martingale. -/
theorem itoIntegral_localMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H I : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : LocallyBrownianIntegrable F P H)
    (hI : IsItoIntegral F P B H I) (hProg : IsStronglyProgressive F I) :
    IsLocalMartingale F P I := by
  sorry

/-- Local Itô integral independence of the product-a.e. representative: Itô integrals of
locally Brownian-integrable `H` and `K` that agree `dt × P`-a.e. on every finite horizon are
indistinguishable. -/
theorem itoIntegral_local_congr (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B H K I J : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hH : LocallyBrownianIntegrable F P H)
    (hK : LocallyBrownianIntegrable F P K)
    (hHK : ∀ T, Function.uncurry H =ᵐ[(timeMeasure T).prod P] Function.uncurry K)
    (hI : IsItoIntegral F P B H I) (hJ : IsItoIntegral F P B K J) :
    Indistinguishable P I J := by
  sorry

/-! ## Layer 4: Quadratic variation, covariation and semimartingales -/

/-- `A` is a quadratic variation of `M` in the square-compensation sense: `A` is strongly
progressive, almost surely continuous, nondecreasing and zero at time zero, and
`M² − M₀² − A` is a local martingale. For continuous `M` this is the bracket `[M]`; for a
jump martingale a continuous such `A` is the predictable bracket, not `[M]`. -/
def IsQuadraticVariation (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (M A : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyProgressive F A ∧
    (∀ᵐ ω ∂P, Continuous (fun t => A t ω) ∧ Monotone (fun t => A t ω) ∧ A 0 ω = 0) ∧
    IsLocalMartingale F P (fun t ω => (M t ω) ^ 2 - (M 0 ω) ^ 2 - A t ω)

/-- Every almost surely continuous local martingale on a raw filtration has a quadratic
variation. -/
theorem exists_isQuadraticVariation (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hM : IsLocalMartingale F P M) (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω)) :
    ∃ A, IsQuadraticVariation F P M A := by
  sorry

/-- The quadratic variation is unique up to indistinguishability. -/
theorem isQuadraticVariation_unique (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M A A' : ℝ≥0 → Ω → ℝ)
    (hA : IsQuadraticVariation F P M A) (hA' : IsQuadraticVariation F P M A') :
    Indistinguishable P A A' := by
  sorry

/-- Brownian motion has quadratic variation `t`. -/
theorem brownian_quadraticVariation (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) :
    IsQuadraticVariation F P B (fun t _ => (t : ℝ)) := by
  sorry

/-- Burkholder–Davis–Gundy for centered continuous local martingales, with constants
depending only on p. Both sides are extended expectations; an infinite stopping time
uses the supremum of finite-time stopped brackets, never a totalized terminal value. -/
theorem continuous_bdg (p : ℝ) (hp : 0 < p) :
    ∃ c C : ℝ≥0, 0 < c ∧ c ≤ C ∧
      ∀ {Ω : Type u} [mΩ : MeasurableSpace Ω] (F : Filtration ℝ≥0 mΩ)
        (P : Measure Ω) [IsProbabilityMeasure P] (M A : ℝ≥0 → Ω → ℝ),
        IsLocalMartingale F P M →
        (∀ᵐ ω ∂P, Continuous (fun t => M t ω)) →
        (∀ᵐ ω ∂P, M 0 ω = 0) → IsQuadraticVariation F P M A →
        ∀ (τ : Ω → WithTop ℝ≥0), IsStoppingTime F τ →
          (c : ℝ≥0∞) * (∫⁻ ω,
            (⨆ t : ℝ≥0, ENNReal.ofReal (stoppedProcess A τ t ω)) ^ (p / 2) ∂P) ≤
              ∫⁻ ω, (⨆ t : ℝ≥0, ‖stoppedProcess M τ t ω‖ₑ) ^ p ∂P ∧
          (∫⁻ ω, (⨆ t : ℝ≥0, ‖stoppedProcess M τ t ω‖ₑ) ^ p ∂P) ≤
            (C : ℝ≥0∞) * (∫⁻ ω,
              (⨆ t : ℝ≥0, ENNReal.ofReal (stoppedProcess A τ t ω)) ^ (p / 2) ∂P) := by
  sorry

/-! ## Layer 5: Itô, Stratonovich and exponential calculus -/

/-- S5.5 original-process Lévy characterization on a raw filtration. Bare native
locality does not supply the literal strong-adaptation hypothesis. All time identities
and path continuity are on common full-measure events. -/
theorem levy_characterization_adapted (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hAdapt : StronglyAdapted F M) (hLocal : IsLocalMartingale F P M)
    (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
    (hZero : ∀ᵐ ω ∂P, M 0 ω = 0)
    (hQV : IsQuadraticVariation F P M (fun t _ => (t : ℝ))) :
    IsFilteredBrownian F P M := by
  sorry

/-- S5.5 bare-locality interface: select an indistinguishable predictable Brownian
version via the adapted surrogate and lagged predictable approximation. This conclusion
does not assert adaptation of the arbitrary original representative. -/
theorem exists_predictable_brownian_of_localMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hLocal : IsLocalMartingale F P M)
    (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
    (hZero : ∀ᵐ ω ∂P, M 0 ω = 0)
    (hQV : IsQuadraticVariation F P M (fun t _ => (t : ℝ))) :
    ∃ B, IsFilteredBrownian F P B ∧ IsStronglyPredictable F B ∧
      Indistinguishable P M B := by
  sorry

/-- The native Brownian law/continuity predicate plus locality and literal adaptation
implies the filtration-relative Brownian conclusion. Future independence is proved. -/
theorem filteredBrownian_of_brownianLaw_localMartingale (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M : ℝ≥0 → Ω → ℝ)
    (hLaw : IsBrownianReal M P) (hLocal : IsLocalMartingale F P M)
    (hAdapt : StronglyAdapted F M) : IsFilteredBrownian F P M := by
  sorry

/-- Lagged predictable approximations select a predictable version even when the
raw Brownian predicate asserts continuity only almost surely. -/
theorem exists_predictable_brownian_version (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) :
    ∃ B', IsFilteredBrownian F P B' ∧ IsStronglyPredictable F B' ∧
      Indistinguishable P B B' := by
  sorry

/-- Final C² Itô target, not only a bounded C³ intermediate proof. The integral
is localized; no global L² assumption on f′(B) is necessary. This representative-level
signature uses `hPred`; the general README theorem first uses the S0.2 selected Brownian
version and the S3.2 product-a.e. integrand adapter, then transfers by indistinguishability. -/
theorem brownian_ito_C2 (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f)
    (hPred : IsStronglyPredictable F (fun s ω => deriv f (B s ω))) :
    ∃ I, IsItoIntegral F P B (fun s ω => deriv f (B s ω)) I ∧
      ∀ᵐ ω ∂P, ∀ t, f (B t ω) = f 0 + I t ω +
        (1 / 2 : ℝ) * ∫ s, iteratedDeriv 2 f (B s ω) ∂timeMeasure t := by
  sorry

/-! ## Layer 6: Brownian paths, Markov and potential theory -/

/-- Reflection gives the upper-maximum probability for every positive level;
using an existential hitting event avoids a totalized real supremum. -/
theorem brownian_reflection (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (t : ℝ≥0)
    (a : ℝ) (ha : 0 < a) :
    P {ω | ∃ s ≤ t, a ≤ B s ω} = 2 * P {ω | a ≤ B t ω} := by
  sorry

/-- Every real level is hit almost surely, and its hitting time from x has
Laplace transform exp(-sqrt(2 θ) |a-x|), including θ=0 and x=a. -/
theorem brownian_hitting_laplace (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (x a : ℝ) (θ : ℝ≥0) :
    let τ := hittingAfter (fun t ω => x + B t ω) {a} 0
    (∀ᵐ ω ∂P, τ ω ≠ ⊤) ∧
      (∫ ω, Real.exp (-(θ : ℝ) * ((τ ω).untopA : ℝ)) ∂P) =
        Real.exp (-Real.sqrt (2 * (θ : ℝ)) * |a-x|) := by
  sorry

/-- Exit from a bounded open interval is integrable, with mean K²-x² for an
interior start and zero for a start on or outside the boundary. -/
theorem brownian_interval_exit (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (x K : ℝ) (hK : 0 < K) :
    let τ := hittingAfter (fun t ω => x + B t ω) (Set.Ioo (-K) K)ᶜ 0
    (∀ᵐ ω ∂P, τ ω ≠ ⊤) ∧ Integrable (fun ω => ((τ ω).untopA : ℝ)) P ∧
      (∫ ω, ((τ ω).untopA : ℝ) ∂P) = max 0 (K^2 - x^2) := by
  sorry

/-- At an almost-surely finite stopping time, the restarted Brownian path is
Brownian and independent of the stopped sigma algebra. Values on the event of
an infinite stopping time are immaterial. -/
theorem brownian_strongMarkov (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (τ : Ω → WithTop ℝ≥0)
    (hτ : IsStoppingTime F τ) (hfinite : ∀ᵐ ω ∂P, τ ω ≠ ⊤) :
    IsBrownianReal (fun t ω => B ((τ ω).untopA + t) ω - B (τ ω).untopA ω) P ∧
      Indep (MeasurableSpace.comap
        (fun ω t => B ((τ ω).untopA + t) ω - B (τ ω).untopA ω)
        (inferInstance : MeasurableSpace (ℝ≥0 → ℝ))) hτ.measurableSpace P := by
  sorry

/-- Brownian martingale representation in terminal form: every square-integrable
variable measurable in the raw natural filtration at T is a constant plus a
Brownian integral. Completion gives the same a.e. conclusion. -/
theorem brownian_martingaleRepresentation (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P)
    (hm : ∀ t, StronglyMeasurable (B t)) (T : ℝ≥0)
    (ξ : Ω → ℝ) (hξ : StronglyMeasurable[Filtration.natural B hm T] ξ)
    (hξ2 : MemLp ξ 2 P) :
    ∃ H I : ℝ≥0 → Ω → ℝ,
      BrownianIntegrable (Filtration.natural B hm) P H ∧
      IsItoIntegral (Filtration.natural B hm) P B H I ∧
      ξ =ᵐ[P] fun ω => (∫ ω', ξ ω' ∂P) + I T ω := by
  sorry

/-- The two-sided Brownian law of the iterated logarithm at infinity, with
normalization sqrt(2 t log log t). Only the eventual positive-time expression matters. -/
theorem brownian_lil (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) :
    ∀ᵐ ω ∂P,
      Filter.limsup (fun t : ℝ≥0 => B t ω /
        Real.sqrt (2 * (t : ℝ) * Real.log (Real.log (t : ℝ)))) Filter.atTop = 1 ∧
      Filter.liminf (fun t : ℝ≥0 => B t ω /
        Real.sqrt (2 * (t : ℝ) * Real.log (Real.log (t : ℝ)))) Filter.atTop = -1 := by
  sorry

/-- Brownian local time is jointly continuous, increases in time, starts at zero,
and has occupation-density normalization with respect to ordinary Lebesgue measure.
Its Tanaka correction has coefficient one; the sign integrand passes through a
predictable representative on each finite horizon. -/
theorem exists_brownian_localTime (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) :
    ∃ L : ℝ≥0 → ℝ → Ω → ℝ,
      (∀ᵐ ω ∂P, Continuous (fun p : ℝ≥0 × ℝ => L p.1 p.2 ω) ∧
        (∀ a, Monotone (fun t => L t a ω) ∧ L 0 a ω = 0) ∧
        ∀ t (f : ℝ → ℝ≥0∞), Measurable f →
          (∫⁻ s, f (B s ω) ∂timeMeasure t) =
            ∫⁻ a, f a * ENNReal.ofReal (L t a ω)) ∧
      ∀ a : ℝ, ∃ H I : ℝ≥0 → Ω → ℝ,
        IsItoIntegral F P B H I ∧
        (∀ T, Function.uncurry H =ᵐ[(timeMeasure T).prod P]
          Function.uncurry (fun t ω =>
            if a < B t ω then (1 : ℝ) else if B t ω < a then -1 else 0)) ∧
        ∀ᵐ ω ∂P, ∀ t, |B t ω - a| = |B 0 ω - a| + I t ω + L t a ω := by
  sorry

/-! ## Layer 7: Clocks and changes of measure -/

/-- Dambis–Dubins–Schwarz reconstruction for an unbounded bracket: a centered
continuous local martingale is Brownian motion evaluated at its quadratic variation. -/
theorem dambisDubinsSchwarz (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M A : ℝ≥0 → Ω → ℝ)
    (hM : IsLocalMartingale F P M)
    (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
    (hZero : ∀ᵐ ω ∂P, M 0 ω = 0) (hA : IsQuadraticVariation F P M A)
    (hInfinity : ∀ᵐ ω ∂P, Filter.Tendsto (fun t => A t ω) Filter.atTop Filter.atTop) :
    ∃ B : ℝ≥0 → Ω → ℝ, IsBrownianReal B P ∧
      ∀ᵐ ω ∂P, ∀ t, M t ω = B (Real.toNNReal (A t ω)) ω := by
  sorry

/-- Candidate stochastic exponential `exp(I_t − ½ ∫_(0,t] θ² ds)` built from a given Itô
integral `I` of `θ`; a true-density theorem requires additional criteria. -/
def stochasticExponential (I θ : ℝ≥0 → Ω → ℝ) (t : ℝ≥0) (ω : Ω) : ℝ :=
  Real.exp (I t ω -
    (1 / 2 : ℝ) * ∫ s, (θ s ω)^2 ∂timeMeasure t)

/-- Novikov is a sufficient condition; the stochastic exponential must not be assumed
integrable simply because it is a positive local martingale. -/
theorem novikov_expectation (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B θ : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hθ : LocallyBrownianIntegrable F P θ)
    (I : ℝ≥0 → Ω → ℝ) (hI : IsItoIntegral F P B θ I) (T : ℝ≥0)
    (hN : Integrable (fun ω => Real.exp ((1 / 2 : ℝ) *
      ∫ s, (θ s ω)^2 ∂timeMeasure T)) P) :
    (∫ ω, stochasticExponential I θ T ω ∂P) = 1 := by
  sorry

/-- Filtration-relative Brownian laws on one declared horizon. -/
def IsBrownianOn (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (T : ℝ≥0) (B : ℝ≥0 → Ω → ℝ) : Prop :=
  (∀ᵐ ω ∂P, B 0 ω = 0) ∧
    (∀ᵐ ω ∂P, ContinuousOn (fun t => B t ω) (Set.Iic T)) ∧ StronglyAdapted F B ∧
    ∀ s t, s ≤ t → t ≤ T →
      HasLaw (fun ω => B t ω - B s ω) (gaussianReal 0 (t-s)) P ∧
      Indep (MeasurableSpace.comap (fun ω => B t ω - B s ω) (borel ℝ)) (F s) P

/-- Positive-sign density yields a minus-sign drift correction, only up to T. -/
theorem girsanov_on_horizon (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B θ : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (hθ : LocallyBrownianIntegrable F P θ)
    (I : ℝ≥0 → Ω → ℝ) (hI : IsItoIntegral F P B θ I) (T : ℝ≥0)
    (hZ : (∫ ω, stochasticExponential I θ T ω ∂P) = 1) :
    IsBrownianOn F
      (P.withDensity (fun ω => ENNReal.ofReal (stochasticExponential I θ T ω))) T
      (fun t ω => B t ω - ∫ s, θ s ω ∂timeMeasure t) := by
  sorry

/-! ## Layer 8: Cameron–Martin and Wiener translations -/

/-- A finite-horizon Cameron–Martin path together with its specified velocity. -/
def IsCameronMartinShift (T : ℝ≥0) (h u : ℝ≥0 → ℝ) : Prop :=
  StronglyMeasurable u ∧ MemLp u 2 (timeMeasure T) ∧
    ∀ t, t ≤ T → h t = ∫ s, u s ∂timeMeasure t

/-- Cameron–Martin pushforward dictionary on finite-horizon coordinates.
The path-space Borel upgrade is S8.2. Cutoff makes the integrand a genuine global
local-domain member without assumptions on u after T. -/
theorem cameronMartin_pushforward (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (T : ℝ≥0) (h u : ℝ≥0 → ℝ)
    (hshift : IsCameronMartinShift T h u) (I : ℝ≥0 → Ω → ℝ)
    (hI : IsItoIntegral F P B (fun s _ => if s ≤ T then u s else 0) I) :
    P.map (fun ω (t : Set.Iic T) => B t.val ω + h t.val) =
      (P.withDensity (fun ω => ENNReal.ofReal
        (stochasticExponential I (fun s _ => if s ≤ T then u s else 0) T ω))).map
        (fun ω (t : Set.Iic T) => B t.val ω) := by
  sorry

/-- A continuous deterministic translation of a finite-horizon Wiener law is
mutually absolutely continuous with that law exactly for an absolutely continuous
shift starting at zero whose velocity is square integrable. -/
theorem cameronMartin_equivalence (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (T : ℝ≥0)
    (h : ℝ≥0 → ℝ) (hc : ContinuousOn h (Set.Iic T)) :
    let μ := P.map (fun ω (t : Set.Iic T) => B t.val ω)
    let ν := P.map (fun ω (t : Set.Iic T) => B t.val ω + h t.val)
    (ν ≪ μ ∧ μ ≪ ν) ↔ ∃ u, IsCameronMartinShift T h u := by
  sorry

/-- A continuous translation outside the finite-horizon Cameron–Martin space
produces a Wiener law mutually singular to the original law. -/
theorem cameronMartin_singularity (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (T : ℝ≥0)
    (h : ℝ≥0 → ℝ) (hc : ContinuousOn h (Set.Iic T))
    (hout : ¬ ∃ u, IsCameronMartinShift T h u) :
    (P.map (fun ω (t : Set.Iic T) => B t.val ω + h t.val)).MutuallySingular
      (P.map (fun ω (t : Set.Iic T) => B t.val ω)) := by
  sorry

/-! ## Layer 9: Strong and weak SDEs, flows and approximation -/

/-- Scalar strong-solution carrier with Borel coefficients and a predictable representative of
`t ↦ σ(t, X_t)` in the finite-horizon `dt × P` classes. Thus a progressive, a.s.-continuous
solution is not required to be literally strongly predictable. The S0.2/S3.2 adapter preserves
Borel coefficients and arbitrary F₀-measurable initial data. -/
def IsStrongSolution (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B : ℝ≥0 → Ω → ℝ) (b σ : ℝ≥0 → ℝ → ℝ) (ξ : Ω → ℝ)
    (X : ℝ≥0 → Ω → ℝ) : Prop :=
  Measurable (Function.uncurry b) ∧ Measurable (Function.uncurry σ) ∧
    StronglyAdapted F X ∧ IsStronglyProgressive F X ∧
    (∀ᵐ ω ∂P, Continuous (fun t => X t ω)) ∧
    ∃ H I : ℝ≥0 → Ω → ℝ,
      IsStronglyPredictable F H ∧ IsItoIntegral F P B H I ∧
      (∀ T, Function.uncurry (fun t ω => σ t (X t ω)) =ᵐ[(timeMeasure T).prod P]
        Function.uncurry H) ∧
      (∀ᵐ ω ∂P, ∀ T,
        Integrable (fun t => b t (X t ω)) (timeMeasure T) ∧
        Integrable (fun t => (σ t (X t ω))^2) (timeMeasure T)) ∧
      ∀ᵐ ω ∂P, ∀ t, X t ω = ξ ω +
        (∫ s, b s (X s ω) ∂timeMeasure t) + I t ω

/-- Strong existence for Borel scalar coefficients with spatial Lipschitz and
linear-growth constants uniform on each finite time horizon, and arbitrary finite
F₀-measurable initial values. No initial moment is required. -/
theorem exists_strongSolution (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (b σ : ℝ≥0 → ℝ → ℝ)
    (hb : Measurable (Function.uncurry b)) (hσ : Measurable (Function.uncurry σ))
    (hLip : ∀ T : ℝ≥0, ∃ L : ℝ≥0, ∀ t ≤ T, ∀ x y,
      |b t x - b t y| + |σ t x - σ t y| ≤ (L : ℝ) * |x-y|)
    (hBound : ∀ T : ℝ≥0, ∃ K : ℝ≥0, ∀ t ≤ T, |b t 0| + |σ t 0| ≤ K)
    (ξ : Ω → ℝ) (hξ : StronglyMeasurable[F 0] ξ) :
    ∃ X, IsStrongSolution F P B b σ ξ X := by
  sorry

/-- Two scalar strong solutions with the same initial variable and Brownian noise
are indistinguishable under spatial Lipschitz bounds on each finite time horizon.
No moment condition on the initial variable is needed. -/
theorem strongSolution_pathwise_unique (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (b σ : ℝ≥0 → ℝ → ℝ)
    (hLip : ∀ T : ℝ≥0, ∃ L : ℝ≥0, ∀ t ≤ T, ∀ x y,
      |b t x - b t y| + |σ t x - σ t y| ≤ (L : ℝ) * |x-y|)
    (ξ : Ω → ℝ) (hξ : StronglyMeasurable[F 0] ξ)
    (X Y : ℝ≥0 → Ω → ℝ)
    (hX : IsStrongSolution F P B b σ ξ X) (hY : IsStrongSolution F P B b σ ξ Y) :
    Indistinguishable P X Y := by
  sorry

end Headlines

/-! ## Raw-filtration localization

Raw-filtration localization interfaces distinguish pointwise strong adaptation from adaptation
only modulo null sets and state common-null path continuity where the construction needs it.
They use Mathlib's native objects and remain subject to the full hypotheses and proof
requirements stated in the README. -/

section RawLocalization

variable {Ω : Type*} {mΩ : MeasurableSpace Ω}
variable (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
variable [IsProbabilityMeasure P]

/-- Native countable-range optional sampling.  Its hypotheses are precisely the ones
needed by Mathlib's conditional-expectation theorem; this API is independent of path
regularity and does not claim the stopped process is a martingale. -/
theorem stoppedValue_countable_range
    {M : ℝ≥0 → Ω → ℝ} {T : Ω → WithTop ℝ≥0} {t : ℝ≥0}
    (hM : Martingale M F P) (hT : IsStoppingTime F T)
    (hTle : ∀ ω, T ω ≤ (t : WithTop ℝ≥0))
    (hTrange : (Set.range T).Countable)
    [SigmaFinite (P.trim (hT.measurableSpace_le_of_le hTle))] :
    stoppedValue M T =ᵐ[P] P[M t | hT.measurableSpace] := by
  exact hM.stoppedValue_ae_eq_condExp_of_le_const_of_countable_range hT hTle hTrange

/-- A stopped-process martingale target for a countable-range stopping time on a raw
filtration. The proof is by the native finite-horizon conditional identity
`stoppedValue_countable_range` on the countable partition into `{T = q}`. It needs no
right-continuity, completion, or path regularity. -/
theorem martingale_stopped_countable_range
    (M : ℝ≥0 → Ω → ℝ) (hM : Martingale M F P)
    (T : Ω → WithTop ℝ≥0) (hT : IsStoppingTime F T)
    (hcount : (Set.range T).Countable) :
    Martingale
      (stoppedProcess (fun t => {ω | (⊥ : WithTop ℝ≥0) < T ω}.indicator (M t)) T)
      F P := by
  sorry

/-- Exact first hitting time of a centered level. Continuity on the good-path event makes
finite hits attained. -/
def firstCenteredLevelHit (X : ℝ≥0 → Ω → ℝ) (a : ℝ) (ω : Ω) : WithTop ℝ≥0 :=
  sInf {t : WithTop ℝ≥0 | ∃ u : ℝ≥0, (u : WithTop ℝ≥0) = t ∧ a ≤ |X u ω - X 0 ω|}

/-- Level-localizer interface for a strongly adapted process with a common-null continuous
path version. Grid hits and their attained minimum have countable range; finite maxima
make the sequence pointwise monotone. The centered, zero-at-stopping convention
is explicit: even if a level is already exceeded at time zero, the native stopped process is
zero when `τ = 0`. One common a.e. set gives both the level comparison and the uniform bound.
-/
theorem exists_raw_level_localizers
    (X : ℝ≥0 → Ω → ℝ) (hX : StronglyAdapted F X)
    (hcont : ∀ᵐ ω ∂P, Continuous (fun t => X t ω)) :
    ∃ τ : ℕ → Ω → WithTop ℝ≥0,
      IsLocalizingSequence F τ P ∧
      (∀ ω, Monotone (fun n => τ n ω)) ∧
      (∀ n, (Set.range (τ n)).Countable) ∧
      ∀ᵐ ω ∂P, ∀ (n : ℕ),
        firstCenteredLevelHit X (((n : ℝ) + 1) / 2) ω ≤ τ n ω ∧
        τ n ω ≤ firstCenteredLevelHit X ((n : ℝ) + 1) ω ∧
        ∀ t,
          |stoppedProcess
            (fun s => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator
              (fun ω => X s ω - X 0 ω))
            (τ n) t ω| ≤ (n : ℝ) + 1 := by
  sorry

/-- A strongly adapted a.s.-continuous process is local when its native stopped stages
are indistinguishable from actual martingales. The given localizing sequence may have arbitrary
range. Use independent countable-range level stops and bounded conditional convergence to
construct new adapted stopped martingales; literal adaptation at the given stops is not assumed. -/
theorem locally_martingale_of_ae_stopped_eq
    (X : ℝ≥0 → Ω → ℝ) (hX : StronglyAdapted F X)
    (hcont : ∀ᵐ ω ∂P, Continuous (fun t => X t ω))
    (τ : ℕ → Ω → WithTop ℝ≥0)
    (hτ : IsLocalizingSequence F τ P)
    (Y : ℕ → ℝ≥0 → Ω → ℝ)
    (hYmart : ∀ n, Martingale (Y n) F P)
    (hYeq : ∀ n, ∀ᵐ ω ∂P, ∀ t,
      Y n t ω = stoppedProcess
        (fun s => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator (X s))
        (τ n) t ω) :
    Locally (fun Z => Martingale Z F P) F X P := by
  sorry

/-- A stopped-version adapter for any native localizing sequence, including arbitrary-range
stopping times. Strong progression is the exact raw-filtration measurability hypothesis that
makes the stopped processes adapted. The stage equalities are simultaneous in time a.e. -/
theorem locally_martingale_of_ae_stopped_eq_of_progressive
    (X : ℝ≥0 → Ω → ℝ) (hProg : IsStronglyProgressive F X)
    (τ : ℕ → Ω → WithTop ℝ≥0)
    (hτ : IsLocalizingSequence F τ P)
    (Y : ℕ → ℝ≥0 → Ω → ℝ)
    (hYmart : ∀ n, Martingale (Y n) F P)
    (hYeq : ∀ n, ∀ᵐ ω ∂P, ∀ t,
      Y n t ω = stoppedProcess
        (fun s => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator (X s))
        (τ n) t ω) :
    Locally (fun Z => Martingale Z F P) F X P := by
  sorry

/-- Raw localization from the native `Locally` predicate with only its original hypotheses.
The construction is performed on an adapted continuous surrogate assembled from the native
stopped martingales; it uses auxiliary level localizers, then intersects each with the original
localizing sequence. The final sequence need not have countable range. -/
theorem exists_raw_bounded_localizer
    (X : ℝ≥0 → Ω → ℝ)
    (hX : Locally (fun Y => Martingale Y F P) F X P)
    (hcont : ∀ᵐ ω ∂P, Continuous (fun t => X t ω)) :
    ∃ τ : ℕ → Ω → WithTop ℝ≥0,
      IsLocalizingSequence F τ P ∧
      (∀ n, Martingale
        (stoppedProcess (fun t => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator (X t))
          (τ n)) F P) ∧
      (∀ᵐ ω ∂P, ∀ n t,
        |stoppedProcess
          (fun s => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator
            (fun ω => X s ω - X 0 ω)) (τ n) t ω| ≤ (n : ℝ) + 1) ∧
      (∀ᵐ ω ∂P, ∀ n t,
        |stoppedProcess (fun s => {ω | (⊥ : WithTop ℝ≥0) < τ n ω}.indicator (X s))
          (τ n) t ω| ≤ 2 * ((n : ℝ) + 1)) := by
  sorry

/-- A local martingale in a larger raw filtration descends to a smaller raw filtration on the
same probability space when the process is strongly adapted to the smaller filtration and has
a common-null continuous version. The proof uses the smaller-filtration attained level stops,
optional sampling in the larger filtration, and bounded convergence; no usual-conditions
assumption is hidden. -/
theorem locally_martingale_descends_raw
    (X : ℝ≥0 → Ω → ℝ)
    (G : Filtration ℝ≥0 mΩ)
    (hFG : ∀ t, F t ≤ G t)
    (hStrong : StronglyAdapted F X)
    (hcont : ∀ᵐ ω ∂P, Continuous (fun t => X t ω))
    (hLocalG : Locally (fun Y => Martingale Y G P) G X P) :
    Locally (fun Y => Martingale Y F P) F X P := by
  sorry

/-- Adjoin the null sets measurable in the given ambient space, without changing that space.
On a complete ambient probability space this is full null augmentation. -/
def ambientNullAugmentation (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    Filtration ℝ≥0 mΩ where
  seq t := F t ⊔ MeasurableSpace.generateFrom {A : Set Ω | MeasurableSet A ∧ P A = 0}
  mono' _ _ h := sup_le_sup (F.mono h) le_rfl
  le' t := sup_le (F.le t) (MeasurableSpace.generateFrom_le fun _ h => h.1)

/-- Every ambient measurable null set is measurable already at time zero after augmentation. -/
theorem measurableSet_null_ambientNullAugmentation
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) {A : Set Ω}
    (hAm : MeasurableSet A) (hA : P A = 0) :
    MeasurableSet[(ambientNullAugmentation F P) 0] A := by
  have hle : MeasurableSpace.generateFrom {B : Set Ω | MeasurableSet B ∧ P B = 0} ≤
      (ambientNullAugmentation F P) 0 := le_sup_right
  exact hle A (MeasurableSpace.measurableSet_generateFrom ⟨hAm, hA⟩)

/-- The raw filtration, viewed on the ambient completed measurable-space type. This keeps the
same time-indexed σ-algebras; the `le'` proof is the explicit inclusion into the completed
ambient σ-algebra. It is not yet right-continuous or complete at each time. -/
noncomputable def completedRawFiltration
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    Filtration ℝ≥0 (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P)) := by
  refine { seq := fun t => F t, mono' := F.mono', le' := ?_ }
  intro t
  exact (F.le t).trans (by
    intro s hs
    exact hs.eventuallyMeasurableSet)

/-- A concrete usual-augmentation package on the completed measurable space. The fields require
raw-filtration inclusion, right-continuity, completion at every time, and minimality among all
right-continuous complete extensions, excluding extra non-null information. -/
structure IsUsualAugmentation
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (G : Filtration ℝ≥0
      (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P))) : Prop where
  raw_le : ∀ t, F t ≤ G t
  right_continuous : Filtration.IsRightContinuous G
  complete_at_each_time : ∀ t A, P A = 0 → ∀ B, B ⊆ A → MeasurableSet[G t] B
  minimal : ∀ H : Filtration ℝ≥0
      (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P)),
    Filtration.IsRightContinuous H →
    (∀ t A, P A = 0 → ∀ B, B ⊆ A → MeasurableSet[H t] B) →
    (∀ t, F t ≤ H t) → ∀ t, G t ≤ H t

/-- The right-continuous hull of the completed raw filtration, with completion at each time.
The definition has the genuine filtration carrier and the specification below records exactly
which properties the construction must satisfy. -/
def nullCompletedFiltration
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    Filtration ℝ≥0 (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P)) where
  seq t := F t ⊔ MeasurableSpace.generateFrom {A : Set Ω | P A = 0}
  mono' _ _ hst := sup_le_sup (F.mono hst) le_rfl
  le' t := sup_le ((completedRawFiltration F P).le t)
    (MeasurableSpace.generateFrom_le fun _ hA => NullMeasurableSet.of_null hA)

noncomputable def usualAugmentation
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    Filtration ℝ≥0 (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P)) :=
  (nullCompletedFiltration F P).rightCont

/-- Specification of the completed right-continuous augmentation constructed above. -/
theorem usualAugmentation_isUsualAugmentation
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    IsUsualAugmentation F P (usualAugmentation F P) := by
  let K := nullCompletedFiltration F P
  have hK (t : ℝ≥0) : K t ≤ usualAugmentation F P t :=
    K.le_rightCont t
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro t
    exact (show F t ≤ K t from le_sup_left).trans (hK t)
  · change Filtration.IsRightContinuous K.rightCont
    infer_instance
  · intro t A hA B hBA
    have hB : P B = 0 := le_antisymm ((measure_mono hBA).trans hA.le) bot_le
    apply hK t
    exact (show MeasurableSpace.generateFrom {A : Set Ω | P A = 0} ≤ K t from
      le_sup_right) B (MeasurableSpace.measurableSet_generateFrom hB)
  · intro H hH hnull hFH t
    have hKH : K ≤ H := by
      intro u
      refine sup_le (hFH u) (MeasurableSpace.generateFrom_le ?_)
      intro A hA
      exact hnull u A hA A Set.Subset.rfl
    have hright : K.rightCont t ≤ H.rightCont t := by
      rw [Filtration.rightCont_eq, Filtration.rightCont_eq]
      exact iInf_mono fun u => iInf_mono fun _ => hKH u
    exact hright.trans (hH.RC t)

/-- Return a local-martingale statement from the completed-measure copy of the *raw*
filtration. The filtration is explicitly `completedRawFiltration F P`, not the larger usual
augmentation. Completion transport uses `Measure.ae_completion` and conditional-expectation
equality for raw-F-measurable integrable variables. -/
theorem locally_martingale_returns_from_completion
    (X : ℝ≥0 → Ω → ℝ)
    (hLocal : Locally
      (fun Y => Martingale Y (completedRawFiltration F P) (P.completion))
      (completedRawFiltration F P) X (P.completion)) :
    Locally (fun Y => Martingale Y F P) F X P := by
  sorry

/-- Passage from a raw local martingale to its minimal complete, right-continuous augmentation,
without adding a strong-adaptation hypothesis. The measure is explicitly `P.completion`; AE
statements transfer by native `Measure.ae_completion`. Conditional-expectation transport still
requires integrability and the minimal-filtration identity; no unconditional equality of
conditional expectations is asserted. -/
theorem locally_martingale_in_usual_augmentation
    (X : ℝ≥0 → Ω → ℝ)
    (G : Filtration ℝ≥0
      (inferInstance : MeasurableSpace (NullMeasurableSpace Ω P)))
    (hUsual : IsUsualAugmentation F P G)
    (hcont : ∀ᵐ ω ∂P, Continuous (fun t => X t ω))
    (hLocal : Locally (fun Y => Martingale Y F P) F X P) :
    Locally (fun Y => Martingale Y G (P.completion)) G X (P.completion) := by
  sorry

end RawLocalization

/-! ## Independent laws

Native law adapters for sums and finite vectors of independent real random variables, which
S1.3 specializes to Brownian increments, followed by elementary finite-law acceptance examples
using native probability and covariance. -/

section IndependentLaws

section Laws

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- Native alias: the law of a sum of independent real random variables is additive
convolution of their laws. This is Mathlib's `IndepFun.map_add_eq_map_conv_map₀`. -/
theorem independent_sum_law
    [IsFiniteMeasure P] {f g : Ω → ℝ}
    (hf : AEMeasurable f P) (hg : AEMeasurable g P)
    (hfg : IndepFun f g P) :
    Measure.map (fun ω => f ω + g ω) P = (Measure.map f P).conv (Measure.map g P) :=
  hfg.map_add_eq_map_conv_map₀ hf hg

/-- Native alias: a finite independent family has the product of its marginal laws.
This supplies the increment-vector law before the cumulative-sum coordinate change. -/
theorem independent_finite_vector_law
    {ι : Type*} [Fintype ι] [IsProbabilityMeasure P]
    {Z : ι → Ω → ℝ} (hZ : ∀ i, AEMeasurable (Z i) P)
    (hInd : iIndepFun Z P) :
    Measure.map (fun ω i => Z i ω) P = Measure.pi (fun i => Measure.map (Z i) P) :=
  hInd.map_fun_eq_pi_map hZ

/-- If each coordinate of the finite independent family has the stated density, the
joint increment-vector law is the product of those one-dimensional density measures. -/
theorem independent_finite_vector_density_law
    {ι : Type*} [Fintype ι] [IsProbabilityMeasure P]
    {Z : ι → Ω → ℝ} (hZ : ∀ i, AEMeasurable (Z i) P)
    (hInd : iIndepFun Z P) (ρ : ι → ℝ → ℝ≥0∞)
    (hDensity : ∀ i, Measure.map (Z i) P = volume.withDensity (ρ i)) :
    Measure.map (fun ω i => Z i ω) P =
      Measure.pi (fun i => volume.withDensity (ρ i)) := by
  rw [independent_finite_vector_law hZ hInd]
  exact congrArg Measure.pi (funext hDensity)

/-- The exact joint law underlying exercise 1(a): apply the measurable map `(x,y) ↦ (x+y,y)`
to the product of the independent marginal laws. -/
theorem independent_sum_second_joint_law
    [IsProbabilityMeasure P] {f g : Ω → ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hfg : IndepFun f g P) :
    Measure.map (fun ω => (f ω + g ω, g ω)) P =
      Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))
        ((Measure.map f P).prod (Measure.map g P)) := by
  have hpair : Measure.map (fun ω => (f ω, g ω)) P =
      (Measure.map f P).prod (Measure.map g P) :=
    (indepFun_iff_map_prod_eq_prod_map_map hf.aemeasurable hg.aemeasurable).mp hfg
  calc
    Measure.map (fun ω => (f ω + g ω, g ω)) P =
        Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))
          (Measure.map (fun ω => (f ω, g ω)) P) := by
      rw [Measure.map_map (by fun_prop) (by fun_prop)]
      rfl
    _ = _ := congrArg (Measure.map (fun z : ℝ × ℝ => (z.1 + z.2, z.2))) hpair

/-- Native density propagation for a sum. The convolution-density theorem is an alias of
Mathlib's `IndepFun.add_hasPDF` under addition, with its finite-probability and
translation-invariant reference-measure assumptions retained. -/
theorem independent_sum_hasPDF
    [IsFiniteMeasure P] {f g : Ω → ℝ}
    [HasPDF f P volume] [HasPDF g P volume]
    (hfg : IndepFun f g P) : HasPDF (fun ω => f ω + g ω) P volume :=
  hfg.add_hasPDF

/-- Desired general joint-event identity from source exercise 1(a). The left side is
written as a preimage event and the right side as the iterated law integral. This remains
a target: the proof must derive it from the joint product-law identity and Tonelli, with
measurability of the translated-set kernel established explicitly. -/
theorem independent_sum_joint_event
    [IsProbabilityMeasure P] {f g : Ω → ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hfg : IndepFun f g P) (A B : Set ℝ)
    (hA : MeasurableSet A) (hB : MeasurableSet B) :
    P {ω | f ω + g ω ∈ A ∧ g ω ∈ B} =
      ∫⁻ x in B, (Measure.map f P) {y | y + x ∈ A} ∂(Measure.map g P) := by
  sorry

end Laws

/-! Elementary finite-law acceptance examples, using native probability and covariance. -/

namespace ThreeAtomExample

abbrev Ω := Fin 3

def μ : Measure Ω := (PMF.uniformOfFintype Ω).toMeasure

def X (i : Ω) : ℝ := (i.val : ℝ) - 1

def Y (i : Ω) : ℝ := (X i) ^ 2

instance : IsProbabilityMeasure μ := by
  dsimp [μ]
  infer_instance

lemma integrable_bounded_one {f : Ω → ℝ} (hf : ∀ i, ‖f i‖ₑ ≤ 1) : Integrable f μ := by
  refine integrable_of_forall_fin_meas_le 1 (by norm_num) (by fun_prop) ?_
  intro s hs hfinite
  calc
    ∫⁻ i in s, ‖f i‖ₑ ∂μ ≤ ∫⁻ i in s, (1 : ℝ≥0∞) ∂μ := by
      apply lintegral_mono
      intro i
      exact hf i
    _ = μ s := by simp
    _ ≤ 1 := by
      calc μ s ≤ μ Set.univ := measure_mono (Set.subset_univ _)
        _ = 1 := measure_univ

lemma integrable_X : Integrable X μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [X]

lemma integrable_Y : Integrable Y μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma integrable_X_sq : Integrable (fun i => X i ^ 2) μ := integrable_Y

lemma integrable_Y_sq : Integrable (fun i => Y i ^ 2) μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma integrable_XY : Integrable (fun i => X i * Y i) μ := by
  apply integrable_bounded_one
  intro i
  fin_cases i <;> norm_num [Y, X]

lemma memLp_X : MemLp X 2 μ := by
  apply MemLp.of_bound (p := 2) (by fun_prop) 1
  filter_upwards [] with i
  fin_cases i <;> norm_num [X]

lemma memLp_Y : MemLp Y 2 μ := by
  apply MemLp.of_bound (p := 2) (by fun_prop) 1
  filter_upwards [] with i
  fin_cases i <;> norm_num [Y, X]

lemma mean_X : ∫ i, X i ∂μ = 0 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma mean_Y : ∫ i, Y i ∂μ = (2 : ℝ) / 3 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma mean_XY : ∫ i, X i * Y i ∂μ = 0 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma second_moment_Y : ∫ i, Y i ^ 2 ∂μ = (2 : ℝ) / 3 := by
  rw [show μ = (PMF.uniformOfFintype Ω).toMeasure by rfl, PMF.integral_eq_sum]
  norm_num [Y, X, PMF.uniformOfFintype_apply, Fin.sum_univ_succ]

lemma covariance_XY_zero :
    cov[X, Y; μ] = 0 := by
  rw [covariance_eq_sub memLp_X memLp_Y]
  change (∫ i, X i * Y i ∂μ) - (∫ i, X i ∂μ) * (∫ i, Y i ∂μ) = 0
  rw [mean_XY, mean_X, mean_Y]
  norm_num

lemma independent_covariance_eq_zero {α : Type*} [MeasurableSpace α]
    {ν : Measure α} [IsProbabilityMeasure ν] {f g : α → ℝ}
    (hf : MemLp f 2 ν) (hg : MemLp g 2 ν) (hfg : IndepFun f g ν) :
    cov[f, g; ν] = 0 := by
  rw [covariance_eq_sub hf hg]
  rw [hfg.integral_mul_eq_mul_integral hf.aestronglyMeasurable hg.aestronglyMeasurable]
  ring

lemma independent_product_integrable_generic {α : Type*} [MeasurableSpace α]
    {ν : Measure α} {f g : α → ℝ}
    (hfg : IndepFun f g ν) (hf : Integrable f ν) (hg : Integrable g ν) :
    Integrable (fun x => f x * g x) ν :=
  hfg.integrable_mul hf hg

lemma independent_integral_factorization_generic {α : Type*} [MeasurableSpace α]
    {ν : Measure α} {f g : α → ℝ}
    (hfg : IndepFun f g ν) (hf : Integrable f ν) (hg : Integrable g ν) :
    (∫ x, f x * g x ∂ν) = (∫ x, f x ∂ν) * (∫ x, g x ∂ν) :=
  hfg.integral_mul_eq_mul_integral hf.aestronglyMeasurable hg.aestronglyMeasurable

lemma variance_X : variance X μ = (2 : ℝ) / 3 := by
  rw [variance_eq_sub memLp_X]
  change (∫ i, X i ^ 2 ∂μ) - (∫ i, X i ∂μ) ^ 2 = (2 : ℝ) / 3
  rw [mean_X, show (fun i => X i ^ 2) = Y by rfl, mean_Y]
  norm_num

lemma variance_Y : variance Y μ = (2 : ℝ) / 9 := by
  rw [variance_eq_sub memLp_Y]
  change (∫ i, Y i ^ 2 ∂μ) - (∫ i, Y i ∂μ) ^ 2 = (2 : ℝ) / 9
  rw [second_moment_Y, mean_Y]
  norm_num

lemma not_indep_X_Y : ¬ IndepFun X Y μ := by
  intro h
  have hsets := h.measure_inter_preimage_eq_mul ({0} : Set ℝ) ({0} : Set ℝ)
    (measurableSet_singleton 0) (measurableSet_singleton 0)
  have hpre : X ⁻¹' ({0} : Set ℝ) = ({1} : Set Ω) := by
    ext i
    fin_cases i <;> norm_num [X]
  have hpreY : Y ⁻¹' ({0} : Set ℝ) = ({1} : Set Ω) := by
    ext i
    fin_cases i <;> norm_num [Y, X]
  have hleft : μ (X ⁻¹' ({0} : Set ℝ) ∩ Y ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpre, hpreY]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  have hx : μ (X ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpre]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  have hy : μ (Y ⁻¹' ({0} : Set ℝ)) = (3 : ℝ≥0∞)⁻¹ := by
    rw [hpreY]
    norm_num [μ, PMF.toMeasure_apply_singleton, PMF.uniformOfFintype_apply]
  rw [hleft, hx, hy] at hsets
  have hneq : (3 : ℝ≥0∞)⁻¹ ≠ (3 : ℝ≥0∞)⁻¹ * (3 : ℝ≥0∞)⁻¹ := by
    intro h
    have h' := congrArg ENNReal.toReal h
    norm_num at h'
  exact hneq hsets

end ThreeAtomExample

namespace FairCoinExample

noncomputable def μ : Measure (ℕ → Fin 2) :=
  Measure.infinitePi (fun (_ : ℕ) => (PMF.uniformOfFintype (Fin 2)).toMeasure)

instance : IsProbabilityMeasure μ := by
  dsimp [μ]
  infer_instance

/-- Every finite prescribed fair-coin outcome has its native product probability. -/
theorem cylinder_probability (S : Finset ℕ) (e : S → Fin 2) :
    μ {ω | S.restrict ω = e} = ((2 : ℝ≥0∞)⁻¹) ^ S.card := by
  change μ (S.restrict ⁻¹' ({e} : Set (S → Fin 2))) = _
  rw [← Measure.map_apply (by fun_prop) (measurableSet_singleton e)]
  simp [μ, Measure.infinitePi_map_restrict, Measure.pi_singleton,
    PMF.uniformOfFintype_apply]

end FairCoinExample

end IndependentLaws

/-! ## Point-process adapters

Representative normalization lemmas for the common half-line Lebesgue convention specified by
this roadmap and PointProcesses. These prototypes do not exhaust the point-process adapters. -/

section PointProcessesAdapter

theorem nnvolume_eq_comap_volume :
    nnvolume = Measure.comap ((↑) : ℝ≥0 → ℝ) volume := rfl

theorem timeMeasure_eq_comap_volume (T : ℝ≥0) :
    timeMeasure T = (Measure.comap ((↑) : ℝ≥0 → ℝ) volume).restrict (Set.Ioc 0 T) := rfl

theorem predictableMeasure_eq_comap_volume {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) (T : ℝ≥0) :
    predictableMeasure F P T =
      ((((Measure.comap ((↑) : ℝ≥0 → ℝ) volume).restrict (Set.Ioc 0 T)).prod P).trim
        (predictable_le_prod F)) := rfl

end PointProcessesAdapter

/-! ## Cameron–Martin grid targets

These finite increment-law targets support S8.3's construction of the path-space
Cameron–Martin density. All variances are positive; the empty grid is included.
The continuum projection and stochastic-integral steps remain README targets. -/

section CameronMartinGrid

variable {n : ℕ}

def incrementLaw (v : Fin n → ℝ≥0) : Measure (Fin n → ℝ) :=
  Measure.pi (fun i => gaussianReal 0 (v i))

def energy (v : Fin n → ℝ≥0) (a : Fin n → ℝ) : ℝ :=
  ∑ i, (a i) ^ 2 / (v i : ℝ)

def likelihood (v : Fin n → ℝ≥0) (a x : Fin n → ℝ) : ℝ :=
  Real.exp (∑ i, (a i * x i / (v i : ℝ) - (a i) ^ 2 / (2 * (v i : ℝ))))

/-- The positive cross term is the pushforward by addition of the shift. -/
theorem translated_increment_density (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) :
    Measure.map (fun x => x + a) (incrementLaw v) =
      (incrementLaw v).withDensity (fun x => ENNReal.ofReal (likelihood v a x)) := by
  sorry

/-- Positive densities have every real power integrable, including negative powers. -/
theorem likelihood_power_integrable (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) (p : ℝ) :
    Integrable (fun x => (likelihood v a x) ^ p) (incrementLaw v) := by
  sorry

/-- Gaussian moments give normalization, uniform Lp bounds and the L2 projection error. -/
theorem likelihood_power_moment (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) (p : ℝ) :
    (∫ x, (likelihood v a x) ^ p ∂incrementLaw v) =
      Real.exp (p * (p - 1) * energy v a / 2) := by
  sorry

end CameronMartinGrid

/-! ## Autonomous arcsin–sech ODE

Suggested native declarations for the deterministic autonomous equation
`z' = 1 - tanh(C - z) / 2` of S9's arcsin–sech branch representation: its separated time
coordinate, the global inverse chart, and the unique global solution with its hitting time. -/

section AutonomousODE

open scoped ContDiff

/-- The positive logarithm argument in the separated-coordinate primitive. -/
def logArgument (C z : ℝ) : ℝ := 2 * Real.cosh (C - z) - Real.sinh (C - z)

/-- Strictly increasing time coordinate for `z' = 1 - tanh(C-z)/2`. -/
def timeCoordinate (C z : ℝ) : ℝ :=
  -(4 / 3 : ℝ) * (C - z) - (2 / 3 : ℝ) * Real.log (logArgument C z)

/-- Positivity is global; it does not depend on the source branch `z < C`. -/
theorem logArgument_pos (C z : ℝ) : 0 < logArgument C z := by
  sorry

/-- Exact derivative of the separated-coordinate map. -/
theorem hasDerivAt_timeCoordinate (C z : ℝ) :
    HasDerivAt (timeCoordinate C) (1 / (1 - (1 / 2 : ℝ) * Real.tanh (C - z))) z := by
  sorry

/-- Global strict derivative bounds. -/
theorem timeCoordinate_derivative_bounds (C z : ℝ) :
    (2 / 3 : ℝ) < 1 / (1 - (1 / 2 : ℝ) * Real.tanh (C - z)) ∧
      1 / (1 - (1 / 2 : ℝ) * Real.tanh (C - z)) < 2 := by
  sorry

/-- Smoothness on all of `ℝ`, since the logarithm argument is everywhere positive. -/
theorem timeCoordinate_smooth (C : ℝ) : ContDiff ℝ ∞ (timeCoordinate C) := by
  sorry

/-- The derivative bounds make the time coordinate a strictly increasing bijection. -/
theorem timeCoordinate_bijective (C : ℝ) : Function.Bijective (timeCoordinate C) := by
  sorry

/-- The global inverse chart, with no branch restriction. -/
noncomputable def timeCoordinateEquiv (C : ℝ) : ℝ ≃ ℝ :=
  Equiv.ofBijective (timeCoordinate C) (timeCoordinate_bijective C)

/-- Unique global deterministic solution with initial value `z₀`. -/
def odeSolution (C z₀ t : ℝ) : ℝ :=
  (timeCoordinateEquiv C).symm (t + timeCoordinate C z₀)

theorem odeSolution_initial (C z₀ : ℝ) : odeSolution C z₀ 0 = z₀ := by
  sorry

theorem hasDerivAt_odeSolution (C z₀ t : ℝ) :
    HasDerivAt (odeSolution C z₀) (1 - (1 / 2 : ℝ) * Real.tanh (C - odeSolution C z₀ t)) t := by
  sorry

theorem odeSolution_strictMono (C z₀ : ℝ) : StrictMono (odeSolution C z₀) := by
  sorry

theorem odeSolution_unique (C z₀ : ℝ) {φ : ℝ → ℝ}
    (hφ : ∀ t, HasDerivAt φ (1 - (1 / 2 : ℝ) * Real.tanh (C - φ t)) t)
    (h0 : φ 0 = z₀) : ∀ t, φ t = odeSolution C z₀ t := by
  sorry

theorem odeSolution_hitTime_pos (C z₀ : ℝ) (hz₀ : z₀ < C) :
    0 < timeCoordinate C C - timeCoordinate C z₀ := by
  sorry

/-- For `z₀ < C`, the unique global solution first reaches `C` at this positive time.
The equivalence rules out every earlier hit, including negative times. -/
theorem odeSolution_hits_C_iff (C z₀ t : ℝ) (hz₀ : z₀ < C) :
    odeSolution C z₀ t = C ↔ t = timeCoordinate C C - timeCoordinate C z₀ := by
  sorry

theorem odeSolution_preHit_lt_C (C z₀ t : ℝ) (hz₀ : z₀ < C)
    (ht0 : 0 ≤ t) (ht : t < timeCoordinate C C - timeCoordinate C z₀) :
    odeSolution C z₀ t < C := by
  sorry

end AutonomousODE

end StochasticCalculusSuggested


namespace TauCetiRoadmap.StochasticCalculus

open MeasureTheory ProbabilityTheory
open scoped NNReal

variable {Ω : Type*} [MeasurableSpace Ω]

/-- On each fixed positive finite horizon, standard scalar Brownian motion has
Lévy's exact uniform modulus, with mesh approaching zero through positive values. -/
theorem brownian_exact_uniform_modulus (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P)
    (T : ℝ≥0) (hT : 0 < T) :
    ∀ᵐ ω ∂P, Filter.Tendsto
      (fun h : ℝ =>
        sSup {a : ℝ | ∃ s t : ℝ≥0,
          s ≤ T ∧ t ≤ T ∧ dist s t ≤ h ∧ a = |B t ω - B s ω|} /
          Real.sqrt (2 * h * Real.log (1 / h)))
      (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (nhds (1 : ℝ)) := by
  sorry

/-- One common full-measure set excludes derivatives at every positive time
and the right derivative at zero. The extension by toNNReal only fixes the domain. -/
theorem brownian_simultaneous_nowhere_differentiable
    (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) :
    ∀ᵐ ω ∂P,
      (∀ t : ℝ, 0 < t →
        ¬ DifferentiableAt ℝ (fun s : ℝ => B s.toNNReal ω) t) ∧
      ¬ DifferentiableWithinAt ℝ (fun s : ℝ => B s.toNNReal ω)
        (Set.Ici 0) 0 := by
  sorry

end TauCetiRoadmap.StochasticCalculus
