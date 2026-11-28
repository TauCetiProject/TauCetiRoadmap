import Mathlib

/-!
# Fictitious play in two-player matrix games: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned Mathlib, with the few definitions they need,
every theorem with `sorry` and every definition with a real body. Every headline theorem of the
README is statable at the pins and is stated here. The `sorry` proofs are targets, not completed
results.

A game is a pair of payoff matrices `A B : Matrix ι κ ℝ` over finite nonempty action types; both
players maximize. Fictitious play is a predicate on sequences of pure actions: from round `1` on,
each player's action is a best response to the opponent's counts of the earlier rounds, every
tie-break is admissible, and round `0` is arbitrary. The probability simplex and the regret are
copied verbatim from RegretMinimizationAndEquilibria, because a roadmap's Lean file does not
import another roadmap's module. The expected payoff `x ⬝ᵥ (A *ᵥ y)`, which that roadmap declares
as `Matrix.payoff A x y` in the root namespace, is written out, so that the name is declared once.
-/

noncomputable section

open Finset Matrix Filter Topology

namespace TauCetiRoadmap.FictitiousPlay

-- Conventions (copied verbatim from RegretMinimizationAndEquilibria, Conventions and 1.1)
/-- The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

section Online

variable {ι : Type*} [Fintype ι] [Nonempty ι]

-- Conventions (copied verbatim from RegretMinimizationAndEquilibria, 1.1)
/-- The regret of the plays `p` against action `a` after `T` rounds. -/
def regret (p u : ℕ → ι → ℝ) (T : ℕ) (a : ι) : ℝ :=
  ∑ t ∈ range T, (u t a - p t ⬝ᵥ u t)

end Online

section FP

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]
  [Nonempty ι] [Nonempty κ]

/-! ## Layer 1: fictitious play in bimatrix games -/

/-- 1.1 The number of rounds `s < t` in which the action sequence `i` plays `a`, as a real
vector. -/
def playCount (i : ℕ → ι) (t : ℕ) : ι → ℝ :=
  fun a ↦ (((range t).filter fun s ↦ i s = a).card : ℝ)

/-- 1.1 The empirical mixture of the rounds `0, …, t - 1`; at `t = 0` it is the zero vector. -/
def empiricalMix (i : ℕ → ι) (t : ℕ) : ι → ℝ := (t : ℝ)⁻¹ • playCount i t

/-- 1.1 Simultaneous fictitious play of the bimatrix game `(A, B)`: from round `1` on, each
player's action is a best response to the opponent's counts of the earlier rounds (every
tie-break is admissible); round `0` is arbitrary. -/
def IsFictitiousPlay (A B : Matrix ι κ ℝ) (i : ℕ → ι) (j : ℕ → κ) : Prop :=
  ∀ t, 1 ≤ t → (∀ a, (A *ᵥ playCount j t) a ≤ (A *ᵥ playCount j t) (i t)) ∧
    ∀ b, (playCount i t ᵥ* B) b ≤ (playCount i t ᵥ* B) (j t)

/-- 1.1 Fictitious-play sequences exist from every first profile. -/
theorem exists_isFictitiousPlay (A B : Matrix ι κ ℝ) (a₀ : ι) (b₀ : κ) :
    ∃ i j, IsFictitiousPlay A B i j ∧ i 0 = a₀ ∧ j 0 = b₀ :=
  sorry

/-- 1.1 If both empirical mixtures of a fictitious-play sequence converge, the limits form a
mixed Nash equilibrium. -/
theorem isNash_of_tendsto_empiricalMix {A B : Matrix ι κ ℝ} {i : ℕ → ι} {j : ℕ → κ}
    (hfp : IsFictitiousPlay A B i j) {x : ι → ℝ} {y : κ → ℝ}
    (hx : Tendsto (empiricalMix i) atTop (𝓝 x)) (hy : Tendsto (empiricalMix j) atTop (𝓝 y)) :
    x ∈ simplex ι ∧ y ∈ simplex κ ∧ (∀ x' ∈ simplex ι, x' ⬝ᵥ (A *ᵥ y) ≤ x ⬝ᵥ (A *ᵥ y)) ∧
      ∀ y' ∈ simplex κ, x ⬝ᵥ (B *ᵥ y') ≤ x ⬝ᵥ (B *ᵥ y) :=
  sorry

/-- 1.2 A strict pure Nash equilibrium played at some round, `0` included, is played at every
subsequent round. -/
theorem isFictitiousPlay_absorbing {A B : Matrix ι κ ℝ} {i : ℕ → ι} {j : ℕ → κ}
    (hfp : IsFictitiousPlay A B i j) (t : ℕ)
    (hA : ∀ a, a ≠ i t → A a (j t) < A (i t) (j t))
    (hB : ∀ b, b ≠ j t → B (i t) b < B (i t) (j t)) :
    ∀ s, t ≤ s → i s = i t ∧ j s = j t :=
  sorry

