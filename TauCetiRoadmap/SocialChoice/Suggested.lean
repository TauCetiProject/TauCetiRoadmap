import Mathlib

/-!
# Social choice: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining Checks and route lemmas are not
restated.

Alternatives form a type `α`, finite or not, and voters a type `ι`. A weak preference is a total
transitive relation on `α`, read "is at least as good as", and a linear preference is an
antisymmetric weak preference. A profile is a function from voters to
preferences. Social welfare functions return a weak preference; social choice functions return a
set of alternatives, and resolute ones a single alternative. Counts of voters are `Set.ncard`, and
every statement that counts voters assumes `[Finite ι]`.
-/

namespace TauCetiRoadmap.SocialChoice

/-! ## Layer 1: preferences, profiles and majorities -/

/-- 1.1 A weak preference on `α`: a total and transitive relation, a total preorder. `R.rel x y`
reads "`x` is at least as good as `y`". -/
structure WeakPref (α : Type*) where
  /-- The relation "is at least as good as". -/
  rel : α → α → Prop
  /-- Any two alternatives are compared. -/
  total : Std.Total rel
  /-- The relation is transitive. -/
  trans : IsTrans α rel

/-- 1.1 A linear preference: a weak preference with no indifference between distinct
alternatives, that is, a linear order on `α` with the better alternative first. -/
structure LinPref (α : Type*) extends WeakPref α where
  /-- Distinct alternatives are never indifferent. -/
  antisymm : Std.Antisymm rel

/-- 1.1 The strict part of a weak preference: `x` is strictly better than `y`. -/
def WeakPref.P {α : Type*} (R : WeakPref α) (x y : α) : Prop :=
  R.rel x y ∧ ¬R.rel y x

/-- 1.1 The linear preference obtained by renaming the alternatives by `π`: it ranks `π x`
above `π y` exactly when `r` ranks `x` above `y`. -/
def LinPref.map {α : Type*} (π : Equiv.Perm α) (r : LinPref α) : LinPref α where
  rel x y := r.rel (π.symm x) (π.symm y)
  total := ⟨fun x y => r.total.total (π.symm x) (π.symm y)⟩
  trans := ⟨fun _ _ _ hxy hyz => r.trans.trans _ _ _ hxy hyz⟩
  antisymm := ⟨fun _ _ hxy hyx => π.symm.injective (r.antisymm.antisymm _ _ hxy hyx)⟩

variable {ι α : Type*}

/-- 1.2 The majority relation of a profile: more voters strictly prefer `x` to `y` than `y`
to `x`. -/
def majorityPrefers (p : ι → LinPref α) (x y : α) : Prop :=
  {i | (p i).P y x}.ncard < {i | (p i).P x y}.ncard

/-- 1.2 A Condorcet winner beats every other alternative by majority. -/
def IsCondorcetWinner (p : ι → LinPref α) (m : α) : Prop :=
  ∀ y, y ≠ m → majorityPrefers p m y

/-- 1.2 A weak Condorcet winner is beaten by no alternative by majority. -/
def IsWeakCondorcetWinner (p : ι → LinPref α) (m : α) : Prop :=
  ∀ y, ¬majorityPrefers p y m

/-- 1.2 The majority rule as a social choice function: the set of weak Condorcet winners. For
two alternatives it chooses the alternative preferred by more voters, and both on a tie. -/
def majorityWinners (p : ι → LinPref α) : Set α :=
  {m | IsWeakCondorcetWinner p m}

/-! ## Layer 2: Arrow's theorem -/

/-- 2.1 The Pareto condition for a social welfare function whose ballots, of type `β`, are read
as weak preferences through `w`: if every voter strictly prefers `x` to `y`, so does society. -/
def IsPareto {β : Type*} (w : β → WeakPref α) (F : (ι → β) → WeakPref α) : Prop :=
  ∀ p x y, (∀ i, (w (p i)).P x y) → (F p).P x y

/-- 2.1 Independence of irrelevant alternatives: the social comparison of `x` and `y` depends
only on the voters' comparisons of `x` and `y`, in both directions. -/
def IsIIA {β : Type*} (w : β → WeakPref α) (F : (ι → β) → WeakPref α) : Prop :=
  ∀ p q x y, (∀ i, ((w (p i)).rel x y ↔ (w (q i)).rel x y) ∧
      ((w (p i)).rel y x ↔ (w (q i)).rel y x)) →
    ((F p).rel x y ↔ (F q).rel x y)

/-- 2.1 Voter `i` is a dictator: whenever `i` strictly prefers `x` to `y`, so does society. -/
def IsDictator {β : Type*} (w : β → WeakPref α) (F : (ι → β) → WeakPref α) (i : ι) : Prop :=
  ∀ p x y, (w (p i)).P x y → (F p).P x y

