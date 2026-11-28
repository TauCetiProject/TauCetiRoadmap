import Mathlib

/-!
# Integer polyhedra and total unimodularity: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, with the one definition those statements
need: the polyhedron `{x ≥ 0 | A x = b}`, copied verbatim from TensorProductCombinatorics §1.5.

Total unimodularity is Mathlib's `Matrix.IsTotallyUnimodular`, used for integer matrices. A
vertex of a polyhedron is a point of Mathlib's `Set.extremePoints ℝ`, and a vector is integral
when each of its coordinates is the image of an integer. Every headline theorem of the README is
stated here.
-/

namespace TauCetiRoadmap.IntegerPolyhedraAndTotalUnimodularity

open Matrix

/-! ## Layer 1: vertices of polyhedra and integrality -/

section Vertices

variable {m n : Type*} [Fintype m] [Fintype n]

/-- 1.1 The vertex criterion: a point `z` of the polyhedron `{x | A x ≤ b}` is a vertex exactly
when no nonzero direction is annihilated by every row of `A` that is tight at `z`, that is, when
the tight rows have rank `|n|`. -/
theorem mem_extremePoints_iff_forall_tight (A : Matrix m n ℝ) (b : m → ℝ) {z : n → ℝ}
    (hz : A *ᵥ z ≤ b) :
    z ∈ Set.extremePoints ℝ {x | A *ᵥ x ≤ b} ↔
      ∀ c : n → ℝ, (∀ i, (A *ᵥ z) i = b i → (A *ᵥ c) i = 0) → c = 0 := by
  sorry

/-- 1.2 Integrality of vertices: if `A` is totally unimodular and `b` is integral, every vertex of
`{x | A x ≤ b}` is integral. -/
theorem integral_of_mem_extremePoints {A : Matrix m n ℤ} (hA : A.IsTotallyUnimodular)
    (b : m → ℤ) {x : n → ℝ}
    (hx : x ∈ Set.extremePoints ℝ {x : n → ℝ | A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)}) :
    ∀ j, ∃ k : ℤ, x j = k := by
  sorry

/-- 1.3 Integral optima: if `A` is totally unimodular, `b` is integral and a linear function
attains its maximum on `{x | A x ≤ b}`, then it attains it at an integral point. -/
theorem exists_integral_isMaxOn {A : Matrix m n ℤ} (hA : A.IsTotallyUnimodular) (b : m → ℤ)
    (c : n → ℝ) {x₀ : n → ℝ}
    (hx₀ : x₀ ∈ {x : n → ℝ | A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)})
    (hmax : IsMaxOn (fun x => c ⬝ᵥ x)
      {x : n → ℝ | A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)} x₀) :
    ∃ x ∈ {x : n → ℝ | A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)},
      (∀ j, ∃ k : ℤ, x j = k) ∧
        IsMaxOn (fun x => c ⬝ᵥ x)
          {x : n → ℝ | A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)} x := by
  sorry

end Vertices

/-! ## Layer 2: characterisations of total unimodularity -/

section ChamberCountingCopy

variable {r : ℕ} {ι : Type*} [Fintype ι]

/-- 2.1 The real polytope `P_A(b) = {x ≥ 0 : A x = b}` (copied verbatim from
TensorProductCombinatorics §1.5). -/
def realFibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℝ) : Set (ι → ℝ) :=
  {x | (∀ j, 0 ≤ x j) ∧ ∀ i, ∑ j, (A i j : ℝ) * x j = b i}

end ChamberCountingCopy

/-- 2.1 Unimodular matrices (Veinott–Dantzig): an integer matrix `A` with `r` rows and real rank
`r` has all its `r × r` minors in `{0, 1, −1}` exactly when, for every integral `b`, every vertex
of `{x ≥ 0 | A x = b}` is integral. -/
theorem forall_det_mem_iff_forall_extremePoints_realFibre {r : ℕ} {ι : Type*} [Fintype ι]
    (A : Matrix (Fin r) ι ℤ) (hrank : (A.map ((↑) : ℤ → ℝ)).rank = r) :
    (∀ e : Fin r → ι, Function.Injective e →
        (A.submatrix id e).det ∈ Set.range SignType.cast) ↔
      ∀ b : Fin r → ℤ, ∀ x ∈ Set.extremePoints ℝ (realFibre A fun i => (b i : ℝ)),
        ∀ j, ∃ k : ℤ, x j = k := by
  sorry

