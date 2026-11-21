import Mathlib

/-!
# Potential games and the price of anarchy: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets and Checks are not
restated.

Games are given by costs, which players minimize: `C i a` is the cost of player `i` at the pure
profile `a`. The utility games of the roadmap RegretMinimizationAndEquilibria (its Conventions)
are the cost games `fun i a ↦ -u i a`. The probability simplex `simplex` and the coarse correlated
equilibria `IsCoarseCorrelatedEq` are copied verbatim from that roadmap's `Suggested.lean`
(Conventions and Section 3.2), so that this file imports no other roadmap.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.PotentialGamesAndPriceOfAnarchy

/-- Conventions (copied verbatim from RegretMinimizationAndEquilibria, Conventions): the
probability simplex on a finite type, as a set of weight vectors. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-! ## Layer 1: potential games -/

section Potential

variable {N : Type*} [Fintype N] [DecidableEq N] {A : N → Type*}

/-- 1.1 A pure Nash equilibrium of the cost game `C`: no player lowers its cost by a unilateral
deviation. -/
def IsPureNash (C : N → (∀ i, A i) → ℝ) (a : ∀ i, A i) : Prop :=
  ∀ i (b : A i), C i a ≤ C i (Function.update a i b)

/-- 1.1 `Φ` is an exact potential of `C`: every unilateral deviation changes the deviator's cost
and `Φ` by the same amount. -/
def IsExactPotential (C : N → (∀ i, A i) → ℝ) (Φ : (∀ i, A i) → ℝ) : Prop :=
  ∀ a i (b : A i), C i (Function.update a i b) - C i a = Φ (Function.update a i b) - Φ a

/-- 1.1 `Φ` is a generalized ordinal potential of `C`: every unilateral deviation that strictly
lowers the deviator's cost strictly lowers `Φ`. -/
def IsGeneralizedOrdinalPotential (C : N → (∀ i, A i) → ℝ) (Φ : (∀ i, A i) → ℝ) : Prop :=
  ∀ a i (b : A i), C i (Function.update a i b) < C i a → Φ (Function.update a i b) < Φ a

/-- 1.2 An improvement step from `a` to `a'`: some player `i` changes only its own strategy and
strictly lowers its cost. -/
def IsImprovementStep (C : N → (∀ i, A i) → ℝ) (a a' : ∀ i, A i) : Prop :=
  ∃ i, a' = Function.update a i (a' i) ∧ C i a' < C i a

/-- 1.2 The finite improvement property: there is no infinite sequence of improvement steps. -/
def HasFiniteImprovementProperty (C : N → (∀ i, A i) → ℝ) : Prop :=
  ¬ ∃ s : ℕ → ∀ i, A i, ∀ k, IsImprovementStep C (s k) (s (k + 1))

/-- 1.3 The profile reached from `a` by the unilateral deviations of the list `s`, in order;
a deviation `⟨i, b⟩` sets player `i`'s strategy to `b`. -/
def deviateAlong (a : ∀ i, A i) (s : List (Σ i, A i)) : ∀ i, A i :=
  s.foldl (fun x d ↦ Function.update x d.1 d.2) a

/-- 1.3 The total change in the deviators' costs along the deviations of `s` from `a`: each
deviation contributes the change in the cost of the player who deviates. -/
def pathCostChange (C : N → (∀ i, A i) → ℝ) : (∀ i, A i) → List (Σ i, A i) → ℝ
  | _, [] => 0
  | a, d :: s =>
      (C d.1 (Function.update a d.1 d.2) - C d.1 a) +
        pathCostChange C (Function.update a d.1 d.2) s

/-- 1.2 A finite game with nonempty strategy sets and a generalized ordinal potential has a pure
Nash equilibrium (a minimizer of the potential is one). -/
theorem exists_isPureNash_of_isGeneralizedOrdinalPotential [∀ i, Fintype (A i)]
    [∀ i, Nonempty (A i)] (C : N → (∀ i, A i) → ℝ) (Φ : (∀ i, A i) → ℝ)
    (hΦ : IsGeneralizedOrdinalPotential C Φ) : ∃ a, IsPureNash C a := by
  sorry

/-- 1.2 Monderer–Shapley: a finite game has the finite improvement property if and only if it
has a generalized ordinal potential. -/
theorem hasFiniteImprovementProperty_iff [∀ i, Fintype (A i)] (C : N → (∀ i, A i) → ℝ) :
    HasFiniteImprovementProperty C ↔ ∃ Φ, IsGeneralizedOrdinalPotential C Φ := by
  sorry

/-- 1.3 Monderer–Shapley: a game has an exact potential if and only if the deviators' costs
change by zero in total along every closed path of unilateral deviations. -/
theorem exists_isExactPotential_iff_closedPath (C : N → (∀ i, A i) → ℝ) :
    (∃ Φ, IsExactPotential C Φ) ↔
      ∀ a (s : List (Σ i, A i)), deviateAlong a s = a → pathCostChange C a s = 0 := by
  sorry

/-- 1.3 Monderer–Shapley: it suffices to test the closed paths of four deviations in which two
distinct players each deviate and then return. -/
theorem exists_isExactPotential_iff_fourCycle (C : N → (∀ i, A i) → ℝ) :
    (∃ Φ, IsExactPotential C Φ) ↔
      ∀ (a : ∀ i, A i) (i j : N), i ≠ j → ∀ (b : A i) (c : A j),
        (C i (Function.update a i b) - C i a) +
          (C j (Function.update (Function.update a i b) j c) - C j (Function.update a i b)) +
          (C i (Function.update a j c) - C i (Function.update (Function.update a i b) j c)) +
          (C j a - C j (Function.update a j c)) = 0 := by
  sorry

end Potential

/-! ## Layer 2: congestion games -/

/-- 2.1 A congestion game: player `i`'s strategy `b : A i` uses the set of resources
`uses i b`, and a resource used by `k` players costs `resourceCost e k` to each of them. -/
structure CongestionGame (N E : Type*) (A : N → Type*) where
  /-- The resources used by each strategy. -/
  uses : ∀ i, A i → Finset E
  /-- The cost of a resource as a function of the number of its users. -/
  resourceCost : E → ℕ → ℝ

namespace CongestionGame

variable {N E : Type*} [Fintype N] [DecidableEq N] [DecidableEq E] {A : N → Type*}

/-- 2.1 The load of resource `e` at the profile `a`: the number of players whose strategy uses
`e`. -/
def load (G : CongestionGame N E A) (a : ∀ i, A i) (e : E) : ℕ :=
  #{i | e ∈ G.uses i (a i)}

/-- 2.1 The cost of player `i` at `a`: the sum of the costs of the resources it uses. -/
def playerCost (G : CongestionGame N E A) : N → (∀ i, A i) → ℝ :=
  fun i a ↦ ∑ e ∈ G.uses i (a i), G.resourceCost e (G.load a e)

/-- 2.1 Rosenthal's potential `Σ_e Σ_{k=1}^{load e} resourceCost e k`. -/
def rosenthalPotential [Fintype E] (G : CongestionGame N E A) (a : ∀ i, A i) : ℝ :=
  ∑ e, ∑ k ∈ Icc 1 (G.load a e), G.resourceCost e k

/-- 2.1 Rosenthal: every congestion game is an exact potential game, with Rosenthal's potential;
no hypothesis on the resource costs. -/
theorem isExactPotential_rosenthalPotential [Fintype E] (G : CongestionGame N E A) :
    IsExactPotential G.playerCost G.rosenthalPotential := by
  sorry

/-- 2.1 Rosenthal: every congestion game with finite nonempty strategy sets has a pure Nash
equilibrium. -/
theorem exists_isPureNash [Fintype E] [∀ i, Fintype (A i)] [∀ i, Nonempty (A i)]
    (G : CongestionGame N E A) : ∃ a, IsPureNash G.playerCost a := by
  sorry

end CongestionGame

/-! ## Layer 3: smooth games and coarse correlated equilibria -/

section Smooth

variable {N : Type*} [Fintype N] [DecidableEq N] {A : N → Type*}

/-- 3.1 The social cost of a profile: the sum of the players' costs. -/
def socialCost (C : N → (∀ i, A i) → ℝ) (a : ∀ i, A i) : ℝ :=
  ∑ i, C i a

/-- 3.1 Roughgarden's `(λ, μ)`-smoothness of a cost game: for all profiles `a` and `o`, the costs
of the deviations of each player from `a` to its strategy in `o` sum to at most
`λ · socialCost o + μ · socialCost a`. -/
def IsSmooth (C : N → (∀ i, A i) → ℝ) (lam mu : ℝ) : Prop :=
  ∀ a o : ∀ i, A i,
    ∑ i, C i (Function.update a i (o i)) ≤ lam * socialCost C o + mu * socialCost C a

