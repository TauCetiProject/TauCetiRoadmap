module

public import Mathlib

/-!
# Real functions, derivatives and variation: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The definitions carry no `sorry`. The implementation namespace of the README is `TauCeti`; the
prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal

namespace TauCetiRoadmap.RealFunctionsDerivativesAndVariation

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: Dini derivatives -/

section Dini

/-- The upper right Dini derivative `D⁺f(x) = limsup_{y → x⁺} (f y - f x) / (y - x)`, valued in
`EReal`, so that the values `⊤` and `⊥` are genuine rather than junk. -/
def upperRightDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  limsup (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[>] x)

/-- The lower right Dini derivative `D₊f(x) = liminf_{y → x⁺} (f y - f x) / (y - x)`. -/
def lowerRightDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  liminf (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[>] x)

/-- The upper left Dini derivative `D⁻f(x) = limsup_{y → x⁻} (f y - f x) / (y - x)`. -/
def upperLeftDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  limsup (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[<] x)

/-- The lower left Dini derivative `D₋f(x) = liminf_{y → x⁻} (f y - f x) / (y - x)`. -/
def lowerLeftDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  liminf (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[<] x)

/-- Sanity check of the definition: at `0` the right Dini derivatives of `|x|` are `1` and the
left ones are `-1`. -/
theorem dini_abs_zero :
    upperRightDini (fun x ↦ |x|) 0 = 1 ∧ lowerRightDini (fun x ↦ |x|) 0 = 1 ∧
      upperLeftDini (fun x ↦ |x|) 0 = -1 ∧ lowerLeftDini (fun x ↦ |x|) 0 = -1 := by
  sorry

/-- Sanity check of the definition: at `0` the right Dini derivatives of `x sin (1/x)` are `1`
and `-1`. -/
theorem dini_mul_sin_inv_zero :
    upperRightDini (fun x ↦ x * Real.sin x⁻¹) 0 = 1 ∧
      lowerRightDini (fun x ↦ x * Real.sin x⁻¹) 0 = -1 := by
  sorry

/-- Sanity check of the definition: both right Dini derivatives of `√|x|` at `0` are `⊤`; a
real-valued `limsup` would return the junk value `0` here. -/
theorem dini_sqrt_abs_zero :
    upperRightDini (fun x ↦ √|x|) 0 = ⊤ ∧ lowerRightDini (fun x ↦ √|x|) 0 = ⊤ := by
  sorry

/-- A function is differentiable at `x` with derivative `d` iff its four Dini derivatives at `x`
all equal `d`. -/
theorem hasDerivAt_iff_dini {f : ℝ → ℝ} {x d : ℝ} :
    HasDerivAt f d x ↔
      upperRightDini f x = d ∧ lowerRightDini f x = d ∧ upperLeftDini f x = d ∧
        lowerLeftDini f x = d := by
  sorry

/-- Dini's theorem on the bounds of the right Dini derivatives of a continuous function: on
`[a, b)` their supremum and infimum equal those of the difference quotients over `[a, b]`. -/
theorem dini_bounds {f : ℝ → ℝ} {a b : ℝ} (hab : a < b) (hf : ContinuousOn f (Icc a b)) :
    (⨆ x ∈ Ico a b, upperRightDini f x) =
        ⨆ p ∈ {p : ℝ × ℝ | p.1 ∈ Icc a b ∧ p.2 ∈ Icc a b ∧ p.1 < p.2},
          ((slope f p.1 p.2 : ℝ) : EReal) ∧
      (⨆ x ∈ Ico a b, lowerRightDini f x) =
        ⨆ p ∈ {p : ℝ × ℝ | p.1 ∈ Icc a b ∧ p.2 ∈ Icc a b ∧ p.1 < p.2},
          ((slope f p.1 p.2 : ℝ) : EReal) ∧
      (⨅ x ∈ Ico a b, upperRightDini f x) =
        ⨅ p ∈ {p : ℝ × ℝ | p.1 ∈ Icc a b ∧ p.2 ∈ Icc a b ∧ p.1 < p.2},
          ((slope f p.1 p.2 : ℝ) : EReal) ∧
      (⨅ x ∈ Ico a b, lowerRightDini f x) =
        ⨅ p ∈ {p : ℝ × ℝ | p.1 ∈ Icc a b ∧ p.2 ∈ Icc a b ∧ p.1 < p.2},
          ((slope f p.1 p.2 : ℝ) : EReal) := by
  sorry

