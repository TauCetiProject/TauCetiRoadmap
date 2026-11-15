module

public import Mathlib

/-!
# Stable matching: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib, each with `sorry`, with only the definitions they need: marriage markets with strict
preferences given by rank functions, matchings, stability, the change of one agent's stated
preferences, and the men-proposing deferred acceptance algorithm run for a fixed number of rounds.

Headlines stated:

* README 1.1, `exists_isStable`: every marriage market has a stable matching (Gale–Shapley);
* README 1.2, `exists_isStable_man_eq_deferredAcceptance`: deferred acceptance returns one;
* README 1.3, `rankM_deferredAcceptance_le`: it is the men-optimal stable matching;
* README 2.1, `exists_isStable_manSup` and `exists_isStable_manInf`: Conway's lattice;
* README 2.2, `man_eq_none_iff_of_isStable` and `woman_eq_none_iff_of_isStable`: the theorem of
  McVitie and Wilson;
* README 2.3, `not_forall_rankM_lt_deferredAcceptance`: weak Pareto optimality for the men;
* README 3.1, `not_exists_truthful_stable_mechanism`: Roth's impossibility theorem;
* README 3.2, `rankM_deferredAcceptance_le_updateMan`: truth-telling is a dominant strategy for the
  men (Dubins–Freedman, Roth).

Every headline of the README is stated.
-/

public section

noncomputable section

namespace TauCetiRoadmap.StableMatching

/-- A **marriage market** with strict preferences: each man ranks the women and « single »
(`none`), each woman ranks the men and `none`, by injective rank functions; a smaller rank is
better, and a partner ranked after `none` is unacceptable (README 0.1). -/
structure Market (M W : Type*) where
  /-- The rank a man gives to a woman, or to staying single. -/
  rankM : M → Option W → ℕ
  /-- The rank a woman gives to a man, or to staying single. -/
  rankW : W → Option M → ℕ
  /-- Men's preferences are strict. -/
  rankM_injective : ∀ m, Function.Injective (rankM m)
  /-- Women's preferences are strict. -/
  rankW_injective : ∀ w, Function.Injective (rankW w)

/-- A **matching**: a partner (or none) for each man and for each woman, consistently
(README 0.1). -/
structure Matching (M W : Type*) where
  /-- The partner of a man. -/
  man : M → Option W
  /-- The partner of a woman. -/
  woman : W → Option M
  /-- `m` is matched to `w` exactly when `w` is matched to `m`. -/
  man_eq_some_iff : ∀ m w, man m = some w ↔ woman w = some m

variable {M W : Type*}

namespace Market

variable (P : Market M W)

/-- A matching is **individually rational** when nobody is matched to an unacceptable partner
(README 0.1). -/
def IsIndividuallyRational (μ : Matching M W) : Prop :=
  (∀ m, P.rankM m (μ.man m) ≤ P.rankM m none) ∧ ∀ w, P.rankW w (μ.woman w) ≤ P.rankW w none

/-- The pair `(m, w)` **blocks** `μ` when each prefers the other to the partner `μ` gives them
(README 0.1). -/
def Blocks (μ : Matching M W) (m : M) (w : W) : Prop :=
  P.rankM m (some w) < P.rankM m (μ.man m) ∧ P.rankW w (some m) < P.rankW w (μ.woman w)

/-- A matching is **stable** when it is individually rational and no pair blocks it
(README 0.1). -/
def IsStable (μ : Matching M W) : Prop :=
  P.IsIndividuallyRational μ ∧ ∀ m w, ¬ P.Blocks μ m w

/-- The market in which man `m` states the strict preferences `r` instead of his own
(README 0.2). -/
def updateMan [DecidableEq M] (m : M) (r : Option W → ℕ) (hr : Function.Injective r) :
    Market M W where
  rankM := Function.update P.rankM m r
  rankW := P.rankW
  rankM_injective m' := by
    by_cases h : m' = m
    · subst h
      simpa using hr
    · simpa [Function.update_of_ne h] using P.rankM_injective m'
  rankW_injective := P.rankW_injective

/-- The market in which woman `w` states the strict preferences `r` instead of her own
(README 0.2). -/
def updateWoman [DecidableEq W] (w : W) (r : Option M → ℕ) (hr : Function.Injective r) :
    Market M W where
  rankM := P.rankM
  rankW := Function.update P.rankW w r
  rankM_injective := P.rankM_injective
  rankW_injective w' := by
    by_cases h : w' = w
    · subst h
      simpa using hr
    · simpa [Function.update_of_ne h] using P.rankW_injective w'

variable [Fintype M] [Fintype W] [DecidableEq M] [DecidableEq W]

/-- The proposal of man `m` when the women in `R` have rejected him: his best acceptable woman
outside `R`, if any (README 1.2). -/
def proposal (m : M) (R : Finset W) : Option W :=
  List.argmin (fun w ↦ P.rankM m (some w))
    (Finset.univ.filter fun w ↦ w ∉ R ∧ P.rankM m (some w) < P.rankM m none).toList

/-- The man woman `w` holds among the proposals `props`: her best acceptable proposer, if any
(README 1.2). -/
def held (props : M → Option W) (w : W) : Option M :=
  List.argmin (fun m ↦ P.rankW w (some m))
    (Finset.univ.filter fun m ↦ props m = some w ∧ P.rankW w (some m) < P.rankW w none).toList

