import TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws
import TauCeti.AlgebraicTopology.Singular.Excision

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested Lean declarations;
the README is the definitive specification. Honest admitted targets remain below.

AT-owned boundary-interior comparisons.  The recharted carrier is the actual interior of a
possibly-boundary manifold, so local constructions are transported by its open inclusion rather
than by a false homeomorphism from the whole carrier to the ambient manifold.
-/

noncomputable section
universe u v w
set_option maxHeartbeats 2000000
set_option synthInstance.maxHeartbeats 2000000
open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry

namespace TauCetiRoadmap.AlgebraicTopology.BoundaryInteriorComparison

/-- The fresh rechart carrier includes as an open embedding into the original manifold, also when
that manifold has boundary. The range is exactly `I.interior M`. -/
theorem FreshInteriorRechart.val_isOpenEmbedding
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Topology.IsOpenEmbedding
      (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M)
        I m e => (x.point : M)) := by
  let U : TopologicalSpace.Opens M := ⟨I.interior M, I.isOpen_interior (M := M) (n := ∞) (by simp)⟩
  have hsub : Topology.IsOpenEmbedding (Subtype.val : U → M) := U.isOpenEmbedding'
  let hhomeo := TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.carrierHomeomorphInterior
    (I := I) (M := M) m e
  have hcomp := hsub.comp hhomeo.isOpenEmbedding
  have hfun : (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
      (E := E) (H := H) (M := M) I m e => (x.point : M)) =
      (Subtype.val ∘ hhomeo) := by
    funext x
    change (x.point : M) = ((hhomeo x : I.interior M) : M)
    rfl
  convert hcomp using 1

/-- Global local-diffeomorphism certificate for the interior inclusion, made from the pointwise
inverse-function statement in the fresh rechart. -/
theorem FreshInteriorRechart.val_isLocalDiffeomorph
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
        (E := E) (H := H) (M := M) I m e) :=
      TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.chartedSpace I m e
    letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞
      (TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
        (E := E) (H := H) (M := M) I m e) :=
      TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isManifold I m e
    IsLocalDiffeomorph (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) I ∞
      (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M)
        I m e => (x.point : M)) := by
  exact fun x => TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isLocalDiffeomorph_val
    I m e x

/-- The constant-integral local class on a boundary-manifold carrier, transported to the ambient
manifold by the genuine open inclusion. The source orientation is pulled back from `o` by the
local diffeomorphism `val`; no whole-carrier/ambient homeomorphism is used. -/
noncomputable def pointGeneratorOnAmbient
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    [T2Space M] [SecondCountableTopology M]
    (o : Manifold.Orientation I M (Fin m))
    (x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) (x.point : M))
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m := by
  let C := TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e
  letI : TopologicalSpace C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.carrierTopologicalSpace I m e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.chartedSpace I m e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isManifold I m e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.boundaryless I m e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  let f : C → M := fun y => y.point
  let hf : IsLocalDiffeomorph (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) I ∞ f :=
    fun y => TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isLocalDiffeomorph_val
      I m e y
  let oC := Manifold.Orientation.pullback hf (by norm_num) o
  exact embeddingIntegralLocalMap (TopCat.ofHom ⟨f, (BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding I m e).continuous⟩)
    (BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding I m e).toIsEmbedding.injective x m
      (OrientationComparison.pointGenerator m C oC x)

/-- The local integral map of a generic T2 open embedding is an isomorphism by local excision;
there is no charted-space or boundaryless hypothesis on the target. -/
theorem isIso_embeddingIntegralLocalMap
    {M N : Type} [TopologicalSpace M] [TopologicalSpace N]
    [T2Space M] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (x : M) (m : ℕ) :
    IsIso (embeddingIntegralLocalMap (TopCat.ofHom ⟨f, hf.continuous⟩)
      hf.toIsEmbedding.injective x m) := by
  sorry

/-- Compact-support excision for a generic T2 open embedding. Compactness makes the support closed,
so excision identifies the ambient relative pair with the one inside the open image. -/
theorem isIso_supportOpenEmbeddingHomologyMap
    {M N : Type} [TopologicalSpace M] [TopologicalSpace N]
    [T2Space M] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (hK : IsCompact K) (m : ℕ) :
    IsIso (CompactOrientationLaws.supportOpenEmbeddingHomologyMap f hf K m) := by
  sorry

/-- Twisted relative map on the support pair of an open embedding, with the source coefficient
system exactly the categorical pullback of the target local system. -/
noncomputable def supportOpenEmbeddingTwistedHomologyMap
    {R : Type u} [Ring R] {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (L : TauCeti.LocalCoefficientSystem R (TopCat.of N)) (m : ℕ) :
    (TopPair.ofSubset (X := TopCat.of M) Kᶜ).twistedHomology
      ((TauCeti.LocalCoefficientSystem.pullback
        (TopPair.Hom.fst (CompactOrientationLaws.supportOpenEmbeddingPairMap f hf K)).hom).obj L) m ⟶
      (TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ).twistedHomology L m :=
  TopPair.twistedHomologyMap
    (CompactOrientationLaws.supportOpenEmbeddingPairMap f hf K) L m

end TauCetiRoadmap.AlgebraicTopology.BoundaryInteriorComparison

/- Public spelling on the fresh carrier API for its inclusion into the ambient manifold. -/
namespace TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart

theorem val_isOpenEmbedding
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Topology.IsOpenEmbedding
      (fun x : Carrier (E := E) (H := H) (M := M) I m e => (x.point : M)) :=
  TauCetiRoadmap.AlgebraicTopology.BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding
    I m e

end TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart
