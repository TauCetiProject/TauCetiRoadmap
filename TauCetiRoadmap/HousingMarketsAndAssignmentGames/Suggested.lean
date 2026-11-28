import Mathlib

/-!
# Housing markets and assignment games: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here. Egerváry's theorem, the equality of the
largest weight of a matching with the least total of a weighted cover, is
MinimumCostFlowsAndWeightedBipartiteMatching's `egervary` (2.2); its case of real values is used
in the proofs of 2.2, 2.3 and 3.3 and is not restated. That roadmap's `matchingWeight` and
`IsWeightCover` are copied verbatim below, since a roadmap's Lean file imports no other roadmap's
module. The README's remaining Checks are not restated.

A housing market has a finite set `ι` of agents, agent `i` owning house `i` and ranking the
houses by a strict total order `prefers i`; an allocation is a permutation `π` of `ι`, agent `i`
receiving house `π i`. An assignment game has finite sets `ι` of buyers and `κ` of sellers and a
real value `v i j` of the house of seller `j` to buyer `i`; a matching is a partial bijection
`ι ≃. κ`, and the payoffs are real vectors `u : ι → ℝ` and `p : κ → ℝ`.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.HousingMarketsAndAssignmentGames

/-! ## Matching weights and weighted covers (copied verbatim from
MinimumCostFlowsAndWeightedBipartiteMatching) -/

section CopiedFromMinimumCostFlows

variable {ι κ : Type*} [Fintype ι] [Fintype κ]
variable {K : Type*} [CommRing K] [LinearOrder K] [IsStrictOrderedRing K]

/-- 2.2 The weight of a matching `M`, a partial bijection from `ι` to `κ`: the sum of `w i j` over
its matched pairs. (Copied verbatim from MinimumCostFlowsAndWeightedBipartiteMatching 2.2.) -/
def matchingWeight (w : ι → κ → K) (M : ι ≃. κ) : K :=
  ∑ i, ∑ j ∈ (M i).toFinset, w i j

/-- 2.2 A weighted vertex cover of `w`: nonnegative `u` on `ι` and `p` on `κ` with
`w i j ≤ u i + p j` for every pair. (Copied verbatim from
MinimumCostFlowsAndWeightedBipartiteMatching 2.2.) -/
def IsWeightCover (w : ι → κ → K) (u : ι → K) (p : κ → K) : Prop :=
  (∀ i, 0 ≤ u i) ∧ (∀ j, 0 ≤ p j) ∧ ∀ i j, w i j ≤ u i + p j

end CopiedFromMinimumCostFlows

/-! ## Layer 1: housing markets and top trading cycles -/

/-- 1.1 A housing market on the agents `ι`: agent `i` owns house `i`, and `prefers i a b` says
that agent `i` strictly prefers house `a` to house `b`; each `prefers i` is a strict total
order. -/
structure HousingMarket (ι : Type*) where
  /-- `prefers i a b`: agent `i` strictly prefers house `a` to house `b`. -/
  prefers : ι → ι → ι → Prop
  /-- Each agent's preference is a strict total order on the houses. -/
  isStrictTotalOrder : ∀ i, IsStrictTotalOrder ι (prefers i)

variable {ι : Type*}

/-- 1.1 The coalition `A` weakly blocks the allocation `π` through the reallocation `σ`: `σ`
sends the members of `A` to houses of members of `A`, differs from `π` somewhere on `A`, and
every member of `A` whose house changes strictly prefers its house under `σ`. -/
def WeaklyBlocks (P : HousingMarket ι) (π : Equiv.Perm ι) (A : Finset ι) (σ : Equiv.Perm ι) :
    Prop :=
  (∀ i ∈ A, σ i ∈ A) ∧ (∃ i ∈ A, σ i ≠ π i) ∧ ∀ i ∈ A, σ i ≠ π i → P.prefers i (σ i) (π i)

/-- 1.1 The allocation `π` is in the strict core when no coalition weakly blocks it. -/
def IsInStrictCore (P : HousingMarket ι) (π : Equiv.Perm ι) : Prop :=
  ∀ (A : Finset ι) (σ : Equiv.Perm ι), ¬WeaklyBlocks P π A σ

variable [Fintype ι]

/-- 1.2 The strict core of a housing market on finitely many agents with strict preferences
consists of exactly one allocation. -/
theorem existsUnique_isInStrictCore (P : HousingMarket ι) : ∃! π, IsInStrictCore P π := by
  sorry

