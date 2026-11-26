import Mathlib

/-!
# Equiangular lines and two-graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Graphs are Mathlib's `SimpleGraph V`. The Seidel matrix of a graph has `0` on the diagonal, `-1`
for adjacent and `1` for distinct nonadjacent vertices. A two-graph is a set of three-element
subsets in which every four-element subset contains an even number of members. A system of lines
through the origin is given by a family of unit vectors, one on each line; the family `x` is
equiangular with angle `α` when `‖⟪x i, x j⟫‖ = α` for `i ≠ j`. The multiplicity of an eigenvalue
`θ` of a matrix `S` is the dimension of the eigenspace of `θ` for `Matrix.toLin' S`, which is `0`
when `θ` is not an eigenvalue. Dimensions are `Module.finrank`, which is `0` for an
infinite-dimensional space; the bounds 4.1–4.3 and Neumann's theorem 5.3 therefore carry
`[FiniteDimensional]`, while 3.1 (a statement about a finite span), 5.1 (where `d = 0` forces
`n = 0`) and 5.2 (where `2 ≤ d` forces finite dimension) do not need it.
-/

noncomputable section

open Matrix Module

open scoped InnerProductSpace

namespace TauCetiRoadmap.EquiangularLinesAndTwoGraphs

/-! ## Layer 1: Seidel matrices and switching -/

section Seidel

variable {V : Type*}

/-- 1.1 The Seidel matrix `J − I − 2A` of a graph: `0` on the diagonal, `-1` for adjacent and
`1` for distinct nonadjacent vertices. -/
def seidelMatrix (R : Type*) [DecidableEq V] [Ring R] (G : SimpleGraph V) [DecidableRel G.Adj] :
    Matrix V V R :=
  Matrix.of fun u v => if u = v then 0 else if G.Adj u v then -1 else 1

/-- 1.2 Seidel switching of `G` with respect to `U`: adjacency is kept inside `U` and inside its
complement and is interchanged between `U` and its complement. -/
def switch (G : SimpleGraph V) (U : Set V) : SimpleGraph V where
  Adj u v := u ≠ v ∧ (G.Adj u v ↔ (u ∈ U ↔ v ∈ U))
  symm.symm u v h := ⟨h.1.symm, by rw [G.adj_comm, h.2]; exact Iff.comm⟩
  loopless.irrefl u h := h.1 rfl

/-- 1.2 Decidability of adjacency in a switched graph. -/
instance instDecidableRelSwitch [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Set V) [DecidablePred (· ∈ U)] : DecidableRel (switch G U).Adj :=
  fun u v => inferInstanceAs (Decidable (u ≠ v ∧ (G.Adj u v ↔ (u ∈ U ↔ v ∈ U))))

/-- 1.2 Switching with respect to `U` conjugates the Seidel matrix by the diagonal matrix with
`-1` at the vertices of `U` and `1` elsewhere; in particular switching does not change the Seidel
spectrum. -/
theorem seidelMatrix_switch [Fintype V] [DecidableEq V] (R : Type*) [Ring R]
    (G : SimpleGraph V) [DecidableRel G.Adj] (U : Set V) [DecidablePred (· ∈ U)] :
    seidelMatrix R (switch G U) =
      diagonal (fun v => if v ∈ U then (-1 : R) else 1) * seidelMatrix R G *
        diagonal (fun v => if v ∈ U then (-1 : R) else 1) := by
  sorry

end Seidel

/-! ## Layer 2: two-graphs -/

section TwoGraphs

variable {V : Type*} [DecidableEq V]

/-- 2.1 A two-graph on `V`: a set of three-element subsets, the coherent triples, such that every
four-element subset of `V` contains an even number of them. -/
def IsTwoGraph (Δ : Set (Finset V)) : Prop :=
  (∀ t ∈ Δ, t.card = 3) ∧ ∀ s : Finset V, s.card = 4 → Even {t | t ⊆ s ∧ t ∈ Δ}.ncard

