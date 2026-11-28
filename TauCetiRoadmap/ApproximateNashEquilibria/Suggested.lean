import Mathlib

/-!
# Approximate Nash equilibria of bimatrix games: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib, each
with `sorry`, together with the definitions they need; every definition has a real body. Every
headline theorem of the README is statable at the pins and is stated here.

The probability simplex `simplex`, the expected utility `expectedUtility` and the Nash
equilibria `IsNash` of finite games are copied verbatim from the roadmap
RegretMinimizationAndEquilibria (Conventions and Section 3.1), so that this file imports no other
roadmap. The expected payoff `x ⬝ᵥ (A *ᵥ y)` is written out; it is the number that roadmap calls
`Matrix.payoff A x y` (Section 2.1).
-/

noncomputable section

open Finset Matrix

universe u

namespace TauCetiRoadmap.ApproximateNashEquilibria

/-- Conventions (copied verbatim from RegretMinimizationAndEquilibria, Conventions): the
probability simplex on a finite type, as a set of weight vectors. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-! ## Layer 1: approximate and well-supported equilibria -/

section Bimatrix

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- 1.1 `(x, y)` is an `ε`-approximate Nash equilibrium of the bimatrix game `(A, B)`: both are
mixed strategies, and no mixed deviation gains a player more than `ε`. -/
def IsApproxNash (A B : Matrix ι κ ℝ) (ε : ℝ) (x : ι → ℝ) (y : κ → ℝ) : Prop :=
  x ∈ simplex ι ∧ y ∈ simplex κ ∧
    (∀ x' ∈ simplex ι, x' ⬝ᵥ (A *ᵥ y) ≤ x ⬝ᵥ (A *ᵥ y) + ε) ∧
    ∀ y' ∈ simplex κ, x ⬝ᵥ (B *ᵥ y') ≤ x ⬝ᵥ (B *ᵥ y) + ε

/-- 1.1 `(x, y)` is an `ε`-well-supported Nash equilibrium of `(A, B)`: both are mixed
strategies, and every action played with positive probability is within `ε` of a best
response. -/
def IsWellSupportedNash (A B : Matrix ι κ ℝ) (ε : ℝ) (x : ι → ℝ) (y : κ → ℝ) : Prop :=
  x ∈ simplex ι ∧ y ∈ simplex κ ∧
    (∀ a, 0 < x a → ∀ a', (A *ᵥ y) a' ≤ (A *ᵥ y) a + ε) ∧
    ∀ b, 0 < y b → ∀ b', (x ᵥ* B) b' ≤ (x ᵥ* B) b + ε

/-- 1.1 Basic relations: a well-supported equilibrium is an approximate one with the same `ε`
(for all payoffs); pure deviations suffice; at `ε = 0` the two notions agree; and the notion is
invariant under positive affine changes of the payoffs, which rescale `ε`. -/
theorem isApproxNash_basic (A B : Matrix ι κ ℝ) (ε : ℝ) (x : ι → ℝ) (y : κ → ℝ) :
    (IsWellSupportedNash A B ε x y → IsApproxNash A B ε x y) ∧
    (IsApproxNash A B ε x y ↔ x ∈ simplex ι ∧ y ∈ simplex κ ∧
      (∀ a, (A *ᵥ y) a ≤ x ⬝ᵥ (A *ᵥ y) + ε) ∧ ∀ b, (x ᵥ* B) b ≤ x ⬝ᵥ (B *ᵥ y) + ε) ∧
    (IsApproxNash A B 0 x y ↔ IsWellSupportedNash A B 0 x y) ∧
    ∀ c d d' : ℝ, 0 < c →
      (IsApproxNash (c • A + Matrix.of fun _ _ ↦ d) (c • B + Matrix.of fun _ _ ↦ d') (c * ε) x y ↔
        IsApproxNash A B ε x y) :=
  sorry

end Bimatrix

section FiniteGame

variable {N : Type*} [Fintype N] [DecidableEq N] {A : N → Type*} [∀ i, Fintype (A i)]
  [∀ i, Nonempty (A i)] [∀ i, DecidableEq (A i)]

/-- 1.2 (copied verbatim from RegretMinimizationAndEquilibria, Section 3.1): the expected
utility of player `i` under the mixed profile `σ`. -/
def expectedUtility (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) (i : N) : ℝ :=
  ∑ a : ∀ j, A j, (∏ j, σ j (a j)) * u i a

/-- 1.2 (copied verbatim from RegretMinimizationAndEquilibria, Section 3.1): `σ` is a mixed Nash
equilibrium. -/
def IsNash (u : N → (∀ i, A i) → ℝ) (σ : ∀ i, A i → ℝ) : Prop :=
  (∀ i, σ i ∈ simplex (A i)) ∧
    ∀ i, ∀ τ ∈ simplex (A i),
      expectedUtility u (Function.update σ i τ) i ≤ expectedUtility u σ i

end FiniteGame

section TwoPlayer

variable {ι κ : Type u} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]
  [Nonempty ι] [Nonempty κ]

