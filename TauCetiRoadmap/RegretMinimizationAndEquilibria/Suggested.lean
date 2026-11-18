import Mathlib

/-!
# Regret minimization and equilibria in games: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib API,
with the definitions they need; every headline theorem of the README is statable at the pins and
is stated here. Discharging them finishes neither a milestone nor the roadmap. The `sorry` proofs
are targets, not completed results.

Suppliers: Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`,
`IsSaddlePointOn`, `Sion.exists_isSaddlePointOn`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`, `Matrix.rowStochastic`, `Metric.infDist`,
`Metric.diam`, `convexHull_diam`, `exists_norm_eq_iInf_of_complete_convex`,
`norm_eq_iInf_iff_real_inner_le_zero`; Tau Ceti
`Convexity.StdSimplex.convex_range_toFun_comp_weights` and
`TauCeti.brouwerFixedPoint_compactConvex_continuousOn`.
`Matrix.payoff`, `Matrix.exists_saddle_point` and `Matrix.exists_mixedNash` take the names and
orientations of Mathlib PR #39393, and `Matrix.rowStochastic.exists_stationary_distribution` the
name of Mathlib PR #34713, so that Mathlib's declarations can take their place.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.RegretMinimizationAndEquilibria

/-- The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-! ## Layer 1: online learning over the simplex -/

section Online

variable {ι : Type*} [Fintype ι] [Nonempty ι]

/-- A deterministic online algorithm: the strategy at time `t` from the payoffs before `t`. -/
abbrev OnlineAlgorithm (ι : Type*) := (t : ℕ) → (Fin t → ι → ℝ) → (ι → ℝ)

/-- The strategies an online algorithm plays against the payoff sequence `u`. -/
def OnlineAlgorithm.play (A : OnlineAlgorithm ι) (u : ℕ → ι → ℝ) (t : ℕ) : ι → ℝ :=
  A t fun s ↦ u s

/-- The regret of the plays `p` against action `a` after `T` rounds. -/
def regret (p u : ℕ → ι → ℝ) (T : ℕ) (a : ι) : ℝ :=
  ∑ t ∈ range T, (u t a - p t ⬝ᵥ u t)

/-- The swap regret of the plays `p` after `T` rounds. -/
def swapRegret (p u : ℕ → ι → ℝ) (T : ℕ) : ℝ :=
  ⨆ φ : ι → ι, ∑ t ∈ range T, ∑ a, p t a * (u t (φ a) - u t a)

/-- `u` has range `Δ`: at each time its values lie in an interval of length `Δ`. -/
def HasRange (u : ℕ → ι → ℝ) (Δ : ℝ) : Prop :=
  ∃ c : ℕ → ℝ, ∀ t a, c t ≤ u t a ∧ u t a ≤ c t + Δ

/-- 1.1: regret against a mixed comparator is the `q`-average of the regrets against actions. -/
theorem sum_sub_eq_sum_mul_regret (p u : ℕ → ι → ℝ) {q : ι → ℝ} (hq : q ∈ simplex ι)
    (T : ℕ) :
    ∑ t ∈ range T, (q ⬝ᵥ u t - p t ⬝ᵥ u t) = ∑ a, q a * regret p u T a :=
  sorry

/-- 1.1: external regret is at most swap regret. -/
theorem regret_le_swapRegret (p u : ℕ → ι → ℝ) (hp : ∀ t, p t ∈ simplex ι) (T : ℕ) (a : ι) :
    regret p u T a ≤ swapRegret p u T :=
  sorry

/-- 1.1: the instantaneous regret is bounded by the range. -/
theorem abs_instRegret_le (p u : ℕ → ι → ℝ) (hp : ∀ t, p t ∈ simplex ι) {Δ : ℝ}
    (hu : HasRange u Δ) (t : ℕ) (a : ι) : |u t a - p t ⬝ᵥ u t| ≤ Δ :=
  sorry

/-- Hedge with learning rate `η`. -/
def hedge (η : ℝ) : OnlineAlgorithm ι := fun _ past a ↦
  Real.exp (η * ∑ s, past s a) / ∑ b, Real.exp (η * ∑ s, past s b)

