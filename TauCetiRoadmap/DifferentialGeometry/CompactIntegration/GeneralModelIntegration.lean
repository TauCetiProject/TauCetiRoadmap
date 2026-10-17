import TauCetiRoadmap.DifferentialGeometry.CompactIntegration.RelativeIntegration
import TauCetiRoadmap.DifferentialGeometry.CompactIntegration.AbsoluteIntegration
import TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation

/-!
DG 9.3 full-model integration targets consuming AT's orientation-selected class on the original
manifold. There is no DG-owned Euclidean rechart adapter: the only class input is AT's
`chosenCompactDatum`, and its carrier remains `TopCat.of N` throughout evaluation.
-/
noncomputable section

open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry
open TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation
namespace TauCetiRoadmap.DifferentialGeometry.CompactIntegration

/-- Real coefficients of AT's original-model class, obtained by the native integer-to-real
coefficient map from the existing DG/AT interface. -/
noncomputable def generalModelRealClass (m : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    {I : ModelWithCorners ℝ E H} [ChartedSpace H N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of N)) (hK : IsCompact K)
    (o : Manifold.Orientation I N (Fin m)) : RealRelativeHomology m N K :=
  integerToRealRelativeHomologyMap m N K
    (chosenCompactDatum I m e K hK o).fundamentalClass

