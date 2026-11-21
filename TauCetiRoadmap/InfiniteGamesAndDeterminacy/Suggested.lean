import Mathlib

/-!
# Infinite games and determinacy: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks are not restated.

A Gale–Stewart game on a type `X` has payoff `A : Set (ℕ → X)`. The two players alternately
choose elements of `X`, player I at the even positions and player II at the odd ones, each seeing
every earlier move; player I wins the play if it lies in `A`. A strategy for either player is a
function `List X → X` from finite histories to moves; a strategy of player I is only ever
consulted at histories of even length, and one of player II at histories of odd length. Where a
topology enters, `X` is discrete and `ℕ → X` carries the product topology.

The Banach–Mazur game of `A` is the Gale–Stewart game on the alphabet `X × List X`, a move
`(x, w)` standing for the nonempty finite sequence `x :: w`, with the payoff of those sequences
of moves whose concatenation lies in `A`.

Lean's logic includes the axiom of choice, so no statement carries a choice hypothesis.
-/

open Set

namespace TauCetiRoadmap.InfiniteGamesAndDeterminacy

universe u

variable {X : Type u}

/-! ## Layer 1: Gale–Stewart games and open and closed determinacy -/

/-- 1.1 The first `n` moves of the play in which player I follows `σ` and player II follows `τ`:
move `k` is `σ` of the moves before it when `k` is even and `τ` of them when `k` is odd. -/
def history (σ τ : List X → X) : ℕ → List X
  | 0 => []
  | n + 1 =>
      history σ τ n ++ [if Even n then σ (history σ τ n) else τ (history σ τ n)]

/-- 1.1 The infinite play of player I's strategy `σ` against player II's strategy `τ`. -/
def play (σ τ : List X → X) (n : ℕ) : X :=
  if Even n then σ (history σ τ n) else τ (history σ τ n)

/-- 1.1 Player I has a winning strategy in the game with payoff `A`: some `σ` puts the play in
`A` against every strategy of player II. -/
def PlayerIWins (A : Set (ℕ → X)) : Prop :=
  ∃ σ : List X → X, ∀ τ : List X → X, play σ τ ∈ A

/-- 1.1 Player II has a winning strategy in the game with payoff `A`: some `τ` keeps the play
out of `A` against every strategy of player I. -/
def PlayerIIWins (A : Set (ℕ → X)) : Prop :=
  ∃ τ : List X → X, ∀ σ : List X → X, play σ τ ∉ A

/-- 1.1 The game with payoff `A` is determined: one of the two players has a winning
strategy. -/
def IsDetermined (A : Set (ℕ → X)) : Prop :=
  PlayerIWins A ∨ PlayerIIWins A

/-- 1.2 The Gale–Stewart theorem: on a nonempty discrete `X`, every closed subset of `ℕ → X` is
determined. -/
theorem isDetermined_of_isClosed [TopologicalSpace X] [DiscreteTopology X] [Nonempty X]
    {A : Set (ℕ → X)} (hA : IsClosed A) : IsDetermined A := by
  sorry

