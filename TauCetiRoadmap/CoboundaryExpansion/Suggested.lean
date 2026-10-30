import Mathlib

/-!
# Coboundary expansion with group coefficients: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.

These prototypes pin the counting convention (sums of a group norm, not means), the gauge
convention `β u⁻¹ * α u v * β v`, the orientation `u < v < w` used to evaluate edges and
triangles, and the definition of the Cheeger constant as an infimum over cochains at positive
gauge distance. The cross-degree convention of Layer 9 and the coefficient-subgroup values of
Layer 6 are specified in the README only.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.CoboundaryExpansion

/-! ## Layer 1: conjugation-invariant group norms -/

section Norms

variable {G : Type*} [Group G]

/-- A group norm is conjugation invariant. With `GroupNorm.inv'` this makes
`d g h = ℓ (g⁻¹ * h)` a bi-invariant metric. -/
def IsConjInvariant (ℓ : GroupNorm G) : Prop :=
  ∀ g h : G, ℓ (h * g * h⁻¹) = ℓ g

end Norms

section Moved

variable (α : Type*) [Fintype α] [DecidableEq α]

/-- The moved-point count of a permutation: the unnormalized Hamming norm. -/
def movedNorm : GroupNorm (Equiv.Perm α) where
  toFun σ := (σ.support.card : ℝ)
  map_one' := by sorry
  mul_le' σ τ := by sorry
  inv' σ := by sorry
  eq_one_of_map_eq_zero' σ h := by sorry

theorem isConjInvariant_movedNorm : IsConjInvariant (movedNorm α) := by
  sorry

variable {α}

/-- Hamming distance between permutations is the moved-point count of the quotient. -/
theorem hammingDist_eq_movedNorm (σ τ : Equiv.Perm α) :
    (hammingDist (⇑σ) (⇑τ) : ℝ) = movedNorm α (σ⁻¹ * τ) := by
  sorry

/-- The parity retraction onto `{1, t}` for a transposition `t`. -/
def parityRetract (t : Equiv.Perm α) (ht : t.IsSwap) : Equiv.Perm α →* Equiv.Perm α where
  toFun g := if Equiv.Perm.sign g = 1 then 1 else t
  map_one' := by sorry
  map_mul' g h := by sorry

/-- The parity retraction never moves more points. -/
theorem movedNorm_parityRetract_le (t : Equiv.Perm α) (ht : t.IsSwap) (g : Equiv.Perm α) :
    movedNorm α (parityRetract t ht g) ≤ movedNorm α g := by
  sorry

end Moved

/-! ## Layer 2: finite 2-complexes and group-valued 1-cochains -/

/-- A finite 2-complex: 2-element edges and 3-element triangles whose 2-element faces are edges. -/
structure TwoComplex (V : Type*) [DecidableEq V] where
  edges : Finset (Finset V)
  triangles : Finset (Finset V)
  card_edge : ∀ e ∈ edges, e.card = 2
  card_triangle : ∀ t ∈ triangles, t.card = 3
  face_mem : ∀ t ∈ triangles, ∀ e ⊆ t, e.card = 2 → e ∈ edges

/-- The complete 2-complex: every pair is an edge and every triple a triangle. -/
def complete (V : Type*) [Fintype V] [DecidableEq V] : TwoComplex V where
  edges := univ.powersetCard 2
  triangles := univ.powersetCard 3
  card_edge := by sorry
  card_triangle := by sorry
  face_mem := by sorry

variable {V : Type*} [Fintype V] [LinearOrder V]
variable {G : Type*} [Group G]

/-- A `G`-valued 1-cochain: a value on each oriented edge, inverted by reversing it. -/
structure Cochain (X : TwoComplex V) (G : Type*) [Group G] where
  toFun : V → V → G
  inv_symm : ∀ u v, ({u, v} : Finset V) ∈ X.edges → toFun v u = (toFun u v)⁻¹

namespace Cochain

variable {X : TwoComplex V}