/-- 3.2 (copied verbatim from RegretMinimizationAndEquilibria, Section 3.2) `μ` is a coarse
correlated equilibrium of the utility game `u` with per-player tolerances `ε`. -/
def IsCoarseCorrelatedEq [∀ i, Fintype (A i)] (u : N → (∀ i, A i) → ℝ) (μ : (∀ i, A i) → ℝ)
    (ε : N → ℝ) : Prop :=
  μ ∈ simplex (∀ i, A i) ∧
    ∀ i, ∀ b : A i, ∑ a, μ a * u i (Function.update a i b) ≤ ∑ a, μ a * u i a + ε i

/-- 3.2 Roughgarden's extension theorem: in a `(λ, μ)`-smooth cost game with `μ < 1`, every
coarse correlated equilibrium `ν` of the utility game `-C` with tolerances `ε` has expected
social cost at most `(λ · socialCost o + Σ_i ε i) / (1 - μ)`, for every profile `o`. -/
theorem expectedSocialCost_le_of_isSmooth [∀ i, Fintype (A i)] (C : N → (∀ i, A i) → ℝ)
    {lam mu : ℝ} (hmu : mu < 1) (hC : IsSmooth C lam mu) {ν : (∀ i, A i) → ℝ} {ε : N → ℝ}
    (hν : IsCoarseCorrelatedEq (fun i a ↦ -C i a) ν ε) (o : ∀ i, A i) :
    ∑ a, ν a * socialCost C a ≤ (lam * socialCost C o + ∑ i, ε i) / (1 - mu) := by
  sorry

end Smooth

/-! ## Layer 4: the price of anarchy of affine congestion games -/

namespace CongestionGame

variable {N E : Type*} [Fintype N] [DecidableEq N] [Fintype E] [DecidableEq E] {A : N → Type*}

/-- 4.1 Christodoulou–Koutsoupias, Awerbuch–Azar–Epstein: a congestion game with affine resource
costs `α e * k + β e`, `α e ≥ 0`, `β e ≥ 0`, is `(5/3, 1/3)`-smooth. -/
theorem isSmooth_of_affine (G : CongestionGame N E A) (α β : E → ℝ) (hα : ∀ e, 0 ≤ α e)
    (hβ : ∀ e, 0 ≤ β e) (hG : ∀ e k, G.resourceCost e k = α e * k + β e) :
    IsSmooth G.playerCost (5 / 3) (1 / 3) := by
  sorry

/-- 4.2 Awerbuch–Azar–Epstein, Christodoulou–Koutsoupias: in a congestion game with affine
resource costs with nonnegative coefficients, every pure Nash equilibrium has social cost at most
`5/2` times that of every profile. -/
theorem socialCost_le_of_isPureNash_of_affine (G : CongestionGame N E A) (α β : E → ℝ)
    (hα : ∀ e, 0 ≤ α e) (hβ : ∀ e, 0 ≤ β e) (hG : ∀ e k, G.resourceCost e k = α e * k + β e)
    {a : ∀ i, A i} (ha : IsPureNash G.playerCost a) (o : ∀ i, A i) :
    socialCost G.playerCost a ≤ 5 / 2 * socialCost G.playerCost o := by
  sorry

/-- 4.2 The bound `5/2` for coarse correlated equilibria (Roughgarden): with finite strategy sets,
every coarse correlated equilibrium of the utility game `-playerCost` with zero tolerances has
expected social cost at most `5/2` times the social cost of every profile. -/
theorem expectedSocialCost_le_of_affine [∀ i, Fintype (A i)] (G : CongestionGame N E A)
    (α β : E → ℝ) (hα : ∀ e, 0 ≤ α e) (hβ : ∀ e, 0 ≤ β e)
    (hG : ∀ e k, G.resourceCost e k = α e * k + β e) {ν : (∀ i, A i) → ℝ}
    (hν : IsCoarseCorrelatedEq (fun i a ↦ -G.playerCost i a) ν 0) (o : ∀ i, A i) :
    ∑ a, ν a * socialCost G.playerCost a ≤ 5 / 2 * socialCost G.playerCost o := by
  sorry

end CongestionGame

/-! ## Layer 5: nonatomic congestion games and Wardrop equilibria -/

/-- 5.1 A nonatomic congestion game: commodity `k` has the finite set of routes `P k`, route `p`
uses the resources `uses k p`, the commodity has total demand `demand k`, and resource `e` has
latency `latency e x` when it carries the amount `x`. A routing network is the case where the
resources are the edges of a directed graph and the routes of `k` are its `s_k`–`t_k` paths. -/
structure NonatomicGame (K E : Type*) (P : K → Type*) where
  /-- The resources used by each route. -/
  uses : ∀ k, P k → Finset E
  /-- The demand of each commodity. -/
  demand : K → ℝ
  /-- The latency of each resource as a function of its load. -/
  latency : E → ℝ → ℝ