/-- 1.3 After every number of rounds, each player of a fictitious-play sequence has an action
against which its regret is nonnegative. -/
theorem exists_zero_le_regret {A B : Matrix ι κ ℝ} {i : ℕ → ι} {j : ℕ → κ}
    (hfp : IsFictitiousPlay A B i j) (T : ℕ) :
    (∃ a, 0 ≤ regret (fun t ↦ Pi.single (i t) 1) (fun t ↦ A *ᵥ Pi.single (j t) 1) T a) ∧
      ∃ b, 0 ≤ regret (fun t ↦ Pi.single (j t) 1) (fun t ↦ Pi.single (i t) 1 ᵥ* B) T b :=
  sorry

end FP

/-- 1.3 The action `t mod 2` of `Fin 2` at round `t`. -/
def coordinationPath (t : ℕ) : Fin 2 := ⟨t % 2, Nat.mod_lt _ two_pos⟩

/-- 1.3 In the coordination game with payoff matrices `1`, the row player playing
`t mod 2` and the column player `(t + 1) mod 2` is fictitious play; the row player's regret
against action `0` after `T` rounds is `⌊T/2⌋`, and both empirical mixtures tend to the
uniform strategy. -/
theorem coordination_regret :
    IsFictitiousPlay (1 : Matrix (Fin 2) (Fin 2) ℝ) 1 coordinationPath
        (fun t ↦ coordinationPath (t + 1)) ∧
      (∀ T : ℕ, regret (fun t ↦ Pi.single (coordinationPath t) (1 : ℝ))
          (fun t ↦ (1 : Matrix (Fin 2) (Fin 2) ℝ) *ᵥ Pi.single (coordinationPath (t + 1)) 1)
          T 0 = ((T / 2 : ℕ) : ℝ)) ∧
      Tendsto (empiricalMix coordinationPath) atTop (𝓝 fun _ ↦ 1 / 2) ∧
      Tendsto (empiricalMix fun t ↦ coordinationPath (t + 1)) atTop (𝓝 fun _ ↦ 1 / 2) :=
  sorry

section ZeroSum

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [Nonempty ι] [Nonempty κ]

/-! ## Layer 2: zero-sum games -/

/-- 2.1 Robinson's vector systems for the matrix `A`, indexed so that fictitious play from the
zero vectors is one: `V t` is the row player's cumulative payoff vector, `U t` the column
player's cumulative concession vector, `i t` maximizes `V t` and `j t` minimizes `U t`. -/
structure IsVectorSystem (A : Matrix ι κ ℝ) (U : ℕ → κ → ℝ) (V : ℕ → ι → ℝ) (i : ℕ → ι)
    (j : ℕ → κ) : Prop where
  init : ⨅ b, U 0 b = ⨆ a, V 0 a
  stepU : ∀ t, U (t + 1) = U t + fun b ↦ A (i t) b
  stepV : ∀ t, V (t + 1) = V t + fun a ↦ A a (j t)
  row_max : ∀ t a, V t a ≤ V t (i t)
  col_min : ∀ t b, U t (j t) ≤ U t b

/-- 2.1 Robinson's theorem: for every `ε > 0` there is a time `T`, the same for all vector
systems of `A`, after which `max V t - min U t ≤ ε t`. -/
theorem robinson_vectorSystem (A : Matrix ι κ ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : ℕ, ∀ U V i j, IsVectorSystem A U V i j → ∀ t, T ≤ t →
      (⨆ a, V t a) - (⨅ b, U t b) ≤ ε * t :=
  sorry

/-- 2.2 Fictitious play in the zero-sum game `(A, -A)`: the duality gap of the empirical
mixtures tends to `0`, both bounds tend to the value `⨆ x, ⨅ y, x ⬝ᵥ (A *ᵥ y)`, and every
cluster point of the pair of empirical mixtures is a saddle point. -/
theorem tendsto_fictitiousPlay_zeroSum [DecidableEq ι] [DecidableEq κ] {A : Matrix ι κ ℝ}
    {i : ℕ → ι} {j : ℕ → κ} (hfp : IsFictitiousPlay A (-A) i j) :
    Tendsto (fun t ↦ (⨆ a, (A *ᵥ empiricalMix j t) a) - ⨅ b, (empiricalMix i t ᵥ* A) b)
        atTop (𝓝 0) ∧
      Tendsto (fun t ↦ ⨆ a, (A *ᵥ empiricalMix j t) a) atTop
        (𝓝 (⨆ x : simplex ι, ⨅ y : simplex κ, (x : ι → ℝ) ⬝ᵥ (A *ᵥ (y : κ → ℝ)))) ∧
      Tendsto (fun t ↦ ⨅ b, (empiricalMix i t ᵥ* A) b) atTop
        (𝓝 (⨆ x : simplex ι, ⨅ y : simplex κ, (x : ι → ℝ) ⬝ᵥ (A *ᵥ (y : κ → ℝ)))) ∧
      ∀ x y, MapClusterPt (x, y) atTop (fun t ↦ (empiricalMix i t, empiricalMix j t)) →
        x ∈ simplex ι ∧ y ∈ simplex κ ∧ (∀ x' ∈ simplex ι, x' ⬝ᵥ (A *ᵥ y) ≤ x ⬝ᵥ (A *ᵥ y)) ∧
          ∀ y' ∈ simplex κ, x ⬝ᵥ (A *ᵥ y) ≤ x ⬝ᵥ (A *ᵥ y') :=
  sorry

