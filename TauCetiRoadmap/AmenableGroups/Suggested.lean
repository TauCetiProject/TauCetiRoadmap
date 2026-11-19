import Mathlib
import TauCeti.GroupTheory.Amenable.Content
import TauCeti.GroupTheory.Amenable.DiscreteFoelner
import TauCeti.GroupTheory.Amenable.Linfty
import TauCeti.GroupTheory.Amenable.Sequence
import TauCeti.GroupTheory.Amenable.Tarski
import TauCeti.GroupTheory.FreeGroup.Paradoxical
import TauCeti.MeasureTheory.Group.Paradoxical

/-!
# Amenable groups: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, on Tau Ceti's carriers: the amenability class
`TauCeti.Amenable` (existence of a left-invariant mean on `TauCeti.UCB G`), Følner sets
`TauCeti.HasFoelnerSets`, and paradoxical sets `TauCeti.Paradoxical`.

The headlines are the characterization of discrete amenability by invariant finitely additive
probabilities on all subsets (README §2.4), the obstruction to paradoxical decompositions and the
paradoxical decomposition of the free group on two generators (README §3.4 and §3.5), the Følner
characterizations of discrete amenability (README §5.1, §5.4 and §5.5), the characterization of
amenable locally compact Hausdorff groups by invariant means on Haar `L∞` (README §7.5), and
Tarski's alternative for the left regular action of a discrete group (README §8.3).

Every headline is statable at the pins. The pinned Tau Ceti proves all of them except the
characterization by invariant means on Haar `L∞` in the non-discrete case; those statements are
proved here from the Tau Ceti theorems, and the remaining one carries `sorry`.
-/

namespace TauCetiRoadmap.AmenableGroups

open Filter MeasureTheory
open scoped Topology Pointwise symmDiff ENNReal

/-! ## Layer 2: discrete means, contents and finite groups -/

/-- **Discrete amenability through contents.** A discrete group is amenable exactly when there is
a finitely additive probability on all of its subsets that is invariant under left translation.
Finite additivity on every subset is essential: a countably additive invariant probability on the
subsets of an infinite group does not exist. Garrido, Definitions 1.12–1.13 and Theorem 1.15, in
discrete scope. -/
theorem amenable_iff_exists_invariantContent (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] :
    TauCeti.Amenable G ↔ ∃ m : AddContent ℝ≥0∞ (Set.univ : Set (Set G)),
      m Set.univ = 1 ∧ ∀ (g : G) (A : Set G), m (g • A) = m A :=
  TauCeti.amenable_iff_exists_invariantContent G

/-! ## Layer 3: equidecompositions and the free-group obstruction -/

/-- **The easy obstruction.** If a group `G` acts on `X` and there is a `G`-invariant finitely
additive probability on all subsets of `X`, then `X` is not `G`-paradoxical: the easy direction
of Tarski's theorem, Garrido, Theorem 1.11. -/
theorem not_paradoxical_univ_of_invariantContent (G : Type*) {X : Type*} [Group G]
    [MulAction G X] (m : AddContent ℝ≥0∞ (Set.univ : Set (Set X)))
    (hone : m Set.univ = 1) (hinv : ∀ (g : G) (A : Set X), m (g • A) = m A) :
    ¬ TauCeti.Paradoxical G (Set.univ : Set X) :=
  TauCeti.not_paradoxical_univ_of_addContent hinv hone

/-- **The free group on two generators is paradoxical** for its left regular action, by the
decomposition into reduced words according to their first letter. Garrido, Proposition 1.5 (1). -/
theorem freeGroup_two_paradoxical :
    TauCeti.Paradoxical (FreeGroup (Fin 2)) (Set.univ : Set (FreeGroup (Fin 2))) :=
  FreeGroup.paradoxical_univ

/-! ## Layer 5: Følner criteria for arbitrary discrete groups -/

open scoped Classical in
/-- **Følner sets, finite-test form.** A group has Følner sets (Mathlib's counting-measure Følner
filter on all subsets is nontrivial) exactly when every finite test set `K` and tolerance `ε > 0`
admit a finite nonempty `F` with `|gF △ F| < ε |F|` for every `g ∈ K`. No topology and no
countability hypothesis. -/
theorem hasFoelnerSets_iff (G : Type*) [Group G] :
    TauCeti.HasFoelnerSets G ↔
      ∀ K : Finset G, ∀ ε : ℝ, 0 < ε → ∃ F : Finset G, F.Nonempty ∧
        ∀ g ∈ K, (((g • F) ∆ F).card : ℝ) < ε * (F.card : ℝ) :=
  TauCeti.hasFoelnerSets_iff

/-- **Følner's theorem.** A discrete group is amenable exactly when it has Følner sets, with no
countability hypothesis. Garrido, Theorem 3.6; Bekka–de la Harpe–Valette, G.5.1–G.5.2. -/
theorem amenable_iff_hasFoelnerSets (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] :
    TauCeti.Amenable G ↔ TauCeti.HasFoelnerSets G :=
  TauCeti.amenable_iff_hasFoelnerSets

open scoped Classical in
/-- **Følner's theorem, finite-test form.** A discrete group is amenable exactly when every finite
test set `K` and tolerance `ε > 0` admit a finite nonempty `F` with `|gF △ F| < ε |F|` for every
`g ∈ K`. -/
theorem amenable_iff_exists_finset (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] :
    TauCeti.Amenable G ↔
      ∀ K : Finset G, ∀ ε : ℝ, 0 < ε → ∃ F : Finset G, F.Nonempty ∧
        ∀ g ∈ K, (((g • F) ∆ F).card : ℝ) < ε * (F.card : ℝ) :=
  TauCeti.amenable_iff_exists_finset

open scoped Classical in
/-- **Følner sequences.** A countable discrete group is amenable exactly when it has a sequence
of finite nonempty sets `F n` with `|g F n △ F n| / |F n| → 0` for every `g`. Countability is used
only to replace the Følner filter by a sequence. -/
theorem amenable_iff_exists_foelnerSequence (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] [Countable G] :
    TauCeti.Amenable G ↔
      ∃ F : ℕ → Finset G, (∀ n, (F n).Nonempty) ∧
        ∀ g : G, Tendsto (fun n => ((((g • F n) ∆ F n).card : ℝ) / ((F n).card : ℝ)))
          atTop (𝓝 0) :=
  TauCeti.amenable_iff_hasFoelnerSets.trans TauCeti.hasFoelnerSets_iff_exists_seq

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

/-! ## Layer 8: Tarski's alternative for the whole discrete group -/

/-- **Tarski's alternative for the left regular action.** A discrete group is amenable exactly
when it is not paradoxical for its left regular action. The statement concerns the whole group;
it does not assert that every nonempty subset is non-paradoxical. Garrido, Theorem 1.11 with
`X = E = G`, and Theorem 1.15 (iii) in discrete scope. -/
theorem amenable_iff_not_paradoxical (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] :
    TauCeti.Amenable G ↔ ¬ TauCeti.Paradoxical G (Set.univ : Set G) :=
  TauCeti.amenable_iff_not_paradoxical_univ

end TauCetiRoadmap.AmenableGroups
