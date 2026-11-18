import Mathlib
import TauCeti.Order.Lattice.Submodular

/-!
# Cooperative games: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`. Every headline theorem
is statable at the pins. Completeness of baseline attribution (6.2) is the efficiency theorem
`sum_shapleyValue` applied to `baselineGame` and is not restated.

A set function is `v : Finset ι → ℝ` on a type `ι` of players, which is finite from Layer 2 on;
a game is a set function with `v ∅ = 0`. A statement assumes `v ∅ = 0` or `v ∅ ≤ 0` only where
its conclusion fails without it. Convexity of a game is Tau Ceti's `TauCeti.IsSubmodular (-v)`.

Suppliers used by the README and not restated here: Tau Ceti `TauCeti.IsSubmodular.add` and
`TauCeti.isSubmodular_finsetSum` (`TauCeti/Order/Lattice/Submodular.lean`),
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_coeff_add_dual_pos_at`
(`TauCeti/Geometry/Convex/Cone/Alternative.lean`), `Finset.sum_Icc_neg_one_pow_card_sub_card_left`
and `TauCeti.card_nonempty_finset` (`TauCeti/Data/Finset/Basic.lean`); Mathlib
`Fintype.card_equiv`, `Metric.isCompact_of_isClosed_isBounded`, `IsCompact.exists_isMinOn`,
`IsCompact.exists_isMaxOn`, `Set.Finite.isCompact_convexHull`,
`geometric_hahn_banach_point_closed`, `Finset.sum_range_by_parts`,
`extremePoints_convexHull_subset`, `closure_convexHull_extremePoints`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`,
`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`,
`ProbabilityTheory.iIndepFun_pi`, `ProbabilityTheory.uniformOn_univ`,
`ProbabilityTheory.uniformOn_pi` and `Finset.piecewise`.
-/

noncomputable section

open Finset TauCeti
open scoped Nat

namespace TauCetiRoadmap.CooperativeGames

variable {ι : Type*}

/-! ## Layer 1: set functions, unanimity games and dividends -/

/-- 1.1: a set function is supermodular exactly when marginal contributions increase with the
coalition (Shapley, RAND RM-4571-PR, Section 1). -/
theorem isSubmodular_neg_iff_forall_insert [DecidableEq ι] (v : Finset ι → ℝ) :
    IsSubmodular (-v) ↔
      ∀ S T : Finset ι, S ⊆ T → ∀ i, i ∉ T → v (insert i S) - v S ≤ v (insert i T) - v T :=
  sorry

/-- 1.2: the unanimity function of `S`, equal to `1` on the coalitions that contain `S` and to
`0` elsewhere. -/
def unanimity [DecidableEq ι] (S : Finset ι) : Finset ι → ℝ := fun T ↦ if S ⊆ T then 1 else 0

/-- 1.2: the Harsanyi dividend of `S` in `v`, the Möbius transform of `v` on the subset
lattice. -/
def dividend (v : Finset ι → ℝ) (S : Finset ι) : ℝ :=
  ∑ R ∈ S.powerset, (-1) ^ (S.card - R.card) * v R

/-- 1.2: Möbius inversion on the subset lattice: a set function is the sum of its dividends over
subcoalitions (Shapley, RAND P-295, Lemma 3). -/
theorem sum_powerset_dividend (v : Finset ι → ℝ) (T : Finset ι) :
    ∑ S ∈ T.powerset, dividend v S = v T :=
  sorry

/-- 1.2: the unanimity functions form a basis of the set functions, and the coordinates of `v`
in it are its dividends. -/
theorem eq_sum_smul_unanimity_iff [Fintype ι] [DecidableEq ι] (v d : Finset ι → ℝ) :
    v = ∑ S : Finset ι, d S • unanimity S ↔ d = dividend v :=
  sorry

/-- 1.2: a set function with nonnegative dividends on coalitions of at least two players is
supermodular. -/
theorem isSubmodular_neg_of_dividend_nonneg [DecidableEq ι] {v : Finset ι → ℝ}
    (h : ∀ S : Finset ι, 2 ≤ S.card → 0 ≤ dividend v S) : IsSubmodular (-v) :=
  sorry

/-! ## Layer 2: the core and marginal vectors -/

variable [Fintype ι] [DecidableEq ι]

