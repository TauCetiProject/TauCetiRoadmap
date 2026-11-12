import Mathlib
import TauCeti.SetTheory.Descriptive.BorelReducibility

/-!
# Borel equivalence relations, the G₀ dichotomy and Silver's theorem: suggested signatures

**`README.md` is the definitive roadmap document** — its conventions, layer-by-layer build
(Layers 0–5), acceptance checks, worked examples, provenance and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

The roadmap has no model-theoretic dependency. Tau Ceti at the pin proves almost all of it: the
Cantor-space, Gδ, analytic-set, Borel-graph and perfect-set infrastructure of Layer 0, the
antichain vocabulary `Setoid.HasCantorAntichainOn`, `Setoid.HasPerfectAntichainOn` and
`Setoid.IsThinOn`, Kuratowski–Ulam, Mycielski, Baire-measurable maps, the graphs
`TauCeti.gSGraph` and `TauCeti.gZero` with Miller's independence lemma, the Borel colorings
`SetRel.HasCountableBorelColoring` and the Kechris–Solecki–Todorcevic lemma, invariant Lusin
separation, Miller's ideal `SetRel.IsSmallFamily`, the G₀ dichotomy `SimpleGraph.g0_dichotomy`,
Silver's theorem `Setoid.silver_dichotomy` in all its forms, `Setoid.BorelReducible`,
`Setoid.IsSmooth` and `TauCeti.eZero`. The README names each consumed Tau Ceti declaration and
its module.

What remains are the two statements below, stated on Tau Ceti's carriers. Names and namespaces
are provisional.
-/

universe u

open MeasureTheory Function

namespace TauCetiRoadmap.BorelEquivalenceRelations

/-! ## Layer 4: the perfect set theorem for analytic sets -/

/-- The perfect set theorem for analytic sets, a corollary of Silver's theorem: write `A` as the
range of a continuous map `g` on a Polish space, apply `Setoid.silver_dichotomy` to the closed
relation `g a = g b`, and compose `g` with the Cantor antichain. Tau Ceti has the Borel case,
`MeasurableSet.exists_nat_bool_injection_of_not_countable`. -/
theorem _root_.MeasureTheory.AnalyticSet.exists_nat_bool_injection_of_not_countable
    {X : Type u} [TopologicalSpace X] [T2Space X] {A : Set X} (hA : AnalyticSet A)
    (hunc : ¬ A.Countable) :
    ∃ f : (ℕ → Bool) → X, Set.range f ⊆ A ∧ Continuous f ∧ Injective f := by
  sorry

/-! ## Layer 5: closed relations are smooth -/

/-- Closed equivalence relations on Polish spaces are smooth. For basic open sets `U`, `V` with
`U ×ˢ V` disjoint from the graph of `E`, the saturations of `U` and `V` are disjoint analytic
invariant sets, which `Setoid.exists_invariant_measurableSet_separating` separates by an invariant
Borel set; the countably many separators separate the classes, and
`Setoid.isSmooth_iff_countablySeparated` concludes. -/
theorem isSmooth_of_isClosed {X : Type u} [TopologicalSpace X] [PolishSpace X]
    [MeasurableSpace X] [BorelSpace X] (E : Setoid X) (hE : IsClosed {p : X × X | E p.1 p.2}) :
    E.IsSmooth := by
  sorry

end TauCetiRoadmap.BorelEquivalenceRelations
