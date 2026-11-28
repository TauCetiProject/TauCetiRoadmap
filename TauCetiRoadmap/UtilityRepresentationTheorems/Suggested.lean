import Mathlib

/-!
# Utility representation theorems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's API lists, routes and Checks are not restated.

A preference on a type `α` is a relation `R : α → α → Prop`, read "`R x y`: `x` is at least as
good as `y`", that is total (`Std.Total R`) and transitive (`IsTrans α R`), a total preorder. A
utility for `R` is a real function `u` with `R x y ↔ u y ≤ u x`. Mixtures are taken in Mathlib's
convex spaces `Convexity.ConvexSpace ℝ X`, with weights in `unitInterval`; simple lotteries on a
type of outcomes `C` are Mathlib's `Convexity.StdSimplex ℝ C`. Monetary lotteries are probability
measures on `ℝ` concentrated on an interval `D` of wealth levels.
-/

noncomputable section

open MeasureTheory Convexity

namespace TauCetiRoadmap.UtilityRepresentationTheorems

/-! ## Layer 1: preferences and utility -/

/-- 1.1 The strict part of a relation: `x` is strictly preferred to `y`. -/
def strictPart {α : Type*} (R : α → α → Prop) (x y : α) : Prop :=
  R x y ∧ ¬R y x

/-- 1.1 `u` is a utility for `R`: `x` is at least as good as `y` exactly when `u y ≤ u x`. -/
def IsUtility {α : Type*} (R : α → α → Prop) (u : α → ℝ) : Prop :=
  ∀ x y, R x y ↔ u y ≤ u x

/-- 1.2 A set `D` is order dense for `R` when between any two strictly ranked points there is a
point of `D`, which may be one of the two: `x` strictly preferred to `y` gives `d ∈ D` with
`R x d` and `R d y`. -/
def IsOrderDense {α : Type*} (R : α → α → Prop) (D : Set α) : Prop :=
  ∀ x y, strictPart R x y → ∃ d ∈ D, R x d ∧ R d y

/-- 1.3 A relation on a topological space is continuous when every upper contour set
`{y | R y x}` and every lower contour set `{y | R x y}` is closed. -/
def IsContinuousPref {X : Type*} [TopologicalSpace X] (R : X → X → Prop) : Prop :=
  ∀ x, IsClosed {y | R y x} ∧ IsClosed {y | R x y}

/-- 1.4 The lexicographic preference on the plane: the first coordinate decides, and the second
breaks ties. -/
def lexPref (p q : ℝ × ℝ) : Prop :=
  q.1 < p.1 ∨ (p.1 = q.1 ∧ q.2 ≤ p.2)

/-! ## Layer 2: existence of utility -/

/-- 2.1 Cantor–Debreu theorem. A total preorder has a utility if and only if some countable set
is order dense for it. -/
theorem exists_isUtility_iff_exists_countable_isOrderDense {α : Type*} (R : α → α → Prop)
    [IsTrans α R] [Std.Total R] :
    (∃ u : α → ℝ, IsUtility R u) ↔ ∃ D : Set α, D.Countable ∧ IsOrderDense R D := by
  sorry

/-- 2.2 The lexicographic preference on the plane has no utility. -/
theorem not_exists_isUtility_lexPref : ¬∃ u : ℝ × ℝ → ℝ, IsUtility lexPref u := by
  sorry

/-- 2.3 Debreu's theorem. A continuous total preorder on a second-countable space has a
continuous utility. -/
theorem exists_continuous_isUtility_of_secondCountable {X : Type*} [TopologicalSpace X]
    [SecondCountableTopology X] (R : X → X → Prop) [IsTrans X R] [Std.Total R]
    (hR : IsContinuousPref R) : ∃ u : X → ℝ, Continuous u ∧ IsUtility R u := by
  sorry

/-- 2.4 Eilenberg–Debreu theorem. A continuous total preorder on a separable preconnected space
has a continuous utility. -/
theorem exists_continuous_isUtility_of_separable_preconnected {X : Type*} [TopologicalSpace X]
    [TopologicalSpace.SeparableSpace X] [PreconnectedSpace X] (R : X → X → Prop) [IsTrans X R]
    [Std.Total R] (hR : IsContinuousPref R) : ∃ u : X → ℝ, Continuous u ∧ IsUtility R u := by
  sorry

/-! ## Layer 3: mixture spaces and expected utility -/

section Mixture

variable {X : Type*} [ConvexSpace ℝ X]

/-- 3.1 The mixture `α x + (1 - α) y` in a convex space, for a weight `α` in `[0, 1]`. -/
def mix (α : unitInterval) (x y : X) : X :=
  convexCombPair (α : ℝ) (1 - α) (unitInterval.nonneg α) (unitInterval.one_sub_nonneg α)
    (add_sub_cancel _ _) x y