/-- 1.3 The top-trading-cycles description of the strict core: an allocation `π` is in the
strict core if and only if the agents can be assigned rounds `r : ι → ℕ` such that `π` keeps
every agent in its round and every agent receives its favourite house among the houses of the
agents of its own and later rounds. -/
theorem isInStrictCore_iff_exists_round (P : HousingMarket ι) (π : Equiv.Perm ι) :
    IsInStrictCore P π ↔
      ∃ r : ι → ℕ, (∀ i, r (π i) = r i) ∧
        ∀ i j, r i ≤ r j → j = π i ∨ P.prefers i (π i) j := by
  sorry

/-- 1.4 Strategy-proofness of the strict core: if the markets `P` and `P'` differ only in the
preference of agent `ℓ`, then `ℓ` does not strictly prefer, by its preference in `P`, the house it
receives in the strict core of `P'` to the house it receives in the strict core of `P`. -/
theorem not_prefers_of_isInStrictCore (P P' : HousingMarket ι) (ℓ : ι)
    (hP : ∀ i, i ≠ ℓ → P.prefers i = P'.prefers i) {π π' : Equiv.Perm ι}
    (hπ : IsInStrictCore P π) (hπ' : IsInStrictCore P' π') :
    ¬P.prefers ℓ (π' ℓ) (π ℓ) := by
  sorry

/-! ## Layer 2: the core of the assignment game -/

variable {κ : Type*} [Fintype κ]

/-- 2.1 `M` is a matching of largest weight. -/
def IsMaxWeightMatching (v : ι → κ → ℝ) (M : ι ≃. κ) : Prop :=
  ∀ M' : ι ≃. κ, matchingWeight v M' ≤ matchingWeight v M

/-- 2.1 The value of the assignment game: the largest weight of a matching. -/
def assignmentValue (v : ι → κ → ℝ) : ℝ :=
  ⨆ M : ι ≃. κ, matchingWeight v M

/-- 2.1 A minimum cover: a weighted cover `IsWeightCover v u p` of least total
`∑ i, u i + ∑ j, p j`. -/
def IsMinCover (v : ι → κ → ℝ) (u : ι → ℝ) (p : κ → ℝ) : Prop :=
  IsWeightCover v u p ∧
    ∀ u' p', IsWeightCover v u' p' → ∑ i, u i + ∑ j, p j ≤ ∑ i, u' i + ∑ j, p' j

/-- 2.1 An outcome `(M, u, p)`: nonnegative payoffs that split `v i j` on every matched pair and
vanish at every unmatched buyer and seller. -/
def IsOutcome (v : ι → κ → ℝ) (M : ι ≃. κ) (u : ι → ℝ) (p : κ → ℝ) : Prop :=
  (∀ i, 0 ≤ u i) ∧ (∀ j, 0 ≤ p j) ∧ (∀ i j, j ∈ M i → u i + p j = v i j) ∧
    (∀ i, M i = none → u i = 0) ∧ ∀ j, M.symm j = none → p j = 0

/-- 2.1 A core outcome: an outcome that no buyer and seller can block, that is,
`v i j ≤ u i + p j` for every pair. -/
def IsCoreOutcome (v : ι → κ → ℝ) (M : ι ≃. κ) (u : ι → ℝ) (p : κ → ℝ) : Prop :=
  IsOutcome v M u p ∧ ∀ i j, v i j ≤ u i + p j

/-- 2.2 The Shapley–Shubik characterization of the core: `(M, u, p)` is a core outcome if and
only if `M` is a matching of largest weight and `(u, p)` is a minimum cover. -/
theorem isCoreOutcome_iff (v : ι → κ → ℝ) (M : ι ≃. κ) (u : ι → ℝ) (p : κ → ℝ) :
    IsCoreOutcome v M u p ↔ IsMaxWeightMatching v M ∧ IsMinCover v u p := by
  sorry

/-- 2.3 Every matching of largest weight supports a core outcome; in particular the core of
every assignment game is nonempty. -/
theorem exists_isCoreOutcome (v : ι → κ → ℝ) {M : ι ≃. κ} (hM : IsMaxWeightMatching v M) :
    ∃ u p, IsCoreOutcome v M u p := by
  sorry

/-! ## Layer 3: competitive prices and the lattice of core payoffs -/

/-- 3.1 A Walrasian equilibrium `(M, p)`: the prices are nonnegative, every matched buyer `i`
gets a house `j` with `p j ≤ v i j` that maximises `v i k - p k` over all houses `k`, every
unmatched buyer has no house with a positive surplus, and every unsold house has price `0`. -/
def IsWalrasianEquilibrium (v : ι → κ → ℝ) (M : ι ≃. κ) (p : κ → ℝ) : Prop :=
  (∀ j, 0 ≤ p j) ∧ (∀ i j, j ∈ M i → p j ≤ v i j ∧ ∀ k, v i k - p k ≤ v i j - p j) ∧
    (∀ i, M i = none → ∀ k, v i k ≤ p k) ∧ ∀ j, M.symm j = none → p j = 0

/-- 3.1 Walrasian equilibria are the core outcomes: `(M, p)` is a Walrasian equilibrium if and
only if some buyer payoffs `u` make `(M, u, p)` a core outcome. -/
theorem isWalrasianEquilibrium_iff (v : ι → κ → ℝ) (M : ι ≃. κ) (p : κ → ℝ) :
    IsWalrasianEquilibrium v M p ↔ ∃ u, IsCoreOutcome v M u p := by
  sorry

/-- 3.2 The seller payoffs of core outcomes. -/
def corePrices (v : ι → κ → ℝ) : Set (κ → ℝ) :=
  {p | ∃ M u, IsCoreOutcome v M u p}

/-- 3.2 The buyer payoffs of core outcomes. -/
def coreUtilities (v : ι → κ → ℝ) : Set (ι → ℝ) :=
  {u | ∃ M p, IsCoreOutcome v M u p}

/-- 3.2 The lattice of minimum covers: for two minimum covers, the buyerwise maximum with the
sellerwise minimum, and the buyerwise minimum with the sellerwise maximum, are minimum
covers. -/
theorem IsMinCover.sup_inf {v : ι → κ → ℝ} {u u' : ι → ℝ} {p p' : κ → ℝ}
    (h : IsMinCover v u p) (h' : IsMinCover v u' p') :
    IsMinCover v (u ⊔ u') (p ⊓ p') ∧ IsMinCover v (u ⊓ u') (p ⊔ p') := by
  sorry

/-- 3.3 The buyer-optimal core point: buyer `i`'s largest core payoff is its marginal
contribution `assignmentValue v - assignmentValue v₋ᵢ`, where `v₋ᵢ` replaces row `i` by zeros;
these payoffs form a core payoff vector, and for every matching `M` of largest weight the least
core prices are `v i j` minus that contribution on each matched pair and `0` on unsold houses. -/
theorem isGreatest_coreUtilities_and_isLeast_corePrices [DecidableEq ι] (v : ι → κ → ℝ)
    {M : ι ≃. κ}
    (hM : IsMaxWeightMatching v M) :
    IsGreatest (coreUtilities v)
        (fun i ↦ assignmentValue v - assignmentValue (Function.update v i 0)) ∧
      IsLeast (corePrices v) (fun j ↦ (M.symm j).elim 0 fun i ↦
        v i j - (assignmentValue v - assignmentValue (Function.update v i 0))) := by
  sorry

/-- 3.3 The seller-optimal core point: seller `j`'s largest core payoff is its marginal
contribution `assignmentValue v - assignmentValue v⁻ʲ`, where `v⁻ʲ` replaces column `j` by
zeros; these prices form a core price vector, and for every matching `M` of largest weight the
least core payoffs of the buyers are `v i j` minus that contribution on each matched pair and `0`
for unmatched buyers. -/
theorem isGreatest_corePrices_and_isLeast_coreUtilities [DecidableEq κ] (v : ι → κ → ℝ)
    {M : ι ≃. κ}
    (hM : IsMaxWeightMatching v M) :
    IsGreatest (corePrices v)
        (fun j ↦ assignmentValue v - assignmentValue fun i ↦ Function.update (v i) j 0) ∧
      IsLeast (coreUtilities v) (fun i ↦ (M i).elim 0 fun j ↦
        v i j - (assignmentValue v - assignmentValue fun i' ↦ Function.update (v i') j 0)) := by
  sorry

end TauCetiRoadmap.HousingMarketsAndAssignmentGames
