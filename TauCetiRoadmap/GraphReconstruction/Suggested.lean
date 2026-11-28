import Mathlib

/-!
# Graph reconstruction: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's main results
against the pinned Mathlib, with the few definitions they need: every theorem is `sorry`, every
definition has a real body. Every headline theorem of the README is statable at the pins and is
stated here.

All graphs are simple graphs on one finite vertex type `V`. Two graphs on `V` are compared through
their vertex-deleted subgraphs `G.induce {v}ᶜ`, labelled by the deleted vertex, or through their
edge-deleted subgraphs `G.deleteEdges {e}`, matched by a bijection between the two edge sets.
Copies of a graph `F` in `G` are counted by Mathlib's `G.copyCount F` (subgraphs of `G` isomorphic
to `F`) and `G.labelledCopyCount F` (injective homomorphisms from `F` to `G`); edges are counted by
`G.edgeSet.ncard`, and `Nat.card (G ≃g G)` is the number of automorphisms of `G`.
-/

open SimpleGraph

namespace TauCetiRoadmap.GraphReconstruction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: hypomorphic graphs and Kelly's lemma -/

/-- 1.0. Two graphs on the same vertex type are hypomorphic when, for every vertex `v`, the
graphs they induce on the other vertices are isomorphic. The deleted vertex is the same on both
sides: the decks are matched by the identity of `V`. -/
def IsHypomorphic (G H : SimpleGraph V) : Prop :=
  ∀ v : V, Nonempty (G.induce ({v}ᶜ : Set V) ≃g H.induce ({v}ᶜ : Set V))

/-- 1.0. A graph is reconstructible when every graph on its vertex type that is hypomorphic to it
is isomorphic to it. -/
def IsReconstructible (G : SimpleGraph V) : Prop :=
  ∀ H : SimpleGraph V, IsHypomorphic G H → Nonempty (G ≃g H)

/-- 1.1. Kelly's lemma. Each copy of `F` in `G` survives in exactly the vertex-deleted subgraphs
`G - v` with `v` outside the copy, which gives the counting identity for unlabelled and for
labelled copies; hence hypomorphic graphs contain the same numbers of copies of every graph with
fewer vertices. -/
theorem kelly_lemma {W : Type*} [Fintype W] (G H : SimpleGraph V) (F : SimpleGraph W) :
    ((Fintype.card V - Fintype.card W) * G.copyCount F =
        ∑ v : V, (G.induce ({v}ᶜ : Set V)).copyCount F ∧
      (Fintype.card V - Fintype.card W) * G.labelledCopyCount F =
        ∑ v : V, (G.induce ({v}ᶜ : Set V)).labelledCopyCount F) ∧
    (IsHypomorphic G H → Fintype.card W < Fintype.card V →
      G.copyCount F = H.copyCount F ∧ G.labelledCopyCount F = H.labelledCopyCount F) := by
  sorry

/-- 1.2. On at least three vertices, hypomorphic graphs have the same number of edges, the same
degree at every vertex, and are both connected or both disconnected. -/
theorem isHypomorphic_parameters (G H : SimpleGraph V) [DecidableRel G.Adj] [DecidableRel H.Adj]
    (hn : 3 ≤ Fintype.card V) (h : IsHypomorphic G H) :
    G.edgeSet.ncard = H.edgeSet.ncard ∧ (∀ v, G.degree v = H.degree v) ∧
      (G.Connected ↔ H.Connected) := by
  sorry

/-- 1.3. On at least three vertices, every regular graph is reconstructible. -/
theorem isReconstructible_of_isRegularOfDegree (G : SimpleGraph V) [DecidableRel G.Adj] {r : ℕ}
    (hn : 3 ≤ Fintype.card V) (hG : G.IsRegularOfDegree r) : IsReconstructible G := by
  sorry

/-! ## Layer 2: edge reconstruction -/

/-- 2.0. Two graphs on the same vertex type are edge-hypomorphic when some map `θ` of `Sym2 V`
sends the edge set of `G` bijectively onto the edge set of `H` so that deleting an edge `e` from
`G` and deleting `θ e` from `H` give isomorphic graphs. -/
def IsEdgeHypomorphic (G H : SimpleGraph V) : Prop :=
  ∃ θ : Sym2 V → Sym2 V, Set.BijOn θ G.edgeSet H.edgeSet ∧
    ∀ e ∈ G.edgeSet, Nonempty (G.deleteEdges {e} ≃g H.deleteEdges {θ e})