/-- 2.1 The triples of distinct vertices of `G` that span an odd number of edges. -/
def oddTriples (G : SimpleGraph V) : Set (Finset V) :=
  {t | ∃ x y z, x ≠ y ∧ x ≠ z ∧ y ≠ z ∧ t = {x, y, z} ∧
    Xor (G.Adj x y) (Xor (G.Adj x z) (G.Adj y z))}

/-- 2.1 The odd triples of a graph form a two-graph. -/
theorem isTwoGraph_oddTriples (G : SimpleGraph V) : IsTwoGraph (oddTriples G) := by
  sorry

/-- 2.2 Two graphs have the same two-graph exactly when one is obtained from the other by
switching. -/
theorem oddTriples_eq_oddTriples_iff {G H : SimpleGraph V} :
    oddTriples G = oddTriples H ↔ ∃ U : Set V, H = switch G U := by
  sorry

/-- 2.2 Every two-graph is the two-graph of a graph. -/
theorem exists_oddTriples_eq {Δ : Set (Finset V)} (hΔ : IsTwoGraph Δ) :
    ∃ G : SimpleGraph V, oddTriples G = Δ := by
  sorry

/-- 2.3 The regularity condition of degree `a`: every pair of distinct points lies in exactly `a`
members of `Δ`. -/
def IsRegularTwoGraph (Δ : Set (Finset V)) (a : ℕ) : Prop :=
  ∀ x y : V, x ≠ y → {t ∈ Δ | x ∈ t ∧ y ∈ t}.ncard = a