/-- The Dini derivatives of a Lebesgue measurable function are Lebesgue measurable. -/
theorem aemeasurable_dini {f : ℝ → ℝ} (hf : AEMeasurable f) :
    AEMeasurable (upperRightDini f) ∧ AEMeasurable (lowerRightDini f) ∧
      AEMeasurable (upperLeftDini f) ∧ AEMeasurable (lowerLeftDini f) := by
  sorry

/-- The Dini derivatives of a continuous function are Borel measurable. -/
theorem measurable_dini_of_continuous {f : ℝ → ℝ} (hf : Continuous f) :
    Measurable (upperRightDini f) ∧ Measurable (lowerRightDini f) ∧
      Measurable (upperLeftDini f) ∧ Measurable (lowerLeftDini f) := by
  sorry

/-- G. C. Young's theorem: for an arbitrary function, an upper Dini derivative on one side lies
below the lower Dini derivative on the other side at only countably many points. -/
theorem countable_setOf_upperDini_lt_lowerDini (f : ℝ → ℝ) :
    {x | upperRightDini f x < lowerLeftDini f x}.Countable ∧
      {x | upperLeftDini f x < lowerRightDini f x}.Countable := by
  sorry

end Dini

/-! ## Layer 2: Monotonicity from Dini derivatives -/

section Monotonicity

/-- The rising sun lemma on a closed interval: the shadow set
`E = {x ∈ (a, b) | ∃ y ∈ (x, b], G x < G y}` of a continuous `G` is open, and on each of its
components `(c, d)` one has `G c ≤ G d`, with equality when `c ≠ a`. -/
theorem risingSun {G : ℝ → ℝ} {a b : ℝ} (hG : ContinuousOn G (Icc a b)) (E : Set ℝ)
    (hE : E = {x ∈ Ioo a b | ∃ y ∈ Ioc x b, G x < G y}) :
    IsOpen E ∧ ∀ c d, c < d → Ioo c d ⊆ E → c ∉ E → d ∉ E →
      G c ≤ G d ∧ (a < c → G c = G d) := by
  sorry

