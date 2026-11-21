import Mathlib
import TauCeti.Probability.Kernel.PMF

/-!
# Repeated games and bargaining: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here: Nash's bargaining theorem with the existence and
uniqueness of the Nash point (1.1, 1.2), Rubinstein's theorem on alternating offers in its two
halves (2.2, 2.3), the folk theorem for average payoffs (4.2) and the Nash-threat folk theorem
with discounting (5.2). The README's Checks and API facts are not restated.

The multi-stage objects `StageProfile`, `play` and `IsStageSubgamePerfect` are copied verbatim
from ExtensiveFormGames, Layer 5 (5.1), and `simplex`, `expectedUtility` and `IsNash` from
RegretMinimizationAndEquilibria (its Conventions and 3.1). The behavioural profiles of repeated
games and the law of their infinite play are defined here, through Tau Ceti's `Kernel.ofPMF` and
Mathlib's Ionescu-Tulcea construction `Kernel.trajMeasure`.
-/

noncomputable section

open Finset Filter Topology MeasureTheory ProbabilityTheory

namespace TauCetiRoadmap.RepeatedGamesAndBargaining

/-! ## Layer 1: Nash's bargaining theorem -/

/-- 1.1 A two-person bargaining problem `(S, d)` (Karlin–Peres, Definition 12.4.2): `S` is
compact and convex, every point of `S` weakly dominates `d`, and some point of `S` strictly
dominates `d`. -/
def IsBargainingProblem (S : Set (ℝ × ℝ)) (d : ℝ × ℝ) : Prop :=
  IsCompact S ∧ Convex ℝ S ∧ (∀ x ∈ S, d ≤ x) ∧ ∃ x ∈ S, d.1 < x.1 ∧ d.2 < x.2

/-- 1.1 The Nash product `(x₁ − d₁)(x₂ − d₂)`. -/
def nashProduct (d x : ℝ × ℝ) : ℝ := (x.1 - d.1) * (x.2 - d.2)

/-- 1.1 `a` maximizes the Nash product on `S`. -/
def IsNashPoint (S : Set (ℝ × ℝ)) (d a : ℝ × ℝ) : Prop :=
  a ∈ S ∧ ∀ x ∈ S, nashProduct d x ≤ nashProduct d a

/-- 1.1 The Nash product has exactly one maximizer on a bargaining problem (Karlin–Peres,
Remark 12.4.5). -/
theorem existsUnique_isNashPoint {S : Set (ℝ × ℝ)} {d : ℝ × ℝ} (hS : IsBargainingProblem S d) :
    ∃! a, IsNashPoint S d a :=
  sorry

/-- 1.2 The affine map `x ↦ (α₁ x₁ + β₁, α₂ x₂ + β₂)`. -/
def scaleShift (α β : ℝ × ℝ) (x : ℝ × ℝ) : ℝ × ℝ := (α.1 * x.1 + β.1, α.2 * x.2 + β.2)

/-- 1.2 `F` chooses a point of `S` on every bargaining problem. -/
def IsBargainingSolution (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) : Prop :=
  ∀ S d, IsBargainingProblem S d → F S d ∈ S

/-- 1.2 Affine covariance. -/
def IsAffineCovariantSolution (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) : Prop :=
  ∀ S d (α β : ℝ × ℝ), IsBargainingProblem S d → 0 < α.1 → 0 < α.2 →
    F (scaleShift α β '' S) (scaleShift α β d) = scaleShift α β (F S d)

/-- 1.2 Pareto optimality: no point of `S` weakly dominates `F S d` except itself. -/
def IsParetoSolution (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) : Prop :=
  ∀ S d, IsBargainingProblem S d → ∀ a ∈ S, F S d ≤ a → a = F S d

/-- 1.2 Symmetry: on a problem symmetric under exchanging the coordinates, with `d₁ = d₂`, both
players receive the same payoff. -/
def IsSymmetricSolution (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) : Prop :=
  ∀ S d, IsBargainingProblem S d → d.1 = d.2 → (∀ x ∈ S, x.swap ∈ S) → (F S d).1 = (F S d).2

/-- 1.2 Independence of irrelevant alternatives. -/
def IsIIASolution (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) : Prop :=
  ∀ S S' d, IsBargainingProblem S d → IsBargainingProblem S' d → S ⊆ S' → F S' d ∈ S →
    F S d = F S' d

/-- 1.2 Nash's bargaining theorem (Karlin–Peres, Theorem 12.4.6): a map satisfies the four
axioms if and only if it chooses the Nash point on every bargaining problem. -/
theorem nash_bargaining (F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ) :
    (IsBargainingSolution F ∧ IsAffineCovariantSolution F ∧ IsParetoSolution F ∧
        IsSymmetricSolution F ∧ IsIIASolution F) ↔
      ∀ S d, IsBargainingProblem S d → IsNashPoint S d (F S d) :=
  sorry

