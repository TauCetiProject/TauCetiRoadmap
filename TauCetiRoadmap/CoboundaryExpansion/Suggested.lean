module

public import Mathlib

/-!
# Coboundary expansion with group coefficients: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.

The headline theorems are:

* `h1_complete_movedNorm_fin_two` (Layer 7, Kozlov): the binary constant of the complete
  complex is `k/3` when `k ≥ 3` is not a power of two;
* `h1_complete_movedNorm_fin_three` (Layer 8): the `Sym(3)` constant of the complete complex is
  `k/3` for every `k ≥ 4`;
* `h1Norm_complete_movedNorm_fin_three` (Layer 8): the same constant in the normalized
  convention is `k/(k-2)`;
* `h1Sym_complete` (Layer 8): the infimum over all degrees `≥ 2` is `k/3`;
* `h1Err_complete` (Layer 9): the Chapman–Lubotzky cross-degree constant is `k/3`.

These prototypes pin the counting convention (sums of a group norm, not means), the gauge
convention `β u⁻¹ * α u v * β v`, the orientation `u < v < w` used to evaluate edges and
triangles, the definition of the Cheeger constant as an infimum over cochains at positive
gauge distance, and the cross-degree convention of Layer 9. The finite computations of Layer 6
are specified in the README only.
-/

