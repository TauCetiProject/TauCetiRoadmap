import TauCetiRoadmap.AlgebraicTopology.BoundaryInteriorComparison
import TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested Lean declarations;
the README is the definitive specification. Honest admitted targets remain below.

AT boundary orientation prototype: define the boundary orientation local system on the actual half-space
ambient carrier by transport along the fundamental-groupoid equivalence induced by its interior
inclusion. The equivalence data and resulting natural comparison are explicit admitted geometry
targets, not Prop fields or an independent sign-system placeholder.
-/

noncomputable section
universe u v w
open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry

namespace TauCetiRoadmap.AlgebraicTopology.BoundaryCarrierOrientation

/-- The fresh Euclidean rechart of the interior of an `(n+1)`-dimensional half-space-model
manifold. -/
abbrev InteriorCarrier (n : ℕ) [NeZero (n + 1)] (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M] :=
  FreshInteriorRechart.Carrier
    (E := EuclideanSpace ℝ (Fin (n + 1)))
    (H := EuclideanHalfSpace (n + 1)) (M := M)
    (modelWithCornersEuclideanHalfSpace (n + 1)) (n + 1)
    (ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1))) )

/-- The actual topological inclusion of the freshly recharted interior. -/
noncomputable def interiorInclusion (n : ℕ) [NeZero (n + 1)] (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    C(InteriorCarrier n M, M) := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  letI : TopologicalSpace (InteriorCarrier n M) :=
    FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  exact ⟨fun x => x.point, (FreshInteriorRechart.val_isOpenEmbedding I (n + 1) e).continuous⟩

/-- The groupoid functor is definitionally induced by the actual interior inclusion. The remaining
quasi-inverse and equivalence laws are the geometric interior-push target. -/
noncomputable def interiorFundamentalGroupoidEquivalence (n : ℕ) [NeZero (n + 1)]
    (M : Type) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    CategoryTheory.Equivalence
      (FundamentalGroupoid (TopCat.of (InteriorCarrier n M)))
      (FundamentalGroupoid (TopCat.of M)) where
  functor := FundamentalGroupoid.map (interiorInclusion n M)
  inverse := by
    sorry
  unitIso := by
    sorry
  counitIso := by
    sorry
  functor_unitIso_comp := by
    sorry

/-- Integral top local homology on the boundaryless fresh interior carrier, transported to the
ambient half-space manifold by the inverse of its interior-inclusion groupoid equivalence. Thus
boundary points receive fibres by inward transport rather than by their vanishing ambient local
homology. -/
noncomputable def halfSpaceOrientationLocalSystem (n : ℕ) [NeZero (n + 1)]
    (M : Type) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    TauCeti.LocalCoefficientSystem ℤ (TopCat.of M) := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  let C := InteriorCarrier n M
  letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
    FreshInteriorRechart.chartedSpace I (n + 1) e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
    FreshInteriorRechart.isManifold I (n + 1) e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
    FreshInteriorRechart.boundaryless I (n + 1) e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  exact (interiorFundamentalGroupoidEquivalence n M).inverse ⋙
    TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C

/-- The restriction comparison `κ` is the unit isomorphism of the actual groupoid equivalence,
whiskered by the fresh-carrier integral orientation system. -/
noncomputable def halfSpaceOrientationLocalSystem_restrictInteriorIso
    (n : ℕ) [NeZero (n + 1)] (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    let I := modelWithCornersEuclideanHalfSpace (n + 1)
    let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
    let C := InteriorCarrier n M
    letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
    letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
      FreshInteriorRechart.chartedSpace I (n + 1) e
    letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
      FreshInteriorRechart.isManifold I (n + 1) e
    letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
      FreshInteriorRechart.boundaryless I (n + 1) e
    letI : T2Space C := inferInstance
    letI : SecondCountableTopology C := inferInstance
    (TauCeti.LocalCoefficientSystem.pullback
      (interiorInclusion n M)).obj (halfSpaceOrientationLocalSystem n M) ≅
      TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  let C := InteriorCarrier n M
  letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
    FreshInteriorRechart.chartedSpace I (n + 1) e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
    FreshInteriorRechart.isManifold I (n + 1) e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
    FreshInteriorRechart.boundaryless I (n + 1) e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  let G := interiorFundamentalGroupoidEquivalence n M
  change (G.functor ⋙ (G.inverse ⋙
    TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)) ≅ _
  exact (Functor.associator G.functor G.inverse
    (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)).symm ≪≫
      Functor.isoWhiskerRight G.unitIso.symm
        (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C) ≪≫
      Functor.leftUnitor
        (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)

/-- Twisted support-pair map for every native local system is an isomorphism when `f` is an open
embedding and `K` is compact. The target Hausdorff hypothesis also makes the open source Hausdorff
through the embedding. -/
theorem isIso_supportOpenEmbeddingTwistedHomologyMap
    {R : Type u} [Ring R] {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (hK : IsCompact K)
    (L : TauCeti.LocalCoefficientSystem R (TopCat.of N)) (m : ℕ) :
    IsIso (BoundaryInteriorComparison.supportOpenEmbeddingTwistedHomologyMap f hf K L m) := by
  sorry

/-- On a boundaryless target, the open-interior local generator agrees with the
ordinary general-model construction transported by the whole-carrier homeomorphism. -/
theorem pointGeneratorOnAmbient_eq_generalModel
    {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin m))
    (x : FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e) :
    BoundaryInteriorComparison.pointGeneratorOnAmbient I m e o x =
      GeneralModelOrientation.pointGenerator I m e o x.point := by
  sorry

end TauCetiRoadmap.AlgebraicTopology.BoundaryCarrierOrientation