/-! ## Layer 2: alternating offers -/

section MultiStage

variable {N : Type*} {A : N → Type*}

/-- 2.1 (copied verbatim from ExtensiveFormGames, 5.1): a pure strategy profile of a multi-stage
game with observed actions: at stage `t`, each player's action as a function of the observed
history of action profiles. -/
abbrev StageProfile (N : Type*) (A : N → Type*) :=
  ∀ i, (t : ℕ) → (Fin t → ∀ j, A j) → A i

/-- 2.1 (copied verbatim from ExtensiveFormGames, 5.1): the play from the history `h` of length
`t₀` on: `h`, then the actions of `s`. -/
def play (s : StageProfile N A) (t₀ : ℕ) (h : Fin t₀ → ∀ j, A j) : ℕ → ∀ j, A j
  | t => if ht : t < t₀ then h ⟨t, ht⟩ else fun i ↦ s i t fun k ↦ play s t₀ h k
termination_by t => t
decreasing_by exact k.isLt

variable [DecidableEq N]

/-- 2.1 (copied verbatim from ExtensiveFormGames, 5.1): subgame perfection of a pure profile
against pure deviations after every history. -/
def IsStageSubgamePerfect (u : N → (ℕ → ∀ j, A j) → ℝ) (s : StageProfile N A) : Prop :=
  ∀ i (s' : (t : ℕ) → (Fin t → ∀ j, A j) → A i) t₀ (h : Fin t₀ → ∀ j, A j),
    u i (play (Function.update s i s') t₀ h) ≤ u i (play s t₀ h)

end MultiStage

/-- 2.1 The action of a player at a stage of the bargaining game: an offer, read as player `0`'s
share of the pie `[0, 1]`, and an answer, `true` for acceptance. -/
abbrev BargainingAction := unitInterval × Bool

/-- 2.1 The proposer in round `k`: player `0` in even rounds, player `1` in odd rounds. -/
def proposer (k : ℕ) : Fin 2 := if k % 2 = 0 then 0 else 1

/-- 2.1 The responder in round `k`. -/
def responder (k : ℕ) : Fin 2 := if k % 2 = 0 then 1 else 0

/-- 2.1 The offer of round `k` on a play: the proposer's offer at stage `2k`. -/
def offerAt (ω : ℕ → Fin 2 → BargainingAction) (k : ℕ) : ℝ :=
  ((ω (2 * k) (proposer k)).1 : ℝ)

/-- 2.1 The offer of round `k` is accepted: the responder's answer at stage `2k + 1`. -/
def AcceptedAt (ω : ℕ → Fin 2 → BargainingAction) (k : ℕ) : Prop :=
  (ω (2 * k + 1) (responder k)).2 = true

open Classical in
/-- 2.1 The payoffs of alternating offers with discount factors `δ`: if the first accepted offer
is that of round `k`, with share `x` for player `0`, player `0` receives `δ₀ ^ k x` and player
`1` receives `δ₁ ^ k (1 − x)`; perpetual disagreement gives `0` to both. -/
def bargainingPayoff (δ : Fin 2 → ℝ) (i : Fin 2) (ω : ℕ → Fin 2 → BargainingAction) : ℝ :=
  if h : ∃ k, AcceptedAt ω k then
    δ i ^ Nat.find h * (if i = 0 then offerAt ω (Nat.find h) else 1 - offerAt ω (Nat.find h))
  else 0

/-- 2.1 A history of length `t` is open when no offer was accepted in it. -/
def IsOpenHistory {t : ℕ} (h : Fin t → Fin 2 → BargainingAction) : Prop :=
  ∀ k (hk : 2 * k + 1 < t), (h ⟨2 * k + 1, hk⟩ (responder k)).2 = false

/-- 2.2 Player `0`'s share in Rubinstein's equilibrium in round `k`:
`(1 − δ₁)/(1 − δ₀ δ₁)` when player `0` proposes, `δ₀ (1 − δ₁)/(1 − δ₀ δ₁)` when player `1`
proposes. -/
def rubinsteinShare (δ : Fin 2 → ℝ) (k : ℕ) : ℝ :=
  if k % 2 = 0 then (1 - δ 1) / (1 - δ 0 * δ 1) else δ 0 * (1 - δ 1) / (1 - δ 0 * δ 1)

/-- 2.2 Rubinstein's profile: the proposer of round `k` offers `rubinsteinShare δ k`; in an even
round player `1` accepts an offer `y` exactly when `y ≤ rubinsteinShare δ k`, in an odd round
player `0` accepts exactly when `rubinsteinShare δ k ≤ y`. -/
def rubinsteinProfile (δ : Fin 2 → ℝ) : StageProfile (Fin 2) (fun _ ↦ BargainingAction) :=
  fun _ t h ↦
    (Set.projIcc 0 1 zero_le_one (rubinsteinShare δ (t / 2)),
      if ht : t % 2 = 1 then
        if (t / 2) % 2 = 0 then
          decide (((h ⟨t - 1, by omega⟩ (proposer (t / 2))).1 : ℝ) ≤ rubinsteinShare δ (t / 2))
        else
          decide (rubinsteinShare δ (t / 2) ≤ ((h ⟨t - 1, by omega⟩ (proposer (t / 2))).1 : ℝ))
      else false)

/-- 2.2 Rubinstein's profile is subgame perfect when both discount factors lie in `[0, 1)`. -/
theorem isStageSubgamePerfect_rubinsteinProfile {δ : Fin 2 → ℝ}
    (hδ : ∀ i, 0 ≤ δ i ∧ δ i < 1) :
    IsStageSubgamePerfect (bargainingPayoff δ) (rubinsteinProfile δ) :=
  sorry

/-- 2.3 Uniqueness of the outcome: after every open history of `2k` stages, every
subgame-perfect profile agrees in round `k` on Rubinstein's share. -/
theorem acceptedAt_and_offerAt_of_isStageSubgamePerfect {δ : Fin 2 → ℝ}
    (hδ : ∀ i, 0 < δ i ∧ δ i < 1) {s : StageProfile (Fin 2) (fun _ ↦ BargainingAction)}
    (hs : IsStageSubgamePerfect (bargainingPayoff δ) s) (k : ℕ)
    (h : Fin (2 * k) → Fin 2 → BargainingAction) (hh : IsOpenHistory h) :
    AcceptedAt (play s (2 * k) h) k ∧ offerAt (play s (2 * k) h) k = rubinsteinShare δ k :=
  sorry

/-! ## Layer 3: repeated games -/

section FiniteGame

variable {N : Type*} [Fintype N] [DecidableEq N] {A : N → Type*} [∀ i, Fintype (A i)]
  [∀ i, Nonempty (A i)] [∀ i, DecidableEq (A i)]

/-- 3.1 (copied verbatim from RegretMinimizationAndEquilibria, Conventions): the probability
simplex on a finite type, as a set of weight vectors: the weights of Mathlib's
`Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-- 3.1 (copied verbatim from RegretMinimizationAndEquilibria, 3.1): the expected utility of
player `i` under the mixed profile `σ`. -/
def expectedUtility (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) (i : N) : ℝ :=
  ∑ a : ∀ j, A j, (∏ j, σ j (a j)) * u i a

/-- 3.1 (copied verbatim from RegretMinimizationAndEquilibria, 3.1): `σ` is a mixed Nash
equilibrium. -/
def IsNash (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) : Prop :=
  (∀ i, σ i ∈ simplex (A i)) ∧
    ∀ i, ∀ τ ∈ simplex (A i),
      expectedUtility u (Function.update σ i τ) i ≤ expectedUtility u σ i

/-- 3.1 The payoff polytope: the convex hull of the payoff vectors of the action profiles. -/
def payoffPolytope (u : N → (∀ i, A i) → ℝ) : Set (N → ℝ) :=
  convexHull ℝ (Set.range fun a i ↦ u i a)

/-- 3.1 The minmax value of player `i`: the least, over independent mixed strategies of the
other players, of the best payoff of `i` against them. -/
def minmaxValue (u : N → (∀ i, A i) → ℝ) (i : N) : ℝ :=
  sInf ((fun x ↦ ⨆ b : A i, expectedUtility u (Function.update x i (Pi.single b 1)) i) ''
    {x | ∀ j, j ≠ i → x j ∈ simplex (A j)})

/-- 3.2 A behavioural strategy profile of the repeated game: at stage `t`, each player's mixed
action as a function of the history of action profiles. -/
abbrev BehaviouralProfile (N : Type*) (A : N → Type*) :=
  ∀ i, (t : ℕ) → (Fin t → ∀ j, A j) → PMF (A i)

/-- 3.2 The law of an action profile drawn independently by the players. -/
def jointPMF (p : ∀ i, PMF (A i)) : PMF (∀ i, A i) :=
  PMF.ofFintype (fun a ↦ ∏ i, p i (a i)) (by
    rw [← Fintype.prod_sum (fun i b ↦ p i b)]
    exact Finset.prod_eq_one fun i _ ↦ by
      have h := (p i).tsum_coe
      rwa [tsum_fintype] at h)

variable [∀ i, MeasurableSpace (A i)] [∀ i, MeasurableSingletonClass (A i)]

/-- 3.2 The law of the play after the history `h` of length `t₀`: the coordinate `m` is the
action profile of stage `t₀ + m`. -/
def playLaw (σ : BehaviouralProfile N A) (t₀ : ℕ) (h : Fin t₀ → ∀ j, A j) :
    Measure (ℕ → ∀ j, A j) :=
  Kernel.trajMeasure (X := fun _ ↦ ∀ j, A j) (jointPMF fun i ↦ σ i t₀ h).toMeasure
    (fun n ↦ Kernel.ofPMF fun x : (Π _ : Iic n, ∀ j, A j) ↦
      jointPMF fun i ↦ σ i (t₀ + (n + 1))
        (Fin.append h fun k : Fin (n + 1) ↦ x ⟨k, mem_Iic.2 (Nat.lt_succ_iff.1 k.2)⟩))

/-! ## Layer 4: the folk theorem for average payoffs -/

/-- 4.1 The average of the payoffs of player `i` over the first `T` stages of the play `ω`. -/
def averagePayoff (u : N → (∀ i, A i) → ℝ) (i : N) (ω : ℕ → ∀ j, A j) (T : ℕ) : ℝ :=
  (∑ t ∈ range T, u i (ω t)) / T

/-- 4.1 A Nash equilibrium of the infinitely repeated game with average payoffs, with average
payoff vector `g` (Karlin–Peres, Definition 6.4.9): the averages converge almost surely, the
expectation of the limit of player `j` is `g j`, and no deviation of `j` has an expected upper
limit of the averages above `g j`. -/
def IsAverageNash (u : N → (∀ i, A i) → ℝ) (σ : BehaviouralProfile N A) (g : N → ℝ) : Prop :=
  ∀ j, (∀ᵐ ω ∂playLaw σ 0 Fin.elim0, ∃ c, Tendsto (averagePayoff u j ω) atTop (𝓝 c)) ∧
    ∫ ω, limsup (averagePayoff u j ω) atTop ∂playLaw σ 0 Fin.elim0 = g j ∧
    ∀ τ : (t : ℕ) → (Fin t → ∀ k, A k) → PMF (A j),
      ∫ ω, limsup (averagePayoff u j ω) atTop ∂playLaw (Function.update σ j τ) 0 Fin.elim0 ≤
        g j

/-- 4.2 The folk theorem for average payoffs (Karlin–Peres, Theorem 6.4.10): the average payoff
vectors of the Nash equilibria of the infinitely repeated game are exactly the individually
rational points of the payoff polytope. -/
theorem exists_isAverageNash_iff (u : N → (∀ i, A i) → ℝ) (g : N → ℝ) :
    (∃ σ, IsAverageNash u σ g) ↔ g ∈ payoffPolytope u ∧ ∀ i, minmaxValue u i ≤ g i :=
  sorry

/-! ## Layer 5: the Nash-threat folk theorem with discounting -/

/-- 5.1 The normalized discounted payoff of player `i` after the history `h` of length `t₀`. -/
def discountedPayoff (u : N → (∀ i, A i) → ℝ) (δ : ℝ) (σ : BehaviouralProfile N A) (t₀ : ℕ)
    (h : Fin t₀ → ∀ j, A j) (i : N) : ℝ :=
  (1 - δ) * ∫ ω, ∑' m, δ ^ m * u i (ω m) ∂playLaw σ t₀ h

/-- 5.1 Subgame perfection in the discounted repeated game: after every history no player gains
by any behavioural deviation. -/
def IsDiscountedSubgamePerfect (u : N → (∀ i, A i) → ℝ) (δ : ℝ) (σ : BehaviouralProfile N A) :
    Prop :=
  ∀ t₀ (h : Fin t₀ → ∀ j, A j) i (τ : (t : ℕ) → (Fin t → ∀ k, A k) → PMF (A i)),
    discountedPayoff u δ (Function.update σ i τ) t₀ h i ≤ discountedPayoff u δ σ t₀ h i

/-- 5.2 The Nash-threat folk theorem without public randomization: a point of the payoff
polytope that gives every player more than a stage-game Nash equilibrium is, for every `ε > 0`
and every discount factor close enough to `1`, within `ε` of the payoff vector of a
subgame-perfect equilibrium. -/
theorem exists_isDiscountedSubgamePerfect (u : N → (∀ i, A i) → ℝ) {x : ∀ i, A i → ℝ}
    (hx : IsNash u x) {v : N → ℝ} (hv : v ∈ payoffPolytope u)
    (hxv : ∀ i, expectedUtility u x i < v i) {ε : ℝ} (hε : 0 < ε) :
    ∃ δ₀ < 1, ∀ δ, δ₀ < δ → δ < 1 → ∃ σ, IsDiscountedSubgamePerfect u δ σ ∧
      ∀ i, |discountedPayoff u δ σ 0 Fin.elim0 i - v i| ≤ ε :=
  sorry

end FiniteGame

end TauCetiRoadmap.RepeatedGamesAndBargaining