/-- A continuous function whose upper right Dini derivative is nonnegative off a countable set is
monotone. -/
theorem monotoneOn_of_upperRightDini_nonneg {f : ℝ → ℝ} {D s : Set ℝ} (hD : D.OrdConnected)
    (hs : s.Countable) (hf : ContinuousOn f D)
    (hf' : ∀ x ∈ interior D, x ∉ s → 0 ≤ upperRightDini f x) : MonotoneOn f D := by
  sorry

/-- A continuous function is monotone if its upper right Dini derivative is nonnegative almost
everywhere and is `> -∞` off a countable set. -/
theorem monotoneOn_of_ae_upperRightDini_nonneg {f : ℝ → ℝ} {D s : Set ℝ} (hD : D.OrdConnected)
    (hs : s.Countable) (hf : ContinuousOn f D)
    (hbot : ∀ x ∈ interior D, x ∉ s → ⊥ < upperRightDini f x)
    (hae : ∀ᵐ x, x ∈ interior D → 0 ≤ upperRightDini f x) : MonotoneOn f D := by
  sorry

/-- The Goldowski–Tonelli theorem: a continuous function with a derivative, finite or infinite,
off a countable set, nonnegative almost everywhere, is monotone. -/
theorem monotoneOn_of_ae_deriv_nonneg {f : ℝ → ℝ} {D s : Set ℝ} (hD : D.OrdConnected)
    (hs : s.Countable) (hf : ContinuousOn f D)
    (hd : ∀ x ∈ interior D, x ∉ s → ∃ d : EReal, upperRightDini f x = d ∧
      lowerRightDini f x = d ∧ upperLeftDini f x = d ∧ lowerLeftDini f x = d)
    (hae : ∀ᵐ x, x ∈ interior D → 0 ≤ upperRightDini f x) : MonotoneOn f D := by
  sorry

end Monotonicity

/-! ## Layer 3: Images of null sets and the Denjoy–Young–Saks theorem -/

section DenjoyYoungSaks

/-- If `f` has a derivative bounded by `K` at every point of an arbitrary set `A`, then
`λ(f(A)) ≤ K λ(A)` for Lebesgue outer measure. -/
theorem volume_image_le_of_abs_deriv_le {f f' : ℝ → ℝ} {A : Set ℝ} {K : ℝ≥0}
    (hf : ∀ x ∈ A, HasDerivAt f (f' x) x) (hK : ∀ x ∈ A, |f' x| ≤ K) :
    volume (f '' A) ≤ K * volume A := by
  sorry

/-- If `f` has a derivative at every point of an arbitrary set `A`, then `f(A)` is null iff the
derivative vanishes almost everywhere on `A`. -/
theorem volume_image_eq_zero_iff {f f' : ℝ → ℝ} {A : Set ℝ}
    (hf : ∀ x ∈ A, HasDerivAt f (f' x) x) :
    volume (f '' A) = 0 ↔ volume {x ∈ A | f' x ≠ 0} = 0 := by
  sorry

/-- The Denjoy–Young–Saks theorem: for an arbitrary function, almost every point has one of four
Dini types. -/
theorem ae_dini_alternatives (f : ℝ → ℝ) : ∀ᵐ x,
    (∃ d : ℝ, upperRightDini f x = d ∧ lowerRightDini f x = d ∧ upperLeftDini f x = d ∧
        lowerLeftDini f x = d) ∨
      (upperRightDini f x = ⊤ ∧ lowerLeftDini f x = ⊥ ∧
        ∃ d : ℝ, lowerRightDini f x = d ∧ upperLeftDini f x = d) ∨
      (upperLeftDini f x = ⊤ ∧ lowerRightDini f x = ⊥ ∧
        ∃ d : ℝ, lowerLeftDini f x = d ∧ upperRightDini f x = d) ∨
      (upperRightDini f x = ⊤ ∧ upperLeftDini f x = ⊤ ∧ lowerRightDini f x = ⊥ ∧
        lowerLeftDini f x = ⊥) := by
  sorry

/-- For an arbitrary function, almost everywhere no lower Dini derivative is `+∞` and no upper
Dini derivative is `-∞`. -/
theorem ae_dini_ne_infty (f : ℝ → ℝ) : ∀ᵐ x,
    lowerRightDini f x ≠ ⊤ ∧ lowerLeftDini f x ≠ ⊤ ∧ upperRightDini f x ≠ ⊥ ∧
      upperLeftDini f x ≠ ⊥ := by
  sorry

end DenjoyYoungSaks

/-! ## Layer 4: Variation, absolute continuity and the Lusin property -/

section Variation

/-- Helly's selection theorem: a sequence with a common bound at one point and a common bound on
the variation over an interval has a subsequence converging at every point of the interval, and
the limit obeys the same variation bound. -/
theorem exists_subseq_tendsto_of_eVariationOn_le {I : Set ℝ} (hI : I.OrdConnected) {x₀ : ℝ}
    (hx₀ : x₀ ∈ I) {f : ℕ → ℝ → ℝ} {M : ℝ} {V : ℝ≥0} (hM : ∀ n, |f n x₀| ≤ M)
    (hV : ∀ n, eVariationOn (f n) I ≤ V) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ g : ℝ → ℝ,
      (∀ x ∈ I, Tendsto (fun n ↦ f (φ n) x) atTop (𝓝 (g x))) ∧ eVariationOn g I ≤ V := by
  sorry

/-- For every function, the integral of the modulus of its derivative over `[a, b]` is at most
its variation there. -/
theorem lintegral_enorm_deriv_le_eVariationOn (f : ℝ → ℝ) (a b : ℝ) :
    ∫⁻ x in Icc a b, ‖deriv f x‖ₑ ≤ eVariationOn f (Icc a b) := by
  sorry

/-- Tonelli's characterization: a function of bounded variation on `[a, b]` is absolutely
continuous there iff its variation equals the integral of the modulus of its derivative. -/
theorem absolutelyContinuousOnInterval_iff_eVariationOn_eq_lintegral {f : ℝ → ℝ} {a b : ℝ}
    (hab : a ≤ b) (hf : BoundedVariationOn f (Icc a b)) :
    AbsolutelyContinuousOnInterval f a b ↔
      eVariationOn f (Icc a b) = ∫⁻ x in Icc a b, ‖deriv f x‖ₑ := by
  sorry

/-- Fubini's theorem on termwise differentiation: a pointwise summable series of monotone
functions may be differentiated termwise almost everywhere. -/
theorem hasDerivAt_tsum_of_monotone {f : ℕ → ℝ → ℝ} (hf : ∀ n, Monotone (f n))
    (hs : ∀ x, Summable fun n ↦ f n x) :
    ∀ᵐ x, Summable (fun n ↦ deriv (f n) x) ∧
      HasDerivAt (fun y ↦ ∑' n, f n y) (∑' n, deriv (f n) x) x := by
  sorry

/-- Lusin's property (N) on a set: `f` maps Lebesgue-null subsets of `s` to Lebesgue-null sets. -/
def HasLusinN (f : ℝ → ℝ) (s : Set ℝ) : Prop :=
  ∀ t ⊆ s, volume t = 0 → volume (f '' t) = 0

/-- Sanity check of the definition: a function Lipschitz on `s` has property (N) on `s`. -/
theorem LipschitzOnWith.hasLusinN {f : ℝ → ℝ} {s : Set ℝ} {K : ℝ≥0}
    (hf : LipschitzOnWith K f s) : HasLusinN f s := by
  sorry

/-- The Banach–Zarecki theorem: absolute continuity on `[a, b]` is continuity, bounded variation
and property (N) there. -/
theorem absolutelyContinuousOnInterval_iff_hasLusinN {f : ℝ → ℝ} {a b : ℝ} :
    AbsolutelyContinuousOnInterval f a b ↔
      ContinuousOn f (uIcc a b) ∧ BoundedVariationOn f (uIcc a b) ∧
        HasLusinN f (uIcc a b) := by
  sorry

/-- A function continuous on `[a, b]` maps Lebesgue measurable subsets of `[a, b]` to Lebesgue
measurable sets iff it has property (N) there. -/
theorem nullMeasurableSet_image_iff_hasLusinN {f : ℝ → ℝ} {a b : ℝ}
    (hf : ContinuousOn f (Icc a b)) :
    (∀ t ⊆ Icc a b, NullMeasurableSet t → NullMeasurableSet (f '' t)) ↔
      HasLusinN f (Icc a b) := by
  sorry

/-- There is a continuous strictly increasing function whose derivative vanishes almost
everywhere. -/
theorem exists_strictMono_ae_hasDerivAt_zero :
    ∃ f : ℝ → ℝ, StrictMono f ∧ Continuous f ∧ ∀ᵐ x, HasDerivAt f 0 x := by
  sorry

/-- Weil's theorem: there is a function on `[0, 1]` with a bounded derivative at every point that
is monotone on no subinterval. -/
theorem exists_hasDerivWithinAt_nowhere_monotone :
    ∃ u u' : ℝ → ℝ, (∀ x ∈ Icc (0 : ℝ) 1, HasDerivWithinAt u (u' x) (Icc 0 1) x) ∧
      (∃ C, ∀ x ∈ Icc (0 : ℝ) 1, |u' x| ≤ C) ∧
      ∀ a b, 0 ≤ a → a < b → b ≤ 1 → ¬ MonotoneOn u (Icc a b) ∧ ¬ AntitoneOn u (Icc a b) := by
  sorry

end Variation

/-! ## Layer 5: Functions of the first Baire class -/

section BaireOne

/-- A function of the first Baire class: a pointwise limit of a sequence of continuous
functions. -/
def IsBaireOne {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∃ g : ℕ → X → Y, (∀ n, Continuous (g n)) ∧ ∀ x, Tendsto (fun n ↦ g n x) atTop (𝓝 (f x))

/-- Sanity check of the definition: the indicator of a point is of the first Baire class. -/
theorem isBaireOne_indicator_singleton :
    IsBaireOne (Set.indicator {(0 : ℝ)} fun _ ↦ (1 : ℝ)) := by
  sorry

/-- Sanity check of the definition: the indicator of the rationals is not of the first Baire
class, although it vanishes almost everywhere and is a double limit of continuous functions. -/
theorem not_isBaireOne_indicator_rat :
    ¬ IsBaireOne (Set.indicator (Set.range ((↑) : ℚ → ℝ)) fun _ ↦ (1 : ℝ)) := by
  sorry

/-- The derivative of a differentiable function is of the first Baire class. -/
theorem _root_.Differentiable.isBaireOne_deriv {f : ℝ → ℝ} (hf : Differentiable ℝ f) :
    IsBaireOne (deriv f) := by
  sorry

/-- The Lebesgue–Hausdorff theorem for real functions on a separable metrizable space: the first
Baire class consists of the functions under which closed sets have `G_δ` preimages. -/
theorem isBaireOne_iff_isGδ_preimage {X : Type*} [TopologicalSpace X]
    [TopologicalSpace.MetrizableSpace X] [TopologicalSpace.SeparableSpace X] {f : X → ℝ} :
    IsBaireOne f ↔ ∀ s : Set ℝ, IsClosed s → IsGδ (f ⁻¹' s) := by
  sorry

/-- Baire's theorem: the continuity points of a first-class function on a metrizable space form a
residual set. -/
theorem IsBaireOne.setOf_continuousAt_mem_residual {X : Type*} [TopologicalSpace X]
    [TopologicalSpace.MetrizableSpace X] {f : X → ℝ} (hf : IsBaireOne f) :
    {x | ContinuousAt f x} ∈ residual X := by
  sorry

/-- Baire's characterization on a Polish space: a real function is of the first Baire class iff
its restriction to every nonempty closed set has a point of continuity. -/
theorem isBaireOne_iff_exists_continuousWithinAt {X : Type*} [TopologicalSpace X]
    [PolishSpace X] {f : X → ℝ} :
    IsBaireOne f ↔ ∀ F : Set X, IsClosed F → F.Nonempty → ∃ x ∈ F, ContinuousWithinAt f F x := by
  sorry

/-- A subset of `[a, b]` is the set of continuity points of a derivative on `[a, b]` iff it is a
dense `G_δ` subset of `[a, b]`. -/
theorem exists_deriv_continuity_set_iff {a b : ℝ} (hab : a < b) {A : Set ℝ}
    (hA : A ⊆ Icc a b) :
    (∃ F f' : ℝ → ℝ, (∀ x ∈ Icc a b, HasDerivWithinAt F (f' x) (Icc a b) x) ∧
        {x ∈ Icc a b | ContinuousWithinAt f' (Icc a b) x} = A) ↔
      Icc a b ⊆ closure A ∧ IsGδ A := by
  sorry

end BaireOne

/-! ## Layer 6: Typical continuous functions -/

section Typical

/-- The Banach–Mazurkiewicz theorem: the continuous functions on `[a, b]` having, at some point
of `[a, b)`, an upper right Dini derivative `< +∞` and a lower right Dini derivative `> -∞` form a
meagre set. -/
theorem isMeagre_setOf_exists_rightDini_finite {a b : ℝ} (hab : a < b) :
    IsMeagre {g : C(Icc a b, ℝ) | ∃ x ∈ Ico a b,
      upperRightDini (IccExtend hab.le ⇑g) x ≠ ⊤ ∧
        lowerRightDini (IccExtend hab.le ⇑g) x ≠ ⊥} := by
  sorry

/-- The typical continuous function on `[a, b]` is differentiable at no point of `(a, b)`. -/
theorem residual_forall_not_differentiableAt {a b : ℝ} (hab : a < b) :
    ∀ᶠ g : C(Icc a b, ℝ) in residual C(Icc a b, ℝ),
      ∀ x ∈ Ioo a b, ¬ DifferentiableAt ℝ (IccExtend hab.le ⇑g) x := by
  sorry

end Typical

/-! ## Layer 7: Approximate continuity and the density topology -/

section Density

/-- `s` has Lebesgue density `0` at `x`, for Lebesgue outer measure and centred closed balls. -/
def HasDensityZeroAt (s : Set ℝ) (x : ℝ) : Prop :=
  Tendsto (fun r ↦ volume (s ∩ Metric.closedBall x r) / volume (Metric.closedBall x r))
    (𝓝[>] 0) (𝓝 0)

/-- `x` is a density point of `s`: the complement of `s` has density `0` at `x`. -/
def IsDensityPoint (s : Set ℝ) (x : ℝ) : Prop :=
  HasDensityZeroAt sᶜ x

/-- `f` is approximately continuous at `x`: for every `ε > 0` the set where `f` is at least `ε`
away from `f x` has density `0` at `x`. -/
def ApproximatelyContinuousAt (f : ℝ → ℝ) (x : ℝ) : Prop :=
  ∀ ε > 0, HasDensityZeroAt {y | ε ≤ |f y - f x|} x

/-- The sparse set `⋃ₙ [2^{-(n+1)} - 4^{-(n+1)}, 2^{-(n+1)}]`, which accumulates at `0`. -/
def sparseSet : Set ℝ :=
  ⋃ n : ℕ, Icc ((1 / 2 : ℝ) ^ (n + 1) - (1 / 4 : ℝ) ^ (n + 1)) ((1 / 2 : ℝ) ^ (n + 1))

/-- Sanity check of the definition: `0` lies in the closure of `sparseSet`, which nevertheless
has density `0` there. -/
theorem hasDensityZeroAt_sparseSet :
    (0 : ℝ) ∈ closure sparseSet ∧ HasDensityZeroAt sparseSet 0 := by
  sorry

/-- Sanity check of the definition: `0` is not a density point of `(0, ∞)`, whose density there
is `1/2`; a one-sided convention for the balls would get this wrong. -/
theorem not_isDensityPoint_Ioi_zero : ¬ IsDensityPoint (Ioi 0) 0 := by
  sorry

/-- Sanity check of the definition: the indicator of `sparseSet` is approximately continuous at
`0` but not continuous there. -/
theorem approximatelyContinuousAt_indicator_sparseSet :
    ApproximatelyContinuousAt (sparseSet.indicator fun _ ↦ 1) 0 ∧
      ¬ ContinuousAt (sparseSet.indicator fun _ ↦ (1 : ℝ)) 0 := by
  sorry

/-- Sanity check of the definition: the indicator of the rationals is approximately continuous
exactly at the irrational points. -/
theorem approximatelyContinuousAt_indicator_rat_iff {x : ℝ} :
    ApproximatelyContinuousAt (Set.indicator (Set.range ((↑) : ℚ → ℝ)) fun _ ↦ 1) x ↔
      x ∉ Set.range ((↑) : ℚ → ℝ) := by
  sorry

/-- Lebesgue's density theorem: almost every point of a Lebesgue measurable set is a density point
of it. -/
theorem ae_isDensityPoint {s : Set ℝ} (hs : NullMeasurableSet s) :
    ∀ᵐ x, x ∈ s → IsDensityPoint s x := by
  sorry

/-- Denjoy's theorem: a function is Lebesgue measurable iff it is approximately continuous almost
everywhere. -/
theorem aemeasurable_iff_ae_approximatelyContinuousAt {f : ℝ → ℝ} :
    AEMeasurable f ↔ ∀ᵐ x, ApproximatelyContinuousAt f x := by
  sorry

/-- A bounded measurable function is the derivative of its indefinite integral at every point of
approximate continuity. -/
theorem hasDerivAt_integral_of_approximatelyContinuousAt {f : ℝ → ℝ} {C x : ℝ}
    (hf : AEStronglyMeasurable f) (hC : ∀ y, |f y| ≤ C) (hx : ApproximatelyContinuousAt f x) :
    HasDerivAt (fun u ↦ ∫ t in (0 : ℝ)..u, f t) (f x) x := by
  sorry

/-- An everywhere approximately continuous function is of the first Baire class. -/
theorem isBaireOne_of_approximatelyContinuousAt {f : ℝ → ℝ}
    (hf : ∀ x, ApproximatelyContinuousAt f x) : IsBaireOne f := by
  sorry

/-- The Lusin–Menchoff theorem: a closed subset `X` of a measurable set `E` at whose points `E` has
density `1` lies in a perfect subset of `E` that also has density `1` at every point of `X`. -/
theorem exists_perfect_isDensityPoint {E X : Set ℝ} (hE : NullMeasurableSet E)
    (hX : IsClosed X) (hXE : X ⊆ E) (hd : ∀ x ∈ X, IsDensityPoint E x) :
    ∃ P, Perfect P ∧ X ⊆ P ∧ P ⊆ E ∧ ∀ x ∈ X, IsDensityPoint P x := by
  sorry

/-- Zahorski's lemma: an `F_σ` set at each of whose points it has density `1` is the positivity
set of an approximately continuous upper semicontinuous function with values in `[0, 1]`. -/
theorem exists_approximatelyContinuousAt_pos_on {E : Set ℝ} (F : ℕ → Set ℝ)
    (hF : ∀ n, IsClosed (F n)) (hE : E = ⋃ n, F n) (hd : ∀ x ∈ E, IsDensityPoint E x) :
    ∃ f : ℝ → ℝ, (∀ x, ApproximatelyContinuousAt f x) ∧ UpperSemicontinuous f ∧
      (∀ x ∈ E, 0 < f x ∧ f x ≤ 1) ∧ ∀ x ∉ E, f x = 0 := by
  sorry

/-- A density-open set: every one of its points is a density point of it. -/
def IsDensityOpen (U : Set ℝ) : Prop :=
  ∀ x ∈ U, IsDensityPoint U x

/-- A density-open set is Lebesgue measurable. -/
theorem IsDensityOpen.nullMeasurableSet {U : Set ℝ} (hU : IsDensityOpen U) :
    NullMeasurableSet U := by
  sorry

/-- The density topology on `ℝ`, generated by the density-open sets. It is not an instance: it
competes with the order topology. -/
@[instance_reducible]
def densityTopology : TopologicalSpace ℝ :=
  TopologicalSpace.generateFrom {U | IsDensityOpen U}

/-- The open sets of the density topology are exactly the density-open sets. -/
theorem isOpen_densityTopology_iff {U : Set ℝ} :
    IsOpen[densityTopology] U ↔ IsDensityOpen U := by
  sorry

/-- The density topology is strictly finer than the usual topology, and every Lebesgue-null set is
closed in it. -/
theorem densityTopology_lt :
    densityTopology < (inferInstance : TopologicalSpace ℝ) ∧
      ∀ s : Set ℝ, volume s = 0 → IsClosed[densityTopology] s := by
  sorry

/-- Continuity at a point for the density topology on the source and the usual topology on the
target is approximate continuity. -/
theorem continuousAt_densityTopology_iff {f : ℝ → ℝ} {x : ℝ} :
    @ContinuousAt ℝ ℝ densityTopology _ f x ↔ ApproximatelyContinuousAt f x := by
  sorry

/-- The density topology is a Baire space. -/
theorem baireSpace_densityTopology : @BaireSpace ℝ densityTopology := by
  sorry

/-- The density topology is completely regular. -/
theorem completelyRegularSpace_densityTopology : @CompletelyRegularSpace ℝ densityTopology := by
  sorry

/-- The density topology is not normal. -/
theorem not_normalSpace_densityTopology : ¬ @NormalSpace ℝ densityTopology := by
  sorry

end Density

/-! ## Mathlib vocabulary used by the README -/

#check @slope
#check @eVariationOn
#check @BoundedVariationOn
#check @AbsolutelyContinuousOnInterval
#check @AbsolutelyContinuousOnInterval.boundedVariationOn
#check @AbsolutelyContinuousOnInterval.integral_deriv_eq_sub
#check @LocallyBoundedVariationOn.ae_differentiableAt
#check @Monotone.ae_hasDerivAt
#check @eVariationOn.lowerSemicontinuous
#check @image_le_of_liminf_slope_right_lt_deriv_boundary
#check @MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero
#check @MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero
#check @exists_hasDerivWithinAt_eq_of_gt_of_lt
#check @Besicovitch.ae_tendsto_measure_inter_div
#check @IsGδ.setOfPred_continuousAt
#check @residual
#check @IsMeagre
#check @BaireSpace
#check @Perfect
#check @Set.IccExtend
#check @TopologicalSpace.generateFrom
#check @CompletelyRegularSpace
#check @NormalSpace
#check @Real.volume_closedBall
#check @hasDerivAt_iff_tendsto_slope
#check @Filter.liminf_le_limsup

end TauCetiRoadmap.RealFunctionsDerivativesAndVariation
