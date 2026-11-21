import Mathlib

/-!
# Online learning and the Littlestone dimension: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A hypothesis class on an instance type `X` is a set `H : Set (X → Bool)` of classifiers. The
Littlestone dimension, the VC dimension and mistake bounds take values in `ℕ∞`; the empty class
has Littlestone dimension `0` and every learner has mistake bound `0` on it, since no sequence is
realizable. A learner is deterministic: a function from the history of labelled examples and the
next instance to a predicted label. Mistake bounds are suprema over all finite sequences that
some member of the class labels correctly; since the learner is deterministic, an adaptive
adversary gains nothing over a fixed sequence. The perceptron is a recursively defined sequence of
weight vectors in a real inner product space; its bounds are inequalities about that sequence.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.OnlineLearningAndLittlestoneDimension

/-! ## Layer 1: mistake trees and the Littlestone dimension -/

section Layer1

variable {X : Type*}

/-- 1.1 A mistake tree of depth `d`, labelling each node by an instance, is shattered by `H`
when every path of answers `y : Fin d → Bool` is followed by a member of `H`: the node reached
after the answers `y 0, …, y (i - 1)` is labelled by `t` applied to that list of answers, and the
member gives it the label `y i`. Only the nodes at depth less than `d` matter. -/
def IsShatteredTree (H : Set (X → Bool)) (d : ℕ) (t : List Bool → X) : Prop :=
  ∀ y : Fin d → Bool, ∃ h ∈ H, ∀ i : Fin d, h (t ((List.ofFn y).take i)) = y i

/-- 1.1 The Littlestone dimension: the supremum in `ℕ∞` of the depths of the mistake trees
shattered by `H`. It is `0` for the empty class, which shatters no tree. -/
def littlestoneDim (H : Set (X → Bool)) : ℕ∞ :=
  ⨆ (d : ℕ) (_ : ∃ t, IsShatteredTree H d t), (d : ℕ∞)

/-- 1.2 Verbatim copy of `vcDimSet` from MathematicalStatisticsAsymptotic 3.5: the VC dimension
of a family of sets, the supremum of the sizes of the finite sets whose traces exhaust their
power sets. -/
def vcDimSet (C : Set (Set X)) : ℕ∞ :=
  ⨆ (s : Finset X) (_ : ∀ u ⊆ s, ∃ A ∈ C, ∀ x ∈ s, x ∈ A ↔ x ∈ u), (s.card : ℕ∞)

/-- 1.2 The VC dimension of a class, that of the family of sets on which its members are `true`,
is at most its Littlestone dimension. -/
theorem vcDimSet_le_littlestoneDim (H : Set (X → Bool)) :
    vcDimSet ((fun h : X → Bool ↦ {x | h x = true}) '' H) ≤ littlestoneDim H := by
  sorry

/-- 1.2 The Littlestone dimension of a finite class is at most `⌊log₂ |H|⌋`. -/
theorem littlestoneDim_le_log_ncard (H : Set (X → Bool)) (hH : H.Finite) :
    littlestoneDim H ≤ (Nat.log 2 H.ncard : ℕ∞) := by
  sorry

/-- 1.3 The threshold classifiers `x ↦ decide (x < a)` on `ℕ`, one for each `a : ℕ`. -/
def thresholds : Set (ℕ → Bool) :=
  Set.range fun a x ↦ decide (x < a)

/-- 1.3 The thresholds on `ℕ` have VC dimension `1` and infinite Littlestone dimension. -/
theorem vcDimSet_thresholds_eq_one_and_littlestoneDim_thresholds_eq_top :
    vcDimSet ((fun h : ℕ → Bool ↦ {x | h x = true}) '' thresholds) = 1 ∧
      littlestoneDim thresholds = ⊤ := by
  sorry

end Layer1

/-! ## Layer 2: mistake bounds -/

section Layer2

variable {X : Type*}

/-- 2.1 A deterministic online learner: from the history of labelled examples and the next
instance, a predicted label. -/
abbrev Learner (X : Type*) := List (X × Bool) → X → Bool

/-- 2.1 The number of mistakes of `A` on the sequence `s`: the rounds `i` at which the prediction
from the first `i` examples differs from the label of the `i`-th. -/
def mistakes (A : Learner X) (s : List (X × Bool)) : ℕ :=
  ((List.finRange s.length).filter fun i : Fin s.length ↦
    decide (A (s.take i) s[i].1 ≠ s[i].2)).length

/-- 2.1 A sequence of labelled examples is realizable by `H` when one member of `H` gives every
example its label. -/
def IsRealizable (H : Set (X → Bool)) (s : List (X × Bool)) : Prop :=
  ∃ h ∈ H, ∀ p ∈ s, h p.1 = p.2

