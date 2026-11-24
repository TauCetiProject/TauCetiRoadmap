import Mathlib
import TauCeti.Combinatorics.Hypergraph.Colored.Counting
import TauCeti.Combinatorics.Hypergraph.Colored.EditDiscrepancy
import TauCeti.Combinatorics.Hypergraph.Triadic.Basic
import TauCeti.Combinatorics.Hypergraph.Triadic.CountingParameters
import TauCeti.Combinatorics.Hypergraph.Triadic.InducedCounting
import TauCeti.Combinatorics.Hypergraph.Triadic.Nontransversal
import TauCeti.Combinatorics.Hypergraph.Triadic.Placement

/-!
# Graph regularity, finite weak regularity, and arity-3 hypergraph complexes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti:

* the strong arity-3 regular approximation theorem (README §8.2): every coloring of the triples
  of a large enough finite set is close in edit distance to a coloring that is regular over a
  triadic complex of bounded complexity, at an error schedule and a rank schedule chosen in
  advance;
* its composition with induced counting (README §9.4): the same approximation, at the counting
  parameters, predicts the labelled induced copies of a fixed colored three-uniform pattern on `k`
  vertices up to `ε |V| ^ k`.

Both are statable at the pins. The complexity bound of §8.2 is a number depending only on the
top palette, the error, the two schedules and the requested number of vertex cells; it is stated
as an existential quantifier over that number, placed before the host, so that it cannot depend
on the host.

The carriers are Tau Ceti's: colorings of triples `TauCeti.Colored3Graph`, triadic complexes
`TauCeti.TriadicComplex3` with their computed complexity, lower skeleton regularity
`TauCeti.PairSkeleton3.LowerSkeletonRegular`, top regularity over most polyads
`TauCeti.Colored3Graph.TopRegularOverMostPolyads`, edit approximation
`TauCeti.Colored3Graph.Approximates3`, the prediction `TauCeti.Colored3Graph.expectedInducedCount`
and the counting parameters `TauCeti.inducedCountingParameter3`,
`TauCeti.inducedCountingSchedule3` and `TauCeti.diagonalControl3`. The graph regularity tower,
the arity-3 vocabulary and the induced counting lemma over a regular triadic complex are Tau
Ceti's at the pin and are not restated here (README, Scope and ownership).
-/

universe u v

namespace TauCetiRoadmap.Regularity

open TauCeti

/-! ## Layer 8: strong arity-3 regular approximation -/