/-- One round of deferred acceptance: every man proposes, every woman holds her best acceptable
proposer, and each rejected proposal is added to the proposer's rejections (README 1.2). -/
def step (R : M → Finset W) : M → Finset W := fun m ↦
  match P.proposal m (R m) with
  | none => R m
  | some w =>
    if P.held (fun m' ↦ P.proposal m' (R m')) w = some m then R m else insert w (R m)

/-- The men-proposing **deferred acceptance** algorithm: `|M| · |W| + 1` rounds from no
rejection, then each man's final proposal (README 1.2). -/
def deferredAcceptance : M → Option W :=
  let R := P.step^[Fintype.card M * Fintype.card W + 1] fun _ ↦ ∅
  fun m ↦ P.proposal m (R m)

/-! ## Layer 1: existence and the deferred acceptance algorithm -/

/-- **Gale–Shapley.** Every finite marriage market has a stable matching (README 1.1). -/
theorem exists_isStable : ∃ μ : Matching M W, P.IsStable μ := by
  sorry

/-- Deferred acceptance returns the men's side of a stable matching (README 1.2). -/
theorem exists_isStable_man_eq_deferredAcceptance :
    ∃ μ : Matching M W, μ.man = P.deferredAcceptance ∧ P.IsStable μ := by
  sorry

/-- **Gale–Shapley.** Every man likes the outcome of deferred acceptance at least as well as his
partner at any stable matching (README 1.3). -/
theorem rankM_deferredAcceptance_le {ν : Matching M W} (hν : P.IsStable ν) (m : M) :
    P.rankM m (P.deferredAcceptance m) ≤ P.rankM m (ν.man m) := by
  sorry

/-! ## Layer 2: the set of stable matchings -/

/-- **Conway's lattice, join.** Letting each man take the better of his partners at two stable
matchings gives a stable matching (README 2.1). -/
theorem exists_isStable_manSup {μ ν : Matching M W} (hμ : P.IsStable μ) (hν : P.IsStable ν) :
    ∃ ρ : Matching M W, P.IsStable ρ ∧ ∀ m, ρ.man m =
      if P.rankM m (μ.man m) ≤ P.rankM m (ν.man m) then μ.man m else ν.man m := by
  sorry

/-- **Conway's lattice, meet.** Letting each man take the worse of his partners at two stable
matchings gives a stable matching (README 2.1). -/
theorem exists_isStable_manInf {μ ν : Matching M W} (hμ : P.IsStable μ) (hν : P.IsStable ν) :
    ∃ ρ : Matching M W, P.IsStable ρ ∧ ∀ m, ρ.man m =
      if P.rankM m (ν.man m) ≤ P.rankM m (μ.man m) then μ.man m else ν.man m := by
  sorry

/-- **McVitie–Wilson, men.** The same men are single at every stable matching (README 2.2). -/
theorem man_eq_none_iff_of_isStable {μ ν : Matching M W} (hμ : P.IsStable μ)
    (hν : P.IsStable ν) (m : M) : μ.man m = none ↔ ν.man m = none := by
  sorry

/-- **McVitie–Wilson, women.** The same women are single at every stable matching
(README 2.2). -/
theorem woman_eq_none_iff_of_isStable {μ ν : Matching M W} (hμ : P.IsStable μ)
    (hν : P.IsStable ν) (w : W) : μ.woman w = none ↔ ν.woman w = none := by
  sorry

/-- **Roth.** No individually rational matching makes every man strictly better off than
deferred acceptance (README 2.3). -/
theorem not_forall_rankM_lt_deferredAcceptance [Nonempty M] {ν : Matching M W}
    (hν : P.IsIndividuallyRational ν) :
    ¬ ∀ m, P.rankM m (ν.man m) < P.rankM m (P.deferredAcceptance m) := by
  sorry

/-! ## Layer 3: incentives -/

/-- **Dubins–Freedman, Roth.** No man obtains, by stating other strict preferences, a partner
he truly prefers to the one deferred acceptance gives him (README 3.2). -/
theorem rankM_deferredAcceptance_le_updateMan (m : M) (r : Option W → ℕ)
    (hr : Function.Injective r) :
    P.rankM m (P.deferredAcceptance m) ≤
      P.rankM m ((P.updateMan m r hr).deferredAcceptance m) := by
  sorry

end Market

/-- **Roth's impossibility theorem.** With at least two men and two women, no mechanism that
returns a stable matching for every market makes truth-telling a dominant strategy for every
agent (README 3.1). -/
theorem not_exists_truthful_stable_mechanism [Fintype M] [Fintype W] [DecidableEq M]
    [DecidableEq W] (hM : 2 ≤ Fintype.card M) (hW : 2 ≤ Fintype.card W) :
    ¬ ∃ h : Market M W → Matching M W, (∀ P, P.IsStable (h P)) ∧
      (∀ P m r hr, P.rankM m ((h P).man m) ≤ P.rankM m ((h (P.updateMan m r hr)).man m)) ∧
      ∀ P w r hr, P.rankW w ((h P).woman w) ≤ P.rankW w ((h (P.updateWoman w r hr)).woman w) := by
  sorry

end TauCetiRoadmap.StableMatching