/-- 3.1 The weight `1/2`. -/
def half : unitInterval :=
  ⟨1 / 2, by norm_num, by norm_num⟩

/-- 3.1 The continuity axiom of Herstein and Milnor: for all `x`, `y`, `z`, the weights `α` with
`α x + (1 - α) y` at least as good as `z`, and those with `z` at least as good as it, form closed
subsets of `[0, 1]`. -/
def IsMixtureContinuous (R : X → X → Prop) : Prop :=
  ∀ x y z, IsClosed {α : unitInterval | R (mix α x y) z} ∧
    IsClosed {α : unitInterval | R z (mix α x y)}

/-- 3.1 The independence axiom of Herstein and Milnor: if `x` and `x'` are indifferent, so are
the even mixtures of each of them with any `y`. -/
def IsHalfIndependent (R : X → X → Prop) : Prop :=
  ∀ x x' y, R x x' → R x' x →
    R (mix half x y) (mix half x' y) ∧ R (mix half x' y) (mix half x y)

/-- 3.2 The independence axiom of von Neumann and Morgenstern: for every weight `0 < α < 1`,
`x` is at least as good as `y` exactly when `α x + (1 - α) z` is at least as good as
`α y + (1 - α) z`. -/
def IsMixtureIndependent (R : X → X → Prop) : Prop :=
  ∀ α : unitInterval, 0 < (α : ℝ) → (α : ℝ) < 1 → ∀ x y z, R x y ↔ R (mix α x z) (mix α y z)

/-- 3.2 The continuity axiom in its indifference form: if `x` is strictly preferred to `y` and
`y` to `z`, some mixture `α x + (1 - α) z` with `0 < α < 1` is indifferent to `y`. -/
def IsMixtureSolvable (R : X → X → Prop) : Prop :=
  ∀ x y z, strictPart R x y → strictPart R y z →
    ∃ α : unitInterval, 0 < (α : ℝ) ∧ (α : ℝ) < 1 ∧ R y (mix α x z) ∧ R (mix α x z) y

/-- 3.1 Herstein–Milnor theorem. A total preorder on a convex space has an affine utility if and
only if it satisfies the continuity and independence axioms of Herstein and Milnor. -/
theorem exists_isAffineMap_isUtility_iff (R : X → X → Prop) [IsTrans X R] [Std.Total R] :
    IsMixtureContinuous R ∧ IsHalfIndependent R ↔
      ∃ U : X → ℝ, IsAffineMap ℝ U ∧ IsUtility R U := by
  sorry

/-- 3.1 Uniqueness in the Herstein–Milnor theorem: two affine utilities for the same relation
differ by a positive affine transformation. -/
theorem exists_pos_affine_of_isAffineMap_isUtility (R : X → X → Prop) {U V : X → ℝ}
    (hU : IsAffineMap ℝ U) (hUR : IsUtility R U) (hV : IsAffineMap ℝ V) (hVR : IsUtility R V) :
    ∃ a : ℝ, 0 < a ∧ ∃ b : ℝ, ∀ x, V x = a * U x + b := by
  sorry

end Mixture

/-- 3.2 The expected utility of a simple lottery `p` on the outcomes `C` for the utility `u` on
outcomes: the sum of `p c * u c` over the support of `p`. -/
def expectedUtility {C : Type*} (u : C → ℝ) (p : StdSimplex ℝ C) : ℝ :=
  p.weights.sum fun c t => t * u c

/-- 3.2 von Neumann–Morgenstern theorem. A total preorder on the simple lotteries over any type
of outcomes satisfies the independence axiom and the continuity axiom in its indifference form if
and only if it is represented by the expected utility of some utility on outcomes. -/
theorem exists_isUtility_expectedUtility_iff {C : Type*}
    (R : StdSimplex ℝ C → StdSimplex ℝ C → Prop) [IsTrans (StdSimplex ℝ C) R] [Std.Total R] :
    IsMixtureIndependent R ∧ IsMixtureSolvable R ↔
      ∃ u : C → ℝ, IsUtility R (expectedUtility u) := by
  sorry

/-- 3.2 Uniqueness of von Neumann–Morgenstern utilities: two utilities on outcomes whose expected
utilities represent the same relation differ by a positive affine transformation. -/
theorem exists_pos_affine_of_isUtility_expectedUtility {C : Type*}
    (R : StdSimplex ℝ C → StdSimplex ℝ C → Prop) {u v : C → ℝ}
    (hu : IsUtility R (expectedUtility u)) (hv : IsUtility R (expectedUtility v)) :
    ∃ a : ℝ, 0 < a ∧ ∃ b : ℝ, ∀ c, v c = a * u c + b := by
  sorry