/-- 2.1 The mistake bound of `A` on `H`: the supremum in `ℕ∞` of its numbers of mistakes over all
finite sequences realizable by `H`. -/
def mistakeBound (A : Learner X) (H : Set (X → Bool)) : ℕ∞ :=
  ⨆ (s : List (X × Bool)) (_ : IsRealizable H s), (mistakes A s : ℕ∞)

/-- 2.2 The version space: the members of `H` consistent with every example of `s`. -/
def versionSpace (H : Set (X → Bool)) (s : List (X × Bool)) : Set (X → Bool) :=
  {h ∈ H | ∀ p ∈ s, h p.1 = p.2}

/-- 2.2 The halving learner: the majority vote of the version space, with ties broken towards
`true`. -/
def halvingLearner (H : Set (X → Bool)) : Learner X := fun s x ↦
  decide ((versionSpace H s).ncard ≤ 2 * {h ∈ versionSpace H s | h x = true}.ncard)

/-- 2.2 The halving bound: on a finite class the halving learner makes at most `⌊log₂ |H|⌋`
mistakes on every realizable sequence. -/
theorem mistakeBound_halvingLearner_le (H : Set (X → Bool)) (hH : H.Finite) :
    mistakeBound (halvingLearner H) H ≤ (Nat.log 2 H.ncard : ℕ∞) := by
  sorry

/-- 2.3 Littlestone's theorem: the Littlestone dimension is the least mistake bound of a
deterministic learner. Every learner has mistake bound at least `littlestoneDim H`, and some
learner attains it. -/
theorem isLeast_mistakeBound (H : Set (X → Bool)) :
    IsLeast (Set.range fun A : Learner X ↦ mistakeBound A H) (littlestoneDim H) := by
  sorry

end Layer2

/-! ## Layer 3: the perceptron -/

section Layer3

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 3.1 The perceptron weights for instances `x` and labels `y`: `w 0 = 0`, and
`w (t + 1) = w t + y t • x t` when `y t * ⟪w t, x t⟫ ≤ 0`, `w (t + 1) = w t` otherwise. -/
def perceptronWeight (x : ℕ → E) (y : ℕ → ℝ) : ℕ → E
  | 0 => 0
  | t + 1 =>
    if y t * inner ℝ (perceptronWeight x y t) (x t) ≤ 0 then perceptronWeight x y t + y t • x t
    else perceptronWeight x y t

/-- 3.1 The update rounds among the first `T`: the `t < T` with `y t * ⟪w t, x t⟫ ≤ 0`. -/
def perceptronUpdates (x : ℕ → E) (y : ℕ → ℝ) (T : ℕ) : Finset ℕ :=
  {t ∈ range T | y t * inner ℝ (perceptronWeight x y t) (x t) ≤ 0}

/-- 3.2 Novikoff's bound: if the labels are `±1`, the instances have norm at most `R` and `u`
separates the first `T` examples with margin `γ > 0`, then there are at most `(R ‖u‖ / γ)²`
updates among them. -/
theorem card_perceptronUpdates_le (x : ℕ → E) (y : ℕ → ℝ) (T : ℕ) (R γ : ℝ) (u : E)
    (hy : ∀ t < T, y t = 1 ∨ y t = -1) (hR : ∀ t < T, ‖x t‖ ≤ R) (hγ : 0 < γ)
    (hmargin : ∀ t < T, γ ≤ y t * inner ℝ u (x t)) :
    ((perceptronUpdates x y T).card : ℝ) ≤ (R * ‖u‖ / γ) ^ 2 := by
  sorry

/-- 3.3 The hinge-loss bound: if the labels are `±1` and the instances have norm at most `R`,
then for every `u`, with `L` the sum over the update rounds of `max 0 (1 - y t * ⟪u, x t⟫)`, the
number of updates `M` satisfies `M ≤ L + R ‖u‖ √L + R² ‖u‖²`. -/
theorem card_perceptronUpdates_le_hinge (x : ℕ → E) (y : ℕ → ℝ) (T : ℕ) (R : ℝ) (u : E)
    (hy : ∀ t < T, y t = 1 ∨ y t = -1) (hR : ∀ t < T, ‖x t‖ ≤ R) :
    ((perceptronUpdates x y T).card : ℝ) ≤
      (∑ t ∈ perceptronUpdates x y T, max 0 (1 - y t * inner ℝ u (x t))) +
        R * ‖u‖ * √(∑ t ∈ perceptronUpdates x y T, max 0 (1 - y t * inner ℝ u (x t))) +
        R ^ 2 * ‖u‖ ^ 2 := by
  sorry

end Layer3

end TauCetiRoadmap.OnlineLearningAndLittlestoneDimension