/-- **Strong regular approximation** (README §8.1). The coloring `H'` of the triples of `V` and
the triadic complex `C` form a strong regular approximation of the coloring `H`, at error `ε`,
error schedule `F`, rank schedule `R` and complexity bound `b`, when: `H` and `H'` differ in edit
discrepancy by at most `ε`; the selected polyads of `C` decompose the injective triples; the lower
skeleton of `C` is regular at `F` evaluated at the number of vertex cells plus the number of pair
colors; `H'` is top-regular at tolerance `F C.complexity` and rank `R C.complexity` over all
polyads of `C` except an `ε`-proportion of their support; and the complexity of `C` is at most
`b`. -/
def IsStrongRegularApproximation3 {κ₃ : Type v} {V : Type u} [DecidableEq κ₃] [Fintype V]
    [DecidableEq V] (H H' : Colored3Graph κ₃ V) (C : TriadicComplex3 V) (ε : ℝ) (F : ℕ → ℝ)
    (R : ℕ → ℕ) (b : ℕ) : Prop :=
  H.Approximates3 H' ε ∧ C.IsPolyadDecomposition ∧ C.skeleton.LowerSkeletonRegular F ∧
    H'.TopRegularOverMostPolyads C (F C.complexity) ε (R C.complexity) ∧ C.complexity ≤ b

/-- **Strong arity-3 regular approximation** (README §8.2; Rödl–Schacht, *Regular partitions of
hypergraphs: regularity lemmas*, Theorems 14 and 17 and Lemma 25 in the numbering of the authors'
preprint). Fix a finite top palette `κ₃`, an error `ε > 0`, a positive error schedule `F`, a rank
schedule `R ≥ 1` and a number `t₀` of vertex cells. There is a bound `B`, independent of the host,
such that every coloring `H` of the triples of a finite set `V` with at least `B` elements has a
strong regular approximation `(H', C)` at `ε, F, R` with complexity at most `B`, whose vertex cells
form an equipartition into at least `t₀` cells. -/
theorem exists_strong_regular_approximation3 (κ₃ : Type v) [Fintype κ₃] [DecidableEq κ₃]
    (ε : ℝ) (hε : 0 < ε) (F : ℕ → ℝ) (hF : ∀ n, 0 < F n) (R : ℕ → ℕ) (hR : ∀ n, 1 ≤ R n)
    (t₀ : ℕ) :
    ∃ B : ℕ, ∀ (V : Type u) [Fintype V] [DecidableEq V], B ≤ Fintype.card V →
      ∀ H : Colored3Graph κ₃ V, ∃ (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 V),
        C.VertexCellsControlled t₀ ∧ IsStrongRegularApproximation3 H H' C ε F R B := by
  sorry

/-! ## Layer 9: induced counting -/

/-- **Strong regular approximation with induced counting** (README §9.4). Fix a finite top
palette `κ₃`, a colored three-uniform pattern `F₀` on `k` vertices, an error `ε > 0` and a rank
schedule `R ≥ 1`. There is a bound `B`, independent of the host, such that every coloring `H` of
the triples of a finite set `V` with at least `B` elements has a strong regular approximation
`(H', C)` at the counting parameters (edit and exceptional-mass error
`inducedCountingParameter3 k ε`, error schedule `inducedCountingSchedule3 k ε`, rank schedule `R`),
with complexity at most `B` and at least `diagonalControl3 k ε` equitable vertex cells, whose
prediction `H'.expectedInducedCount C F₀` is within `ε |V| ^ k` of the number of labelled induced
copies of `F₀` in `H`. The proof composes §8.2 with Tau Ceti's induced counting lemma
`TauCeti.Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular`. -/
theorem exists_strong_regular_approximation3_counting (κ₃ : Type v) [Fintype κ₃]
    [DecidableEq κ₃] (F₀ : FiniteColored3Pattern κ₃) (ε : ℝ) (hε : 0 < ε) (R : ℕ → ℕ)
    (hR : ∀ n, 1 ≤ R n) :
    ∃ B : ℕ, ∀ (V : Type u) [Fintype V] [DecidableEq V], B ≤ Fintype.card V →
      ∀ H : Colored3Graph κ₃ V, ∃ (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 V),
        C.VertexCellsControlled (diagonalControl3 F₀.k ε) ∧
        IsStrongRegularApproximation3 H H' C (inducedCountingParameter3 F₀.k ε)
          (inducedCountingSchedule3 F₀.k ε) R B ∧
        |(H.inducedCopyCount F₀ : ℝ) - H'.expectedInducedCount C F₀| ≤
          ε * (Fintype.card V : ℝ) ^ F₀.k := by
  obtain ⟨B, hB⟩ := exists_strong_regular_approximation3.{u} κ₃
    (inducedCountingParameter3 F₀.k ε) (inducedCountingParameter3_pos F₀.k hε)
    (inducedCountingSchedule3 F₀.k ε) (inducedCountingSchedule3_pos F₀.k hε) R hR
    (diagonalControl3 F₀.k ε)
  refine ⟨B, fun V _ _ hV H => ?_⟩
  obtain ⟨H', C, hcells, happrox, hdec, hlower, htop, hcx⟩ := hB V hV H
  exact ⟨H', C, hcells, ⟨happrox, hdec, hlower, htop, hcx⟩,
    Colored3Graph.abs_inducedCopyCount_sub_expectedInducedCount_le_of_topRegular hdec hε happrox
      hlower (hR C.complexity) htop hcells⟩

end TauCetiRoadmap.Regularity