/-- 2.2 The Hoffman–Kruskal theorem: an integer matrix `A` is totally unimodular exactly when,
for every integral `b`, every vertex of `{x | x ≥ 0, A x ≤ b}` is integral. -/
theorem isTotallyUnimodular_iff_forall_extremePoints {m n : Type*} [Fintype m] [Fintype n]
    (A : Matrix m n ℤ) :
    A.IsTotallyUnimodular ↔
      ∀ b : m → ℤ, ∀ x ∈ Set.extremePoints ℝ
          {x : n → ℝ | 0 ≤ x ∧ A.map ((↑) : ℤ → ℝ) *ᵥ x ≤ fun i => (b i : ℝ)},
        ∀ j, ∃ k : ℤ, x j = k := by
  sorry

/-- 2.3 Ghouila-Houri's characterisation: an integer matrix is totally unimodular exactly when
every finite set `R` of its rows can be signed so that the signed sum of the rows of `R` has all
its entries in `{0, 1, −1}`. -/
theorem isTotallyUnimodular_iff_forall_finset_signs {m n : Type*} (A : Matrix m n ℤ) :
    A.IsTotallyUnimodular ↔
      ∀ R : Finset m, ∃ ε : m → ℤ, (∀ i ∈ R, ε i = 1 ∨ ε i = -1) ∧
        ∀ j, ∑ i ∈ R, ε i * A i j ∈ Set.range SignType.cast := by
  sorry

/-! ## Layer 3: classes of totally unimodular matrices -/

/-- 3.1 A matrix with entries in `{0, 1, −1}` having at most one entry `1` and at most one entry
`−1` in each column is totally unimodular. -/
theorem isTotallyUnimodular_of_forall_col {m n : Type*} (A : Matrix m n ℤ)
    (hA : ∀ i j, A i j ∈ Set.range SignType.cast)
    (hpos : ∀ j i i', A i j = 1 → A i' j = 1 → i = i')
    (hneg : ∀ j i i', A i j = -1 → A i' j = -1 → i = i') :
    A.IsTotallyUnimodular := by
  sorry

/-- 3.2 A simple graph is bipartite exactly when its vertex–edge incidence matrix over `ℤ` is
totally unimodular. -/
theorem isTotallyUnimodular_incMatrix_iff {V : Type*} [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    (G.incMatrix ℤ).IsTotallyUnimodular ↔ G.IsBipartite := by
  sorry

/-! ## Layer 4: matching polytopes of bipartite graphs -/

section Matching

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- 4.1 The matching polytope of a finite bipartite graph: the nonnegative edge vectors with sum at
most `1` at every vertex form the convex hull of the indicator vectors of the matchings. -/
theorem setOf_incMatrix_le_one_eq_convexHull (hG : G.IsBipartite) :
    {x : G.edgeSet → ℝ | 0 ≤ x ∧ ∀ v, ∑ e : G.edgeSet, G.incMatrix ℝ v e * x e ≤ 1} =
      convexHull ℝ {x | ∃ M : G.Subgraph, M.IsMatching ∧
        x = Set.indicator {e : G.edgeSet | (e : Sym2 V) ∈ M.edgeSet} 1} := by
  sorry

/-- 4.2 The perfect matching polytope of a finite bipartite graph: the nonnegative edge vectors
with sum exactly `1` at every vertex form the convex hull of the indicator vectors of the perfect
matchings. -/
theorem setOf_incMatrix_eq_one_eq_convexHull (hG : G.IsBipartite) :
    {x : G.edgeSet → ℝ | 0 ≤ x ∧ ∀ v, ∑ e : G.edgeSet, G.incMatrix ℝ v e * x e = 1} =
      convexHull ℝ {x | ∃ M : G.Subgraph, M.IsPerfectMatching ∧
        x = Set.indicator {e : G.edgeSet | (e : Sym2 V) ∈ M.edgeSet} 1} := by
  sorry

end Matching

end TauCetiRoadmap.IntegerPolyhedraAndTotalUnimodularity