/-- 2.3 The two-graph of `G` on `n` points is regular of degree `a` exactly when its Seidel
matrix satisfies `S² = (n − 1) I + (n − 2 − 2a) S`. -/
theorem isRegularTwoGraph_oddTriples_iff [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (a : ℕ) :
    IsRegularTwoGraph (oddTriples G) a ↔
      seidelMatrix ℤ G * seidelMatrix ℤ G =
        ((Fintype.card V : ℤ) - 1) • (1 : Matrix V V ℤ) +
          ((Fintype.card V : ℤ) - 2 - 2 * a) • seidelMatrix ℤ G := by
  sorry

/-- 2.4 The two-graph of `G` is regular exactly when the Seidel matrix of `G` has at most two
distinct eigenvalues, that is, is annihilated by a monic real quadratic. -/
theorem exists_isRegularTwoGraph_iff [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    (∃ a, IsRegularTwoGraph (oddTriples G) a) ↔
      ∃ ρ₁ ρ₂ : ℝ, (seidelMatrix ℝ G - ρ₁ • 1) * (seidelMatrix ℝ G - ρ₂ • 1) = 0 := by
  sorry

end TwoGraphs

/-! ## Layer 3: equiangular systems and their Seidel matrices -/

section Equiangular

variable {E : Type*} [NormedAddCommGroup E] {ι : Type*}

/-- 3.1 The family `x` of vectors is equiangular with angle `α` over `𝕜`: unit vectors whose
inner products between distinct members all have absolute value `α`. -/
def IsEquiangular (𝕜 : Type*) [RCLike 𝕜] [InnerProductSpace 𝕜 E] (x : ι → E) (α : ℝ) : Prop :=
  (∀ i, ‖x i‖ = 1) ∧ ∀ i j, i ≠ j → ‖⟪x i, x j⟫_𝕜‖ = α

/-- 3.1 The sign graph of a family of vectors of a real inner product space: `i` and `j` are
adjacent when `i ≠ j` and `⟪x i, x j⟫ < 0`. -/
def signGraph [InnerProductSpace ℝ E] (x : ι → E) : SimpleGraph ι where
  Adj i j := i ≠ j ∧ ⟪x i, x j⟫_ℝ < 0
  symm.symm i j h := ⟨h.1.symm, by rw [real_inner_comm]; exact h.2⟩
  loopless.irrefl i h := h.1 rfl

/-- 3.1 Adjacency in the sign graph is decided classically. -/
instance instDecidableRelSignGraph [InnerProductSpace ℝ E] (x : ι → E) :
    DecidableRel (signGraph x).Adj :=
  Classical.decRel _

/-- 3.1 From lines to Seidel matrices. For an equiangular family of `n` unit vectors with angle
`α > 0` spanning a subspace of dimension `r`, the Gram matrix is `I + α S` for the Seidel matrix
`S` of the sign graph, every eigenvalue of `S` is at least `−1/α`, and `−1/α` has multiplicity
`n − r`. -/
theorem gram_eq_and_finrank_eigenspace [InnerProductSpace ℝ E] [Fintype ι] [DecidableEq ι]
    {x : ι → E} {α : ℝ} (hx : IsEquiangular ℝ x α) (hα : 0 < α) :
    gram ℝ x = 1 + α • seidelMatrix ℝ (signGraph x) ∧
      (seidelMatrix ℝ (signGraph x) + α⁻¹ • 1).PosSemidef ∧
      finrank ℝ (Module.End.eigenspace (toLin' (seidelMatrix ℝ (signGraph x))) (-α⁻¹)) =
        Fintype.card ι - finrank ℝ (Submodule.span ℝ (Set.range x)) := by
  sorry

/-- 3.2 From Seidel matrices to lines. If `θ < 0` and `S − θ I` is positive semidefinite for the
Seidel matrix `S` of a graph on `n` vertices, and `m` is the multiplicity of `θ`, there are `n`
unit vectors spanning `ℝ^(n − m)` whose inner products are `−θ⁻¹ S i j` for `i ≠ j`. -/
theorem exists_equiangular_of_posSemidef [Fintype ι] [DecidableEq ι] (G : SimpleGraph ι)
    [DecidableRel G.Adj] {θ : ℝ} (hθ : θ < 0) (hS : (seidelMatrix ℝ G - θ • 1).PosSemidef) :
    ∃ x : ι → EuclideanSpace ℝ
        (Fin (Fintype.card ι - finrank ℝ (Module.End.eigenspace (toLin' (seidelMatrix ℝ G)) θ))),
      (∀ i, ‖x i‖ = 1) ∧ (∀ i j, i ≠ j → ⟪x i, x j⟫_ℝ = -θ⁻¹ * seidelMatrix ℝ G i j) ∧
        Submodule.span ℝ (Set.range x) = ⊤ := by
  sorry

/-! ## Layer 4: the absolute and relative bounds -/

/-- 4.1 The absolute bound (Gerzon). An equiangular family of unit vectors with angle `α < 1` in
a real inner product space of dimension `d` has at most `d(d + 1)/2` members. -/
theorem two_mul_card_le_of_isEquiangular [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [Fintype ι] {x : ι → E} {α : ℝ} (hx : IsEquiangular ℝ x α) (hα : α < 1) :
    2 * Fintype.card ι ≤ finrank ℝ E * (finrank ℝ E + 1) := by
  sorry

/-- 4.2 The absolute bound over `ℂ`. An equiangular family of unit vectors with angle `α < 1` in
a complex inner product space of dimension `d` has at most `d²` members. -/
theorem card_le_sq_of_isEquiangular [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]
    [Fintype ι] {x : ι → E} {α : ℝ} (hx : IsEquiangular ℂ x α) (hα : α < 1) :
    Fintype.card ι ≤ finrank ℂ E ^ 2 := by
  sorry

/-- 4.3 The relative bound. If `n` unit vectors of a real or complex inner product space of
dimension `d` have `‖⟪x i, x j⟫‖ ≤ α` for `i ≠ j` and `d α² < 1`, then
`n ≤ d (1 − α²) / (1 − d α²)`. -/
theorem card_le_relativeBound {𝕜 : Type*} [RCLike 𝕜] [InnerProductSpace 𝕜 E]
    [FiniteDimensional 𝕜 E] [Fintype ι] {x : ι → E} (hx : ∀ i, ‖x i‖ = 1) {α : ℝ}
    (hxα : ∀ i j, i ≠ j → ‖⟪x i, x j⟫_𝕜‖ ≤ α) (hd : (finrank 𝕜 E : ℝ) * α ^ 2 < 1) :
    (Fintype.card ι : ℝ) ≤ finrank 𝕜 E * (1 - α ^ 2) / (1 - finrank 𝕜 E * α ^ 2) := by
  sorry

/-! ## Layer 5: equality and integrality -/

/-- 5.1 Equality in the relative bound. For an equiangular family of `n` unit vectors with angle
`α > 0` in a real inner product space of dimension `d` with `d α² < 1` and
`n (1 − d α²) = d (1 − α²)`, the Seidel matrix of the sign graph has the eigenvalues
`ρ = (n − d)/(α d)`, of multiplicity `d`, and `−1/α`, of multiplicity `n − d` (so `−1/α` is not
an eigenvalue when `n = d`), and no others; if moreover `d + 1 < n` and `n ≠ 2d`, both are odd
integers. -/
theorem seidelMatrix_of_card_eq_relativeBound [InnerProductSpace ℝ E] [Fintype ι] [DecidableEq ι]
    {x : ι → E} {α : ℝ} (hx : IsEquiangular ℝ x α) (hα : 0 < α)
    (hd : (finrank ℝ E : ℝ) * α ^ 2 < 1)
    (heq : (Fintype.card ι : ℝ) * (1 - finrank ℝ E * α ^ 2) = finrank ℝ E * (1 - α ^ 2)) :
    (seidelMatrix ℝ (signGraph x) -
          (((Fintype.card ι : ℝ) - finrank ℝ E) / (α * finrank ℝ E)) • 1) *
        (seidelMatrix ℝ (signGraph x) + α⁻¹ • 1) = 0 ∧
      finrank ℝ (Module.End.eigenspace (toLin' (seidelMatrix ℝ (signGraph x)))
          (((Fintype.card ι : ℝ) - finrank ℝ E) / (α * finrank ℝ E))) = finrank ℝ E ∧
      finrank ℝ (Module.End.eigenspace (toLin' (seidelMatrix ℝ (signGraph x))) (-α⁻¹)) =
        Fintype.card ι - finrank ℝ E ∧
      (finrank ℝ E + 1 < Fintype.card ι → Fintype.card ι ≠ 2 * finrank ℝ E →
        ∃ m₁ m₂ : ℤ, Odd m₁ ∧ Odd m₂ ∧
          (m₁ : ℝ) = ((Fintype.card ι : ℝ) - finrank ℝ E) / (α * finrank ℝ E) ∧
          (m₂ : ℝ) = -α⁻¹) := by
  sorry

/-- 5.2 Equality in the absolute bound. If an equiangular family of unit vectors with angle
`α < 1` in a real inner product space of dimension `d ≥ 2` has `d(d + 1)/2` members, then
`α² = 1/(d + 2)`. -/
theorem add_two_mul_sq_eq_one [InnerProductSpace ℝ E] [Fintype ι] {x : ι → E} {α : ℝ}
    (hx : IsEquiangular ℝ x α) (hα : α < 1) (hd : 2 ≤ finrank ℝ E)
    (heq : 2 * Fintype.card ι = finrank ℝ E * (finrank ℝ E + 1)) :
    ((finrank ℝ E : ℝ) + 2) * α ^ 2 = 1 := by
  sorry

/-- 5.3 Neumann's theorem. If an equiangular family of `n` unit vectors with angle `α` in a real
inner product space of dimension `d` has `n > 2d`, then `1/α` is an odd integer. -/
theorem exists_odd_mul_eq_one [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [Fintype ι]
    {x : ι → E} {α : ℝ} (hx : IsEquiangular ℝ x α) (hn : 2 * finrank ℝ E < Fintype.card ι) :
    ∃ m : ℕ, Odd m ∧ (m : ℝ) * α = 1 := by
  sorry

end Equiangular

end TauCetiRoadmap.EquiangularLinesAndTwoGraphs
