import Mathlib

/-!
# Extensive-form games: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here: Zermelo–Kuhn (4.3), Kuhn's theorem in both directions (2.1, 2.2),
existence of a behavioural Nash equilibrium under perfect recall (3.1), and the one-shot
deviation principle on trees (4.2) and for multi-stage games continuous at infinity (5.2),
with the two route statements 1.2 and 1.3. The README's non-examples, Checks and API facts are
not restated.

A finite game tree is the inductive type `GameTree H A Z`: information sets are labels `h : H`
with action types `A h`, a chance node carries explicit probability weights, leaves carry
outcomes in `Z`. Behavioural profiles are weights at every label; validity is membership in
`simplex`, copied verbatim from RegretMinimizationAndEquilibria, Layer 1, so that the existence
theorem of its 3.1 applies on the route of 3.1 here.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.ExtensiveFormGames

/-- 1.2 (copied verbatim from RegretMinimizationAndEquilibria, Layer 1, 1.1): the probability
simplex on a finite type, as a set of weight vectors: the weights of Mathlib's
`Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

universe u v w

/-! ## Layer 1: game trees, payoffs and information -/

/-- 1.1 A finite game tree. Information sets are labels `h : H` with action type `A h`; a decision
node carries its information set, and its children are indexed by the actions of that set.
A chance node has `n` branches with probability weights `p`. Leaves carry outcomes `z : Z`. -/
inductive GameTree (H : Type u) (A : H → Type v) (Z : Type w) : Type (max u v w)
  | leaf (z : Z)
  | chance (n : ℕ) (p : Fin n → ℝ) (hp : (∀ k, 0 ≤ p k) ∧ ∑ k, p k = 1)
      (c : Fin n → GameTree H A Z)
  | decision (h : H) (c : A h → GameTree H A Z)

variable {N : Type*} {H : Type u} {A : H → Type v} {Z : Type w}

namespace GameTree

/-- 1.1 One step of a path from the root: a move `⟨h, a⟩` at a decision node, or the index of a
chance branch. -/
abbrev Step (H : Type u) (A : H → Type v) := (Σ h, A h) ⊕ ℕ

/-- 1.1 The decision nodes of a tree, each as its path from the root and its information set. -/
def nodes : GameTree H A Z → Set (List (Step H A) × H)
  | leaf _ => ∅
  | chance _ _ _ c => ⋃ k, (fun x ↦ (Sum.inr k.val :: x.1, x.2)) '' nodes (c k)
  | decision h c => insert ([], h) (⋃ a, (fun x ↦ (Sum.inl ⟨h, a⟩ :: x.1, x.2)) '' nodes (c a))

/-- 1.1 The subtrees of a tree, each with the path from the root to its root. -/
def subtrees : GameTree H A Z → Set (List (Step H A) × GameTree H A Z)
  | leaf z => {([], leaf z)}
  | chance n p hp c => insert ([], chance n p hp c)
      (⋃ k, (fun x ↦ (Sum.inr k.val :: x.1, x.2)) '' subtrees (c k))
  | decision h c => insert ([], decision h c)
      (⋃ a, (fun x ↦ (Sum.inl ⟨h, a⟩ :: x.1, x.2)) '' subtrees (c a))

/-- 1.1 The outcomes at the leaves of a tree. -/
def leaves [∀ h, Fintype (A h)] [DecidableEq Z] : GameTree H A Z → Finset Z
  | leaf z => {z}
  | chance _ _ _ c => univ.biUnion fun k ↦ leaves (c k)
  | decision _ c => univ.biUnion fun a ↦ leaves (c a)

end GameTree

open GameTree

/-- 1.2 A behavioural profile: weights on the actions of every information set. -/
abbrev Profile (H : Type u) (A : H → Type v) := ∀ h, A h → ℝ

section Payoff

variable [∀ h, Fintype (A h)]

/-- 1.2 The expected value of `u : Z → ℝ` at the leaves when the weights `σ` are played. -/
def expectedPayoff (u : Z → ℝ) : GameTree H A Z → Profile H A → ℝ
  | leaf z, _ => u z
  | chance _ p _ c, σ => ∑ k, p k * expectedPayoff u (c k) σ
  | decision h c, σ => ∑ a, σ h a * expectedPayoff u (c a) σ

/-- 1.2 The outcome distribution: the probability of each outcome when `σ` is played. -/
def outcomeProb [DecidableEq Z] : GameTree H A Z → Profile H A → Z → ℝ
  | leaf z, _ => Pi.single z 1
  | chance _ p _ c, σ => ∑ k, p k • outcomeProb (c k) σ
  | decision h c, σ => ∑ a, σ h a • outcomeProb (c a) σ

end Payoff

section Players

variable [DecidableEq N] (player : H → N)

/-- 1.3 The experience of player `i` along a path: the information sets of `i` met and the
actions `i` took there, in order (Karlin–Peres's `H(v)`). -/
def experience (i : N) (π : List (Step H A)) : List (Σ h, A h) :=
  π.filterMap fun x ↦ match x with
    | Sum.inl m => if player m.1 = i then some m else none
    | Sum.inr _ => none

/-- 1.3 Perfect recall: all nodes of an information set have the same experience of its
player. -/
def IsPerfectRecall (t : GameTree H A Z) : Prop :=
  ∀ π π' h, (π, h) ∈ t.nodes → (π', h) ∈ t.nodes →
    experience player (player h) π = experience player (player h) π'

/-- 1.3 Perfect information: every information set has at most one node. -/
def IsPerfectInformation (t : GameTree H A Z) : Prop :=
  ∀ π π' h, (π, h) ∈ t.nodes → (π', h) ∈ t.nodes → π = π'

/-- 1.3 No absent-mindedness: no path meets an information set twice. -/
def IsNonAbsentMinded (t : GameTree H A Z) : Prop :=
  ∀ π h, (π, h) ∈ t.nodes → ∀ a : A h, (Sum.inl ⟨h, a⟩ : Step H A) ∉ π

/-- 1.4 Player `i` plays `b` at its own information sets, the others play `σ`. -/
def deviate (i : N) (b σ : Profile H A) : Profile H A :=
  fun h ↦ if player h = i then b h else σ h

variable (A) in
/-- 1.4 A pure strategy of player `i`: an action at each of its information sets. -/
abbrev PureStrategy (i : N) := ∀ h : {h : H // player h = i}, A h.1

variable [∀ h, DecidableEq (A h)]

/-- 1.4 The pure profile `s`, as weights. -/
def pureProfile (s : ∀ h, A h) : Profile H A := fun h ↦ Pi.single (s h) 1

/-- 1.4 Player `i` plays the pure strategy `s`, the others play `σ`. -/
def withPure (i : N) (s : PureStrategy A player i) (σ : Profile H A) : Profile H A :=
  fun h ↦ if hh : player h = i then Pi.single (s ⟨h, hh⟩) 1 else σ h

variable [∀ h, Fintype (A h)]

/-- 1.4 A Nash equilibrium in behavioural strategies: no player gains by changing its weights at
its own information sets. -/
def IsBehaviouralNash (t : GameTree H A Z) (u : N → Z → ℝ) (σ : Profile H A) : Prop :=
  (∀ h, σ h ∈ simplex (A h)) ∧
    ∀ i (b : Profile H A), (∀ h, player h = i → b h ∈ simplex (A h)) →
      expectedPayoff (u i) t (deviate player i b σ) ≤ expectedPayoff (u i) t σ

/-- 1.2 The expected payoff is the sum of `u` against the outcome distribution, over the
outcomes at the leaves. -/
theorem expectedPayoff_eq_sum_outcomeProb [DecidableEq Z] (u : Z → ℝ) (t : GameTree H A Z)
    (σ : Profile H A) :
    expectedPayoff u t σ = ∑ z ∈ t.leaves, outcomeProb t σ z * u z :=
  sorry

/-- 1.3 Perfect recall excludes absent-mindedness. -/
theorem IsPerfectRecall.isNonAbsentMinded {t : GameTree H A Z}
    (ht : IsPerfectRecall player t) : IsNonAbsentMinded t :=
  sorry

/-! ## Layer 2: Kuhn's theorem -/

/-- 2.1 Kuhn's theorem, behavioural to mixed: without absent-mindedness a behavioural strategy
has the outcome distribution of the product mixed strategy, against every profile of the
others. -/
theorem outcomeProb_deviate_eq_sum_prod [Fintype H] [DecidableEq H] [DecidableEq Z]
    (t : GameTree H A Z) (ht : IsNonAbsentMinded t) (i : N) (b : Profile H A)
    (hb : ∀ h, player h = i → b h ∈ simplex (A h)) (σ : Profile H A) :
    outcomeProb t (deviate player i b σ) =
      ∑ s : PureStrategy A player i, (∏ h, b h.1 (s h)) • outcomeProb t (withPure player i s σ) :=
  sorry

/-- 2.2 Kuhn's theorem, mixed to behavioural: under perfect recall every mixed strategy of
player `i` has a behavioural strategy with the same outcome distribution against every profile
of the others. -/
theorem exists_behavioural_outcomeProb_eq [Fintype H] [DecidableEq H] [DecidableEq Z]
    (t : GameTree H A Z) (ht : IsPerfectRecall player t) (i : N)
    (μ : PureStrategy A player i → ℝ) (hμ : μ ∈ simplex (PureStrategy A player i)) :
    ∃ b : Profile H A, (∀ h, player h = i → b h ∈ simplex (A h)) ∧
      ∀ σ : Profile H A, outcomeProb t (deviate player i b σ) =
        ∑ s, μ s • outcomeProb t (withPure player i s σ) :=
  sorry

/-! ## Layer 3: behavioural equilibria under perfect recall -/

/-- 3.1 Under perfect recall there is a Nash equilibrium in behavioural strategies (Karlin–Peres,
Corollary 6.2.9). -/
theorem exists_isBehaviouralNash [∀ h, Nonempty (A h)] (t : GameTree H A Z)
    (ht : IsPerfectRecall player t) (u : N → Z → ℝ) :
    ∃ σ, IsBehaviouralNash player t u σ :=
  sorry

/-! ## Layer 4: subgame perfection and backward induction -/

/-- 4.1 Subgame perfection: `σ` is a Nash equilibrium of every subtree that no information set
crosses (every node of an information set met in the subtree lies below its root). -/
def IsSubgamePerfect (t : GameTree H A Z) (u : N → Z → ℝ) (σ : Profile H A) : Prop :=
  ∀ π t', (π, t') ∈ t.subtrees →
    (∀ π' h, (π', h) ∈ t.nodes → (∃ ρ, (ρ, h) ∈ t'.nodes) → π <+: π') →
      IsBehaviouralNash player t' u σ

/-- 4.1 No profitable one-shot deviation: at every decision node, the player moving there does
not gain, in the subtree of that node, by changing its action there only. -/
def IsOneShotUnimprovable [DecidableEq H] (t : GameTree H A Z) (u : N → Z → ℝ)
    (σ : Profile H A) : Prop :=
  ∀ π h c, (π, decision h c) ∈ t.subtrees → ∀ a : A h,
    expectedPayoff (u (player h)) (decision h c) (Function.update σ h (Pi.single a 1)) ≤
      expectedPayoff (u (player h)) (decision h c) σ

/-- 4.2 The one-shot deviation principle, finite horizon: in a game of perfect information a
behavioural profile is subgame perfect iff no player gains by a one-shot deviation. -/
theorem isSubgamePerfect_iff_isOneShotUnimprovable [DecidableEq H] (t : GameTree H A Z)
    (ht : IsPerfectInformation t) (u : N → Z → ℝ) (σ : Profile H A)
    (hσ : ∀ h, σ h ∈ simplex (A h)) :
    IsSubgamePerfect player t u σ ↔ IsOneShotUnimprovable player t u σ :=
  sorry

/-- 4.3 Zermelo–Kuhn: a finite game of perfect information, chance moves allowed, has a pure
subgame-perfect equilibrium. -/
theorem exists_pure_isSubgamePerfect [∀ h, Nonempty (A h)] (t : GameTree H A Z)
    (ht : IsPerfectInformation t) (u : N → Z → ℝ) :
    ∃ s : ∀ h, A h, IsSubgamePerfect player t u (pureProfile s) :=
  sorry

end Players

/-! ## Layer 5: multi-stage games with observed actions -/

section MultiStage

variable {N : Type*} {A : N → Type*}

/-- 5.1 A pure strategy profile of a multi-stage game with observed actions: at stage `t`, each
player's action as a function of the observed history of action profiles. -/
abbrev StageProfile (N : Type*) (A : N → Type*) :=
  ∀ i, (t : ℕ) → (Fin t → ∀ j, A j) → A i

/-- 5.1 The play from the history `h` of length `t₀` on: `h`, then the actions of `s`. -/
def play (s : StageProfile N A) (t₀ : ℕ) (h : Fin t₀ → ∀ j, A j) : ℕ → ∀ j, A j
  | t => if ht : t < t₀ then h ⟨t, ht⟩ else fun i ↦ s i t fun k ↦ play s t₀ h k
termination_by t => t
decreasing_by exact k.isLt

/-- 5.1 Continuity at infinity (uniformly over pairs of plays). -/
def IsContinuousAtInfinity (u : N → (ℕ → ∀ j, A j) → ℝ) : Prop :=
  ∀ i, ∀ ε > 0, ∃ T : ℕ, ∀ p q : ℕ → ∀ j, A j, (∀ k < T, p k = q k) → |u i p - u i q| ≤ ε

variable [DecidableEq N]

/-- 5.1 Subgame perfection of a pure profile against pure deviations after every history. -/
def IsStageSubgamePerfect (u : N → (ℕ → ∀ j, A j) → ℝ) (s : StageProfile N A) : Prop :=
  ∀ i (s' : (t : ℕ) → (Fin t → ∀ j, A j) → A i) t₀ (h : Fin t₀ → ∀ j, A j),
    u i (play (Function.update s i s') t₀ h) ≤ u i (play s t₀ h)

/-- 5.1 No profitable one-shot deviation: changing only the stage-`t₀` action after `h`. -/
def IsStageOneShotUnimprovable (u : N → (ℕ → ∀ j, A j) → ℝ) (s : StageProfile N A) : Prop :=
  ∀ i t₀ (h : Fin t₀ → ∀ j, A j) (a : A i),
    u i (play (Function.update s i fun t h' ↦ if t = t₀ then a else s i t h') t₀ h) ≤
      u i (play s t₀ h)

/-- 5.2 The one-shot deviation principle for multi-stage games, pure strategies: in a
multi-stage game with observed actions that is continuous at infinity, a pure profile is
subgame perfect iff it has no profitable one-shot deviation. -/
theorem isStageSubgamePerfect_iff (u : N → (ℕ → ∀ j, A j) → ℝ) (hu : IsContinuousAtInfinity u)
    (s : StageProfile N A) :
    IsStageSubgamePerfect u s ↔ IsStageOneShotUnimprovable u s :=
  sorry

end MultiStage

end TauCetiRoadmap.ExtensiveFormGames