/-- 2.0. A graph is edge-reconstructible when every graph on its vertex type that is
edge-hypomorphic to it is isomorphic to it. -/
def IsEdgeReconstructible (G : SimpleGraph V) : Prop :=
  ∀ H : SimpleGraph V, IsEdgeHypomorphic G H → Nonempty (G ≃g H)

/-- 2.0. The number `|G → H|_F` of permutations `σ` of `V` that carry exactly the edges of `F` of
the graph `G` onto edges of `H`: the edges `uv` of `G` with `σ u σ v` an edge of `H` are exactly
the edges of `F`. -/
noncomputable def arrowCount (G H F : SimpleGraph V) : ℕ := by
  classical exact (Finset.univ.filter fun σ : Equiv.Perm V => G ⊓ H.comap σ = F).card

/-- 2.1. Kelly's lemma for edges. Each copy of `F` in `G` survives in exactly the edge-deleted
subgraphs `G - e` with `e` outside the copy, which gives the counting identity for labelled and
for unlabelled copies; hence edge-hypomorphic graphs contain the same numbers of copies of every
graph with fewer edges. -/
theorem kelly_lemma_edge {W : Type*} [Fintype W] (G H : SimpleGraph V) [DecidableRel G.Adj]
    (F : SimpleGraph W) :
    ((G.edgeSet.ncard - F.edgeSet.ncard) * G.copyCount F =
        ∑ e : G.edgeSet, (G.deleteEdges {(e : Sym2 V)}).copyCount F ∧
      (G.edgeSet.ncard - F.edgeSet.ncard) * G.labelledCopyCount F =
        ∑ e : G.edgeSet, (G.deleteEdges {(e : Sym2 V)}).labelledCopyCount F) ∧
    (IsEdgeHypomorphic G H → F.edgeSet.ncard < G.edgeSet.ncard →
      G.copyCount F = H.copyCount F ∧ G.labelledCopyCount F = H.labelledCopyCount F) := by
  sorry

/-- 2.2. Nash-Williams' lemma. If `H` is edge-hypomorphic to `G` but not isomorphic to it, then
for every spanning subgraph `F` of `G`,
`|G → G|_F - |G → H|_F = (-1) ^ (e(G) - e(F)) * aut(G)`. -/
theorem nash_williams_lemma (G H F : SimpleGraph V) (hF : F ≤ G) (h : IsEdgeHypomorphic G H)
    (hGH : IsEmpty (G ≃g H)) :
    (arrowCount G G F : ℤ) - arrowCount G H F =
      (-1) ^ (G.edgeSet.ncard - F.edgeSet.ncard) * Nat.card (G ≃g G) := by
  sorry

/-- 2.3. Nash-Williams' criteria. A graph `G` is edge-reconstructible if for some spanning
subgraph `F` of `G` either (i) `|G → H|_F` is the same for every `H` edge-hypomorphic to `G`, or
(ii) `2 |F → G| < 2 ^ (e(G) - e(F)) * aut(G)`, where `|F → G|` is the labelled copy count. -/
theorem isEdgeReconstructible_of_criteria (G F : SimpleGraph V) (hF : F ≤ G) :
    ((∀ H, IsEdgeHypomorphic G H → arrowCount G H F = arrowCount G G F) →
      IsEdgeReconstructible G) ∧
    (2 * G.labelledCopyCount F < 2 ^ (G.edgeSet.ncard - F.edgeSet.ncard) * Nat.card (G ≃g G) →
      IsEdgeReconstructible G) := by
  sorry

/-- 2.4. Lovász's and Müller's theorems. A graph with `n` vertices and `m` edges is
edge-reconstructible if `n (n - 1) < 4 m` (Lovász), if `2 n! < 2 ^ m` (Müller), or if
`m > n log₂ n`. -/
theorem isEdgeReconstructible_of_many_edges (G : SimpleGraph V) :
    (Fintype.card V * (Fintype.card V - 1) < 4 * G.edgeSet.ncard → IsEdgeReconstructible G) ∧
    (2 * (Fintype.card V).factorial < 2 ^ G.edgeSet.ncard → IsEdgeReconstructible G) ∧
    ((Fintype.card V : ℝ) * Real.logb 2 (Fintype.card V) < G.edgeSet.ncard →
      IsEdgeReconstructible G) := by
  sorry

end TauCetiRoadmap.GraphReconstruction
