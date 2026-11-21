/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Stochastic calculus: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with real definitions
only for the objects their statements use.

The headline families are Wiener construction; stochastic integration, brackets and BDG;
Itô and Brownian Stratonovich calculus; strong Markov, the Brownian filtration and
martingale representation; reflection, exits, LIL, path modulus, nowhere differentiability
and local time; Brownian potential theory through point polarity in dimension at least two;
DDS; Novikov and Girsanov; Cameron–Martin equivalence and singularity; strong existence and
pathwise uniqueness, and weak existence and uniqueness in law for a bounded drift with unit
diffusion; and the scalar Feynman–Kac representation.

Not statable at the pins: the general semimartingale Itô and Stratonovich formulas (no
constructed semimartingale integral or covariation operator); Hilbert–Schmidt vector
integration and the finite-dimensional vector SDE, weak-solution, maximal-solution and flow
statements (no vector integral, maximal-solution or flow carrier); harmonic Hardy boundary representation
(no Hardy-space or boundary-trace carrier); the general diffusion generator, martingale
problem and vector Feynman–Kac comparison (no constructed diffusion law or generator
domain); the independent-extension branch of DDS (no enlarged stochastic basis). These
remain README targets; no predicate stands in for those carriers. The scalar Brownian
integral, bracket, density, Cameron–Martin shift, coordinate vector Brownian and
strong-solution predicates below are concrete definitions on native functions, measures and
filtrations, and the scalar Feynman–Kac representation and the Brownian Stratonovich sums are
stated on them.
-/
noncomputable section
open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal ProbabilityTheory
namespace TauCetiRoadmap.StochasticCalculus

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

/-- Adjoin every ambient-measurable `P`-null set to each `F t`, on the original measurable
space: null augmentation of a filtration, not completion of the ambient probability space. -/
def ambientNullAugmentation (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) :
    Filtration ℝ≥0 mΩ where
  seq t := F t ⊔ MeasurableSpace.generateFrom {A : Set Ω | MeasurableSet A ∧ P A = 0}
  mono' _ _ h := sup_le_sup (F.mono h) le_rfl
  le' t := sup_le (F.le t) (MeasurableSpace.generateFrom_le fun _ h => h.1)

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

