import Mathlib

/-!
# The matching polynomial: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need, each with a real body. Every headline theorem of the roadmap is statable at
the pins and is stated here.

A graph is a Mathlib `SimpleGraph V` on a finite vertex type. The matching polynomial is
`μ(G, x) = Σ_k (−1)^k m_k x^(n − 2k)`, where `n` is the number of vertices and `m_k` the number of
matchings with `k` edges, matchings being Mathlib's `SimpleGraph.Subgraph.IsMatching`. Deleting
vertices is `SimpleGraph.induce` on the complement; real-rootedness is `Polynomial.Splits` of the
image in `ℝ[X]`.
-/

open Polynomial

namespace TauCetiRoadmap.MatchingPolynomial

variable {V : Type*}

/-! ## Layer 1: the matching polynomial and its recursions -/

/-- 1.1 The number `m_k` of matchings of `G` with exactly `k` edges, a matching being a subgraph
`M` with `M.IsMatching`. On a finite vertex type the set is finite; `m_0 = 1` (the empty
subgraph). -/
noncomputable def matchingCount (G : SimpleGraph V) (k : ℕ) : ℕ :=
  {M : G.Subgraph | M.IsMatching ∧ M.edgeSet.ncard = k}.ncard

/-- 1.1 The matching polynomial `μ(G, x) = Σ_(0 ≤ k ≤ n/2) (−1)^k m_k x^(n − 2k)` of a graph on a
finite vertex type with `n` vertices. It is monic of degree `n`, and `μ = 1` on the empty type. -/
noncomputable def matchingPolynomial [Finite V] (G : SimpleGraph V) : ℤ[X] :=
  ∑ k ∈ Finset.range (Nat.card V / 2 + 1),
    C ((-1) ^ k * (matchingCount G k : ℤ)) * X ^ (Nat.card V - 2 * k)

/-- 1.2 Vertex recursion: for a vertex `v`,
`μ(G) = x μ(G − v) − Σ_(w ~ v) μ(G − v − w)`. -/
theorem matchingPolynomial_eq_X_mul_sub_sum [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) :
    matchingPolynomial G =
      X * matchingPolynomial (G.induce ({v}ᶜ : Set V)) -
        ∑ w ∈ G.neighborFinset v, matchingPolynomial (G.induce ({v, w}ᶜ : Set V)) := by
  sorry

/-- 1.2 Edge recursion: for an edge `uv` of `G`, `μ(G) = μ(G − uv) − μ(G − u − v)`, where
`G − uv` deletes the edge and `G − u − v` deletes both of its ends. -/
theorem matchingPolynomial_eq_deleteEdges_sub [Finite V] (G : SimpleGraph V) {u v : V}
    (h : G.Adj u v) :
    matchingPolynomial G =
      matchingPolynomial (G.deleteEdges {s(u, v)}) -
        matchingPolynomial (G.induce ({u, v}ᶜ : Set V)) := by
  sorry

/-! ## Layer 2: the characteristic polynomial -/

/-- 2.1 The signed adjacency matrix of a signing `s` of the edges of `G`: the entry at `(i, j)` is
`s` of the edge `ij` when `i ~ j`, and `0` otherwise. -/
def signedAdjMatrix [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : G.edgeSet → ℤˣ) : Matrix V V ℤ :=
  Matrix.of fun i j =>
    if h : G.Adj i j then ((s ⟨s(i, j), (SimpleGraph.mem_edgeSet G).2 h⟩ : ℤˣ) : ℤ) else 0