/-- 2.1: the core of `v`: the efficient payoff vectors that give every coalition at least its
worth. -/
def core (v : Finset ι → ℝ) : Set (ι → ℝ) :=
  {x | ∑ i, x i = v univ ∧ ∀ S : Finset ι, v S ≤ ∑ i ∈ S, x i}

/-- 2.2: the players that precede `i` in the order `σ`. -/
def predecessors (σ : ι ≃ Fin (Fintype.card ι)) (i : ι) : Finset ι :=
  univ.filter fun j ↦ σ j < σ i

/-- 2.2: the marginal vector of the order `σ`: each player receives its marginal contribution
to the coalition of its predecessors. -/
def marginalVector (v : Finset ι → ℝ) (σ : ι ≃ Fin (Fintype.card ι)) : ι → ℝ :=
  fun i ↦ v (insert i (predecessors σ i)) - v (predecessors σ i)

/-- 2.3: a game is convex exactly when every marginal vector lies in its core (Shapley, RAND
RM-4571-PR, Lemma 3, for the forward direction; the converse is Ichiishi's). -/
theorem isSubmodular_neg_iff_forall_marginalVector_mem_core {v : Finset ι → ℝ} (hv : v ∅ = 0) :
    IsSubmodular (-v) ↔ ∀ σ, marginalVector v σ ∈ core v :=
  sorry

/-- 2.4: the core of a game lies in the convex hull of its marginal vectors (Weber). -/
theorem core_subset_convexHull_range_marginalVector {v : Finset ι → ℝ} (hv : v ∅ = 0) :
    core v ⊆ convexHull ℝ (Set.range (marginalVector v)) :=
  sorry

/-- 2.4: the extreme points of the core of a convex game are exactly its marginal vectors
(Shapley, RAND RM-4571-PR, Theorems 2 and 3). -/
theorem extremePoints_core_eq_range_marginalVector {v : Finset ι → ℝ} (hv : v ∅ = 0)
    (hc : IsSubmodular (-v)) : (core v).extremePoints ℝ = Set.range (marginalVector v) :=
  sorry

/-- 2.4: the core of a convex game is the convex hull of its marginal vectors. -/
theorem core_eq_convexHull_range_marginalVector {v : Finset ι → ℝ} (hv : v ∅ = 0)
    (hc : IsSubmodular (-v)) : core v = convexHull ℝ (Set.range (marginalVector v)) :=
  sorry

/-! ## Layer 3: balanced weights and the Bondareva–Shapley theorem -/

/-- 3.1: balanced weights: nonnegative weights on coalitions such that the coalitions containing
any given player have total weight `1`. -/
structure IsBalanced (w : Finset ι → ℝ) : Prop where
  nonneg : ∀ S, 0 ≤ w S
  sum_eq_one : ∀ i, ∑ S with i ∈ S, w S = 1

/-- 3.2: the Bondareva–Shapley theorem: the core is nonempty exactly when every system of
balanced weights satisfies `∑ S, w S * v S ≤ v univ`. -/
theorem core_nonempty_iff_forall_isBalanced (v : Finset ι → ℝ) :
    (core v).Nonempty ↔ ∀ w, IsBalanced w → ∑ S, w S * v S ≤ v univ :=
  sorry

/-- 3.3: the Bondareva–Shapley theorem in its sharp form: it suffices to test the extreme points
of the set of balanced weights, which are the weights of the minimal balanced collections
(Shapley, RAND RM-4601-PR, Theorem 2). -/
theorem core_nonempty_iff_forall_mem_extremePoints {v : Finset ι → ℝ} (hv : v ∅ ≤ 0) :
    (core v).Nonempty ↔
      ∀ w ∈ Set.extremePoints ℝ {w : Finset ι → ℝ | IsBalanced w},
        ∑ S, w S * v S ≤ v univ :=
  sorry

/-- 3.4: linear programming duality for the core: the least total payoff that meets every
coalition's worth equals the greatest balanced value, and both are attained. -/
theorem exists_isLeast_isGreatest_isBalanced {v : Finset ι → ℝ} (hv : v ∅ ≤ 0) :
    ∃ c : ℝ,
      IsLeast {t | ∃ x : ι → ℝ, (∀ S : Finset ι, v S ≤ ∑ i ∈ S, x i) ∧ ∑ i, x i = t} c ∧
      IsGreatest {t | ∃ w, IsBalanced w ∧ ∑ S, w S * v S = t} c :=
  sorry

/-! ## Layer 4: the Shapley value -/

/-- 4.1: the Shapley value, by Shapley's coalition formula (RAND P-295, formula (13)). -/
def shapleyValue (v : Finset ι → ℝ) (i : ι) : ℝ :=
  ∑ S ∈ (univ.erase i).powerset,
    ((S.card)! : ℝ) * ((Fintype.card ι - S.card - 1)! : ℝ) / ((Fintype.card ι)! : ℝ) *
      (v (insert i S) - v S)

/-- 4.1: the random-order formula: the Shapley value is the average of the marginal vectors
over all orders of the players. -/
theorem shapleyValue_eq_sum_marginalVector (v : Finset ι → ℝ) (i : ι) :
    shapleyValue v i =
      (∑ σ : ι ≃ Fin (Fintype.card ι), marginalVector v σ i) / ((Fintype.card ι)! : ℝ) :=
  sorry

/-- 4.2: efficiency of the Shapley value. -/
theorem sum_shapleyValue (v : Finset ι → ℝ) : ∑ i, shapleyValue v i = v univ - v ∅ :=
  sorry

/-- 4.3: the dividend formula: each coalition's dividend is shared equally among its members
(Shapley, RAND P-295, formula (10)). -/
theorem shapleyValue_eq_sum_dividend (v : Finset ι → ℝ) (i : ι) :
    shapleyValue v i = ∑ S with i ∈ S, dividend v S / S.card :=
  sorry

/-- 4.4: Shapley's uniqueness theorem. On an additively closed class `C` of games containing the
nonnegative multiples of the unanimity games, a value that is efficient, treats symmetric players
equally, gives null players nothing and is additive is the Shapley value. -/
theorem eq_shapleyValue_of_efficient_of_symmetric_of_null_of_additive
    {C : AddSubmonoid (Finset ι → ℝ)} (hC : ∀ v ∈ C, v ∅ = 0)
    (hun : ∀ (c : ℝ) (S : Finset ι), 0 ≤ c → S.Nonempty → c • unanimity S ∈ C)
    (ψ : (Finset ι → ℝ) → ι → ℝ)
    (eff : ∀ v ∈ C, ∑ i, ψ v i = v univ)
    (symm : ∀ v ∈ C, ∀ i j,
      (∀ S : Finset ι, i ∉ S → j ∉ S → v (insert i S) = v (insert j S)) → ψ v i = ψ v j)
    (null : ∀ v ∈ C, ∀ i, (∀ S : Finset ι, v (insert i S) = v S) → ψ v i = 0)
    (add : ∀ v ∈ C, ∀ w ∈ C, ψ (v + w) = ψ v + ψ w) :
    ∀ v ∈ C, ψ v = shapleyValue v :=
  sorry

/-- 4.5: Young's characterization. A value on games that is efficient, treats symmetric players
equally, and gives a player the same payoff in two games in which its marginal contributions
agree, is the Shapley value. -/
theorem eq_shapleyValue_of_efficient_of_symmetric_of_marginal
    (ψ : (Finset ι → ℝ) → ι → ℝ)
    (eff : ∀ v : Finset ι → ℝ, v ∅ = 0 → ∑ i, ψ v i = v univ)
    (symm : ∀ v : Finset ι → ℝ, v ∅ = 0 → ∀ i j,
      (∀ S : Finset ι, i ∉ S → j ∉ S → v (insert i S) = v (insert j S)) → ψ v i = ψ v j)
    (marg : ∀ v w : Finset ι → ℝ, v ∅ = 0 → w ∅ = 0 → ∀ i,
      (∀ S : Finset ι, v (insert i S) - v S = w (insert i S) - w S) → ψ v i = ψ w i) :
    ∀ v : Finset ι → ℝ, v ∅ = 0 → ψ v = shapleyValue v :=
  sorry

/-- 4.6: the Shapley value of a convex game lies in its core (Shapley, RAND RM-4571-PR,
Theorem 4). -/
theorem shapleyValue_mem_core {v : Finset ι → ℝ} (hv : v ∅ = 0) (hc : IsSubmodular (-v)) :
    shapleyValue v ∈ core v :=
  sorry

/-! ## Layer 5: simple games and the Banzhaf value -/

omit [DecidableEq ι] in
/-- 5.1: the core of a `0`-`1`-valued set function with `v univ = 1` consists of the
distributions of one unit among the veto players, the players that belong to every winning
coalition. -/
theorem core_eq_of_forall_eq_zero_or_eq_one {v : Finset ι → ℝ} (h01 : ∀ S, v S = 0 ∨ v S = 1)
    (hN : v univ = 1) :
    core v =
      {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1 ∧ ∀ i, (∃ S : Finset ι, v S = 1 ∧ i ∉ S) → x i = 0} :=
  sorry

/-- 5.3: the Banzhaf value: the average marginal contribution of `i` over the coalitions of the
other players. -/
def banzhafValue (v : Finset ι → ℝ) (i : ι) : ℝ :=
  (∑ S ∈ (univ.erase i).powerset, (v (insert i S) - v S)) / 2 ^ (Fintype.card ι - 1)

/-- 5.3: the dividend formula for the Banzhaf value. -/
theorem banzhafValue_eq_sum_dividend (v : Finset ι → ℝ) (i : ι) :
    banzhafValue v i = ∑ S with i ∈ S, dividend v S / 2 ^ (S.card - 1) :=
  sorry

/-! ## Layer 6: sampling and baseline attribution -/

/-- 6.1: the permutation-sampling estimator of the Shapley value: the mean, over a sample `s` of
`m` orders, of the marginal contributions of `i`. -/
def permutationEstimator (v : Finset ι → ℝ) {m : ℕ} (s : Fin m → ι ≃ Fin (Fintype.card ι))
    (i : ι) : ℝ :=
  (∑ k, marginalVector v (s k) i) / m

/-- 6.1: the permutation-sampling estimator is unbiased: its mean over all samples of `m ≥ 1`
orders is the Shapley value. -/
theorem sum_permutationEstimator_div (v : Finset ι → ℝ) {m : ℕ} (hm : 0 < m) (i : ι) :
    (∑ s : Fin m → ι ≃ Fin (Fintype.card ι), permutationEstimator v s i) /
        ((Fintype.card ι)! : ℝ) ^ m =
      shapleyValue v i :=
  sorry

/-- 6.1: Hoeffding's bound for permutation sampling: if the marginal contributions of `i` lie in
`[a, b]`, the fraction of samples of `m` orders whose estimate deviates from the Shapley value by
at least `ε` is at most `2 * exp (-2 * m * ε ^ 2 / (b - a) ^ 2)`. -/
theorem card_filter_le_abs_permutationEstimator_sub_div_le (v : Finset ι → ℝ) {m : ℕ} (i : ι)
    {a b ε : ℝ} (hab : ∀ S : Finset ι, i ∉ S → v (insert i S) - v S ∈ Set.Icc a b)
    (hε : 0 ≤ ε) :
    ((univ.filter fun s : Fin m → ι ≃ Fin (Fintype.card ι) ↦
        ε ≤ |permutationEstimator v s i - shapleyValue v i|).card : ℝ) /
        ((Fintype.card ι)! : ℝ) ^ m ≤
      2 * Real.exp (-2 * m * ε ^ 2 / (b - a) ^ 2) :=
  sorry

/-- 6.2: the baseline game of a function `f` of several variables at the input `x` with baseline
`x₀`: the coalition `S` is worth the change in `f` when the coordinates in `S` are moved from the
baseline to the input. -/
def baselineGame {α : ι → Type*} (f : (∀ i, α i) → ℝ) (x x₀ : ∀ i, α i) : Finset ι → ℝ :=
  fun S ↦ f (S.piecewise x x₀) - f x₀

/-- 6.2: for an additive function, the Shapley value of the baseline game is the change of each
summand. -/
theorem shapleyValue_baselineGame_of_additive {α : ι → Type*} (c : ℝ) (g : ∀ i, α i → ℝ)
    (x x₀ : ∀ i, α i) (i : ι) :
    shapleyValue (baselineGame (fun z ↦ c + ∑ j, g j (z j)) x x₀) i = g i (x i) - g i (x₀ i) :=
  sorry

end TauCetiRoadmap.CooperativeGames
