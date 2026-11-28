import Mathlib
import TauCeti.GroupTheory.Amenable.Linfty

/-!
# Amenable groups: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file is the test of the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, on Tau Ceti's carriers: the
amenability class `TauCeti.Amenable` (existence of a left-invariant mean on `TauCeti.UCB G`),
Følner sets `TauCeti.HasFoelnerSets`, and paradoxical sets `TauCeti.Paradoxical`. Every headline
is statable at the pins, and the pinned Tau Ceti proves all but one of them, so those are cited
here and not restated:

- the characterization of discrete amenability by left-invariant finitely additive probabilities
  on all subsets (README §2.4): `TauCeti.amenable_iff_exists_invariantContent`;
- the obstruction: if a group acts on `X` and `X` carries an invariant finitely additive
  probability on all of its subsets, then `X` is not paradoxical (README §3.4):
  `TauCeti.not_paradoxical_univ_of_addContent`;
- the paradoxical decomposition of every free group on at least two generators, `F₂` included,
  for its left regular action (README §3.5): `FreeGroup.paradoxical_univ`;
- the finite-test form of Følner sets, with no topology and no countability (README §5.1):
  `TauCeti.hasFoelnerSets_iff`;
- Følner's theorem for discrete groups and its finite-test form (README §5.4):
  `TauCeti.amenable_iff_hasFoelnerSets`, `TauCeti.amenable_iff_exists_finset`;
- the Følner-sequence form for countable discrete groups (README §5.5):
  `TauCeti.hasFoelnerSets_iff_exists_seq`, composed with `TauCeti.amenable_iff_hasFoelnerSets`;
- Tarski's alternative for the left regular action of a discrete group (README §8.3):
  `TauCeti.amenable_iff_not_paradoxical_univ`.

The remaining headlines are stated below with `sorry`:

- the characterization of amenable locally compact Hausdorff groups by invariant means on Haar
  `L∞` (README §7.5). The pinned Tau Ceti proves its reverse implication
  (`TauCeti.Amenable.of_lpTop`) and the case of a discrete group
  (`TauCeti.amenable_iff_exists_lpTop_invariant`), not the forward implication in general;
- the Markov–Kakutani theorem (README §9.2), its form for solvable groups (README §9.3), Day's
  fixed point theorem (README §9.4), the amenability of solvable groups (README §9.5) and the
  invariant probability measures of actions on compact spaces (README §9.6). The pinned Tau Ceti
  has none of Layer 9.

A further §7.6 target records that the correspondence
`PositiveLinearMap.addContentLpTopEquiv` between positive functionals on `L∞` and contents is
monotone in both directions. The `AddEquiv` and `OrderIso` themselves are data and need an
addition and a pointwise order on `AddContent`, which the pins lack, so monotonicity is stated on
values. Additivity, the content of `M + M'` at each set being the sum of the contents, follows
from the pinned evaluation lemmas `LinearMap.toAddContentLpTop_apply` and
`LinearMap.toAddContentLpTop_of_not_measurableSet` and is not restated here.

In Layer 9 a map `T : K → K` on a convex set `K` is *affine* when it preserves two-point convex
combinations; the hypotheses `haff` below spell this out, and README §9.1 identifies it with
Mathlib's `Convexity.IsAffineMap` for the convex-space structure of `K`.
-/

namespace TauCetiRoadmap.AmenableGroups

open MeasureTheory
open scoped ENNReal

/-! ## Layer 7: locally compact Hausdorff groups and Haar L∞ -/

/-- **Invariant means on Haar `L∞`.** Let `G` be a locally compact Hausdorff group and `μ` a
regular left Haar measure on its Borel sets. Then `G` is amenable exactly when `L∞(G, μ)`, the
classes of essentially bounded functions modulo `μ`-almost-everywhere equality, carries a positive
linear functional `M` with `M 1 = 1` that is invariant under left translation. Bekka–de la
Harpe–Valette, Theorem G.3.1 (i) ⇔ (v), stated for Mathlib's global `L∞`. -/
theorem amenable_iff_exists_lpTop_invariant_of_isHaarMeasure (G : Type*) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G] (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular] :
    TauCeti.Amenable G ↔ ∃ M : Lp ℝ ∞ μ →ₚ[ℝ] ℝ, M TauCeti.linftyOne = 1 ∧
      ∀ (g : G) (φ : Lp ℝ ∞ μ), M (Lp.leftTranslation μ ∞ ℝ g φ) = M φ := by
  sorry

/-! ### §7.6 Means on L∞ and Borel contents: order -/

