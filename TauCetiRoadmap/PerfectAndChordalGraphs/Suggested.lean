import Mathlib

/-!
# Perfect and chordal graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not restated.

Graphs are Mathlib's `SimpleGraph V`. A graph is chordal when no cycle graph on at least four
vertices is an induced subgraph, in the sense of Mathlib's `SimpleGraph.IsIndContained`. Clique
numbers, independence numbers and chromatic numbers are Mathlib's `SimpleGraph.cliqueNum` and
`SimpleGraph.indepNum`, valued in `ℕ`, and `SimpleGraph.chromaticNumber`, valued in `ℕ∞`. A graph
is perfect when every subgraph induced on a finite set of vertices has chromatic number equal to
its clique number; on a finite vertex type these are all induced subgraphs. The separator
theorem of Dirac assumes nothing on `V`; the theorems on simplicial vertices and elimination
orderings assume a finite vertex type; the theorems on perfection are about finite induced
subgraphs and assume nothing on `V`. The perfection of complements of comparability graphs, a
target of the README's §3.2, is not stated separately: it follows in one step from
`IsComparabilityGraph.isPerfect` and `isPerfect_compl_iff`.
-/

namespace TauCetiRoadmap.PerfectAndChordalGraphs

open SimpleGraph Finset

variable {V : Type*}

/-! ## Layer 1: chordal graphs -/

/-- 1.1 A graph is chordal when no cycle on at least four vertices is an induced subgraph, that
is, every cycle of length at least four has a chord. -/
def IsChordal (G : SimpleGraph V) : Prop :=
  ∀ n, 4 ≤ n → ¬(cycleGraph n).IsIndContained G

/-- 1.1 A vertex is simplicial when its neighbours are pairwise adjacent. -/
def IsSimplicial (G : SimpleGraph V) (v : V) : Prop :=
  G.IsClique (G.neighborSet v)

/-- 1.1 A set `S` of vertices separates `a` from `b` when neither `a` nor `b` lies in `S` and `b`
is not reachable from `a` in the graph induced on the complement of `S`. -/
def IsSeparator (G : SimpleGraph V) (a b : V) (S : Set V) : Prop :=
  ∃ (ha : a ∉ S) (hb : b ∉ S), ¬(G.induce Sᶜ).Reachable ⟨a, ha⟩ ⟨b, hb⟩

/-- 1.1 A minimal `a`–`b` separator: an `a`–`b` separator no proper subset of which separates `a`
from `b`. -/
def IsMinimalSeparator (G : SimpleGraph V) (a b : V) (S : Set V) : Prop :=
  Minimal (IsSeparator G a b) S

/-- 1.1 A bijection `σ : V ≃ Fin n` is a perfect elimination ordering when, for every vertex `v`,
the neighbours of `v` that come after `v` are pairwise adjacent. -/
def IsPerfectEliminationOrder {n : ℕ} (G : SimpleGraph V) (σ : V ≃ Fin n) : Prop :=
  ∀ v, G.IsClique {w | G.Adj v w ∧ σ v < σ w}

/-- 1.2 Dirac's theorem: a graph is chordal if and only if every minimal `a`–`b` separator, for
any two vertices `a` and `b`, is a clique. No finiteness is assumed. -/
theorem isChordal_iff_forall_isMinimalSeparator_isClique (G : SimpleGraph V) :
    IsChordal G ↔ ∀ a b S, IsMinimalSeparator G a b S → G.IsClique S := by
  sorry

/-- 1.3 Dirac's simplicial vertex theorem: a finite chordal graph that is not complete has two
nonadjacent simplicial vertices. -/
theorem IsChordal.exists_isSimplicial_not_adj [Finite V] {G : SimpleGraph V} (hG : IsChordal G)
    (htop : G ≠ ⊤) :
    ∃ u v, u ≠ v ∧ ¬G.Adj u v ∧ IsSimplicial G u ∧ IsSimplicial G v := by
  sorry