/-- 1.2: the regret bound of Hedge. -/
theorem hedge_regret_le {η Δ : ℝ} (hη : 0 < η) (u : ℕ → ι → ℝ) (hu : HasRange u Δ) (T : ℕ)
    (a : ι) :
    regret ((hedge η).play u) u T a ≤
      Real.log (Fintype.card ι) / η + η * Δ ^ 2 * T / 8 :=
  sorry

/-- 1.2: the regret bound of Hedge at the learning rate `√(8 log n / T) / Δ`. -/
theorem hedge_regret_le_sqrt {Δ : ℝ} (hΔ : 0 < Δ) (hn : 2 ≤ Fintype.card ι) (u : ℕ → ι → ℝ)
    (hu : HasRange u Δ) {T : ℕ} (hT : 1 ≤ T) (a : ι) :
    regret ((hedge (Real.sqrt (8 * Real.log (Fintype.card ι) / T) / Δ)).play u) u T a ≤
      Δ * Real.sqrt (T * Real.log (Fintype.card ι) / 2) :=
  sorry

/-- The regret-matching strategy for a cumulative regret vector `R`. -/
def rmStrategy (R : ι → ℝ) : ι → ℝ :=
  if 0 < ∑ a, max (R a) 0 then fun a ↦ max (R a) 0 / ∑ b, max (R b) 0
  else fun _ ↦ 1 / Fintype.card ι

/-- The cumulative regret vector of regret matching against `u`. -/
def rmRegret (u : ℕ → ι → ℝ) : ℕ → ι → ℝ
  | 0 => 0
  | t + 1 => fun a ↦ rmRegret u t a + (u t a - rmStrategy (rmRegret u t) ⬝ᵥ u t)

/-- 1.3: the squared positive part of the cumulative regret is at most the sum of the squared
instantaneous regrets. -/
theorem regretMatching_sum_sq_pos_le (u : ℕ → ι → ℝ) (T : ℕ) :
    ∑ a, max (rmRegret u T a) 0 ^ 2 ≤
      ∑ t ∈ range T, ∑ a, (u t a - rmStrategy (rmRegret u t) ⬝ᵥ u t) ^ 2 :=
  sorry

/-- 1.3: the regret bound of regret matching. -/
theorem regretMatching_regret_le {Δ : ℝ} (u : ℕ → ι → ℝ) (hu : HasRange u Δ) (T : ℕ)
    (a : ι) :
    regret (fun t ↦ rmStrategy (rmRegret u t)) u T a ≤
      Δ * Real.sqrt (Fintype.card ι * T) :=
  sorry

/-- 1.3: the regret bound of regret matching with time-varying ranges. -/
theorem regretMatching_regret_le_of_ranges (u : ℕ → ι → ℝ) (Δ c : ℕ → ℝ)
    (hu : ∀ t a, c t ≤ u t a ∧ u t a ≤ c t + Δ t) (T : ℕ) (a : ι) :
    regret (fun t ↦ rmStrategy (rmRegret u t)) u T a ≤
      Real.sqrt (Fintype.card ι * ∑ t ∈ range T, Δ t ^ 2) :=
  sorry

/-- The state of regret matching+ against `u`. -/
def rmPlusState (u : ℕ → ι → ℝ) : ℕ → ι → ℝ
  | 0 => 0
  | t + 1 => fun a ↦ max (rmPlusState u t a +
      (u t a - rmStrategy (rmPlusState u t) ⬝ᵥ u t)) 0

/-- 1.4: the regret bound of regret matching+. -/
theorem regretMatchingPlus_regret_le {Δ : ℝ} (u : ℕ → ι → ℝ) (hu : HasRange u Δ) (T : ℕ)
    (a : ι) :
    regret (fun t ↦ rmStrategy (rmPlusState u t)) u T a ≤
      Δ * Real.sqrt (Fintype.card ι * T) :=
  sorry

/-- The mixed extension of a vector payoff `r`: the expected payoff when the players mix with
weights `p` and `q`. -/
def mixedPayoff {κ E : Type*} [Fintype κ] [AddCommMonoid E] [Module ℝ E] (r : ι → κ → E)
    (p : ι → ℝ) (q : κ → ℝ) : E :=
  ∑ i, ∑ j, (p i * q j) • r i j

/-- `S` is response-satisfiable for `r`: against every mixed `q` there is a mixed `p` whose
expected payoff lies in `S`. -/
def ResponseSatisfiable {κ E : Type*} [Fintype κ] [AddCommMonoid E] [Module ℝ E]
    (r : ι → κ → E) (S : Set E) : Prop :=
  ∀ q ∈ simplex κ, ∃ p ∈ simplex ι, mixedPayoff r p q ∈ S

