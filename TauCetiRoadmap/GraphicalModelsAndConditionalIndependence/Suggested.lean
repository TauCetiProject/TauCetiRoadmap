import Mathlib

/-!
# Graphical models and conditional independence: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Variables are indexed by a finite type `V` of vertices; the variable at `v` takes values in a
finite type `X v`, and a configuration is an element of `∀ v, X v`. A law is a function
`p : (∀ v, X v) → ℝ≥0`; no normalization is imposed except in the theorem on directed acyclic
graphs, which assumes `∑ x, p x = 1`. Conditional independence of the variables in `A` and in `B`
given those in `S` is the identity `p(x_S) p(x_{A ∪ B ∪ S}) = p(x_{A ∪ S}) p(x_{B ∪ S})` between
margins, for every configuration `x`. Undirected graphs are Mathlib's `SimpleGraph V`; directed
graphs are Mathlib's `Digraph V`.
-/

noncomputable section

open Finset MeasureTheory ProbabilityTheory
open scoped NNReal

namespace TauCetiRoadmap.GraphicalModelsAndConditionalIndependence

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-! ## Layer 1: conditional independence -/

/-- 1.1 The margin of `p` on the set `A` at the configuration `x`: the total mass of the
configurations that agree with `x` on `A`. On `A = ∅` it is the total mass of `p`. -/
def margin (p : (∀ v, X v) → ℝ≥0) (A : Finset V) (x : ∀ v, X v) : ℝ≥0 :=
  ∑ y ∈ univ.filter (fun y => ∀ v ∈ A, y v = x v), p y

/-- 1.1 The variables in `A` and in `B` are conditionally independent given those in `S` under
`p`: `p(x_S) p(x_{A ∪ B ∪ S}) = p(x_{A ∪ S}) p(x_{B ∪ S})` for every configuration `x`. -/
def CondIndep (p : (∀ v, X v) → ℝ≥0) (A B S : Finset V) : Prop :=
  ∀ x, margin p S x * margin p (A ∪ B ∪ S) x = margin p (A ∪ S) x * margin p (B ∪ S) x

/-- 1.2 Agreement with Mathlib: for a probability measure `μ` on the configurations (each
`X v` discrete), `CondIndep` for the point masses of `μ` is Mathlib's conditional independence
of the restrictions to `A` and to `B` given the restriction to `S`. -/
theorem condIndep_iff_condIndepFun [∀ v, MeasurableSpace (X v)]
    [∀ v, DiscreteMeasurableSpace (X v)] (μ : Measure (∀ v, X v)) [IsProbabilityMeasure μ]
    (A B S : Finset V) :
    CondIndep (fun x => (μ {x}).toNNReal) A B S ↔
      A.restrict ⟂ᵢ[S.restrict, Finset.measurable_restrict S; μ] B.restrict := by
  sorry

/-- 1.3 The chain rule of conditional independence, which packages decomposition, weak union and
contraction: `A ⊥ (B ∪ D) | S` holds if and only if `A ⊥ B | S` and `A ⊥ D | S ∪ B`. It holds for
every law and every four sets of vertices. -/
theorem condIndep_union_iff (p : (∀ v, X v) → ℝ≥0) (A B D S : Finset V) :
    CondIndep p A (B ∪ D) S ↔ CondIndep p A B S ∧ CondIndep p A D (S ∪ B) := by
  sorry

/-- 1.4 The intersection property for positive laws: if `B` and `D` are disjoint, `A ⊥ B | S ∪ D`
and `A ⊥ D | S ∪ B`, then `A ⊥ (B ∪ D) | S`. -/
theorem condIndep_union_of_pos {p : (∀ v, X v) → ℝ≥0} (hp : ∀ x, 0 < p x)
    {A B D S : Finset V} (hBD : Disjoint B D) (h₁ : CondIndep p A B (S ∪ D))
    (h₂ : CondIndep p A D (S ∪ B)) : CondIndep p A (B ∪ D) S := by
  sorry

/-! ## Layer 2: Markov properties of undirected graphs -/

/-- 2.1 `S` separates `A` from `B` in `G`: every walk from a vertex of `A` to a vertex of `B`
visits a vertex of `S`. -/
def Separates (G : SimpleGraph V) (S A B : Finset V) : Prop :=
  ∀ a ∈ A, ∀ b ∈ B, ∀ w : G.Walk a b, ∃ v ∈ w.support, v ∈ S