/-- 1.2 The action sets of a bimatrix game as a two-player finite game: player `false` is the
row player, player `true` the column player. -/
abbrev biActions (ι κ : Type u) : Bool → Type u := fun p ↦ cond p κ ι

/-- 1.2 The action sets of the two players are finite. -/
instance biActions.instFintype : ∀ p, Fintype (biActions ι κ p)
  | false => (inferInstance : Fintype ι)
  | true => (inferInstance : Fintype κ)

/-- 1.2 The action sets of the two players are nonempty. -/
instance biActions.instNonempty : ∀ p, Nonempty (biActions ι κ p)
  | false => (inferInstance : Nonempty ι)
  | true => (inferInstance : Nonempty κ)

/-- 1.2 The action sets of the two players have decidable equality. -/
instance biActions.instDecidableEq : ∀ p, DecidableEq (biActions ι κ p)
  | false => (inferInstance : DecidableEq ι)
  | true => (inferInstance : DecidableEq κ)

/-- 1.2 The utilities of the bimatrix game `(A, B)` as a two-player finite game. -/
def biUtility (A B : Matrix ι κ ℝ) : Bool → (∀ p, biActions ι κ p) → ℝ :=
  fun p a ↦ cond p (B (a false) (a true)) (A (a false) (a true))

/-- 1.2 The mixed profile of the pair `(x, y)`. -/
def biProfile (x : ι → ℝ) (y : κ → ℝ) : ∀ p, biActions ι κ p → ℝ
  | false => x
  | true => y

/-- 1.2 The `0`-approximate equilibria of `(A, B)` are exactly the Nash equilibria of the
corresponding two-player finite game. -/
theorem isApproxNash_zero_iff_isNash (A B : Matrix ι κ ℝ) (x : ι → ℝ) (y : κ → ℝ) :
    IsApproxNash A B 0 x y ↔ IsNash (biUtility A B) (biProfile x y) :=
  sorry

end TwoPlayer