/-- For an almost surely continuous local martingale on a raw filtration, the quadratic
variation is unique up to indistinguishability: the difference of two candidates is a
continuous local martingale of finite variation starting at zero (Revuz–Yor, Chapter IV,
Theorem 1.8). -/
theorem isQuadraticVariation_unique (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (M A A' : ℝ≥0 → Ω → ℝ)
    (hM : IsLocalMartingale F P M) (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))
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

/-- Brownian Stratonovich calculus for a `C¹` integrand `h` with primitive `H`: along
deterministic partitions `0 = π n 0 ≤ … ≤ π n (k n) = t` whose mesh tends to zero, the
symmetric-endpoint sums `Σ ½(h(B_{tᵢ}) + h(B_{tᵢ₊₁}))(B_{tᵢ₊₁} − B_{tᵢ})` converge in
probability to `H(B_t) − H(B_0)` (Protter, Chapter V, §5). The Itô form of the limit is
`∫ h(B) dB + ½ ∫ h'(B) ds`. -/
theorem brownian_stratonovich_symmetric_sums (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (h H : ℝ → ℝ) (hh : ContDiff ℝ 1 h)
    (hH : ∀ y, HasDerivAt H (h y) y) (t : ℝ≥0)
    (k : ℕ → ℕ) (π : ℕ → ℕ → ℝ≥0) (hmono : ∀ n, Monotone (π n))
    (h0 : ∀ n, π n 0 = 0) (ht : ∀ n, π n (k n) = t)
    (hmesh : Filter.Tendsto
      (fun n => ⨆ i : Fin (k n), (π n ((i : ℕ) + 1) - π n (i : ℕ) : ℝ))
      Filter.atTop (nhds 0)) :
    TendstoInMeasure P (fun n ω => ∑ i ∈ Finset.range (k n),
        (h (B (π n i) ω) + h (B (π n (i + 1)) ω)) / 2 * (B (π n (i + 1)) ω - B (π n i) ω))
      Filter.atTop (fun ω => H (B t ω) - H (B 0 ω)) := by
  sorry

/-- Brownian temporal-midpoint sums `Σ h(B_{(tᵢ + tᵢ₊₁)/2})(B_{tᵢ₊₁} − B_{tᵢ})` for a `C¹`
integrand converge in probability to the same limit `H(B_t) − H(B_0)`. This uses the
Brownian increment law: for a deterministically time-changed Brownian motion the midpoint
sums have a different limit (README §5.3's biased-binary clock). -/
theorem brownian_stratonovich_midpoint_sums (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) (h H : ℝ → ℝ) (hh : ContDiff ℝ 1 h)
    (hH : ∀ y, HasDerivAt H (h y) y) (t : ℝ≥0)
    (k : ℕ → ℕ) (π : ℕ → ℕ → ℝ≥0) (hmono : ∀ n, Monotone (π n))
    (h0 : ∀ n, π n 0 = 0) (ht : ∀ n, π n (k n) = t)
    (hmesh : Filter.Tendsto
      (fun n => ⨆ i : Fin (k n), (π n ((i : ℕ) + 1) - π n (i : ℕ) : ℝ))
      Filter.atTop (nhds 0)) :
    TendstoInMeasure P (fun n ω => ∑ i ∈ Finset.range (k n),
        h (B ((π n i + π n (i + 1)) / 2) ω) * (B (π n (i + 1)) ω - B (π n i) ω))
      Filter.atTop (fun ω => H (B t ω) - H (B 0 ω)) := by
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

/-- The ambient-null augmentation of the raw natural filtration of a Brownian motion is
right-continuous: every event of the right-continuous hull differs from an event of the raw
filtration at the same time by an ambient-measurable null set (Mörters–Peres, Theorem 2.5
for the independence of the post-`s` increments from the hull at `s`, Theorem 2.7 for the
germ zero–one law at `s = 0`; Karatzas–Shreve, §2.7.A). The ambient space is not
completed. -/
theorem brownian_natural_augmentation_isRightContinuous (P : Measure Ω)
    [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P)
    (hm : ∀ t, StronglyMeasurable (B t)) :
    (ambientNullAugmentation (Filtration.natural B hm) P).IsRightContinuous := by
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

/-- On each fixed positive finite horizon, standard scalar Brownian motion has
Lévy's exact uniform modulus, with mesh approaching zero through positive values
(Mörters–Peres, Theorem 1.14, p. 16, stated there on `[0,1]` in limsup form; Remark 1.18,
p. 17, and Exercise 1.7, p. 31, for the limit form; Brownian scaling moves `[0,1]` to
`[0,T]`). -/
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
and the right derivative at zero (Mörters–Peres, Theorem 1.30; Lalley, Proposition 9).
The extension by toNNReal only fixes the domain. -/
theorem brownian_simultaneous_nowhere_differentiable
    (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B P) :
    ∀ᵐ ω ∂P,
      (∀ t : ℝ, 0 < t →
        ¬ DifferentiableAt ℝ (fun s : ℝ => B s.toNNReal ω) t) ∧
      ¬ DifferentiableWithinAt ℝ (fun s : ℝ => B s.toNNReal ω)
        (Set.Ici 0) 0 := by
  sorry

/-- A `d`-dimensional standard Brownian motion given by its coordinates in the standard basis:
each coordinate is a native scalar Brownian motion and the coordinate paths are independent
as path-valued random variables. -/
def IsBrownianVector {d : ℕ} (P : Measure Ω) (B : Fin d → ℝ≥0 → Ω → ℝ) : Prop :=
  (∀ i, IsBrownianReal (B i) P) ∧ iIndepFun (fun i ω => (fun t => B i t ω : ℝ≥0 → ℝ)) P

/-- Points are polar for Brownian motion in dimension at least two: from every deterministic
start `x`, a `d`-dimensional Brownian motion almost surely never visits a fixed point `a` at a
positive time, including `a = x` (Mörters–Peres, Corollary 2.26, p. 47, stated there for times
in `(0,1]`; Brownian scaling covers every bounded horizon). -/
theorem brownian_point_polar {d : ℕ} (hd : 2 ≤ d) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin d → ℝ≥0 → Ω → ℝ) (hB : IsBrownianVector P B) (x a : Fin d → ℝ) :
    P {ω | ∃ t : ℝ≥0, 0 < t ∧ ∀ i, x i + B i t ω = a i} = 0 := by
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

/-- Weak existence for a bounded Borel drift with unit diffusion: for every jointly Borel `b`
bounded by a constant and every starting point `x`, some filtered probability space carries a
filtered Brownian motion `B` and a solution `X` of `dX = b(t, X) dt + dB`, `X₀ = x`
(Karatzas–Shreve, §5.3, by Girsanov's theorem on the canonical space). `IsStrongSolution` is
the solution predicate on a given basis; a weak solution is a basis together with a solution
on it, and `X` need not be adapted to the filtration generated by `B`. -/
theorem exists_weakSolution_boundedDrift (b : ℝ≥0 → ℝ → ℝ)
    (hb : Measurable (Function.uncurry b)) (hbb : ∃ C : ℝ, ∀ t y, |b t y| ≤ C) (x : ℝ) :
    ∃ (Ω' : Type) (m' : MeasurableSpace Ω') (F' : Filtration ℝ≥0 m') (P' : Measure Ω')
      (_ : IsProbabilityMeasure P') (B' X' : ℝ≥0 → Ω' → ℝ),
      IsFilteredBrownian F' P' B' ∧
        IsStrongSolution F' P' B' b (fun _ _ => 1) (fun _ => x) X' := by
  sorry

/-- Uniqueness in law for a bounded Borel drift with unit diffusion: two weak solutions of
`dX = b(t, X) dt + dB` from the same starting point, on possibly different filtered
probability spaces, have the same path law on `ℝ≥0 → ℝ` (Karatzas–Shreve, §5.3). -/
theorem weakSolution_boundedDrift_law_unique (b : ℝ≥0 → ℝ → ℝ)
    (hbb : ∃ C : ℝ, ∀ t y, |b t y| ≤ C) (x : ℝ)
    {Ω₁ Ω₂ : Type*} {m₁ : MeasurableSpace Ω₁} {m₂ : MeasurableSpace Ω₂}
    (F₁ : Filtration ℝ≥0 m₁) (F₂ : Filtration ℝ≥0 m₂)
    (P₁ : Measure Ω₁) [IsProbabilityMeasure P₁] (P₂ : Measure Ω₂) [IsProbabilityMeasure P₂]
    (B₁ X₁ : ℝ≥0 → Ω₁ → ℝ) (B₂ X₂ : ℝ≥0 → Ω₂ → ℝ)
    (hB₁ : IsFilteredBrownian F₁ P₁ B₁) (hB₂ : IsFilteredBrownian F₂ P₂ B₂)
    (hX₁ : IsStrongSolution F₁ P₁ B₁ b (fun _ _ => 1) (fun _ => x) X₁)
    (hX₂ : IsStrongSolution F₂ P₂ B₂ b (fun _ _ => 1) (fun _ => x) X₂) :
    P₁.map (fun ω t => X₁ t ω) = P₂.map (fun ω t => X₂ t ω) := by
  sorry

/-! ## Layer 10: Diffusions, generators and probabilistic PDEs -/

/-- Scalar Feynman–Kac representation (Karatzas–Shreve, Theorem 5.7.6, in its scalar
bounded form): for a strong solution `X` of `dX = b dt + σ dB` started at the point `x`,
with coefficients Lipschitz and of linear growth on each finite horizon, a bounded Borel
potential `q` and a bounded `C²` function `u` on `ℝ × ℝ` with bounded spatial derivative
solving the backward equation `∂ₜu + b ∂ₓu + ½σ² ∂ₓₓu + q u = 0` on `[0, T] × ℝ`,
`u(0, x) = E[exp(∫₀ᵀ q(s, X_s) ds) · u(T, X_T)]`. The time derivative is that of the real
extension of `u`, so the equation at `t = 0` is two-sided; the sign convention is
`+ q u` in the equation and `exp(+∫ q)` in the weight. -/
theorem feynmanKac_scalar (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ)
    (hB : IsFilteredBrownian F P B) (b σ : ℝ≥0 → ℝ → ℝ)
    (hLip : ∀ T : ℝ≥0, ∃ L : ℝ≥0, ∀ t ≤ T, ∀ x y,
      |b t x - b t y| + |σ t x - σ t y| ≤ (L : ℝ) * |x-y|)
    (hBound : ∀ T : ℝ≥0, ∃ K : ℝ≥0, ∀ t ≤ T, |b t 0| + |σ t 0| ≤ K)
    (x : ℝ) (X : ℝ≥0 → Ω → ℝ) (hX : IsStrongSolution F P B b σ (fun _ => x) X)
    (T : ℝ≥0) (q : ℝ≥0 → ℝ → ℝ) (hq : Measurable (Function.uncurry q))
    (hqb : ∃ C : ℝ, ∀ t y, |q t y| ≤ C)
    (u : ℝ → ℝ → ℝ) (hu : ContDiff ℝ 2 (Function.uncurry u))
    (hub : ∃ C : ℝ, ∀ t y, |u t y| + |deriv (fun z => u t z) y| ≤ C)
    (hpde : ∀ t : ℝ≥0, t ≤ T → ∀ y : ℝ,
      deriv (fun s : ℝ => u s y) t + b t y * deriv (fun z => u t z) y +
        (1 / 2 : ℝ) * (σ t y) ^ 2 * iteratedDeriv 2 (fun z => u t z) y + q t y * u t y = 0) :
    u 0 x = ∫ ω, Real.exp (∫ s, q s (X s ω) ∂timeMeasure T) * u T (X T ω) ∂P := by
  sorry

end Headlines

end TauCetiRoadmap.StochasticCalculus