/-- The AT real class on `(N,N \ K)` viewed on the open-pair carrier of `W`, where `K=Wᶜ`. -/
noncomputable def generalModelOpenRealClass (m : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    {I : ModelWithCorners ℝ E H} [ChartedSpace H N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (W : TopologicalSpace.Opens N) (hK : IsCompact ((W : Set N)ᶜ))
    (o : Manifold.Orientation I N (Fin m)) :=
  let K : Set (TopCat.of N) := (W : Set N)ᶜ
  let c := generalModelRealClass m e K hK o
  let P := openManifoldPair W
  let hp : TopPair.ofSubset (X := TopCat.of N) Kᶜ = P := by
    simp [K, P, openManifoldPair]
  ((P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom (hp ▸ c))

/-- Absolute AT class obtained from the same original-model compact datum at `K=univ`, followed
by the native `(N,∅)`-to-absolute homology isomorphism. -/
noncomputable def generalModelAbsoluteRealClass (m : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [CompactSpace N] {I : ModelWithCorners ℝ E H} [ChartedSpace H N]
    [IsManifold I ∞ N] [BoundarylessManifold I N]
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I N (Fin m)) : AbsoluteRealHomology m N := by
  let P : TopPair := TopPair.ofSubset (X := TopCat.of N) (Set.univ : Set N)ᶜ
  have hp : P = TopPair.ofSubset (X := TopCat.of N) (∅ : Set N) := by simp [P]
  exact (relativeEmptyToAbsoluteHomologyIso m N).hom
    (hp ▸ ((P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m).hom
      (generalModelRealClass m e Set.univ isCompact_univ o)))

/-- The model-identity pullback leaves a smooth form unchanged before restriction to the
relative open pair. This named lemma is the pullback/restriction bridge used in both dimensions. -/
theorem generalModel_pullback_restriction {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [ChartedSpace H N]
    {I : ModelWithCorners ℝ E H} [IsManifold I 1 N] [IsManifold I ∞ N]
    (m : ℕ) (W : TopologicalSpace.Opens N)
    (α : SmoothForm I N ℝ m)
    (hW : mpullbackₗ (I := I) (I' := I)
      (f := fun x : W => (x : N)) contMDiff_subtype_val m α = 0) :
    mpullbackₗ (I := I) (I' := I) (f := fun x : W => (x : N))
      contMDiff_subtype_val m
      (mpullbackₗ (I := I) (I' := I) (f := fun x : N => x) contMDiff_id m α) = 0 := by
  have hid : mpullbackₗ (I := I) (I' := I)
      (f := fun x : N => x) contMDiff_id m α = α := by
    apply Subtype.ext
    exact mpullback_id (α : RoughForm I N ℝ m)
  simpa only [hid] using hW

/-- Relative de Rham evaluation against the original-model AT class on `(N,N\W)`. -/
noncomputable def generalModelRelativeEvaluation (m : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] {I : ModelWithCorners ℝ E H} [ChartedSpace H N]
    [IsManifold I 1 N] [IsManifold I ∞ N] [BoundarylessManifold I N]
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I N (Fin m)) (W : TopologicalSpace.Opens N)
    (hK : IsCompact ((W : Set N)ᶜ))
    (hm : Module.finrank ℝ E = m)
    (α : SmoothForm I N ℝ m)
    (hW : mpullbackₗ (I := I) (I' := I)
      (f := fun x : W => (x : N)) contMDiff_subtype_val m α = 0) :=
  relativeKronecker W m
    (relativeDeRhamHom I W m
      (relativeDeRhamClassOfVanishing I W m α
        (topForm_closed_of_finrank m hm α) hW))
    (generalModelOpenRealClass m e W hK o)

/-! The general-model proof pulls forms and relative de Rham classes to AT's fresh carrier
via `carrierValDiffeomorph`. Use DG8.4's `relativeDeRhamHom_naturality`, native Kronecker
naturality and AT's explicitly pushed integral class to compare evaluations. DG5.2's signed
change-of-variables theorem compares the two integrals using `carrierOrientationAt_spec`.
Apply the Euclidean positive- or zero-dimensional integration theorem on the carrier and
transport back. These are proof targets on the actual AT carrier; no second atlas on `N` or
second integral class factory is involved. -/

/-- Relative integration for positive finite dimension. The real class is the coefficient image of
AT's selected ordinary integer class on the original manifold. -/
theorem generalModel_relativeIntegration_target (q : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] {I : ModelWithCorners ℝ E H} [ChartedSpace H N]
    [IsManifold I 1 N] [IsManifold I ∞ N] [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = q + 1)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin (q + 1)))
    (o : Manifold.Orientation I N (Fin (q + 1)))
    (W : TopologicalSpace.Opens N) (hK : IsCompact ((W : Set N)ᶜ))
    (α : SmoothForm I N ℝ (q + 1))
    (hW : mpullbackₗ (I := I) (I' := I)
      (f := fun x : W => (x : N)) contMDiff_subtype_val (q + 1) α = 0) :
    generalModelRelativeEvaluation (q + 1) e o W hK hm α hW = integralTopForm o α := by
  have hrestriction := generalModel_pullback_restriction (q + 1) W α hW
  -- Apply the local integration theorem to AT's class and use its local-image normalization.
  sorry

/-- Zero-dimensional relative integration; no positive-dimension chart or reflection argument is
used, and the orientation-selected AT class remains the input. -/
theorem generalModel_relativeIntegration_zero_target {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] {I : ModelWithCorners ℝ E H} [ChartedSpace H N]
    [IsManifold I 1 N] [IsManifold I ∞ N] [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = 0)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin 0))
    (o : Manifold.Orientation I N (Fin 0))
    (W : TopologicalSpace.Opens N) (hK : IsCompact ((W : Set N)ᶜ))
    (α : SmoothForm I N ℝ 0)
    (hW : mpullbackₗ (I := I) (I' := I)
      (f := fun x : W => (x : N)) contMDiff_subtype_val 0 α = 0) :
    generalModelRelativeEvaluation 0 e o W hK hm α hW = integralTopForm o α := by
  have hrestriction := generalModel_pullback_restriction 0 W α hW
  -- The isolated degree-zero local generator is the point class selected by AT.
  sorry

/-- Positive-dimensional absolute integration against AT's original-model compact class. -/
theorem generalModel_absoluteIntegration_positive_target (q : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] [CompactSpace N] {I : ModelWithCorners ℝ E H}
    [ChartedSpace H N] [IsManifold I 1 N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = q + 1)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin (q + 1)))
    (o : Manifold.Orientation I N (Fin (q + 1)))
    (α : SmoothForm I N ℝ (q + 1)) :
    ((absolutePairKronecker (q + 1) N)
      (deRhamHom I N (q + 1)
        (deRhamCohomology.mk I N (q + 1)
          ⟨α, topForm_closed_of_finrank (q + 1) hm α⟩))).hom
      (generalModelAbsoluteRealClass (q + 1) e o) = integralTopForm o α := by
  sorry

/-- Zero-dimensional absolute integration, retaining the signed orientation class. -/
theorem generalModel_absoluteIntegration_zero_target {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] [CompactSpace N] {I : ModelWithCorners ℝ E H}
    [ChartedSpace H N] [IsManifold I 1 N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = 0)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin 0))
    (o : Manifold.Orientation I N (Fin 0))
    (α : SmoothForm I N ℝ 0) :
    ((absolutePairKronecker 0 N)
      (deRhamHom I N 0
        (deRhamCohomology.mk I N 0
          ⟨α, topForm_closed_of_finrank 0 hm α⟩))).hom
      (generalModelAbsoluteRealClass 0 e o) = integralTopForm o α := by
  sorry

/-- The relative evaluation is independent of which linear rechart carries AT's construction. -/
theorem generalModel_relativeIntegration_rechart_independent (m : ℕ) {E H N : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] {I : ModelWithCorners ℝ E H} [ChartedSpace H N]
    [IsManifold I 1 N] [IsManifold I ∞ N] [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = m)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I N (Fin m)) (W : TopologicalSpace.Opens N)
    (hK : IsCompact ((W : Set N)ᶜ)) (α : SmoothForm I N ℝ m)
    (hW : mpullbackₗ (I := I) (I' := I)
      (f := fun x : W => (x : N)) contMDiff_subtype_val m α = 0) :
    generalModelRelativeEvaluation m e o W hK hm α hW =
      generalModelRelativeEvaluation m e' o W hK hm α hW := by
  -- Use AT's class equality for the fixed orientation and functoriality of the real coefficient map.
  sorry

/-- Positive-dimensional absolute evaluation is independent of the rechart choice. -/
theorem generalModel_absoluteIntegration_adapter_independent_positive (q : ℕ)
    {E H N : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] [CompactSpace N] {I : ModelWithCorners ℝ E H}
    [ChartedSpace H N] [IsManifold I 1 N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = q + 1)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin (q + 1)))
    (o : Manifold.Orientation I N (Fin (q + 1)))
    (α : SmoothForm I N ℝ (q + 1)) :
    ((absolutePairKronecker (q + 1) N)
      (deRhamHom I N (q + 1)
        (deRhamCohomology.mk I N (q + 1)
          ⟨α, topForm_closed_of_finrank (q + 1) hm α⟩))).hom
      (generalModelAbsoluteRealClass (q + 1) e o) =
    ((absolutePairKronecker (q + 1) N)
      (deRhamHom I N (q + 1)
        (deRhamCohomology.mk I N (q + 1)
          ⟨α, topForm_closed_of_finrank (q + 1) hm α⟩))).hom
      (generalModelAbsoluteRealClass (q + 1) e' o) := by
  -- Combine the absolute formula with AT's same-orientation rechart equality.
  sorry

/-- Zero-dimensional absolute evaluation is independent of the rechart choice. -/
theorem generalModel_absoluteIntegration_adapter_independent_zero
    {E H N : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace N] [T2Space N] [SecondCountableTopology N]
    [SigmaCompactSpace N] [CompactSpace N] {I : ModelWithCorners ℝ E H}
    [ChartedSpace H N] [IsManifold I 1 N] [IsManifold I ∞ N]
    [BoundarylessManifold I N]
    (hm : Module.finrank ℝ E = 0)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin 0))
    (o : Manifold.Orientation I N (Fin 0)) (α : SmoothForm I N ℝ 0) :
    ((absolutePairKronecker 0 N)
      (deRhamHom I N 0
        (deRhamCohomology.mk I N 0
          ⟨α, topForm_closed_of_finrank 0 hm α⟩))).hom
      (generalModelAbsoluteRealClass 0 e o) =
    ((absolutePairKronecker 0 N)
      (deRhamHom I N 0
        (deRhamCohomology.mk I N 0
          ⟨α, topForm_closed_of_finrank 0 hm α⟩))).hom
      (generalModelAbsoluteRealClass 0 e' o) := by
  sorry

end TauCetiRoadmap.DifferentialGeometry.CompactIntegration
end