/-- 2.2 The Kirman–Sondermann theorem. On at least three alternatives, finitely or infinitely
many, a social welfare function on profiles of linear preferences satisfies the Pareto condition
and independence of irrelevant alternatives if and only if there is an ultrafilter `U` on the
voters such that society strictly prefers `x` to `y` exactly when the voters who strictly prefer
`x` to `y` form a set in `U`. The set of voters may be infinite. -/
theorem isPareto_and_isIIA_iff_exists_ultrafilter (hα : 3 ≤ ENat.card α)
    (F : (ι → LinPref α) → WeakPref α) :
    IsPareto LinPref.toWeakPref F ∧ IsIIA LinPref.toWeakPref F ↔
      ∃ U : Ultrafilter ι, ∀ p x y, (F p).P x y ↔ {i | (p i).P x y} ∈ U := by
  sorry

/-- 2.3 Arrow's theorem for linear ballots. With finitely many voters and at least three
alternatives, finitely or infinitely many, a social welfare function from profiles of linear
preferences to weak preferences that satisfies the Pareto condition and independence of
irrelevant alternatives has a dictator. It is the classical form of Arrow's theorem; it follows
from 2.2 and also from 2.4. -/
theorem exists_isDictator_of_isPareto_of_isIIA [Finite ι]
    (hα : 3 ≤ ENat.card α) (F : (ι → LinPref α) → WeakPref α)
    (hP : IsPareto LinPref.toWeakPref F) (hI : IsIIA LinPref.toWeakPref F) :
    ∃ i, IsDictator LinPref.toWeakPref F i := by
  sorry

/-- 2.4 Arrow's theorem for weak ballots. With finitely many voters and at least three
alternatives, finitely or infinitely many, a social welfare function from profiles of weak
preferences to weak preferences that satisfies the Pareto condition and independence of
irrelevant alternatives has a dictator. -/
theorem exists_isDictator_of_isPareto_of_isIIA_weakPref [Finite ι]
    (hα : 3 ≤ ENat.card α) (F : (ι → WeakPref α) → WeakPref α)
    (hP : IsPareto id F) (hI : IsIIA id F) :
    ∃ i, IsDictator id F i := by
  sorry

/-! ## Layer 3: majority on two alternatives and liberal rights -/

/-- 3.1 Anonymity of a social choice function: permuting the voters does not change the
chosen set. -/
def IsAnonymous (F : (ι → LinPref α) → Set α) : Prop :=
  ∀ (σ : Equiv.Perm ι) p, F (p ∘ σ) = F p

/-- 3.1 Neutrality of a social choice function: renaming the alternatives in every ballot
renames the chosen set. -/
def IsNeutral (F : (ι → LinPref α) → Set α) : Prop :=
  ∀ (π : Equiv.Perm α) p, F (fun i => (p i).map π) = π '' F p

/-- 3.1 Positive responsiveness: if `x` is chosen at `p`, and `q` is a different profile in
which every voter who ranks `x` above some `y` at `p` still does, while the comparisons between
alternatives other than `x` are unchanged, then `x` alone is chosen at `q`. -/
def IsPositivelyResponsive (F : (ι → LinPref α) → Set α) : Prop :=
  ∀ p q x, x ∈ F p → p ≠ q → (∀ i y, (p i).P x y → (q i).P x y) →
    (∀ i y z, y ≠ x → z ≠ x → ((p i).P y z ↔ (q i).P y z)) → F q = {x}

/-- 3.1 May's theorem. For finitely many voters and exactly two alternatives, a social choice
function with nonempty values is anonymous, neutral and positively responsive if and only if it
is the majority rule. -/
theorem isAnonymous_and_isNeutral_and_isPositivelyResponsive_iff [Finite ι] [Fintype α]
    (hα : Fintype.card α = 2) (F : (ι → LinPref α) → Set α) (hne : ∀ p, (F p).Nonempty) :
    IsAnonymous F ∧ IsNeutral F ∧ IsPositivelyResponsive F ↔ F = majorityWinners := by
  sorry

/-- 3.2 The Pareto condition for a social choice function: an alternative that every voter
ranks strictly below another is not chosen. -/
def IsParetoChoice (F : (ι → LinPref α) → Set α) : Prop :=
  ∀ p x y, (∀ i, (p i).P x y) → y ∉ F p

/-- 3.2 Voter `i` is decisive over the distinct alternatives `x` and `y` in both directions:
whichever of the two `i` ranks lower is not chosen. -/
def IsDecisiveOver (F : (ι → LinPref α) → Set α) (i : ι) (x y : α) : Prop :=
  x ≠ y ∧ ∀ p, ((p i).P x y → y ∉ F p) ∧ ((p i).P y x → x ∉ F p)

/-- 3.2 Sen's theorem on the impossibility of a Paretian liberal. No social choice function
with nonempty values satisfies the Pareto condition while two different voters are each
decisive in both directions over some pair of distinct alternatives. -/
theorem false_of_isParetoChoice_of_isDecisiveOver (F : (ι → LinPref α) → Set α)
    (hne : ∀ p, (F p).Nonempty) (hP : IsParetoChoice F) {i j : ι} (hij : i ≠ j)
    {x₁ y₁ x₂ y₂ : α} (h₁ : IsDecisiveOver F i x₁ y₁) (h₂ : IsDecisiveOver F j x₂ y₂) :
    False := by
  sorry

