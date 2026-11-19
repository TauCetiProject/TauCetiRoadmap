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

The remaining headline, the characterization of amenable locally compact Hausdorff groups by
invariant means on Haar `L∞` (README §7.5), is stated below with `sorry`. The pinned Tau Ceti
proves its reverse implication (`TauCeti.Amenable.of_lpTop`) and the case of a discrete group
(`TauCeti.amenable_iff_exists_lpTop_invariant`), not the forward implication in general.
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

end TauCetiRoadmap.AmenableGroups