/-- 2.2 The pairwise Markov property: any two distinct non-adjacent vertices are conditionally
independent given all the other vertices. -/
def IsPairwiseMarkov (G : SimpleGraph V) (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ u v, u ≠ v → ¬G.Adj u v → CondIndep p {u} {v} (univ \ {u, v})

/-- 2.2 The local Markov property: every vertex is conditionally independent of the vertices that
are neither it nor its neighbours, given its neighbours. -/
def IsLocalMarkov (G : SimpleGraph V) [DecidableRel G.Adj] (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ v, CondIndep p {v} (univ \ insert v (G.neighborFinset v)) (G.neighborFinset v)

/-- 2.2 The global Markov property: for pairwise disjoint `A`, `B`, `S` with `S` separating `A`
from `B`, the variables in `A` and in `B` are conditionally independent given those in `S`. -/
def IsGlobalMarkov (G : SimpleGraph V) (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ A B S : Finset V, Disjoint A B → Disjoint A S → Disjoint B S → Separates G S A B →
    CondIndep p A B S

open Classical in
/-- 2.3 `p` factorizes according to `G`: it is a product, over the complete sets `C` of `G`, of
nonnegative functions `ψ C` that depend only on the coordinates in `C`. -/
def Factorizes (G : SimpleGraph V) (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∃ ψ : Finset V → (∀ v, X v) → ℝ≥0, (∀ C, DependsOn (ψ C) (C : Set V)) ∧
    ∀ x, p x = ∏ C ∈ univ.filter (fun C : Finset V => G.IsClique (C : Set V)), ψ C x

/-- 2.3 A law that factorizes according to `G` is globally Markov for `G`. -/
theorem Factorizes.isGlobalMarkov {G : SimpleGraph V} {p : (∀ v, X v) → ℝ≥0}
    (h : Factorizes G p) : IsGlobalMarkov G p := by
  sorry

/-- 2.4 The global Markov property implies the local one, for every law. -/
theorem IsGlobalMarkov.isLocalMarkov {G : SimpleGraph V} [DecidableRel G.Adj]
    {p : (∀ v, X v) → ℝ≥0} (h : IsGlobalMarkov G p) : IsLocalMarkov G p := by
  sorry

/-- 2.4 The local Markov property implies the pairwise one, for every law. -/
theorem IsLocalMarkov.isPairwiseMarkov {G : SimpleGraph V} [DecidableRel G.Adj]
    {p : (∀ v, X v) → ℝ≥0} (h : IsLocalMarkov G p) : IsPairwiseMarkov G p := by
  sorry

/-! ## Layer 3: the Hammersley–Clifford theorem and its failure without positivity -/

/-- 3.1 The Hammersley–Clifford theorem: a positive law that is pairwise Markov for `G`
factorizes according to `G`. -/
theorem factorizes_of_isPairwiseMarkov {G : SimpleGraph V} {p : (∀ v, X v) → ℝ≥0}
    (hp : ∀ x, 0 < p x) (h : IsPairwiseMarkov G p) : Factorizes G p := by
  sorry

/-- 3.2 For a positive law, factorization and the global, local and pairwise Markov properties
are equivalent. -/
theorem markovProperties_tfae_of_pos {G : SimpleGraph V} [DecidableRel G.Adj]
    {p : (∀ v, X v) → ℝ≥0} (hp : ∀ x, 0 < p x) :
    [Factorizes G p, IsGlobalMarkov G p, IsLocalMarkov G p, IsPairwiseMarkov G p].TFAE := by
  sorry

open Classical in
/-- 3.3 Moussouris' law on the four-cycle `0 − 1 − 2 − 3 − 0` with binary variables: mass `1` on
each of the eight configurations `x` with `x 0 ≤ x 1 ≤ x 2 ≤ x 3` or `x 0 ≥ x 1 ≥ x 2 ≥ x 3`, and
mass `0` elsewhere. -/
def moussourisLaw : (Fin 4 → Bool) → ℝ≥0 :=
  fun x => if Monotone x ∨ Antitone x then 1 else 0

/-- 3.3 Moussouris' law is globally Markov for the four-cycle. -/
theorem isGlobalMarkov_moussourisLaw :
    IsGlobalMarkov (SimpleGraph.cycleGraph 4) moussourisLaw := by
  sorry

/-- 3.3 Moussouris' law does not factorize according to the four-cycle. -/
theorem not_factorizes_moussourisLaw :
    ¬Factorizes (SimpleGraph.cycleGraph 4) moussourisLaw := by
  sorry

/-! ## Layer 4: directed acyclic graphs -/

/-- 4.1 A directed graph is acyclic when no vertex reaches itself by a nonempty directed walk. -/
def IsAcyclic (G : Digraph V) : Prop :=
  ∀ v, ¬Relation.TransGen G.Adj v v

/-- 4.1 The parents of `v`: the vertices `u` with an arrow `u → v`. -/
def parents (G : Digraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  univ.filter (fun u => G.Adj u v)

open Classical in
/-- 4.1 The descendants of `v`, including `v` itself. -/
def descendants (G : Digraph V) (v : V) : Finset V :=
  univ.filter (fun w => Relation.ReflTransGen G.Adj v w)

open Classical in
/-- 4.1 The ancestors of the set `A`, including `A` itself. -/
def ancestors (G : Digraph V) (A : Finset V) : Finset V :=
  univ.filter (fun u => ∃ a ∈ A, Relation.ReflTransGen G.Adj u a)

/-- 4.2 `p` factorizes recursively according to `G`: it is the product over the vertices `v` of
kernels `k v`, each depending only on the coordinates in `v` and its parents and summing to `1`
over the value at `v`. -/
def DagFactorizes (G : Digraph V) [DecidableRel G.Adj] (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∃ k : V → (∀ v, X v) → ℝ≥0,
    (∀ v, DependsOn (k v) (insert v (parents G v) : Set V)) ∧
    (∀ v x, ∑ a : X v, k v (Function.update x v a) = 1) ∧
    ∀ x, p x = ∏ v, k v x

/-- 4.2 The directed local Markov property: every vertex is conditionally independent of its
non-descendants other than its parents, given its parents. -/
def IsDirectedLocalMarkov (G : Digraph V) [DecidableRel G.Adj] (p : (∀ v, X v) → ℝ≥0) :
    Prop :=
  ∀ v, CondIndep p {v} ((univ \ descendants G v) \ parents G v) (parents G v)

/-- 4.3 The list `l` is a path that is open given `C`: its vertices are distinct, consecutive
vertices are joined by an arrow in one direction or the other, every internal vertex at which
both neighbouring arrows point in (a collider) is an ancestor of `C`, and every other internal
vertex lies outside `C`. -/
def IsOpenPath (G : Digraph V) (C : Finset V) (l : List V) : Prop :=
  l.Nodup ∧ l.IsChain (fun u w => G.Adj u w ∨ G.Adj w u) ∧
    ∀ i (h : i + 2 < l.length),
      (G.Adj l[i] l[i + 1] ∧ G.Adj l[i + 2] l[i + 1] → l[i + 1] ∈ ancestors G C) ∧
      (¬(G.Adj l[i] l[i + 1] ∧ G.Adj l[i + 2] l[i + 1]) → l[i + 1] ∉ C)

/-- 4.3 `A` and `B` are d-separated given `C`: no path from a vertex of `A` to a vertex of `B`
is open given `C`. -/
def DSeparated (G : Digraph V) (A B C : Finset V) : Prop :=
  ∀ l : List V, ∀ a ∈ A, ∀ b ∈ B, l.head? = some a → l.getLast? = some b → ¬IsOpenPath G C l

/-- 4.3 The moral graph of the subgraph of `G` induced on `W`: two distinct vertices of `W` are
adjacent when an arrow joins them or they have a common child in `W`. Vertices outside `W` are
isolated. -/
def moralGraphOn (G : Digraph V) (W : Finset V) : SimpleGraph V where
  Adj u v := u ∈ W ∧ v ∈ W ∧ u ≠ v ∧ (G.Adj u v ∨ G.Adj v u ∨ ∃ w ∈ W, G.Adj u w ∧ G.Adj v w)
  symm := ⟨fun u v h => ⟨h.2.1, h.1, h.2.2.1.symm, by
    rcases h.2.2.2 with h' | h' | ⟨w, hw, h₁, h₂⟩
    · exact Or.inr (Or.inl h')
    · exact Or.inl h'
    · exact Or.inr (Or.inr ⟨w, hw, h₂, h₁⟩)⟩⟩
  loopless := ⟨fun u h => h.2.2.1 rfl⟩

/-- 4.3 For an acyclic `G` and `C` disjoint from `A` and from `B`, d-separation of `A` and `B`
given `C` is separation by `C` in the moral graph of the subgraph induced on the ancestors of
`A ∪ B ∪ C`. -/
theorem dSeparated_iff_separates_moralGraphOn {G : Digraph V} (hG : IsAcyclic G)
    {A B C : Finset V} (hAC : Disjoint A C) (hBC : Disjoint B C) :
    DSeparated G A B C ↔ Separates (moralGraphOn G (ancestors G (A ∪ B ∪ C))) C A B := by
  sorry

/-- 4.4 The directed global Markov property: d-separation of pairwise disjoint sets gives
conditional independence. -/
def IsDirectedGlobalMarkov (G : Digraph V) (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ A B C : Finset V, Disjoint A B → Disjoint A C → Disjoint B C → DSeparated G A B C →
    CondIndep p A B C

/-- 4.4 For an acyclic `G` and a law of total mass `1`, recursive factorization, the directed
local Markov property and the directed global Markov property are equivalent. No positivity is
assumed. -/
theorem dagFactorizes_tfae {G : Digraph V} [DecidableRel G.Adj] (hG : IsAcyclic G)
    {p : (∀ v, X v) → ℝ≥0} (hp : ∑ x, p x = 1) :
    [DagFactorizes G p, IsDirectedLocalMarkov G p, IsDirectedGlobalMarkov G p].TFAE := by
  sorry

end TauCetiRoadmap.GraphicalModelsAndConditionalIndependence