/-- 2.1 Godsil–Gutman: the characteristic polynomials of the `2^|E|` signed adjacency matrices of
`G` sum to `2^|E|` times the matching polynomial; that is, the expected characteristic polynomial
of a uniformly random signing is `μ(G)`. -/
theorem sum_charpoly_signedAdjMatrix [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    ∑ s : G.edgeSet → ℤˣ, (signedAdjMatrix G s).charpoly =
      C ((2 : ℤ) ^ Fintype.card G.edgeSet) * matchingPolynomial G := by
  sorry

/-- 2.2 The characteristic polynomial `det(x I − A)` of the adjacency matrix equals the matching
polynomial if and only if the graph is a forest. -/
theorem charpoly_adjMatrix_eq_matchingPolynomial_iff [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] :
    (G.adjMatrix ℤ).charpoly = matchingPolynomial G ↔ G.IsAcyclic := by
  sorry

/-! ## Layer 3: the path tree -/

/-- 3.1 The path tree `T(G, u)`: its vertices are the paths of `G` that start at `u`, and two paths
are adjacent when one extends the other by a single edge. -/
def pathTree (G : SimpleGraph V) (u : V) : SimpleGraph (Σ w : V, G.Path u w) :=
  SimpleGraph.fromRel fun p q =>
    ∃ h : G.Adj p.1 q.1, (q.2 : G.Walk u q.1) = (p.2 : G.Walk u p.1).concat h

/-- 3.1 The root of the path tree, the path of length zero at `u`. -/
def pathTreeRoot (G : SimpleGraph V) (u : V) : Σ w : V, G.Path u w :=
  ⟨u, SimpleGraph.Path.nil⟩

/-- 3.1 The path tree is a tree. -/
theorem pathTree_isTree (G : SimpleGraph V) (u : V) : (pathTree G u).IsTree := by
  sorry

/-- 3.2 Godsil's identity `μ(G − u) / μ(G) = μ(T − u) / μ(T)` for `T = T(G, u)`, with the
denominators cleared; `T − u` deletes the root. -/
theorem matchingPolynomial_induce_mul_pathTree [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (u : V) :
    matchingPolynomial (G.induce ({u}ᶜ : Set V)) * matchingPolynomial (pathTree G u) =
      matchingPolynomial G *
        matchingPolynomial ((pathTree G u).induce ({pathTreeRoot G u}ᶜ)) := by
  sorry

/-- 3.2 Godsil's divisibility: for a connected graph, `μ(G)` divides `μ(T(G, u))` in `ℤ[X]`. -/
theorem matchingPolynomial_dvd_pathTree [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (hG : G.Connected) (u : V) :
    matchingPolynomial G ∣ matchingPolynomial (pathTree G u) := by
  sorry

/-! ## Layer 4: roots -/

/-- 4.1 The real roots of an integer polynomial, with multiplicity, listed in nonincreasing order. -/
noncomputable def sortedRealRoots (p : ℤ[X]) : List ℝ :=
  ((p.map (Int.castRingHom ℝ)).roots).sort (· ≥ ·)

/-- 4.1 Heilmann–Lieb: the matching polynomial has only real roots. -/
theorem splits_matchingPolynomial [Finite V] (G : SimpleGraph V) :
    ((matchingPolynomial G).map (Int.castRingHom ℝ)).Splits := by
  sorry

/-- 4.1 Interlacing: if `μ(G)` has roots `α₁ ≥ ⋯ ≥ αₙ` and `μ(G − v)` has roots
`β₁ ≥ ⋯ ≥ β_(n−1)`, then `α_i ≥ β_i ≥ α_(i+1)` for `1 ≤ i ≤ n − 1`. By real-rootedness and the
degrees, the two sorted lists have lengths `n` and `n − 1`, so every index used is in range. -/
theorem sortedRealRoots_interlace [Finite V] (G : SimpleGraph V) (v : V) :
    ∀ i, i + 1 < Nat.card V →
        (sortedRealRoots (matchingPolynomial G)).getD (i + 1) 0 ≤
            (sortedRealRoots (matchingPolynomial (G.induce ({v}ᶜ : Set V)))).getD i 0 ∧
          (sortedRealRoots (matchingPolynomial (G.induce ({v}ᶜ : Set V)))).getD i 0 ≤
            (sortedRealRoots (matchingPolynomial G)).getD i 0 := by
  sorry

/-- 4.2 Heilmann–Lieb root bound: if every vertex has degree at most `d` and `d ≥ 2`, every real
root `x` of `μ(G)` satisfies `|x| ≤ 2 √(d − 1)`. -/
theorem abs_le_of_isRoot_matchingPolynomial [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {d : ℕ} (hd : 2 ≤ d) (hdeg : ∀ v, G.degree v ≤ d) {x : ℝ}
    (hx : ((matchingPolynomial G).map (Int.castRingHom ℝ)).IsRoot x) :
    |x| ≤ 2 * Real.sqrt ((d : ℝ) - 1) := by
  sorry

end TauCetiRoadmap.MatchingPolynomial