/-! ## Layer 4: risk aversion -/

/-- 4.1 `c` is a certainty equivalent of the monetary lottery `μ` for the Bernoulli utility `u` on
the interval `D`: a sure wealth in `D` whose utility is the expected utility of `μ`. -/
def IsCertaintyEquivalent (D : Set ℝ) (u : ℝ → ℝ) (μ : Measure ℝ) (c : ℝ) : Prop :=
  c ∈ D ∧ u c = ∫ x, u x ∂μ

/-- 4.1 Existence and uniqueness of the certainty equivalent for a continuous strictly increasing
utility on an interval and a probability measure concentrated on it with integrable utility. -/
theorem existsUnique_isCertaintyEquivalent {D : Set ℝ} (hD : D.OrdConnected) {u : ℝ → ℝ}
    (hu : ContinuousOn u D) (hmono : StrictMonoOn u D) (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμD : ∀ᵐ x ∂μ, x ∈ D) (hint : Integrable u μ) :
    ∃! c, IsCertaintyEquivalent D u μ c := by
  sorry

/-- 4.2 Risk aversion and concavity. On an interval `D`, a utility `u` weakly prefers the mean of
every probability measure concentrated on `D` with a mean and an integrable utility to the
measure itself if and only if `u` is concave on `D`. -/
theorem riskAverse_iff_concaveOn {D : Set ℝ} (hD : D.OrdConnected) (u : ℝ → ℝ) :
    (∀ μ : Measure ℝ, IsProbabilityMeasure μ → (∀ᵐ x ∂μ, x ∈ D) → Integrable (fun x => x) μ →
        Integrable u μ → ∫ x, u x ∂μ ≤ u (∫ x, x ∂μ)) ↔
      ConcaveOn ℝ D u := by
  sorry

/-- 4.3 Pratt's theorem, global form. For continuous strictly increasing utilities `u` and `v`
on an interval `D`, `u` is a concave transformation of `v` on `D` if and only if, for every
probability measure concentrated on `D` with integrable `u` and `v`, every certainty equivalent
for `u` is at most every certainty equivalent for `v`. -/
theorem exists_concaveOn_comp_iff_certaintyEquivalent_le {D : Set ℝ} (hD : D.OrdConnected)
    {u v : ℝ → ℝ} (hu : ContinuousOn u D) (hv : ContinuousOn v D) (humono : StrictMonoOn u D)
    (hvmono : StrictMonoOn v D) :
    (∃ g : ℝ → ℝ, ConcaveOn ℝ (v '' D) g ∧ ∀ x ∈ D, u x = g (v x)) ↔
      ∀ μ : Measure ℝ, IsProbabilityMeasure μ → (∀ᵐ x ∂μ, x ∈ D) → Integrable u μ →
        Integrable v μ → ∀ cu cv, IsCertaintyEquivalent D u μ cu →
          IsCertaintyEquivalent D v μ cv → cu ≤ cv := by
  sorry

/-- 4.4 The Arrow–Pratt coefficient of absolute risk aversion of `u` at `x`:
`-u''(x) / u'(x)`. -/
def arrowPratt (u : ℝ → ℝ) (x : ℝ) : ℝ :=
  -deriv (deriv u) x / deriv u x

/-- 4.4 Pratt's theorem, local form. For utilities `u` and `v` continuous on an interval `D` and
twice differentiable with positive first derivative on its interior, `u` is a concave
transformation of `v` on `D` if and only if the Arrow–Pratt coefficient of `u` is at least that
of `v` at every interior point. -/
theorem exists_concaveOn_comp_iff_arrowPratt_le {D : Set ℝ} (hD : D.OrdConnected)
    {u v : ℝ → ℝ} (hu : ContinuousOn u D) (hv : ContinuousOn v D)
    (hu₁ : DifferentiableOn ℝ u (interior D)) (hu₂ : DifferentiableOn ℝ (deriv u) (interior D))
    (hv₁ : DifferentiableOn ℝ v (interior D)) (hv₂ : DifferentiableOn ℝ (deriv v) (interior D))
    (hu₀ : ∀ x ∈ interior D, 0 < deriv u x) (hv₀ : ∀ x ∈ interior D, 0 < deriv v x) :
    (∃ g : ℝ → ℝ, ConcaveOn ℝ (v '' D) g ∧ ∀ x ∈ D, u x = g (v x)) ↔
      ∀ x ∈ interior D, arrowPratt v x ≤ arrowPratt u x := by
  sorry

end TauCetiRoadmap.UtilityRepresentationTheorems