section Bimatrix

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- 1.3 Approximate equilibria are close to exact ones: for every `ε > 0` there is `δ > 0`
(depending on the game) such that every `δ`-approximate equilibrium is within `ε`, in the sup
norm, of a Nash equilibrium. -/
theorem exists_pos_forall_isApproxNash_near (A B : Matrix ι κ ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ δ > 0, ∀ x y, IsApproxNash A B δ x y →
      ∃ x₀ y₀, IsApproxNash A B 0 x₀ y₀ ∧ ‖x - x₀‖ < ε ∧ ‖y - y₀‖ < ε :=
  sorry

/-! ## Layer 2: two constructions in normalised games -/

/-- 2.1 From approximate to well-supported equilibria: in a game with payoffs in `[0, 1]`,
every `ε² / 8`-approximate equilibrium `(u, v)` yields an `ε`-well-supported equilibrium
supported inside the supports of `u` and `v`. -/
theorem exists_isWellSupportedNash_of_isApproxNash {A B : Matrix ι κ ℝ}
    (hA : ∀ a b, A a b ∈ Set.Icc (0 : ℝ) 1) (hB : ∀ a b, B a b ∈ Set.Icc (0 : ℝ) 1)
    {ε : ℝ} (hε : 0 ≤ ε) {u : ι → ℝ} {v : κ → ℝ} (huv : IsApproxNash A B (ε ^ 2 / 8) u v) :
    ∃ x y, IsWellSupportedNash A B ε x y ∧ (∀ a, x a ≠ 0 → u a ≠ 0) ∧
      ∀ b, y b ≠ 0 → v b ≠ 0 :=
  sorry

/-- 2.2 The Daskalakis–Mehta–Papadimitriou `1/2`-approximate equilibrium: in a game with payoffs
in `[0, 1]`, if `b` is a best response of the column player to the row `a₁` and `a₂` a best
response of the row player to `b`, then the even mixture of `a₁` and `a₂` against `b` is a
`1/2`-approximate equilibrium. -/
theorem isApproxNash_half [DecidableEq ι] [DecidableEq κ] {A B : Matrix ι κ ℝ}
    (hA : ∀ a b, A a b ∈ Set.Icc (0 : ℝ) 1) (hB : ∀ a b, B a b ∈ Set.Icc (0 : ℝ) 1)
    (a₁ : ι) (b : κ) (a₂ : ι) (hb : ∀ b', B a₁ b' ≤ B a₁ b) (ha₂ : ∀ a', A a' b ≤ A a₂ b) :
    IsApproxNash A B (1 / 2) ((1 / 2 : ℝ) • Pi.single a₁ 1 + (1 / 2 : ℝ) • Pi.single a₂ 1)
      (Pi.single b 1) :=
  sorry

/-! ## Layer 3: equilibria with small supports -/

/-- 3.1 `x` is `k`-uniform: the uniform distribution on a multiset of `k` actions. For `k = 0`
this forces `x = 0`. -/
def IsKUniform [DecidableEq ι] (k : ℕ) (x : ι → ℝ) : Prop :=
  ∃ s : Multiset ι, Multiset.card s = k ∧ ∀ a, x a = (s.count a : ℝ) / k

/-- 3.1 The sampling theorem: for finitely many functions with values in `[0, 1]`, a mixed
strategy `x`, `ε > 0` and `log |J| < 2 k ε²`, some `k`-uniform strategy supported inside the
support of `x` loses at most `ε` against `x` on every function. -/
theorem exists_isKUniform_ge [DecidableEq ι] {J : Type*} [Fintype J] (f : J → ι → ℝ)
    (hf : ∀ c a, f c a ∈ Set.Icc (0 : ℝ) 1) {x : ι → ℝ} (hx : x ∈ simplex ι) {ε : ℝ}
    (hε : 0 < ε) {k : ℕ} (hk : Real.log (Fintype.card J) < 2 * k * ε ^ 2) :
    ∃ x', IsKUniform k x' ∧ (∀ a, x' a ≠ 0 → x a ≠ 0) ∧ ∀ c, x ⬝ᵥ f c - ε ≤ x' ⬝ᵥ f c :=
  sorry

/-- 3.2 Small-support equilibria near a Nash equilibrium: in a game with payoffs in `[0, 1]`,
for every Nash equilibrium `(xs, ys)`, every `ε > 0` and every `k` with
`2 log (2 max (m, n)) < k ε²`, there is a `k`-uniform `ε`-well-supported equilibrium supported
inside the supports of `(xs, ys)`, whose payoffs are within `ε / 2` of those of `(xs, ys)`. -/
theorem exists_isKUniform_near_isApproxNash_zero [DecidableEq ι] [DecidableEq κ]
    {A B : Matrix ι κ ℝ}
    (hA : ∀ a b, A a b ∈ Set.Icc (0 : ℝ) 1) (hB : ∀ a b, B a b ∈ Set.Icc (0 : ℝ) 1)
    {xs : ι → ℝ} {ys : κ → ℝ} (hne : IsApproxNash A B 0 xs ys) {ε : ℝ} (hε : 0 < ε) {k : ℕ}
    (hk : 2 * Real.log (2 * max (Fintype.card ι) (Fintype.card κ)) < k * ε ^ 2) :
    ∃ x y, IsKUniform k x ∧ IsKUniform k y ∧ (∀ a, x a ≠ 0 → xs a ≠ 0) ∧
      (∀ b, y b ≠ 0 → ys b ≠ 0) ∧ IsWellSupportedNash A B ε x y ∧
      |x ⬝ᵥ (A *ᵥ y) - xs ⬝ᵥ (A *ᵥ ys)| ≤ ε / 2 ∧ |x ⬝ᵥ (B *ᵥ y) - xs ⬝ᵥ (B *ᵥ ys)| ≤ ε / 2 :=
  sorry

end Bimatrix

section TwoPlayerExistence

variable {ι κ : Type u} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]
  [Nonempty ι] [Nonempty κ]

/-- 3.2 Every game with payoffs in `[0, 1]` and nonempty action sets has, for every `ε > 0` and
every `k` with `2 log (2 max (m, n)) < k ε²`, a `k`-uniform `ε`-well-supported equilibrium. -/
theorem exists_isKUniform_isWellSupportedNash {A B : Matrix ι κ ℝ}
    (hA : ∀ a b, A a b ∈ Set.Icc (0 : ℝ) 1) (hB : ∀ a b, B a b ∈ Set.Icc (0 : ℝ) 1)
    {ε : ℝ} (hε : 0 < ε) {k : ℕ}
    (hk : 2 * Real.log (2 * max (Fintype.card ι) (Fintype.card κ)) < k * ε ^ 2) :
    ∃ x y, IsKUniform k x ∧ IsKUniform k y ∧ IsWellSupportedNash A B ε x y :=
  sorry

end TwoPlayerExistence

end TauCetiRoadmap.ApproximateNashEquilibria
