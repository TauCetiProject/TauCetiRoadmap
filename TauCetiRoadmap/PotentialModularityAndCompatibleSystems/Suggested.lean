import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Places.Basic

/-!
# Potential modularity and compatible systems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The statement is additive strong approximation away from any one place (§2.5a), the
input to the geometric integral-point theorem that the pins can express.

The headline theorems consumed from earlier roadmaps are not stated here: Moret–Bailly's
theorem over number fields and split-field Zariski density (§§2.8–2.10) are
ClassicalSerreModularity `I.0/moret-bailly-split-points`, controlled residual potential
modularity (§§4.13–4.14) is its `I.0/controlled-residual-potential-modularity`, and the
finite-presentation complete-intersection criterion (§10.2) is the case `A = O` of
DeformationAndDerivedPatchingAlgebra §3.5.

The geometric integral-point theorem and the refinements prescribing local opens
(§§2.8, 2.17–2.23) are not stated: the pins lack the local analytic topology on
scheme-valued points and the Skolem integral-point interface. The finite-flat-boundary
relative Picard sheaf, its degree components and divisor fibration (§2.5) are also absent;
rigidified line-bundle classes alone do not supply them.

The compatible-family purity, monodromy and density-one theorems of Layer 1 and the
family existence, all-place strictness and transfer theorems of Layers 12–13 need
actual compatible-system data, Weil–Deligne parameters and labeled p-adic Hodge
conditions. These objects are absent at the pins. Taylor's and Snowden's residual
theorems and given-lift potential modularity (Layers 3–6), ordinary patching and
global-ring finiteness (Layer 8), prescribed lifts and modularity lifting (Layers 9–11)
additionally need the Hilbert moduli, automorphic Galois realizations, Hecke algebras
and arithmetic deformation problems specified in the README. Their signatures require
those objects, including the conditional hypotheses of the branches that use them.
-/

open IsDedekindDomain NumberField
open scoped NumberField

namespace TauCetiRoadmap.PotentialModularityAndCompatibleSystems

variable (K : Type*) [Field K] [NumberField K]

/-- Additive strong approximation away from an arbitrary finite or infinite place:
meet the prescribed local opens and remain integral at every other finite place
(Moret–Bailly II, proof of Lemma 3.8, p. 191; README §2.5a). -/
theorem additiveStrongApproximationAwayFromPlace
    (w : TauCeti.GlobalNumberFields.Place K)
    (S : Finset (HeightOneSpectrum (𝓞 K))) (T : Finset (InfinitePlace K))
    (hS : ∀ v ∈ S, Sum.inl v ≠ w) (hT : ∀ v ∈ T, Sum.inr v ≠ w)
    (harch : ∀ v : InfinitePlace K, Sum.inr v ≠ w → v ∈ T)
    (U : (v : HeightOneSpectrum (𝓞 K)) → Set (v.adicCompletion K))
    (V : (v : InfinitePlace K) → Set v.Completion)
    (hU : ∀ v ∈ S, IsOpen (U v) ∧ (U v).Nonempty)
    (hV : ∀ v ∈ T, IsOpen (V v) ∧ (V v).Nonempty) :
    ∃ x : K, (∀ v ∈ S, algebraMap K (v.adicCompletion K) x ∈ U v) ∧
      (∀ v ∈ T, algebraMap K v.Completion x ∈ V v) ∧
      ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → Sum.inl v ≠ w →
        ‖algebraMap K (v.adicCompletion K) x‖ ≤ 1 := by
  sorry

end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