@[expose] public section

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
  map_one' := by simp [Equiv.Perm.support_one]
  mul_le' σ τ := by
    show ((σ * τ).support.card : ℝ) ≤ σ.support.card + τ.support.card
    have h : (σ * τ).support ⊆ σ.support ∪ τ.support := Equiv.Perm.support_mul_le σ τ
    exact_mod_cast (Finset.card_le_card h).trans (Finset.card_union_le _ _)
  inv' σ := by simp [Equiv.Perm.support_inv]
  eq_one_of_map_eq_zero' σ h := by
    have h' : (σ.support.card : ℝ) = 0 := h
    exact Equiv.Perm.support_eq_empty_iff.mp (Finset.card_eq_zero.mp (by exact_mod_cast h'))

variable {α}

/-- Hamming distance between permutations is the moved-point count of the quotient. -/
theorem hammingDist_eq_movedNorm (σ τ : Equiv.Perm α) :
    (hammingDist (⇑σ) (⇑τ) : ℝ) = movedNorm α (σ⁻¹ * τ) := by
  sorry

end Moved

/-! ## Layer 2: finite 2-complexes and group-valued 1-cochains -/

/-- A finite 2-complex: 2-element edges and 3-element triangles whose 2-element faces are edges.

This is the edge/triangle specialization of the finite graded complex `HypergraphComplex 3 V`
owned by the Regularity roadmap (Layer 5 of `TauCetiRoadmap/Regularity`): `edges` and
`triangles` are its levels 2 and 3. The conversions `toHypergraphComplex` and
`ofHypergraphComplex` between the two are README targets; that roadmap is not importable here,
so it is not referenced in code. -/
structure TwoComplex (V : Type*) [DecidableEq V] where
  /-- The edges, each a 2-element set. -/
  edges : Finset (Finset V)
  /-- The triangles, each a 3-element set. -/
  triangles : Finset (Finset V)
  /-- Every edge has two vertices. -/
  card_edge : ∀ e ∈ edges, e.card = 2
  /-- Every triangle has three vertices. -/
  card_triangle : ∀ t ∈ triangles, t.card = 3
  /-- Every 2-element face of a triangle is an edge. -/
  face_mem : ∀ t ∈ triangles, ∀ e ⊆ t, e.card = 2 → e ∈ edges

/-- The complete 2-complex: every pair is an edge and every triple a triangle. -/
def complete (V : Type*) [Fintype V] [DecidableEq V] : TwoComplex V where
  edges := univ.powersetCard 2
  triangles := univ.powersetCard 3
  card_edge _ he := (Finset.mem_powersetCard.mp he).2
  card_triangle _ ht := (Finset.mem_powersetCard.mp ht).2
  face_mem _ _ _ _ hc := Finset.mem_powersetCard.mpr ⟨Finset.subset_univ _, hc⟩

variable {V : Type*} [Fintype V] [LinearOrder V]
variable {G : Type*} [Group G]

/-- A `G`-valued 1-cochain: a value on each oriented edge, inverted by reversing it. -/
structure Cochain (X : TwoComplex V) (G : Type*) [Group G] where
  /-- The value on the oriented edge `(u, v)`. -/
  toFun : V → V → G
  /-- Reversing an edge inverts the value. -/
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

/-- For finite coefficients the infimum is attained, so the gauge distance vanishes exactly on
coboundaries. -/
theorem gaugeDist_eq_zero_iff [Finite G] (ℓ : GroupNorm G) (α : Cochain X G) :
    α.gaugeDist ℓ = 0 ↔ α.IsCoboundary := by
  sorry

end Cochain

/-! ## Layer 3: the Cheeger constant -/

/-- The first coboundary Cheeger constant in the counting convention: the infimum of `N / D`
over cochains at positive gauge distance. -/
def h1 (X : TwoComplex V) (ℓ : GroupNorm G) : ℝ :=
  sInf {r : ℝ | ∃ α : Cochain X G, 0 < α.gaugeDist ℓ ∧ r = α.defect ℓ / α.gaugeDist ℓ}

/-- The Cheeger constant in the normalized convention: `h1` rescaled by the ratio of the number
of edges to the number of triangles. With Lean's `x / 0 = 0` this is `0` when `X` has no
triangle; the theorems use it only for `card V ≥ 3`. -/
def h1Norm (X : TwoComplex V) (ℓ : GroupNorm G) : ℝ :=
  (X.edges.card / X.triangles.card : ℝ) * h1 X ℓ

/-- The permutation Cheeger constant: the infimum of the same-degree constants
`h1 X (movedNorm (Fin m))` over the degrees `m ≥ 2`. Degree `1` is excluded because `Sym(1)` is
trivial, so its ratio set is empty and `sInf ∅ = 0` would force the infimum to `0`. -/
def h1Sym (X : TwoComplex V) : ℝ :=
  ⨅ n : ℕ, h1 X (movedNorm (Fin (n + 2)))

/-- The permutation constant is at most the binary (degree-2) constant. Each `h1` is
nonnegative, so the infimum defining `h1Sym` is bounded below. -/
theorem h1Sym_le_h1_fin_two (X : TwoComplex V) :
    h1Sym X ≤ h1 X (movedNorm (Fin 2)) := by
  sorry

/-! ## Layer 4: the star bound on the complete complex -/

/-- The star bound (Beasley, Proposition 1; Chapman–Lubotzky, Proposition 3.2, for
permutation coefficients), in counting form: the star gauges `starGauge α w`, one
for each vertex `w`, cost `3N` in total, so `|V| · D ≤ 3N`. -/
theorem card_mul_gaugeDist_le (ℓ : GroupNorm G) (hℓ : IsConjInvariant ℓ)
    (α : Cochain (complete V) G) :
    (Fintype.card V : ℝ) * α.gaugeDist ℓ ≤ 3 * α.defect ℓ := by
  sorry

/-- The star bound as a lower bound on the Cheeger constant of the complete complex, whenever
some cochain has positive gauge distance. -/
theorem card_div_three_le_h1 (ℓ : GroupNorm G) (hℓ : IsConjInvariant ℓ)
    (hne : ∃ α : Cochain (complete V) G, 0 < α.gaugeDist ℓ) :
    (Fintype.card V : ℝ) / 3 ≤ h1 (complete V) ℓ := by
  sorry

/-! ## Layer 5: balanced replication -/

/-- The `q`-fold balanced replication of a cochain on the complete complex: each vertex `i`
becomes the cluster `{i} × Fin q` in the lexicographic order, edges inside a cluster carry `1`,
and an edge between clusters `i ≠ j` carries `α i j`. -/
def Cochain.replicate (α : Cochain (complete V) G) (q : ℕ) :
    Cochain (complete (V ×ₗ Fin q)) G where
  toFun x y := if (ofLex x).1 = (ofLex y).1 then 1 else α.toFun (ofLex x).1 (ofLex y).1
  inv_symm x y _ := by
    by_cases hxy : (ofLex x).1 = (ofLex y).1
    · simp [hxy]
    · simp only [if_neg hxy, if_neg (Ne.symm hxy)]
      exact α.inv_symm (ofLex x).1 (ofLex y).1
        (Finset.mem_powersetCard.mpr ⟨Finset.subset_univ _, Finset.card_pair hxy⟩)

/-- Replication multiplies the triangle defect by `q ^ 3`: a triangle meeting three clusters is
read as the corresponding triangle of `α`, and one meeting at most two clusters has trivial
holonomy. -/
theorem Cochain.defect_replicate (ℓ : GroupNorm G) (α : Cochain (complete V) G) (q : ℕ) :
    (α.replicate q).defect ℓ = (q : ℝ) ^ 3 * α.defect ℓ := by
  sorry

/-- Replication multiplies the gauge distance by `q ^ 2`: lifting a gauge along the clusters gives
`≤`, and averaging over the choices of one vertex per cluster gives `≥`. -/
theorem Cochain.gaugeDist_replicate (ℓ : GroupNorm G) (α : Cochain (complete V) G) (q : ℕ) :
    (α.replicate q).gaugeDist ℓ = (q : ℝ) ^ 2 * α.gaugeDist ℓ := by
  sorry

/-! ## Layer 7: Kozlov's binary witnesses -/

/-- Kozlov: the `𝔽₂` constant is `k/3` when `k` is not a power of two. -/
theorem h1_complete_movedNorm_fin_two (hV : 3 ≤ Fintype.card V)
    (hpow : ¬ ∃ a : ℕ, Fintype.card V = 2 ^ a) :
    h1 (complete V) (movedNorm (Fin 2)) = (Fintype.card V : ℝ) / 3 := by
  sorry

/-! ## Layer 8: the headline -/

/-- The permutation coboundary constant of the complete complex is `k/3` for every `k ≥ 4`,
attained with values in `Sym(3)`. -/
theorem h1_complete_movedNorm_fin_three (hV : 4 ≤ Fintype.card V) :
    h1 (complete V) (movedNorm (Fin 3)) = (Fintype.card V : ℝ) / 3 := by
  sorry

/-- The headline in the normalized convention: `(k choose 2) / (k choose 3) · k/3 = k/(k-2)`. -/
theorem h1Norm_complete_movedNorm_fin_three (hV : 4 ≤ Fintype.card V) :
    h1Norm (complete V) (movedNorm (Fin 3)) = (Fintype.card V : ℝ) / (Fintype.card V - 2) := by
  sorry

/-- The infimum over all degrees `≥ 2` is `k/3`: every degree is bounded below by the star bound
and degree `3` attains it. -/
theorem h1Sym_complete (hV : 4 ≤ Fintype.card V) :
    h1Sym (complete V) = (Fintype.card V : ℝ) / 3 := by
  sorry

/-! ## Layer 9: the cross-degree convention -/

/-- The distance with errors between permutations of possibly different degrees:
`1 − #{j < min n m : σ j = τ j} / max n m`. For `n = m` it is the normalized Hamming distance.
It is used only for degrees `≥ 2`. -/
def distErr {n m : ℕ} (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) : ℝ :=
  1 - ((univ.filter fun j : Fin (min n m) =>
      (σ (Fin.castLE (min_le_left n m) j) : ℕ) = τ (Fin.castLE (min_le_right n m) j)).card : ℝ) /
    (max n m : ℕ)

/-- The cross-degree cost of a gauge `β` of degree `m` against a cochain of degree `n`: the
distance with errors from `α u v` to `β u * (β v)⁻¹`, summed over edges `u < v`. -/
def Cochain.costErr {X : TwoComplex V} {n m : ℕ} (α : Cochain X (Equiv.Perm (Fin n)))
    (β : V → Equiv.Perm (Fin m)) : ℝ :=
  ∑ p ∈ univ.filter (fun p : V × V => p.1 < p.2 ∧ ({p.1, p.2} : Finset V) ∈ X.edges),
    distErr (α.toFun p.1 p.2) (β p.1 * (β p.2)⁻¹)

/-- The cross-degree gauge distance: the infimum of `costErr` over gauges of every degree
`≥ 2`. -/
def Cochain.gaugeDistErr {X : TwoComplex V} {n : ℕ} (α : Cochain X (Equiv.Perm (Fin n))) : ℝ :=
  ⨅ (m : ℕ) (β : V → Equiv.Perm (Fin (m + 2))), α.costErr β

/-- The Chapman–Lubotzky cross-degree Cheeger constant. The numerator is the sum over triangles
of the moved-point counts of the holonomies, divided by the cochain degree; the infimum runs over
cochains of every degree `≥ 2` at strictly positive cross-degree distance (the identity cochain
has distance `0` and is excluded). -/
def h1Err (X : TwoComplex V) : ℝ :=
  sInf {r : ℝ | ∃ (n : ℕ) (α : Cochain X (Equiv.Perm (Fin (n + 2)))), 0 < α.gaugeDistErr ∧
    r = α.defect (movedNorm (Fin (n + 2))) / (n + 2 : ℕ) / α.gaugeDistErr}

/-- Chapman–Lubotzky's cross-degree constant of the complete complex is `k/3` for `k ≥ 4`. -/
theorem h1Err_complete (hV : 4 ≤ Fintype.card V) :
    h1Err (complete V) = (Fintype.card V : ℝ) / 3 := by
  sorry

end TauCetiRoadmap.CoboundaryExpansion