/-! ## Layer 4: monotonicity and manipulation -/

/-- 4.1 Strong monotonicity of a resolute social choice function: if every voter who ranks the
winner `F p` above some `y` at `p` still does at `q`, then `F p` also wins at `q`. -/
def IsStronglyMonotone (F : (ι → LinPref α) → α) : Prop :=
  ∀ p q, (∀ i y, (p i).P (F p) y → (q i).P (F p) y) → F q = F p

/-- 4.1 A resolute social choice function is dictatorial on its range when some voter `i` gets,
at every profile, the alternative that `i` ranks highest among the possible winners. -/
def IsDictatorialOnRange (F : (ι → LinPref α) → α) : Prop :=
  ∃ i, ∀ p, ∀ y ∈ Set.range F, y ≠ F p → (p i).P (F p) y

/-- 4.1 The Muller–Satterthwaite theorem, in the form with the range. With finitely many voters,
a strongly monotone resolute social choice function with at least three possible winners, finitely
or infinitely many, is dictatorial on its range. -/
theorem isDictatorialOnRange_of_isStronglyMonotone [Finite ι]
    (F : (ι → LinPref α) → α) (h3 : 3 ≤ (Set.range F).encard) (hF : IsStronglyMonotone F) :
    IsDictatorialOnRange F := by
  sorry

/-- 4.2 Strategy-proofness of a resolute social choice function: no voter, by replacing the
ballot `p i` with any other ballot `b`, obtains an alternative that `p i` strictly prefers. -/
def IsStrategyProof [DecidableEq ι] (F : (ι → LinPref α) → α) : Prop :=
  ∀ (p : ι → LinPref α) i (b : LinPref α), ¬(p i).P (F (Function.update p i b)) (F p)

/-- 4.2 The Gibbard–Satterthwaite theorem, in the form with the range. With finitely many
voters, a strategy-proof resolute social choice function with at least three possible winners,
finitely or infinitely many, is dictatorial on its range. -/
theorem isDictatorialOnRange_of_isStrategyProof [Finite ι] [DecidableEq ι]
    (F : (ι → LinPref α) → α) (h3 : 3 ≤ (Set.range F).encard) (hF : IsStrategyProof F) :
    IsDictatorialOnRange F := by
  sorry

/-! ## Layer 5: single-peaked preferences -/

/-- 5.1 A linear preference is single-peaked at `t` with respect to the order of `α` (the
axis): of two alternatives on the same side of `t`, the one nearer to `t` is strictly
preferred. Then `t` is the top of the preference. -/
def IsSinglePeakedAt [LinearOrder α] (r : LinPref α) (t : α) : Prop :=
  ∀ x y, (t ≤ x ∧ x < y) ∨ (y < x ∧ x ≤ t) → r.P x y

/-- 5.1 The median voter theorem. In a profile of preferences single-peaked at the peaks `t i`,
an alternative `m` such that more than half of the peaks lie at or below `m` and more than half
lie at or above `m` is a Condorcet winner. -/
theorem isCondorcetWinner_of_median [LinearOrder α] [Finite ι] (p : ι → LinPref α)
    (t : ι → α) (hp : ∀ i, IsSinglePeakedAt (p i) (t i)) (m : α)
    (hl : Nat.card ι < 2 * {i | t i ≤ m}.ncard) (hr : Nat.card ι < 2 * {i | m ≤ t i}.ncard) :
    IsCondorcetWinner p m := by
  sorry

/-- 5.1 Every profile of single-peaked preferences, with any finite number of voters, has a weak
Condorcet winner. -/
theorem exists_isWeakCondorcetWinner [LinearOrder α] [Nonempty α] [Finite ι]
    (p : ι → LinPref α) (hp : ∀ i, ∃ t, IsSinglePeakedAt (p i) t) :
    ∃ m, IsWeakCondorcetWinner p m := by
  sorry

/-- 5.2 For a profile of single-peaked preferences with finitely many voters, the strict
majority relation is transitive. -/
theorem majorityPrefers_trans [LinearOrder α] [Finite ι] (p : ι → LinPref α)
    (hp : ∀ i, ∃ t, IsSinglePeakedAt (p i) t) {x y z : α} (hxy : majorityPrefers p x y)
    (hyz : majorityPrefers p y z) : majorityPrefers p x z := by
  sorry

/-- 5.3 The Condorcet rule cannot be manipulated: if `a` is the Condorcet winner of `p` and `c`
is the Condorcet winner after voter `i` changes ballot, then `i` does not strictly prefer `c`
to `a`. -/
theorem not_P_of_isCondorcetWinner_update [Finite ι] [DecidableEq ι] (p : ι → LinPref α)
    (i : ι) (b : LinPref α) {a c : α} (ha : IsCondorcetWinner p a)
    (hc : IsCondorcetWinner (Function.update p i b) c) : ¬(p i).P c a := by
  sorry

end TauCetiRoadmap.SocialChoice