/-- 1.3 The shift lemma: if the game whose payoff is the set of sequences with tail in `A` is
determined, then so is the game with payoff the complement of `A`. -/
theorem isDetermined_compl_of_isDetermined_preimage_tail {A : Set (ℕ → X)}
    (h : IsDetermined ((fun f n ↦ f (n + 1)) ⁻¹' A)) : IsDetermined Aᶜ := by
  sorry

/-- 1.3 On a nonempty discrete `X`, every open subset of `ℕ → X` is determined. -/
theorem isDetermined_of_isOpen [TopologicalSpace X] [DiscreteTopology X] [Nonempty X]
    {A : Set (ℕ → X)} (hA : IsOpen A) : IsDetermined A := by
  sorry

/-! ## Layer 2: a set that is not determined -/

/-- 2.1 If `X` has two distinct elements, some subset of `ℕ → X` is not determined. -/
theorem exists_not_isDetermined [Nontrivial X] : ∃ A : Set (ℕ → X), ¬ IsDetermined A := by
  sorry

/-! ## Layer 3: Wolfe's theorem -/

/-- 3.1 Wolfe's theorem: on a nonempty discrete `X`, every countable union of closed subsets of
`ℕ → X` is determined. -/
theorem isDetermined_iUnion_of_isClosed [TopologicalSpace X] [DiscreteTopology X] [Nonempty X]
    {F : ℕ → Set (ℕ → X)} (hF : ∀ i, IsClosed (F i)) : IsDetermined (⋃ i, F i) := by
  sorry

/-- 3.2 On a nonempty discrete `X`, every countable intersection of open subsets of `ℕ → X` is
determined. -/
theorem isDetermined_of_isGδ [TopologicalSpace X] [DiscreteTopology X] [Nonempty X]
    {A : Set (ℕ → X)} (hA : IsGδ A) : IsDetermined A := by
  sorry

/-! ## Layer 4: the Banach–Mazur game -/

/-- 4.1 The concatenation of a sequence of nonempty finite sequences, the move `m i = (x, w)`
standing for `x :: w`. Its letter `k` is read off the concatenation of the first `k + 1` moves,
which has at least `k + 1` letters; the default value `(m 0).1` is never reached. -/
def concatMoves (m : ℕ → X × List X) (k : ℕ) : X :=
  ((List.range (k + 1)).flatMap fun i ↦ (m i).1 :: (m i).2).getD k (m 0).1

/-- 4.1 The payoff of the Banach–Mazur game of `A`: the sequences of moves whose concatenation
lies in `A`. -/
def banachMazurPayoff (A : Set (ℕ → X)) : Set (ℕ → X × List X) :=
  concatMoves ⁻¹' A

/-- 4.2 Banach's theorem, first half: on a nonempty discrete `X`, player II wins the
Banach–Mazur game of `A` if and only if `A` is meagre in `ℕ → X`. -/
theorem playerIIWins_banachMazurPayoff_iff_isMeagre [TopologicalSpace X] [DiscreteTopology X]
    [Nonempty X] {A : Set (ℕ → X)} :
    PlayerIIWins (banachMazurPayoff A) ↔ IsMeagre A := by
  sorry

/-- 4.2 Banach's theorem, second half: on a discrete `X`, player I wins the Banach–Mazur game of
`A` if and only if some cylinder minus `A` is meagre. -/
theorem playerIWins_banachMazurPayoff_iff [TopologicalSpace X] [DiscreteTopology X]
    {A : Set (ℕ → X)} :
    PlayerIWins (banachMazurPayoff A) ↔
      ∃ (x : ℕ → X) (n : ℕ), IsMeagre (PiNat.cylinder x n \ A) := by
  sorry

/-- 4.3 On a nonempty discrete `X`, the Banach–Mazur game of a set with the property of Baire is
determined. -/
theorem isDetermined_banachMazurPayoff_of_baireMeasurableSet [TopologicalSpace X]
    [DiscreteTopology X] [Nonempty X] {A : Set (ℕ → X)} (hA : BaireMeasurableSet A) :
    IsDetermined (banachMazurPayoff A) := by
  sorry

/-- 4.4 Determinacy gives the property of Baire: if every member of a family `Λ` of subsets of
`ℕ → X` has a determined Banach–Mazur game, and `Λ` is closed under removing open sets, then
every member of `Λ` has the property of Baire. -/
theorem baireMeasurableSet_of_isDetermined_banachMazurPayoff [TopologicalSpace X]
    [DiscreteTopology X] {Λ : Set (Set (ℕ → X))}
    (hdet : ∀ B ∈ Λ, IsDetermined (banachMazurPayoff B))
    (hdiff : ∀ B ∈ Λ, ∀ U : Set (ℕ → X), IsOpen U → B \ U ∈ Λ)
    {A : Set (ℕ → X)} (hA : A ∈ Λ) : BaireMeasurableSet A := by
  sorry

end TauCetiRoadmap.InfiniteGamesAndDeterminacy