/-- 1.4 The theorem of Fulkerson and Gross: a finite graph is chordal if and only if it has a
perfect elimination ordering. -/
theorem isChordal_iff_exists_isPerfectEliminationOrder [Finite V] (G : SimpleGraph V) :
    IsChordal G ↔ ∃ (n : ℕ) (σ : V ≃ Fin n), IsPerfectEliminationOrder G σ := by
  sorry

/-! ## Layer 2: perfect graphs and chordal graphs -/

/-- 2.1 A graph is perfect when every subgraph induced on a finite set of vertices has chromatic
number equal to its clique number. -/
def IsPerfect (G : SimpleGraph V) : Prop :=
  ∀ s : Finset V, (G.induce (s : Set V)).chromaticNumber = (G.induce (s : Set V)).cliqueNum

/-- 2.2 Every chordal graph is perfect. -/
theorem IsChordal.isPerfect {G : SimpleGraph V} (hG : IsChordal G) : IsPerfect G := by
  sorry

/-! ## Layer 3: comparability graphs and interval graphs -/

/-- 3.1 A comparability graph: two distinct vertices are adjacent exactly when they are comparable
in some strict partial order on the vertices, that is, the graph has a transitive orientation. -/
def IsComparabilityGraph (G : SimpleGraph V) : Prop :=
  ∃ r : V → V → Prop, IsStrictOrder V r ∧ G = SimpleGraph.fromRel r

/-- 3.2 Every comparability graph is perfect. -/
theorem IsComparabilityGraph.isPerfect {G : SimpleGraph V} (hG : IsComparabilityGraph G) :
    IsPerfect G := by
  sorry

/-- 3.3 The intersection graph of a family of sets: two distinct indices are adjacent when their
sets meet. -/
def intersectionGraph {α : Type*} (I : V → Set α) : SimpleGraph V :=
  SimpleGraph.fromRel fun u v => (I u ∩ I v).Nonempty

/-- 3.3 Interval graphs are chordal: the intersection graph of a family of order-connected subsets
of a linear order is chordal. -/
theorem isChordal_intersectionGraph {α : Type*} [LinearOrder α] (I : V → Set α)
    (hI : ∀ v, (I v).OrdConnected) : IsChordal (intersectionGraph I) := by
  sorry

/-- 3.3 The complement of an interval graph is a comparability graph: for a family of
order-connected subsets of a linear order, the complement of the intersection graph is a
comparability graph. -/
theorem isComparabilityGraph_compl_intersectionGraph {α : Type*} [LinearOrder α] (I : V → Set α)
    (hI : ∀ v, (I v).OrdConnected) : IsComparabilityGraph (intersectionGraph I)ᶜ := by
  sorry

/-! ## Layer 4: the perfect graph theorem -/

/-- 4.1 Replicating the vertex `x`: a new vertex `none` is joined to `x` and to every neighbour of
`x`; the graph on the old vertices is unchanged. -/
def replicate (G : SimpleGraph V) (x : V) : SimpleGraph (Option V) :=
  SimpleGraph.fromRel fun a b =>
    match a, b with
    | some u, some v => G.Adj u v
    | none, some v => v = x ∨ G.Adj x v
    | _, _ => False

/-- 4.1 Lovász's replication lemma: replicating a vertex of a perfect graph gives a perfect
graph. -/
theorem IsPerfect.replicate {G : SimpleGraph V} (hG : IsPerfect G) (x : V) :
    IsPerfect (replicate G x) := by
  sorry

/-- 4.2 The perfect graph theorem of Lovász: a graph is perfect if and only if its complement
is. -/
theorem isPerfect_compl_iff {G : SimpleGraph V} : IsPerfect Gᶜ ↔ IsPerfect G := by
  sorry

/-- 4.3 Lovász's characterization: a graph is perfect if and only if every finite set `s` of
vertices has at most `α(G[s]) · ω(G[s])` elements. -/
theorem isPerfect_iff_card_le_indepNum_mul_cliqueNum {G : SimpleGraph V} :
    IsPerfect G ↔ ∀ s : Finset V,
      #s ≤ (G.induce (s : Set V)).indepNum * (G.induce (s : Set V)).cliqueNum := by
  sorry

end TauCetiRoadmap.PerfectAndChordalGraphs
