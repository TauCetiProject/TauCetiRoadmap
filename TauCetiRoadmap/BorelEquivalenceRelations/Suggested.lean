import Mathlib
import TauCeti.Topology.Perfect
import TauCeti.Topology.Baire.Perfect
import TauCeti.Topology.Baire.KuratowskiUlam
import TauCeti.Topology.Baire.Mycielski
import TauCeti.Topology.Baire.BaireMeasurableMap
import TauCeti.Topology.Instances.CantorSpace
import TauCeti.Topology.MetricSpace.Perfect
import TauCeti.Topology.MetricSpace.Polish.GDelta
import TauCeti.Topology.MetricSpace.Polish.Pi
import TauCeti.Data.Set.Countable
import TauCeti.MeasureTheory.MeasurableSpace.Card
import TauCeti.MeasureTheory.MeasurableSpace.Graph
import TauCeti.MeasureTheory.Constructions.Polish.Analytic
import TauCeti.MeasureTheory.Constructions.Polish.GDelta
import TauCeti.MeasureTheory.Constructions.Polish.Graph
import TauCeti.MeasureTheory.Constructions.Polish.Perfect
import TauCeti.SetTheory.Descriptive.Antichain
import TauCeti.SetTheory.Descriptive.CantorScheme
import TauCeti.SetTheory.Descriptive.GSGraph
import TauCeti.SetTheory.Descriptive.BorelColoring
import TauCeti.SetTheory.Descriptive.InvariantSeparation
import TauCeti.SetTheory.Descriptive.SmallFamily.Basic
import TauCeti.SetTheory.Descriptive.SmallFamily.WitnessExtension
import TauCeti.SetTheory.Descriptive.GZeroDichotomy
import TauCeti.SetTheory.Descriptive.Silver
import TauCeti.SetTheory.Descriptive.BorelReducibility
import TauCeti.SetTheory.Descriptive.EZero
import TauCeti.SetTheory.Descriptive.NormalForms

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
`Setoid.IsSmooth` and `TauCeti.eZero`. This file imports the modules the README's *From Tau Ceti*
table names, consumes them and does not restate them; the README names each declaration.

What remains are the two statements below, stated on Tau Ceti's carriers. Names and namespaces
are provisional.
-/

universe u

open MeasureTheory Function

namespace TauCetiRoadmap.BorelEquivalenceRelations

/-- With Tau Ceti imported, instance search finds the Polish and perfect structures of Cantor
space (`TauCeti.polishSpace_pi_of_discreteTopology`, `TauCeti.perfectSpace_pi`), which it does
not find from Mathlib alone. -/
example : PolishSpace (ℕ → Bool) ∧ PerfectSpace (ℕ → Bool) ∧ PerfectSpace (ℕ → ℕ) :=
  ⟨inferInstance, inferInstance, inferInstance⟩

/-- Alexandrov's theorem in the generality the README states, for `T6` spaces: Tau Ceti's
`TauCeti.isGδ_of_isCompletelyMetrizableSpace` assumes a perfectly normal Hausdorff space, which
a `T6` space is, and takes the complete metrizability of the subspace as an instance. -/
example {X : Type u} [TopologicalSpace X] [T6Space X] {s : Set X}
    (hs : TopologicalSpace.IsCompletelyMetrizableSpace s) : IsGδ s :=
  TauCeti.isGδ_of_isCompletelyMetrizableSpace

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