/-- The triangle defect `N`: the norm of the holonomy `α u v * α v w * α w u`, summed over the
triangles, each read in increasing order `u < v < w`. -/
def defect (ℓ : GroupNorm G) (α : Cochain X G) : ℝ :=
  ∑ p ∈ univ.filter (fun p : V × V × V =>
      p.1 < p.2.1 ∧ p.2.1 < p.2.2 ∧ ({p.1, p.2.1, p.2.2} : Finset V) ∈ X.triangles),
    ℓ (α.toFun p.1 p.2.1 * α.toFun p.2.1 p.2.2 * α.toFun p.2.2 p.1)

/-- The cost of a gauge `β`: the norm of `β u⁻¹ * α u v * β v`, summed over edges `u < v`. -/
def cost (ℓ : GroupNorm G) (α : Cochain X G) (β : V → G) : ℝ :=
  ∑ p ∈ univ.filter (fun p : V × V => p.1 < p.2 ∧ ({p.1, p.2} : Finset V) ∈ X.edges),
    ℓ ((β p.1)⁻¹ * α.toFun p.1 p.2 * β p.2)

/-- The gauge distance `D`: the infimum of the cost over all gauges. -/
def gaugeDist (ℓ : GroupNorm G) (α : Cochain X G) : ℝ :=
  ⨅ β : V → G, α.cost ℓ β

/-- `α` is a coboundary when some gauge trivializes every edge. -/
def IsCoboundary (α : Cochain X G) : Prop :=
  ∃ β : V → G, ∀ u v, ({u, v} : Finset V) ∈ X.edges → α.toFun u v = β u * (β v)⁻¹

theorem gaugeDist_eq_zero_iff [Finite G] (ℓ : GroupNorm G) (α : Cochain X G) :
    α.gaugeDist ℓ = 0 ↔ α.IsCoboundary := by
  sorry

end Cochain

/-! ## Layer 3: the Cheeger constant -/

/-- The first coboundary Cheeger constant in the counting convention: the infimum of `N / D`
over cochains at positive gauge distance. -/
def h1 (X : TwoComplex V) (ℓ : GroupNorm G) : ℝ :=
  sInf {r : ℝ | ∃ α : Cochain X G, 0 < α.gaugeDist ℓ ∧ r = α.defect ℓ / α.gaugeDist ℓ}

/-! ## Layer 4: the star bound on the complete complex -/

/-- Chapman–Lubotzky, Proposition 3.2, in counting form: the star gauges cost `3N` in total,
so `|V| · D ≤ 3N`. -/
theorem card_mul_gaugeDist_le (ℓ : GroupNorm G) (hℓ : IsConjInvariant ℓ)
    (α : Cochain (complete V) G) :
    (Fintype.card V : ℝ) * α.gaugeDist ℓ ≤ 3 * α.defect ℓ := by
  sorry

theorem card_div_three_le_h1 (ℓ : GroupNorm G) (hℓ : IsConjInvariant ℓ)
    (hne : ∃ α : Cochain (complete V) G, 0 < α.gaugeDist ℓ) :
    (Fintype.card V : ℝ) / 3 ≤ h1 (complete V) ℓ := by
  sorry

/-! ## Layer 8: the headline -/

/-- The permutation coboundary constant of the complete complex is `k/3` for every `k ≥ 4`,
attained with values in `Sym(3)`. -/
theorem h1_complete_movedNorm_fin_three (hV : 4 ≤ Fintype.card V) :
    h1 (complete V) (movedNorm (Fin 3)) = (Fintype.card V : ℝ) / 3 := by
  sorry

/-- Kozlov: the `𝔽₂` constant is `k/3` when `k` is not a power of two. -/
theorem h1_complete_movedNorm_fin_two (hV : 3 ≤ Fintype.card V)
    (hpow : ¬ ∃ a : ℕ, Fintype.card V = 2 ^ a) :
    h1 (complete V) (movedNorm (Fin 2)) = (Fintype.card V : ℝ) / 3 := by
  sorry

end TauCetiRoadmap.CoboundaryExpansion
