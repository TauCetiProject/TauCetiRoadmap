import Mathlib
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# Graph colouring: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
two definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here. The README's remaining targets, API lists and
Checks are not restated.

Graphs are Mathlib's `SimpleGraph V`. Vertex colourings are Mathlib's `SimpleGraph.Coloring`,
`SimpleGraph.Colorable` and the `ℕ∞`-valued `SimpleGraph.chromaticNumber`. A proper edge colouring
of `G` is a colouring of Mathlib's line graph `G.lineGraph`, whose vertices are the edges of `G`,
two of them adjacent when they are distinct and share an end, so the chromatic index of `G` is
`G.lineGraph.chromaticNumber`. Degrees are `SimpleGraph.degree`, `SimpleGraph.maxDegree` and
`SimpleGraph.minDegree`, which are `0` on the empty vertex type. Orientations are Tau Ceti's
`TauCeti.DoubledQuiver.Orientation`, a choice of one dart over each edge, and directed paths are
Mathlib's `Quiver.Path` in the quiver `TauCeti.DoubledQuiver.OrientedQuiver` of the chosen darts.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.GraphColouring

variable {V : Type*}

/-! ## Layer 1: degree bounds and independent sets -/

/-- 1.1 The degeneracy bound of Szekeres and Wilf. If every nonempty finite set `s` of vertices
contains a vertex with at most `k` neighbours in `s`, then `G` is `(k + 1)`-colourable. No
finiteness of `V` is assumed. -/
theorem colorable_succ_of_forall_exists_card_le {G : SimpleGraph V} [DecidableRel G.Adj]
    {k : ℕ}
    (h : ∀ s : Finset V, s.Nonempty → ∃ v ∈ s, #{w ∈ s | G.Adj v w} ≤ k) :
    G.Colorable (k + 1) := by
  sorry

/-- 1.1 Every finite graph is `(Δ + 1)`-colourable. -/
theorem colorable_maxDegree_add_one [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    G.Colorable (G.maxDegree + 1) := by
  sorry

/-- 1.2 The colour classes are independent: the number of vertices is at most the chromatic
number times the independence number. -/
theorem card_le_chromaticNumber_mul_indepNum [Fintype V] (G : SimpleGraph V) :
    (Fintype.card V : ℕ∞) ≤ G.chromaticNumber * G.indepNum := by
  sorry

/-- 1.3 The Nordhaus–Gaddum bound for the sum: `χ(G) + χ(Gᶜ) ≤ n + 1`. -/
theorem chromaticNumber_add_chromaticNumber_compl_le [Fintype V] (G : SimpleGraph V) :
    G.chromaticNumber + Gᶜ.chromaticNumber ≤ Fintype.card V + 1 := by
  sorry

/-- 1.3 The Nordhaus–Gaddum bound for the product: `n ≤ χ(G) χ(Gᶜ)`. -/
theorem card_le_chromaticNumber_mul_chromaticNumber_compl [Fintype V] (G : SimpleGraph V) :
    (Fintype.card V : ℕ∞) ≤ G.chromaticNumber * Gᶜ.chromaticNumber := by
  sorry

/-! ## Layer 2: Brooks' theorem -/

/-- 2.1 A graph is an odd cycle when it is isomorphic to Mathlib's cycle graph on an odd number,
at least three, of vertices. -/
def IsOddCycle (G : SimpleGraph V) : Prop :=
  ∃ n, 3 ≤ n ∧ Odd n ∧ Nonempty (G ≃g cycleGraph n)

/-- 2.1 Brooks' theorem. A connected finite graph that is neither complete nor an odd cycle is
`Δ`-colourable. -/
theorem colorable_maxDegree_of_connected [Fintype V] {G : SimpleGraph V} [DecidableRel G.Adj]
    (hG : G.Connected) (htop : G ≠ ⊤) (hodd : ¬IsOddCycle G) :
    G.Colorable G.maxDegree := by
  sorry

/-- 2.2 The extremal graphs of the bound `χ ≤ Δ + 1`: a connected finite graph has chromatic
number `Δ + 1` if and only if it is complete or an odd cycle. -/
theorem chromaticNumber_eq_maxDegree_add_one_iff [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : G.Connected) :
    G.chromaticNumber = G.maxDegree + 1 ↔ G = ⊤ ∨ IsOddCycle G := by
  sorry

/-! ## Layer 3: orientations and directed paths -/

/-- 3.1 The theorem of Gallai, Roy and Vitaver. If an orientation of `G` has no directed path of
length `k`, that is, every path in its oriented quiver with distinct vertices has fewer than `k`
arrows, then `G` is `k`-colourable. No finiteness of `V` is assumed; for a finite graph this says
that every orientation has a directed path with at least `χ(G)` vertices. -/
theorem colorable_of_forall_length_lt {G : SimpleGraph V}
    (o : TauCeti.DoubledQuiver.Orientation G) {k : ℕ}
    (h : ∀ (a b : TauCeti.DoubledQuiver.OrientedQuiver G o) (p : Quiver.Path a b),
      p.vertices.Nodup → p.length < k) :
    G.Colorable k := by
  sorry

/-- 3.2 Sharpness. A `k`-colourable graph has an acyclic orientation with no directed path of
length `k`. -/
theorem exists_isAcyclic_orientation_of_colorable {G : SimpleGraph V} {k : ℕ}
    (hk : G.Colorable k) :
    ∃ o : TauCeti.DoubledQuiver.Orientation G,
      TauCeti.Quiver.IsAcyclic (TauCeti.DoubledQuiver.OrientedQuiver G o) ∧
        ∀ (a b : TauCeti.DoubledQuiver.OrientedQuiver G o) (p : Quiver.Path a b),
          p.vertices.Nodup → p.length < k := by
  sorry

/-! ## Layer 4: Mycielski's construction -/

/-- 4.1 The Mycielskian of `G`: the vertices are the vertices `inl v` of `G`, a copy `inr (inl v)`
of each of them and an apex `inr (inr ())`. The vertices of `G` keep their edges, each copy of `v`
is joined to the neighbours of `v` in `G`, and the apex is joined to every copy. -/
def mycielskian (G : SimpleGraph V) : SimpleGraph (V ⊕ V ⊕ Unit) :=
  SimpleGraph.fromRel fun a b =>
    match a, b with
    | .inl v, .inl w => G.Adj v w
    | .inl v, .inr (.inl w) => G.Adj v w
    | .inr (.inl _), .inr (.inr _) => True
    | _, _ => False

/-- 4.2 The Mycielskian of a triangle-free graph is triangle-free. -/
theorem cliqueFree_three_mycielskian {G : SimpleGraph V} (hG : G.CliqueFree 3) :
    (mycielskian G).CliqueFree 3 := by
  sorry

/-- 4.2 The Mycielskian raises the chromatic number by exactly one. -/
theorem chromaticNumber_mycielskian (G : SimpleGraph V) :
    (mycielskian G).chromaticNumber = G.chromaticNumber + 1 := by
  sorry

/-- 4.3 Mycielski's theorem. For every `k` there is a finite triangle-free graph with chromatic
number `k`. -/
theorem exists_cliqueFree_three_chromaticNumber_eq (k : ℕ) :
    ∃ (n : ℕ) (H : SimpleGraph (Fin n)), H.CliqueFree 3 ∧ H.chromaticNumber = k := by
  sorry

/-! ## Layer 5: edge colourings -/

/-- 5.1 Vizing's theorem. The chromatic index of a finite simple graph is `Δ` or `Δ + 1`. -/
theorem maxDegree_le_chromaticNumber_lineGraph_le [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    (G.maxDegree : ℕ∞) ≤ G.lineGraph.chromaticNumber ∧
      G.lineGraph.chromaticNumber ≤ G.maxDegree + 1 := by
  sorry

/-- 5.2 A `d`-regular graph with `d ≥ 1` on an odd number of vertices has chromatic index
`d + 1`. -/
theorem chromaticNumber_lineGraph_of_isRegularOfDegree [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] {d : ℕ} (hG : G.IsRegularOfDegree d) (hd : 0 < d)
    (hn : Odd (Fintype.card V)) :
    G.lineGraph.chromaticNumber = d + 1 := by
  sorry

end TauCetiRoadmap.GraphColouring
