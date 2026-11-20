import Mathlib

/-!
# Kakutani's fixed-point theorem and continuous games: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
two definitions they need; both definitions have real bodies. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

A correspondence from `α` to `β` is a function `φ : α → Set β`; its graph is the set of pairs
`(x, y)` with `y ∈ φ x`. Upper and lower hemicontinuity are Mathlib's `UpperHemicontinuous`,
`UpperHemicontinuousAt` and `LowerHemicontinuousAt`, the topological notions, under which empty
values are allowed. Convexity, convex hulls and quasiconcavity are Mathlib's `Convex`,
`convexHull` and `QuasiconcaveOn` over `ℝ`. Strategy sets live in finite-dimensional real normed
spaces, and a game has finitely many players.
-/

noncomputable section

open Set

namespace TauCetiRoadmap.KakutaniFixedPointAndContinuousGames

/-! ## Layer 1: closed graphs and upper hemicontinuity -/

/-- 1.1 Into a compact Hausdorff space, a correspondence has a closed graph if and only if it is
upper hemicontinuous and has closed values. -/
theorem isClosed_graph_iff_upperHemicontinuous {α β : Type*} [TopologicalSpace α]
    [TopologicalSpace β] [CompactSpace β] [T2Space β] {φ : α → Set β} :
    IsClosed {p : α × β | p.2 ∈ φ p.1} ↔ UpperHemicontinuous φ ∧ ∀ x, IsClosed (φ x) := by
  sorry

/-! ## Layer 2: Berge's maximum theorem -/

/-- 2.1 The argmax correspondence: the points of `φ x` at which `f x` attains its largest value on
`φ x`. -/
def argmaxCorr {α β : Type*} (φ : α → Set β) (f : α → β → ℝ) (x : α) : Set β :=
  {y ∈ φ x | ∀ z ∈ φ x, f x z ≤ f x y}

/-- 2.2 **Berge's maximum theorem.** Let `φ` have nonempty compact values, let `f` be continuous
on the graph of `φ`, and let `φ` be upper and lower hemicontinuous at `x₀`. Then the value
function `x ↦ sup f x (φ x)` is continuous at `x₀`, and the argmax correspondence is upper
hemicontinuous at `x₀` with a nonempty compact value there. -/
theorem berge_maximum_theorem {α β : Type*} [TopologicalSpace α] [TopologicalSpace β]
    {φ : α → Set β} {f : α → β → ℝ} {x₀ : α} (hne : ∀ x, (φ x).Nonempty)
    (hcpt : ∀ x, IsCompact (φ x))
    (hf : ContinuousOn (fun p : α × β ↦ f p.1 p.2) {p | p.2 ∈ φ p.1})
    (hu : UpperHemicontinuousAt φ x₀) (hl : LowerHemicontinuousAt φ x₀) :
    ContinuousAt (fun x ↦ sSup (f x '' φ x)) x₀ ∧ UpperHemicontinuousAt (argmaxCorr φ f) x₀ ∧
      (argmaxCorr φ f x₀).Nonempty ∧ IsCompact (argmaxCorr φ f x₀) := by
  sorry

/-! ## Layer 3: Kakutani's fixed-point theorem -/