/-- **The content correspondence is an order isomorphism.** For positive functionals on `L∞(μ)`
ordered by positivity of the difference (`M φ ≤ M' φ` for every `0 ≤ φ`; the pointwise order
on all `φ` would force `M = M'`), `M ≤ M'` exactly when the content of `M` is pointwise at most
the content of `M'`. -/
theorem le_iff_addContentLpTopEquiv_le {α : Type*} [MeasurableSpace α] (μ : Measure α)
    (M M' : Lp ℝ ∞ μ →ₚ[ℝ] ℝ) :
    (∀ φ : Lp ℝ ∞ μ, 0 ≤ φ → M φ ≤ M' φ) ↔
      ∀ s, (PositiveLinearMap.addContentLpTopEquiv μ M).1 s ≤
        (PositiveLinearMap.addContentLpTopEquiv μ M').1 s := by
  sorry

/-! ## Layer 9: fixed points of affine actions -/

section FixedPoint

universe u v

variable {E : Type v} [AddCommGroup E] [Module ℝ E] [TopologicalSpace E]
  [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [T2Space E] {K : Set E}

/-- **The Markov–Kakutani theorem.** A commuting family of continuous affine self-maps of a
nonempty compact convex subset `K` of a Hausdorff real topological vector space has a common
fixed point. No local convexity is assumed, and the maps need not be invertible (README §9.2;
Markov 1936, Kakutani 1938). -/
theorem exists_forall_isFixedPt_of_commute (hK : IsCompact K) (hKc : Convex ℝ K)
    (hne : K.Nonempty) {ι : Type*} (T : ι → K → K) (hT : ∀ i, Continuous (T i))
    (haff : ∀ i (x y : K) (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hab : a + b = 1),
      (T i ⟨a • (x : E) + b • (y : E), hKc x.2 y.2 ha hb hab⟩ : E) =
        a • (T i x : E) + b • (T i y : E))
    (hcomm : ∀ i j, Function.Commute (T i) (T j)) :
    ∃ x : K, ∀ i, Function.IsFixedPt (T i) x := by
  sorry

/-- **Solvable groups.** A solvable group acting on a nonempty compact convex subset `K` of a
Hausdorff real topological vector space by continuous affine maps has a fixed point. The group
carries no topology (README §9.3). -/
theorem exists_forall_smul_eq_of_isSolvable {G : Type*} [Group G] [Group.IsSolvable G]
    (hK : IsCompact K) (hKc : Convex ℝ K) (hne : K.Nonempty) [MulAction G K]
    [ContinuousConstSMul G K]
    (haff : ∀ (g : G) (x y : K) (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hab : a + b = 1),
      ((g • (⟨a • (x : E) + b • (y : E), hKc x.2 y.2 ha hb hab⟩ : K) : K) : E) =
        a • ((g • x : K) : E) + b • ((g • y : K) : E)) :
    ∃ x : K, ∀ g : G, g • x = x := by
  sorry

/-- **Day's fixed point theorem, forward direction.** An amenable topological group acting on a
nonempty compact convex subset `K` of a Hausdorff locally convex real space by affine maps, with
the action map `G × K → K` jointly continuous, has a fixed point. The space may lie in any
universe (README §9.4). -/
theorem exists_forall_smul_eq_of_amenable {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [TauCeti.Amenable G] [LocallyConvexSpace ℝ E]
    (hK : IsCompact K) (hKc : Convex ℝ K) (hne : K.Nonempty) [MulAction G K]
    [ContinuousSMul G K]
    (haff : ∀ (g : G) (x y : K) (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hab : a + b = 1),
      ((g • (⟨a • (x : E) + b • (y : E), hKc x.2 y.2 ha hb hab⟩ : K) : K) : E) =
        a • ((g • x : K) : E) + b • ((g • y : K) : E)) :
    ∃ x : K, ∀ g : G, g • x = x := by
  sorry

end FixedPoint

/-- **Day's fixed point theorem.** A topological group `G` is amenable exactly when every jointly
continuous affine action of `G` on a nonempty compact convex subset of a Hausdorff locally convex
real space has a fixed point. The spaces range over the universe of `G`, which contains the weak-*
dual of `UCB G` used by the reverse implication (README §9.4). -/
theorem amenable_iff_forall_exists_smul_eq (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    TauCeti.Amenable G ↔
      ∀ (E : Type u) [AddCommGroup E] [Module ℝ E] [TopologicalSpace E]
        [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [LocallyConvexSpace ℝ E] [T2Space E]
        (K : Set E) (hKc : Convex ℝ K), IsCompact K → K.Nonempty →
        ∀ [MulAction G K] [ContinuousSMul G K],
          (∀ (g : G) (x y : K) (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hab : a + b = 1),
            ((g • (⟨a • (x : E) + b • (y : E), hKc x.2 y.2 ha hb hab⟩ : K) : K) : E) =
              a • ((g • x : K) : E) + b • ((g • y : K) : E)) →
          ∃ x : K, ∀ g : G, g • x = x := by
  sorry

/-- **Solvable groups are amenable**, with every group topology (README §9.5). -/
theorem Amenable.of_isSolvable (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [Group.IsSolvable G] : TauCeti.Amenable G := by
  sorry

/-- **Invariant measures for amenable groups.** A jointly continuous action of an amenable
topological group on a nonempty compact Hausdorff space preserves some regular Borel probability
measure (README §9.6). -/
theorem exists_regular_smulInvariantMeasure_of_amenable {G X : Type*} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [TauCeti.Amenable G] [TopologicalSpace X]
    [CompactSpace X] [T2Space X] [Nonempty X] [MeasurableSpace X] [BorelSpace X]
    [MulAction G X] [ContinuousSMul G X] :
    ∃ μ : ProbabilityMeasure X, (μ : Measure X).Regular ∧
      SMulInvariantMeasure G X (μ : Measure X) := by
  sorry

/-- **Invariant measures for solvable groups.** An action of a solvable group on a nonempty
compact Hausdorff space by homeomorphisms preserves some regular Borel probability measure. The
group carries no topology (README §9.6). -/
theorem exists_regular_smulInvariantMeasure_of_isSolvable {G X : Type*} [Group G]
    [Group.IsSolvable G] [TopologicalSpace X] [CompactSpace X] [T2Space X] [Nonempty X]
    [MeasurableSpace X] [BorelSpace X] [MulAction G X] [ContinuousConstSMul G X] :
    ∃ μ : ProbabilityMeasure X, (μ : Measure X).Regular ∧
      SMulInvariantMeasure G X (μ : Measure X) := by
  sorry

end TauCetiRoadmap.AmenableGroups
