import Mathlib

/-!
# Connected layer families and the diameter of normal complexes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib, with the few definitions they need, every theorem with `sorry`
and every definition with a real body. Every headline theorem of the README is statable
at the pins and is stated here.

A family of finite sets lives on an arbitrary type `α` with decidable equality; the ground set is
a `Finset α` called `V`, with `n = V.card` elements. A connected layer family of rank `d` and
length `N` is a sequence `L : ℕ → Finset (Finset α)` whose layers `L 0, …, L N` satisfy the
conditions of `IsConnectedLayerFamily`; the values `L i` for `i > N` play no role. A pure
complex of rank `d` is given by its facets, a `Finset (Finset α)` all of whose members have `d`
elements. Diameters are measured with `SimpleGraph.ediam`, which is `⊤` for a disconnected graph.
-/

namespace TauCetiRoadmap.ConnectedLayerFamilies

variable {α : Type*} [DecidableEq α]

/-! ## Layer 1: Connected layer families and links -/

/-- 1.1 A connected layer family of rank `d` and length `N` on the ground set `V`. Each of
`L 0, …, L N` is a nonempty subfamily of `V.powersetCard d`; a set belongs to at most one of
them; and every finite set `S` meets them in an interval: if some member of `L i` and some
member of `L k` contain `S`, then for `i ≤ j ≤ k` so does some member of `L j`. -/
structure IsConnectedLayerFamily (V : Finset α) (d N : ℕ) (L : ℕ → Finset (Finset α)) :
    Prop where
  layer_nonempty : ∀ i ≤ N, (L i).Nonempty
  layer_subset : ∀ i ≤ N, L i ⊆ V.powersetCard d
  layer_unique : ∀ A : Finset α, ∀ i ≤ N, ∀ j ≤ N, A ∈ L i → A ∈ L j → i = j
  star_interval : ∀ S : Finset α, ∀ i j k, i ≤ j → j ≤ k → k ≤ N →
    (∃ A ∈ L i, S ⊆ A) → (∃ C ∈ L k, S ⊆ C) → ∃ B ∈ L j, S ⊆ B

/-- 1.1 The link of a layered family at an element `e`: layer `i` consists of the sets
`A \ {e}` for the members `A` of `L i` that contain `e`. -/
def layerLink (e : α) (L : ℕ → Finset (Finset α)) : ℕ → Finset (Finset α) :=
  fun i => ((L i).filter (e ∈ ·)).image (Finset.erase · e)

/-- 1.1 If `e` lies in a member of every layer of a connected layer family of rank `d + 1` on
`V`, the link at `e` is a connected layer family of rank `d` and the same length on
`V \ {e}`. -/
theorem IsConnectedLayerFamily.layerLink {V : Finset α} {d N : ℕ}
    {L : ℕ → Finset (Finset α)} (hL : IsConnectedLayerFamily V (d + 1) N L) {e : α}
    (he : ∀ i ≤ N, ∃ A ∈ L i, e ∈ A) :
    IsConnectedLayerFamily (V.erase e) d N (layerLink e L) := by
  sorry

/-! ## Layer 2: Families of length n − d -/

/-- 2.1 For `0 < d ≤ n` there is a connected layer family of rank `d` on `n` points of length
`n − d`: for `i ≤ n − d`, layer `i` holds the single interval `[i, i + d)` of `Fin n`. -/
theorem exists_isConnectedLayerFamily_length_sub {n d : ℕ} (hd₀ : 0 < d) (hdle : d ≤ n) :
    ∃ L : ℕ → Finset (Finset (Fin n)),
      IsConnectedLayerFamily (Finset.univ : Finset (Fin n)) d (n - d) L := by
  sorry

/-! ## Layer 3: Upper bounds on the length -/

/-- 3.1 Larman–Barnette form: a connected layer family of rank `d` and length `N` on `n`
points has `2 N ≤ (n − 1) 2 ^ d`, that is `N ≤ (n − 1) 2 ^ (d − 1)` when `d ≥ 1`. -/
theorem IsConnectedLayerFamily.two_mul_length_le {V : Finset α} {d N : ℕ}
    {L : ℕ → Finset (Finset α)} (hL : IsConnectedLayerFamily V d N L) :
    2 * N ≤ (V.card - 1) * 2 ^ d := by
  sorry

/-- 3.2 Kalai–Kleitman form: for `d ≥ 1`, a connected layer family of rank `d` and length `N`
on `n` points has `N + 1 ≤ n ^ (log₂ d + 1)`. -/
theorem IsConnectedLayerFamily.length_add_one_le_rpow {V : Finset α} {d N : ℕ}
    {L : ℕ → Finset (Finset α)} (hL : IsConnectedLayerFamily V d N L) (hd : 1 ≤ d) :
    (N : ℝ) + 1 ≤ (V.card : ℝ) ^ (Real.logb 2 d + 1) := by
  sorry

/-! ## Layer 4: Facet graphs of pure complexes -/

/-- 4.1 The facet graph of a family `C` of finite sets: two members are adjacent when each has
exactly one element outside the other (for members of equal size: they share a ridge). -/
def facetGraph (C : Finset (Finset α)) : SimpleGraph C where
  Adj X Y := ((X : Finset α) \ Y).card = 1 ∧ ((Y : Finset α) \ X).card = 1
  symm := ⟨fun _ _ h => ⟨h.2, h.1⟩⟩
  loopless := ⟨fun X h => by simp at h⟩

/-- 4.1 Corridor bound: in a pure complex of rank `d` on `V`, any two facets `X`, `Y` satisfy
`(d − 1) · dist(X, Y) + d ≤ C(n, d − 1)`; no connectivity is assumed (`dist` is `0` for
facets in different components). -/
theorem facetGraph_dist_bound {V : Finset α} {d : ℕ} {C : Finset (Finset α)}
    (hcard : ∀ X ∈ C, X.card = d) (hV : ∀ X ∈ C, X ⊆ V) (X Y : C) :
    (d - 1) * (facetGraph C).dist X Y + d ≤ V.card.choose (d - 1) := by
  sorry

/-- 4.2 The star of a set `S` in `C`: the members of `C` containing `S`. -/
def facetStar (C : Finset (Finset α)) (S : Finset α) : Set C :=
  {X | S ⊆ (X : Finset α)}

/-- 4.2 A family is a normal complex (locally strongly connected) when, for every finite set
`S`, the facets containing `S` induce a preconnected subgraph of the facet graph. -/
def IsNormalComplex (C : Finset (Finset α)) : Prop :=
  ∀ S : Finset α, ((facetGraph C).induce (facetStar C S)).Preconnected

/-- 4.2 The facet graph of a normal pure complex of rank `d` on `n` points has diameter at most
`(n − 1) 2 ^ (d − 1)` (in particular it is connected when the complex is nonempty), and, for
`d ≥ 1` and a nonempty complex, diameter plus one at most `n ^ (log₂ d + 1)`. -/
theorem ediam_facetGraph_le_of_isNormalComplex {V : Finset α} {d : ℕ}
    {C : Finset (Finset α)} (hcard : ∀ X ∈ C, X.card = d) (hV : ∀ X ∈ C, X ⊆ V)
    (hC : IsNormalComplex C) :
    2 * (facetGraph C).ediam ≤ ((V.card - 1) * 2 ^ d : ℕ) ∧
      (1 ≤ d → C.Nonempty →
        ((facetGraph C).ediam.toNat : ℝ) + 1 ≤ (V.card : ℝ) ^ (Real.logb 2 d + 1)) := by
  sorry

end TauCetiRoadmap.ConnectedLayerFamilies