/-- 3.1 **Kakutani's fixed-point theorem.** Let `K` be a nonempty compact convex subset of a
finite-dimensional real normed space and let `φ` send each point of `K` to a nonempty convex
subset of `K`, with the graph of `φ` over `K` closed. Then some `x ∈ K` lies in `φ x`. -/
theorem kakutani_fixedPoint {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {K : Set E} (hK : IsCompact K) (hconv : Convex ℝ K)
    (hne : K.Nonempty) {φ : E → Set E} (hφK : ∀ x ∈ K, φ x ⊆ K)
    (hφne : ∀ x ∈ K, (φ x).Nonempty) (hφconv : ∀ x ∈ K, Convex ℝ (φ x))
    (hgraph : IsClosed {p : E × E | p.1 ∈ K ∧ p.2 ∈ φ p.1}) :
    ∃ x ∈ K, x ∈ φ x := by
  sorry

/-! ## Layer 4: intersection theorems and Ky Fan's inequality -/

/-- 4.1 **The Knaster–Kuratowski–Mazurkiewicz lemma.** Let `a i`, for `i` in a nonempty finite
type, be points of a real normed space and `F i` closed sets such that the convex hull of the
points `a i` with `i ∈ A` is covered by the sets `F i` with `i ∈ A`, for every finite `A`. Then
the convex hull of all the points meets every `F i` at a common point. -/
theorem knaster_kuratowski_mazurkiewicz {ι E : Type*} [Fintype ι] [Nonempty ι]
    [NormedAddCommGroup E] [NormedSpace ℝ E] (a : ι → E) (F : ι → Set E)
    (hF : ∀ i, IsClosed (F i))
    (hcov : ∀ A : Finset ι, convexHull ℝ (a '' (A : Set ι)) ⊆ ⋃ i ∈ A, F i) :
    (convexHull ℝ (range a) ∩ ⋂ i, F i).Nonempty := by
  sorry

/-- 4.2 **Fan's form of the KKM lemma.** Let `X` be a subset of a real normed space and let `F`
assign to each `x ∈ X` a closed set `F x`, one of them compact, such that the convex hull of every
finite subset `t` of `X` is covered by the sets `F x` with `x ∈ t`. Then the sets `F x` with
`x ∈ X` have a common point. -/
theorem fan_kkm {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {X : Set E}
    {F : E → Set E} (hF : ∀ x ∈ X, IsClosed (F x)) (hcpt : ∃ x ∈ X, IsCompact (F x))
    (hkkm : ∀ t : Finset E, (t : Set E) ⊆ X → convexHull ℝ (t : Set E) ⊆ ⋃ x ∈ t, F x) :
    (⋂ x ∈ X, F x).Nonempty := by
  sorry

/-- 4.3 **Ky Fan's minimax inequality.** Let `K` be a nonempty compact convex subset of a real
normed space and `f : E → E → ℝ` with `f x` lower semicontinuous on `K` for each `x ∈ K`,
`x ↦ f x y` quasiconcave on `K` for each `y ∈ K`, and `f x x ≤ 0` on `K`. Then some `y ∈ K` has
`f x y ≤ 0` for every `x ∈ K`. -/
theorem kyFan_minimax_inequality {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {K : Set E} (hK : IsCompact K) (hconv : Convex ℝ K) (hne : K.Nonempty) {f : E → E → ℝ}
    (hlsc : ∀ x ∈ K, LowerSemicontinuousOn (f x) K)
    (hq : ∀ y ∈ K, QuasiconcaveOn ℝ K fun x ↦ f x y) (hdiag : ∀ x ∈ K, f x x ≤ 0) :
    ∃ y ∈ K, ∀ x ∈ K, f x y ≤ 0 := by
  sorry

/-! ## Layer 5: existence of pure equilibria -/

section Games

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {E : ι → Type*}
  [∀ i, NormedAddCommGroup (E i)] [∀ i, NormedSpace ℝ (E i)]

/-- 5.1 A pure Nash equilibrium of the game with strategy sets `S i` and payoffs `u i`, which
players maximize: a profile `s` with `s i ∈ S i` for every `i` from which no player gains by a
unilateral deviation within `S i`. -/
def IsPureNashEquilibrium (S : ∀ i, Set (E i)) (u : ι → (∀ i, E i) → ℝ) (s : ∀ i, E i) : Prop :=
  s ∈ Set.univ.pi S ∧ ∀ i, ∀ t ∈ S i, u i (Function.update s i t) ≤ u i s

/-- 5.2 **The Debreu–Glicksberg–Fan theorem.** A game with finitely many players, nonempty
compact convex strategy sets in finite-dimensional real normed spaces, payoffs continuous on the
set of strategy profiles, and each payoff quasiconcave in the player's own strategy has a pure
Nash equilibrium. -/
theorem exists_isPureNashEquilibrium [∀ i, FiniteDimensional ℝ (E i)] {S : ∀ i, Set (E i)}
    {u : ι → (∀ i, E i) → ℝ} (hS : ∀ i, IsCompact (S i)) (hconv : ∀ i, Convex ℝ (S i))
    (hne : ∀ i, (S i).Nonempty) (hu : ∀ i, ContinuousOn (u i) (Set.univ.pi S))
    (hq : ∀ i, ∀ s ∈ Set.univ.pi S, QuasiconcaveOn ℝ (S i) fun t ↦ u i (Function.update s i t)) :
    ∃ s, IsPureNashEquilibrium S u s := by
  sorry

end Games

end TauCetiRoadmap.KakutaniFixedPointAndContinuousGames