end ZeroSum

/-! ## Layer 3: non-convergence and convergence in special classes -/

/-- 3.1 The row player's payoffs in Shapley's game: `1` when the column is the row plus one in
`Fin 3`, else `0`. -/
def shapleyRow : Matrix (Fin 3) (Fin 3) ℝ := fun a b ↦ if b = a + 1 then 1 else 0

/-- 3.1 The column player's payoffs in Shapley's game: `1` when the row is the column plus one
in `Fin 3`, else `0`. -/
def shapleyCol : Matrix (Fin 3) (Fin 3) ℝ := fun a b ↦ if a = b + 1 then 1 else 0

/-- 3.1 Shapley's theorem: in Shapley's game, a fictitious-play sequence whose first-round
actions differ never plays a diagonal profile, and its empirical mixtures do not both
converge. -/
theorem shapley_not_tendsto {i j : ℕ → Fin 3}
    (hfp : IsFictitiousPlay shapleyRow shapleyCol i j) (h0 : i 0 ≠ j 0) :
    (∀ t, i t ≠ j t) ∧
      ¬ ∃ x y, Tendsto (empiricalMix i) atTop (𝓝 x) ∧ Tendsto (empiricalMix j) atTop (𝓝 y) :=
  sorry

section Classes

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]
  [Nonempty ι] [Nonempty κ]

/-- 3.2 Games solvable by iterated strict dominance by pure strategies: if rows and columns
carry deletion rounds `ρ`, `σ` below `K`, except the survivors `a₀`, `b₀` at round `K`, and each
deleted action is strictly dominated, against the opponent's actions still present at its
round, by an action with a higher round, then fictitious play is eventually `(a₀, b₀)`. -/
theorem eventually_eq_of_dominanceSolvable {A B : Matrix ι κ ℝ} {i : ℕ → ι} {j : ℕ → κ}
    (hfp : IsFictitiousPlay A B i j) (ρ : ι → ℕ) (σ : κ → ℕ) (K : ℕ) (a₀ : ι) (b₀ : κ)
    (hρ : ρ a₀ = K ∧ ∀ a, a ≠ a₀ → ρ a < K) (hσ : σ b₀ = K ∧ ∀ b, b ≠ b₀ → σ b < K)
    (hA : ∀ a, a ≠ a₀ → ∃ a', ρ a < ρ a' ∧ ∀ b, ρ a ≤ σ b → A a b < A a' b)
    (hB : ∀ b, b ≠ b₀ → ∃ b', σ b < σ b' ∧ ∀ a, σ b ≤ ρ a → B a b < B a b') :
    ∃ T, ∀ t, T ≤ t → i t = a₀ ∧ j t = b₀ :=
  sorry

/-- 3.3 Weighted potential games: if `P` is a potential with positive weights `w₁`, `w₂`, the
sum of the two players' best-response gaps at the empirical mixtures tends to `0`. -/
theorem tendsto_gap_of_weightedPotential {A B : Matrix ι κ ℝ} {i : ℕ → ι} {j : ℕ → κ}
    (hfp : IsFictitiousPlay A B i j) (P : Matrix ι κ ℝ) {w₁ w₂ : ℝ} (hw₁ : 0 < w₁)
    (hw₂ : 0 < w₂) (hA : ∀ a a' b, A a' b - A a b = w₁ * (P a' b - P a b))
    (hB : ∀ a b b', B a b' - B a b = w₂ * (P a b' - P a b)) :
    Tendsto (fun t ↦ ((⨆ a, (A *ᵥ empiricalMix j t) a) -
          empiricalMix i t ⬝ᵥ (A *ᵥ empiricalMix j t)) +
        ((⨆ b, (empiricalMix i t ᵥ* B) b) - empiricalMix i t ⬝ᵥ (B *ᵥ empiricalMix j t)))
      atTop (𝓝 0) :=
  sorry

end Classes

end TauCetiRoadmap.FictitiousPlay