/-- 1.5: Blackwell's approachability theorem with rate `D / √T`. -/
theorem blackwell_approachability {κ E : Type*} [Fintype κ] [Nonempty κ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    (r : ι → κ → E) {S : Set E} (hne : S.Nonempty) (hcl : IsClosed S) (hcv : Convex ℝ S)
    (hresp : ResponseSatisfiable r S) :
    ∃ σ : (t : ℕ) → (Fin t → κ → ℝ) → (ι → ℝ),
      (∀ t h, σ t h ∈ simplex ι) ∧
      ∀ q : ℕ → κ → ℝ, (∀ t, q t ∈ simplex κ) → ∀ T : ℕ, 1 ≤ T →
        Metric.infDist ((1 / (T : ℝ)) • ∑ t ∈ range T,
            mixedPayoff r (σ t fun s ↦ q s) (q t)) S ≤
          Metric.diam (Set.range fun ij : ι × κ ↦ r ij.1 ij.2) / Real.sqrt T :=
  sorry

/-- 1.5: the converse of Blackwell's theorem: a closed set that is not response-satisfiable
is avoided by a constant mixed strategy of the opponent. -/
theorem blackwell_converse {κ E : Type*} [Fintype κ] [Nonempty κ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    (r : ι → κ → E) {S : Set E} (hne : S.Nonempty) (hcl : IsClosed S)
    (hresp : ¬ ResponseSatisfiable r S) :
    ∃ q₀ ∈ simplex κ, ∃ δ : ℝ, 0 < δ ∧
      ∀ p : ℕ → ι → ℝ, (∀ t, p t ∈ simplex ι) → ∀ T : ℕ, 1 ≤ T →
        δ ≤ Metric.infDist ((1 / (T : ℝ)) • ∑ t ∈ range T, mixedPayoff r (p t) q₀) S :=
  sorry

end Online

/-! ## Layer 2: two-player zero-sum matrix games -/

section MatrixGame

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [Nonempty ι] [Nonempty κ]

/-- The expected payoff `x ⬝ᵥ (M *ᵥ y)` (Mathlib PR #39393, generalized index types). -/
def _root_.Matrix.payoff (M : Matrix ι κ ℝ) (x : ι → ℝ) (y : κ → ℝ) : ℝ := x ⬝ᵥ (M *ᵥ y)

/-- 2.1: a saddle point in Mathlib's orientation (the row strategy minimizes). -/
theorem _root_.Matrix.exists_saddle_point (M : Matrix ι κ ℝ) :
    ∃ a ∈ simplex ι, ∃ b ∈ simplex κ, IsSaddlePointOn (simplex ι) (simplex κ) M.payoff a b :=
  sorry

/-- 2.1: von Neumann's minimax theorem in the textbook orientation (the row player
maximizes). -/
theorem _root_.Matrix.exists_mixedNash (M : Matrix ι κ ℝ) :
    ∃ a ∈ simplex ι, ∃ b ∈ simplex κ,
      (∀ x ∈ simplex ι, M.payoff x b ≤ M.payoff a b) ∧
      ∀ y ∈ simplex κ, M.payoff a b ≤ M.payoff a y :=
  sorry

/-- 2.1: the minimax equality, with suprema and infima indexed by the simplices as types. -/
theorem _root_.Matrix.iSup_iInf_payoff_eq (M : Matrix ι κ ℝ) :
    ⨆ x : simplex ι, ⨅ y : simplex κ, M.payoff x y =
      ⨅ y : simplex κ, ⨆ x : simplex ι, M.payoff x y :=
  sorry

/-- 2.2: the averages of two no-regret players are mixed strategies, and their duality gap is
at most the sum of the regrets divided by `T`. -/
theorem gap_le_of_regret (M : Matrix ι κ ℝ) (x : ℕ → ι → ℝ) (y : ℕ → κ → ℝ)
    (hx : ∀ t, x t ∈ simplex ι) (hy : ∀ t, y t ∈ simplex κ) {T : ℕ} (hT : 1 ≤ T)
    {R₁ R₂ : ℝ} (h₁ : ∀ i, regret x (fun t ↦ M *ᵥ y t) T i ≤ R₁)
    (h₂ : ∀ j, regret y (fun t ↦ -(x t ᵥ* M)) T j ≤ R₂) :
    let xbar := (1 / (T : ℝ)) • ∑ t ∈ range T, x t
    let ybar := (1 / (T : ℝ)) • ∑ t ∈ range T, y t
    xbar ∈ simplex ι ∧ ybar ∈ simplex κ ∧
      ∀ x' ∈ simplex ι, ∀ y' ∈ simplex κ,
        M.payoff x' ybar - M.payoff xbar y' ≤ (R₁ + R₂) / T :=
  sorry

/-- 2.2: regret-matching self-play reaches an `ε`-equilibrium with
`ε ≤ Δ (√|ι| + √|κ|) / √T`. -/
theorem regretMatching_selfPlay_gap_le (M : Matrix ι κ ℝ) {c Δ : ℝ}
    (hM : ∀ i j, c ≤ M i j ∧ M i j ≤ c + Δ) (x : ℕ → ι → ℝ) (y : ℕ → κ → ℝ)
    (hx : ∀ t, x t = rmStrategy (rmRegret (fun s ↦ M *ᵥ y s) t))
    (hy : ∀ t, y t = rmStrategy (rmRegret (fun s ↦ -(x s ᵥ* M)) t)) {T : ℕ} (hT : 1 ≤ T) :
    let xbar := (1 / (T : ℝ)) • ∑ t ∈ range T, x t
    let ybar := (1 / (T : ℝ)) • ∑ t ∈ range T, y t
    ∀ x' ∈ simplex ι, ∀ y' ∈ simplex κ,
      M.payoff x' ybar - M.payoff xbar y' ≤
        Δ * (Real.sqrt (Fintype.card ι) + Real.sqrt (Fintype.card κ)) / Real.sqrt T :=
  sorry

end MatrixGame

/-! ## Layer 3: finite games and correlated equilibria -/

section FiniteGame

variable {N : Type*} [Fintype N] [DecidableEq N] {A : N → Type*} [∀ i, Fintype (A i)]
  [∀ i, Nonempty (A i)] [∀ i, DecidableEq (A i)]

/-- The expected utility of player `i` under the mixed profile `σ`. -/
def expectedUtility (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) (i : N) : ℝ :=
  ∑ a : ∀ j, A j, (∏ j, σ j (a j)) * u i a

/-- `σ` is a mixed Nash equilibrium. -/
def IsNash (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) : Prop :=
  (∀ i, σ i ∈ simplex (A i)) ∧
    ∀ i, ∀ τ ∈ simplex (A i),
      expectedUtility u (Function.update σ i τ) i ≤ expectedUtility u σ i

/-- 3.1: it suffices to test pure deviations. -/
theorem isNash_iff_pure (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ)
    (hσ : ∀ i, σ i ∈ simplex (A i)) :
    IsNash u σ ↔ ∀ i (b : A i),
      expectedUtility u (Function.update σ i (Pi.single b 1)) i ≤ expectedUtility u σ i :=
  sorry

/-- 3.1: every finite game has a mixed Nash equilibrium. -/
theorem exists_isNash (u : N → (∀ i, A i) → ℝ) : ∃ σ, IsNash u σ :=
  sorry

/-- `μ` is a coarse correlated equilibrium with per-player tolerances `ε`. -/
def IsCoarseCorrelatedEq (u : N → (∀ i, A i) → ℝ) (μ : (∀ i, A i) → ℝ) (ε : N → ℝ) : Prop :=
  μ ∈ simplex (∀ i, A i) ∧
    ∀ i, ∀ b : A i, ∑ a, μ a * u i (Function.update a i b) ≤ ∑ a, μ a * u i a + ε i

/-- `μ` is a correlated equilibrium with per-player tolerances `ε`. -/
def IsCorrelatedEq (u : N → (∀ i, A i) → ℝ) (μ : (∀ i, A i) → ℝ) (ε : N → ℝ) : Prop :=
  μ ∈ simplex (∀ i, A i) ∧
    ∀ i, ∀ φ : A i → A i,
      ∑ a, μ a * u i (Function.update a i (φ (a i))) ≤ ∑ a, μ a * u i a + ε i

/-- The payoff sequence of player `i` against the other players' mixed strategies. -/
def deviationPayoff (u : N → (∀ i, A i) → ℝ) (σ : ℕ → ∀ i, A i → ℝ) (i : N) :
    ℕ → A i → ℝ :=
  fun t b ↦ expectedUtility u (Function.update (σ t) i (Pi.single b 1)) i

/-- The empirical distribution of the product profiles over `T` rounds. -/
def empiricalDistribution (σ : ℕ → ∀ i, A i → ℝ) (T : ℕ) : (∀ i, A i) → ℝ :=
  fun a ↦ (1 / (T : ℝ)) * ∑ t ∈ range T, ∏ j, σ t j (a j)

/-- 3.3: the empirical distribution of no-external-regret play is an approximate coarse
correlated equilibrium. -/
theorem isCoarseCorrelatedEq_of_regret (u : N → (∀ i, A i) → ℝ) (σ : ℕ → ∀ i, A i → ℝ)
    (hσ : ∀ t i, σ t i ∈ simplex (A i)) {T : ℕ} (hT : 1 ≤ T) (R : N → ℝ)
    (hR : ∀ i b, regret (fun t ↦ σ t i) (deviationPayoff u σ i) T b ≤ R i) :
    IsCoarseCorrelatedEq u (empiricalDistribution σ T) fun i ↦ R i / T :=
  sorry

/-- 3.3: the empirical distribution of no-swap-regret play is an approximate correlated
equilibrium. -/
theorem isCorrelatedEq_of_swapRegret (u : N → (∀ i, A i) → ℝ) (σ : ℕ → ∀ i, A i → ℝ)
    (hσ : ∀ t i, σ t i ∈ simplex (A i)) {T : ℕ} (hT : 1 ≤ T) (SR : N → ℝ)
    (hSR : ∀ i, swapRegret (fun t ↦ σ t i) (deviationPayoff u σ i) T ≤ SR i) :
    IsCorrelatedEq u (empiricalDistribution σ T) fun i ↦ SR i / T :=
  sorry

end FiniteGame

section BlumMansour

variable {ι : Type*} [Fintype ι] [Nonempty ι]

/-- 3.4: every row-stochastic matrix on a finite nonempty type has a stationary distribution
(the name and vector form of Mathlib PR #34713). -/
theorem _root_.Matrix.rowStochastic.exists_stationary_distribution [DecidableEq ι]
    {Q : Matrix ι ι ℝ} (hQ : Q ∈ rowStochastic ℝ ι) : ∃ p, p ∈ simplex ι ∧ p ᵥ* Q = p :=
  sorry

/-- 3.4: the Blum–Mansour master algorithm has swap regret at most the sum of the external
regrets of its copies. Row `b` of `Q t` is copy `b`'s strategy, `p t` is stationary for `Q t`,
and copy `b` is fed `p t b • u t`. -/
theorem swapRegret_le_sum_regret (u : ℕ → ι → ℝ) (Q : ℕ → Matrix ι ι ℝ) (p : ℕ → ι → ℝ)
    (hstat : ∀ t, p t ᵥ* Q t = p t) (T : ℕ) :
    swapRegret p u T ≤
      ∑ b, ⨆ a, regret (fun t ↦ Q t b) (fun t ↦ p t b • u t) T a :=
  sorry

/-- 3.4: with regret matching in every copy, the swap regret is at most `Δ n √T`. -/
theorem blumMansour_regretMatching_le {Δ : ℝ} (u : ℕ → ι → ℝ) (hu : HasRange u Δ)
    (Q : ℕ → Matrix ι ι ℝ) (p : ℕ → ι → ℝ) (hp : ∀ t, p t ∈ simplex ι)
    (hstat : ∀ t, p t ᵥ* Q t = p t)
    (hQ : ∀ t b, Q t b = rmStrategy (rmRegret (fun s ↦ p s b • u s) t)) (T : ℕ) :
    swapRegret p u T ≤ Δ * Fintype.card ι * Real.sqrt T :=
  sorry

end BlumMansour

/-! ## Layer 4: sequential decision processes and CFR -/

section Sequential

variable {J : Type*} [Fintype J] {A : J → Type*} [∀ j, Fintype (A j)] [∀ j, Nonempty (A j)]
  [DecidableEq J] [∀ j, DecidableEq (A j)]

/-- The sequence-form polytope of the decision process with parent map `parent`. -/
def sequenceFormPolytope (parent : J → Option (Σ j, A j)) : Set (Option (Σ j, A j) → ℝ) :=
  {x | x none = 1 ∧ (∀ s, 0 ≤ x s) ∧ ∀ j, ∑ a, x (some ⟨j, a⟩) = x (parent j)}

/-- `x` is the sequence form of the weights `b`. -/
def IsSequenceForm (parent : J → Option (Σ j, A j)) (b : ∀ j, A j → ℝ)
    (x : Option (Σ j, A j) → ℝ) : Prop :=
  x none = 1 ∧ ∀ j a, x (some ⟨j, a⟩) = x (parent j) * b j a

/-- `W` satisfies the best-response recursion for the utility vector `ℓ`. -/
def IsBestResponseValue (parent : J → Option (Σ j, A j)) (ℓ : Option (Σ j, A j) → ℝ)
    (W : (Σ j, A j) → ℝ) : Prop :=
  ∀ s : Σ j, A j, W s = ℓ (some s) +
    ∑ j' ∈ univ.filter (fun j' ↦ parent j' = some s), ⨆ a', W ⟨j', a'⟩

/-- `V` satisfies the counterfactual-value recursion for the utility vector `ℓ` and the
weights `b`. -/
def IsCounterfactualValue (parent : J → Option (Σ j, A j)) (ℓ : Option (Σ j, A j) → ℝ)
    (b : ∀ j, A j → ℝ) (V : (Σ j, A j) → ℝ) : Prop :=
  ∀ s : Σ j, A j, V s = ℓ (some s) +
    ∑ j' ∈ univ.filter (fun j' ↦ parent j' = some s), ∑ a', b j' a' * V ⟨j', a'⟩

/-- The local regret at the decision point `j` against the action `a` after `T` rounds. -/
def localRegret (b : ℕ → ∀ j, A j → ℝ) (V : ℕ → (Σ j, A j) → ℝ) (T : ℕ) (j : J) (a : A j) :
    ℝ :=
  ∑ t ∈ range T, (V t ⟨j, a⟩ - ∑ a', b t j a' * V t ⟨j, a'⟩)

/-- Counterfactual regret minimization against the utility vectors `ℓ`: `x t` is the sequence
form of `b t`, `V t` are the counterfactual values, and `b t j` is the regret-matching strategy
of the local regrets at `j`. -/
def IsCFR (parent : J → Option (Σ j, A j)) (ℓ : ℕ → Option (Σ j, A j) → ℝ)
    (b : ℕ → ∀ j, A j → ℝ) (x : ℕ → Option (Σ j, A j) → ℝ) (V : ℕ → (Σ j, A j) → ℝ) : Prop :=
  (∀ t, IsSequenceForm parent (b t) (x t)) ∧
    (∀ t, IsCounterfactualValue parent (ℓ t) (b t) (V t)) ∧
    ∀ t j, b t j = rmStrategy (localRegret b V t j)

/-- 4.1: Kuhn's theorem in sequence form: the sequence-form polytope consists of the sequence
forms of the behavioral strategies. -/
theorem mem_sequenceFormPolytope_iff (parent : J → Option (Σ j, A j)) (ρ : J → ℕ)
    (hρ : ∀ j j' a, parent j = some ⟨j', a⟩ → ρ j' < ρ j) (x : Option (Σ j, A j) → ℝ) :
    x ∈ sequenceFormPolytope parent ↔
      ∃ b : ∀ j, A j → ℝ, (∀ j, b j ∈ simplex (A j)) ∧ IsSequenceForm parent b x :=
  sorry

/-- 4.1: the maximum of a linear function over the sequence-form polytope is attained and is
computed by the best-response recursion. -/
theorem isGreatest_linear_bestResponse (parent : J → Option (Σ j, A j)) (ρ : J → ℕ)
    (hρ : ∀ j j' a, parent j = some ⟨j', a⟩ → ρ j' < ρ j) (ℓ : Option (Σ j, A j) → ℝ)
    (W : (Σ j, A j) → ℝ) (hW : IsBestResponseValue parent ℓ W) :
    IsGreatest ((fun x ↦ ∑ s, ℓ s * x s) '' sequenceFormPolytope parent)
      (ℓ none + ∑ j ∈ univ.filter (fun j ↦ parent j = none), ⨆ a, W ⟨j, a⟩) :=
  sorry

/-- 4.2: the laminar regret decomposition: the regret against a point of the sequence-form
polytope is at most the sum of the positive parts of the maximal local regrets. -/
theorem laminar_regret_le (parent : J → Option (Σ j, A j)) (ρ : J → ℕ)
    (hρ : ∀ j j' a, parent j = some ⟨j', a⟩ → ρ j' < ρ j)
    (ℓ : ℕ → Option (Σ j, A j) → ℝ) (b : ℕ → ∀ j, A j → ℝ)
    (x : ℕ → Option (Σ j, A j) → ℝ) (V : ℕ → (Σ j, A j) → ℝ)
    (hx : ∀ t, IsSequenceForm parent (b t) (x t))
    (hV : ∀ t, IsCounterfactualValue parent (ℓ t) (b t) (V t)) (T : ℕ) :
    ∀ y ∈ sequenceFormPolytope parent,
      ∑ t ∈ range T, ∑ s, ℓ t s * (y s - x t s) ≤
        ∑ j, max (⨆ a, localRegret b V T j a) 0 :=
  sorry

/-- 4.3: the CFR regret bound with local ranges `w j`. -/
theorem cfr_regret_le (parent : J → Option (Σ j, A j)) (ρ : J → ℕ)
    (hρ : ∀ j j' a, parent j = some ⟨j', a⟩ → ρ j' < ρ j)
    (ℓ : ℕ → Option (Σ j, A j) → ℝ) (b : ℕ → ∀ j, A j → ℝ)
    (x : ℕ → Option (Σ j, A j) → ℝ) (V : ℕ → (Σ j, A j) → ℝ) (hcfr : IsCFR parent ℓ b x V)
    (w : J → ℝ) (c : ℕ → J → ℝ)
    (hw : ∀ t j a, c t j ≤ V t ⟨j, a⟩ ∧ V t ⟨j, a⟩ ≤ c t j + w j) (T : ℕ) :
    ∀ y ∈ sequenceFormPolytope parent,
      ∑ t ∈ range T, ∑ s, ℓ t s * (y s - x t s) ≤
        ∑ j, w j * Real.sqrt (Fintype.card (A j) * T) :=
  sorry

end Sequential

section ZeroSumSequential

variable {J₁ J₂ : Type*} [Fintype J₁] [Fintype J₂] {A₁ : J₁ → Type*} {A₂ : J₂ → Type*}
  [∀ j, Fintype (A₁ j)] [∀ j, Fintype (A₂ j)] [∀ j, Nonempty (A₁ j)] [∀ j, Nonempty (A₂ j)]
  [DecidableEq J₁] [DecidableEq J₂] [∀ j, DecidableEq (A₁ j)] [∀ j, DecidableEq (A₂ j)]

/-- 4.4: CFR self-play in a two-player zero-sum game in sequence form: the averaged sequence
forms lie in the polytopes, and their duality gap is at most the sum of the two CFR regret
bounds divided by `T`. -/
theorem cfr_selfPlay_gap_le (parent₁ : J₁ → Option (Σ j, A₁ j)) (ρ₁ : J₁ → ℕ)
    (hρ₁ : ∀ j j' a, parent₁ j = some ⟨j', a⟩ → ρ₁ j' < ρ₁ j)
    (parent₂ : J₂ → Option (Σ j, A₂ j)) (ρ₂ : J₂ → ℕ)
    (hρ₂ : ∀ j j' a, parent₂ j = some ⟨j', a⟩ → ρ₂ j' < ρ₂ j)
    (G : Matrix (Option (Σ j, A₁ j)) (Option (Σ j, A₂ j)) ℝ)
    (b₁ : ℕ → ∀ j, A₁ j → ℝ) (x : ℕ → Option (Σ j, A₁ j) → ℝ) (V₁ : ℕ → (Σ j, A₁ j) → ℝ)
    (b₂ : ℕ → ∀ j, A₂ j → ℝ) (y : ℕ → Option (Σ j, A₂ j) → ℝ) (V₂ : ℕ → (Σ j, A₂ j) → ℝ)
    (h₁ : IsCFR parent₁ (fun t ↦ G *ᵥ y t) b₁ x V₁)
    (h₂ : IsCFR parent₂ (fun t ↦ -(x t ᵥ* G)) b₂ y V₂)
    (w₁ : J₁ → ℝ) (c₁ : ℕ → J₁ → ℝ)
    (hw₁ : ∀ t j a, c₁ t j ≤ V₁ t ⟨j, a⟩ ∧ V₁ t ⟨j, a⟩ ≤ c₁ t j + w₁ j)
    (w₂ : J₂ → ℝ) (c₂ : ℕ → J₂ → ℝ)
    (hw₂ : ∀ t j a, c₂ t j ≤ V₂ t ⟨j, a⟩ ∧ V₂ t ⟨j, a⟩ ≤ c₂ t j + w₂ j) {T : ℕ} (hT : 1 ≤ T) :
    let xbar := (1 / (T : ℝ)) • ∑ t ∈ range T, x t
    let ybar := (1 / (T : ℝ)) • ∑ t ∈ range T, y t
    xbar ∈ sequenceFormPolytope parent₁ ∧ ybar ∈ sequenceFormPolytope parent₂ ∧
      ∀ x' ∈ sequenceFormPolytope parent₁, ∀ y' ∈ sequenceFormPolytope parent₂,
        x' ⬝ᵥ (G *ᵥ ybar) - xbar ⬝ᵥ (G *ᵥ y') ≤
          (∑ j, w₁ j * Real.sqrt (Fintype.card (A₁ j) * T) +
            ∑ j, w₂ j * Real.sqrt (Fintype.card (A₂ j) * T)) / T :=
  sorry

end ZeroSumSequential

/-! ### Kuhn poker -/

/-- Kuhn poker decision points: `inl c` is the first decision with card `c`, `inr c` the second
(player 1: after "check, bet"; player 2: after a bet). Action `0` is check or fold, `1` is bet
or call. -/
abbrev KuhnPoint := Fin 3 ⊕ Fin 3

/-- Kuhn poker sequences. -/
abbrev KuhnSeq := Option (Σ _ : KuhnPoint, Fin 2)

/-- Player 1's parent map: the second decision with card `c` follows "check". -/
def kuhnParent₁ : KuhnPoint → KuhnSeq
  | .inl _ => none
  | .inr c => some ⟨.inl c, 0⟩

/-- Player 2's parent map: both decisions are reached from the empty sequence; player 2's
`inl c` follows player 1's check and `inr c` follows player 1's bet. -/
def kuhnParent₂ : KuhnPoint → KuhnSeq := fun _ ↦ none

/-- The showdown sign for player 1 holding `c₁` against `c₂`. -/
def kuhnWin (c₁ c₂ : Fin 3) : ℝ := if c₂ < c₁ then 1 else -1

/-- The sequence-form payoff matrix of Kuhn poker, for player 1, each deal having probability
`1/6`. -/
def kuhnPayoff : Matrix KuhnSeq KuhnSeq ℝ
  | some ⟨.inl c₁, a₁⟩, some ⟨.inl c₂, a₂⟩ =>
      if c₁ ≠ c₂ ∧ a₁ = 0 ∧ a₂ = 0 then kuhnWin c₁ c₂ / 6 else 0
  | some ⟨.inr c₁, a₁⟩, some ⟨.inl c₂, a₂⟩ =>
      if c₁ ≠ c₂ ∧ a₂ = 1 then (if a₁ = 0 then -1 / 6 else 2 * kuhnWin c₁ c₂ / 6) else 0
  | some ⟨.inl c₁, a₁⟩, some ⟨.inr c₂, a₂⟩ =>
      if c₁ ≠ c₂ ∧ a₁ = 1 then (if a₂ = 0 then 1 / 6 else 2 * kuhnWin c₁ c₂ / 6) else 0
  | _, _ => 0

/-- 4.4: the value of Kuhn poker for player 1 is `-1/18`: player 1 has a strategy that
guarantees it and player 2 a strategy that holds player 1 to it. -/
theorem kuhnPoker_value :
    ∃ x ∈ sequenceFormPolytope kuhnParent₁, ∃ y ∈ sequenceFormPolytope kuhnParent₂,
      (∀ y' ∈ sequenceFormPolytope kuhnParent₂, -1 / 18 ≤ x ⬝ᵥ (kuhnPayoff *ᵥ y')) ∧
      ∀ x' ∈ sequenceFormPolytope kuhnParent₁, x' ⬝ᵥ (kuhnPayoff *ᵥ y) ≤ -1 / 18 :=
  sorry

end TauCetiRoadmap.RegretMinimizationAndEquilibria
