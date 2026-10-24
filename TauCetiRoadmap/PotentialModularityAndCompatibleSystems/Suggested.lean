import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Places.Basic

/-!
# Potential modularity and compatible systems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The statements are additive strong approximation away from any one place (§2.5a),
Taylor's split-field Zariski density theorem (§2.10), and Böckle's finite-presentation
complete-intersection theorem (§10.2). The maximal split extension is the supremum of
finite intermediate fields whose scalar extensions to the prescribed completions are
split algebras. The density statement uses separated smooth finite-type schemes;
affine-open reduction gives this form as well as the quasi-projective formulation.

The integral-point theorem and the refinements prescribing local opens (§§2.8–2.10,
2.17–2.23) are not stated: the pins lack the local analytic topology on scheme-valued
points and the Skolem integral-point interface. The finite-flat-boundary relative
Picard sheaf, its degree components and divisor fibration (§2.5) are also absent;
rigidified line-bundle classes alone do not supply them.

The compatible-family purity, monodromy and density-one theorems of Layer 1 and the
family existence, all-place strictness and transfer theorems of Layers 12–13 need
actual compatible-system data, Weil–Deligne parameters and labeled p-adic Hodge
conditions. These objects are absent at the pins. Residual and given-lift potential
modularity (Layers 3–6), ordinary patching and global-ring finiteness (Layer 8),
prescribed lifts and modularity lifting (Layers 9–11) additionally need the Hilbert
moduli, automorphic Galois realizations, Hecke algebras and arithmetic deformation
problems specified in the README. Their signatures require those objects, including
the conditional hypotheses of the branches that use them.
-/

open CategoryTheory AlgebraicGeometry
open IsDedekindDomain NumberField
open scoped NumberField TensorProduct

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

/-- The maximal extension in which the finite places in `S` and infinite places in
`T` split completely, inside a fixed algebraic closure (README §2.10). -/
noncomputable def maximalSplitExtension
    (S : Finset (HeightOneSpectrum (𝓞 K))) (T : Finset (InfinitePlace K)) :
    IntermediateField K (AlgebraicClosure K) :=
  sSup {E | FiniteDimensional K E ∧
    (∀ v ∈ S, Nonempty ((v.adicCompletion K ⊗[K] E) ≃ₐ[v.adicCompletion K]
      (Fin (Module.finrank K E) → v.adicCompletion K))) ∧
    (∀ v ∈ T, Nonempty ((v.Completion ⊗[K] E) ≃ₐ[v.Completion]
      (Fin (Module.finrank K E) → v.Completion)))}

/-- Taylor's Theorem G: local nonemptiness at the prescribed places implies Zariski
density over their maximal split extension (README §2.10). -/
theorem splitField_points_dense
    (S : Finset (HeightOneSpectrum (𝓞 K))) (T : Finset (InfinitePlace K))
    (X : Scheme) (f : X ⟶ Spec (.of K))
    [Smooth f] [IsSeparated f] [QuasiCompact f] [GeometricallyIrreducible f]
    (hS : ∀ v ∈ S, ∃ x : Spec (.of (v.adicCompletion K)) ⟶ X,
      x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K (v.adicCompletion K))))
    (hT : ∀ v ∈ T, ∃ x : Spec (.of v.Completion) ⟶ X,
      x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K v.Completion))) :
    Dense {x : X | ∃ t : Spec (.of (maximalSplitExtension K S T)) ⟶ X,
      t ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K (maximalSplitExtension K S T))) ∧
      x ∈ Set.range t} := by
  sorry

namespace Presentations

/-- A nonzero finite quotient of a complete DVR's power-series ring with at most as
many proper equations as variables is a finite flat complete intersection with
nonzero generic fibre (Böckle, Lemma 2, p. 5; README §10.2). -/
theorem finite_presentation_complete_intersection
    {O R : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧
      RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
        (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) ∧
      RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O) (List.ofFn f) ∧
      Nontrivial (Localization.Away (algebraMap O R π)) := by
  sorry

end Presentations
end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