namespace NonatomicGame

variable {K E : Type*} {P : K → Type*} [Fintype K] [∀ k, Fintype (P k)] [Fintype E]
  [DecidableEq E]

/-- 5.1 A feasible flow: nonnegative amounts on the routes of each commodity summing to its
demand. -/
def IsFeasible (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) : Prop :=
  (∀ k p, 0 ≤ f k p) ∧ ∀ k, ∑ p, f k p = G.demand k

/-- 5.1 The load of resource `e`: the total flow on the routes that use it. -/
def load (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) (e : E) : ℝ :=
  ∑ k, ∑ p with e ∈ G.uses k p, f k p

/-- 5.1 The latency of route `p` of commodity `k`: the sum of the latencies of its resources. -/
def routeLatency (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) (k : K) (p : P k) : ℝ :=
  ∑ e ∈ G.uses k p, G.latency e (G.load f e)

/-- 5.1 A Wardrop equilibrium: a feasible flow whose used routes have the least latency among the
routes of their commodity. -/
def IsWardrop (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) : Prop :=
  G.IsFeasible f ∧ ∀ k (p q : P k), 0 < f k p → G.routeLatency f k p ≤ G.routeLatency f k q

/-- 5.1 Beckmann's potential `Σ_e ∫_0^{load e} latency e`. -/
def beckmann (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) : ℝ :=
  ∑ e, ∫ x in (0 : ℝ)..G.load f e, G.latency e x

/-- 5.4 The total latency (social cost) `Σ_e load e · latency e (load e)`. -/
def totalLatency (G : NonatomicGame K E P) (f : ∀ k, P k → ℝ) : ℝ :=
  ∑ e, G.load f e * G.latency e (G.load f e)

/-- 5.2 With latencies continuous on `[0, ∞)`, every feasible minimizer of Beckmann's potential
over the feasible flows is a Wardrop equilibrium. -/
theorem isWardrop_of_isMinOn (G : NonatomicGame K E P)
    (hG : ∀ e, ContinuousOn (G.latency e) (Set.Ici 0)) {f : ∀ k, P k → ℝ}
    (hf : G.IsFeasible f) (hmin : IsMinOn G.beckmann {g | G.IsFeasible g} f) :
    G.IsWardrop f := by
  sorry

/-- 5.2 With latencies nondecreasing on `[0, ∞)`, every Wardrop equilibrium minimizes Beckmann's
potential over the feasible flows. -/
theorem isMinOn_of_isWardrop (G : NonatomicGame K E P)
    (hG : ∀ e, MonotoneOn (G.latency e) (Set.Ici 0)) {f : ∀ k, P k → ℝ} (hf : G.IsWardrop f) :
    IsMinOn G.beckmann {g | G.IsFeasible g} f := by
  sorry

/-- 5.2 Beckmann–McGuire–Winsten: if some flow is feasible and the latencies are continuous on
`[0, ∞)`, a Wardrop equilibrium exists. -/
theorem exists_isWardrop (G : NonatomicGame K E P)
    (hG : ∀ e, ContinuousOn (G.latency e) (Set.Ici 0)) (hfeas : ∃ g, G.IsFeasible g) :
    ∃ f, G.IsWardrop f := by
  sorry

/-- 5.3 With latencies nondecreasing on `[0, ∞)`, any two Wardrop equilibria give every resource
the same latency. -/
theorem latency_load_eq_of_isWardrop (G : NonatomicGame K E P)
    (hG : ∀ e, MonotoneOn (G.latency e) (Set.Ici 0)) {f g : ∀ k, P k → ℝ} (hf : G.IsWardrop f)
    (hg : G.IsWardrop g) (e : E) : G.latency e (G.load f e) = G.latency e (G.load g e) := by
  sorry

/-- 5.4 Roughgarden–Tardos: with affine latencies `α e * x + β e`, `α e ≥ 0`, `β e ≥ 0`, the total
latency of a Wardrop equilibrium is at most `4/3` times that of every feasible flow. -/
theorem totalLatency_le_of_affine (G : NonatomicGame K E P) (α β : E → ℝ) (hα : ∀ e, 0 ≤ α e)
    (hβ : ∀ e, 0 ≤ β e) (hG : ∀ e x, G.latency e x = α e * x + β e) {f g : ∀ k, P k → ℝ}
    (hf : G.IsWardrop f) (hg : G.IsFeasible g) :
    G.totalLatency f ≤ 4 / 3 * G.totalLatency g := by
  sorry

end NonatomicGame

end TauCetiRoadmap.PotentialGamesAndPriceOfAnarchy
