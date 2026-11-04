import TauCetiRoadmap.AlgebraicTopology.OrientationComparison
import TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws
import TauCetiRoadmap.DifferentialGeometry.Suggested

/-!
AT6.3 orientation-selected general-model classes. The ordinary integer classes exported below
are images of OrientationComparison's selected point generators and compact-support class on a
fresh Euclidean carrier. No Euclidean `ChartedSpace` instance is installed on the original `M`.
-/

noncomputable section

open CategoryTheory
open Limits
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry

namespace TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation

variable {E H M : Type}
variable [normedAddE : NormedAddCommGroup E] [normedSpaceE : NormedSpace ℝ E]
variable [finiteDimE : FiniteDimensional ℝ E]
variable [topologyH : TopologicalSpace H] [topologyM : TopologicalSpace M]
variable [t2M : T2Space M] [secondCountableM : SecondCountableTopology M]
variable (I : ModelWithCorners ℝ E H)
variable [chartedM : ChartedSpace H M] [smoothM : IsManifold I ∞ M]
variable [boundarylessM : BoundarylessManifold I M]

include finiteDimE t2M secondCountableM smoothM boundarylessM I

abbrev EuclideanModel (m : ℕ) :=
  modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))

/-- The rechart choice indexes a new type, so instance search never sees two Euclidean atlases
on one underlying manifold. -/
abbrev RechartedInterior (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :=
  @FreshInteriorRechart.Carrier E H M normedAddE normedSpaceE topologyH topologyM I chartedM m e

noncomputable def rechartedInteriorChartedSpace (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) (RechartedInterior (I := I) (M := M) m e) :=
  FreshInteriorRechart.chartedSpace I m e

noncomputable instance rechartedInteriorChartedSpaceInstance (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) (RechartedInterior (I := I) (M := M) m e) :=
  rechartedInteriorChartedSpace I m e

/-- The preferred chart on the boundaryless orientation carrier is the same reparameterized
interior chart used by `FreshInteriorRechart`: apply the original model map and then `e`. -/
theorem rechartedInteriorChartAt_formula (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (x y : RechartedInterior (I := I) (M := M) m e)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) x).source) :
    chartAt (EuclideanSpace ℝ (Fin m)) x y =
      e (I ((chartAt H (x.point : M)) (y.point : M))) := by
  exact FreshInteriorRechart.chartAt_apply I m e x y hy

theorem rechartedInteriorIsManifold (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
    IsManifold (EuclideanModel m) ∞ (RechartedInterior (I := I) (M := M) m e) := by
  exact FreshInteriorRechart.isManifold I m e

noncomputable instance rechartedInteriorIsManifoldInstance (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    IsManifold (EuclideanModel m) ∞ (RechartedInterior (I := I) (M := M) m e) := by
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
    (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
  exact rechartedInteriorIsManifold I m e

instance rechartedInteriorBoundaryless (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
    BoundarylessManifold (EuclideanModel m) (RechartedInterior (I := I) (M := M) m e) := by
  exact FreshInteriorRechart.boundaryless I m e

/-- Topological carrier equivalence. Its pointwise law pins it to the original subtype value. -/
noncomputable def carrierHomeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    RechartedInterior (I := I) (M := M) m e ≃ₜ M :=
  FreshInteriorRechart.carrierHomeomorphOriginal I m e

theorem carrierHomeomorph_apply (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (x : RechartedInterior (I := I) (M := M) m e) :
    carrierHomeomorph I m e x = (x.point : M) := by
  exact FreshInteriorRechart.carrierHomeomorphOriginal_apply I m e x

/-- Smooth carrier equivalence: Euclidean rechart on the domain, original model `I` on `M`. -/
noncomputable def carrierValDiffeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Diffeomorph (EuclideanModel m) I
      (RechartedInterior (I := I) (M := M) m e) M ∞ := by
  let _ := finiteDimE
  let _ := t2M
  let _ := secondCountableM
  let _ := smoothM
  let _ := boundarylessM
  sorry

theorem carrierValDiffeomorph_toHomeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    (carrierValDiffeomorph (I := I) (M := M) m e).toHomeomorph =
      carrierHomeomorph (I := I) (M := M) m e := by
  sorry

/-- Pull back the given orientation through the derivative of the carrier diffeomorphism. -/
noncomputable def carrierOrientation (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) :
    Manifold.Orientation (EuclideanModel m) (RechartedInterior (I := I) (M := M) m e)
      (Fin m) := by
  let C := RechartedInterior (I := I) (M := M) m e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
    rechartedInteriorChartedSpace I m e
  letI : IsManifold (EuclideanModel m) ∞ C :=
    rechartedInteriorIsManifold I m e
  let hf : IsLocalDiffeomorph (EuclideanModel m) I ∞
      (fun y : C => (y.point : M)) :=
    fun y => FreshInteriorRechart.isLocalDiffeomorph_val I m e y
  exact Manifold.Orientation.pullback hf (by norm_num) o

/-- Exact tangent-orientation comparison used to select the Euclidean-carrier generator. -/
theorem carrierOrientationAt_spec (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m))
    (x : RechartedInterior (I := I) (M := M) m e) :
    Orientation.map (Fin m)
      ((carrierValDiffeomorph I m e).mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
      (orientationAt (carrierOrientation I m e o) x) =
        orientationAt o ((carrierValDiffeomorph I m e) x) := by
  sorry

noncomputable def carrierToOriginal (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    TopCat.of (RechartedInterior (I := I) (M := M) m e) ⟶ TopCat.of M :=
  TopCat.ofHom ⟨fun x => carrierHomeomorph I m e x,
    (carrierHomeomorph I m e).continuous⟩

abbrev IntegralSystem (X : TopCat) : TauCeti.LocalCoefficientSystem ℤ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℤ ℤ)

noncomputable def carrierSupport (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) : Set (TopCat.of (RechartedInterior (I := I) (M := M) m e)) :=
  {y | carrierHomeomorph I m e y ∈ K}

noncomputable def carrierSupportPairMap (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) (K : Set (TopCat.of M)) :
    TopPair.ofSubset (carrierSupport I m e K)ᶜ ⟶ TopPair.ofSubset Kᶜ :=
  TopPair.ofSubsetMap (carrierToOriginal I m e) (by
    intro y hy
    change carrierHomeomorph I m e y ∉ K
    simpa [carrierSupport] using hy)

/-- Ordinary integer local generator on `M`, obtained from AT's orientation-selected generator
on the Euclidean carrier and the explicit native constant-system pullback isomorphism. -/
noncomputable def pointGenerator (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) (x : TopCat.of M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) (IntegralSystem (TopCat.of M)) m := by
  have hx : carrierHomeomorph I m e ((carrierHomeomorph I m e).symm x) = x :=
    (carrierHomeomorph I m e).apply_symm_apply x
  rw [← hx]
  exact TauCetiRoadmap.AlgebraicTopology.embeddingIntegralLocalMap
    (carrierToOriginal I m e)
    (carrierHomeomorph I m e).injective ((carrierHomeomorph I m e).symm x) m
    (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator m
      (RechartedInterior (I := I) (M := M) m e) (carrierOrientation I m e o)
      ((carrierHomeomorph I m e).symm x))

/-- Lift the carrier's selected section through the actual carrier map and constant pullback
comparison. The carrier section is exactly AT6.3's `chosenSection`. -/
noncomputable def chosenSection (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (IntegralSystem (TopCat.of M)) m Set.univ where
  localValue := fun x _ => pointGenerator I m e o x
  locally_represented := by
    intro x hx
    let C := RechartedInterior (I := I) (M := M) m e
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := rechartedInteriorChartedSpace I m e
    letI : IsManifold (EuclideanModel m) ∞ C := rechartedInteriorIsManifold I m e
    letI : BoundarylessManifold (EuclideanModel m) C := rechartedInteriorBoundaryless I m e
    let S := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenSection
      m C (carrierOrientation I m e o)
    obtain ⟨B, hBU, hBopen, hxB, c, hc⟩ := S.locally_represented
      ((carrierHomeomorph I m e).symm x) (Set.mem_univ _)
    -- Transport this AT witness across the carrier homeomorphism, using the exact pointwise
    -- carrier law and the two pair-map naturality squares to identify its local generator.
    sorry

/-- Actual ordinary integral class on the original pair `(M, M \ K)`. It is the image of
OrientationComparison's chosen compact class on the fresh carrier, after the explicit constant
system pullback isomorphism. No compactness of `M` is assumed. -/
noncomputable def compactSupportFundamentalClass (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    twistedRelativeHomology ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem (TopCat.of M)) m := by
  let C : Type := RechartedInterior (I := I) (M := M) m e
  let P := carrierSupportPairMap I m e K
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := rechartedInteriorChartedSpace I m e
  letI : IsManifold (EuclideanModel m) ∞ C := rechartedInteriorIsManifold I m e
  letI : BoundarylessManifold (EuclideanModel m) C := rechartedInteriorBoundaryless I m e
  let hK' : IsCompact (carrierSupport I m e K) := by
    -- Pullback along the carrier homeomorphism preserves compactness.
    sorry
  exact
    (TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.constantSystemHomologyMap
      P (ModuleCat.of ℤ ℤ) m)
      (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactClass m C
        (carrierSupport I m e K) hK' (carrierOrientation I m e o))

/-- The support-class image on `M` is normalized by the exported point generator. This is the
local-image theorem needed by DG integration, not a separate assumed normalization field. -/
theorem compactSupportFundamentalClass_local (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m))
    (x : TopCat.of M) (hx : x ∈ K) :
    twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem (TopCat.of M)) m K x hx
      (compactSupportFundamentalClass I m e K hK o) = pointGenerator I m e o x := by
  -- Reduce to `OrientationComparison.chosenCompactClass_local` on the carrier, then use
  -- naturality of the support-pair maps and the constant coefficient pullback isomorphisms.
  sorry

/-- Class-level rechart independence for one fixed tangent orientation `o`; the result compares
ordinary integer classes in the same relative group on the original manifold. Its proof uses the
carrier-change homeomorphism and the local-image theorem above. -/
theorem compactSupportFundamentalClass_rechart_independent (m : ℕ)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    compactSupportFundamentalClass I m e K hK o =
      compactSupportFundamentalClass I m e' K hK o := by
  -- Uniqueness in the AT compact-support factory follows from equality of the local generators.
  sorry

/-- The selected local generator itself is independent of the Euclidean rechart. Both sides
land in the same ordinary integer local-homology group of the original manifold. -/
theorem pointGenerator_rechart_independent (m : ℕ)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) (x : TopCat.of M) :
    pointGenerator I m e o x = pointGenerator I m e' o x := by
  -- Compare the carrier local classes through the pointwise carrier homeomorphism law and
  -- the selected tangent-orientation derivative comparison.
  sorry

/-- AT local-normalization datum on the original support pair. Its local equations are the
support-local theorem above, rewritten through the native pair-local map. -/
noncomputable def chosenCompactDatum (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem (TopCat.of M)) m
      (fun x _ => pointGenerator I m e o x) where
  fundamentalClass := compactSupportFundamentalClass I m e K hK o
  local_eq := by
    intro x hx
    have hmem : x ∈ K := by
      -- The complement pair's subspace is exactly the points outside K.
      sorry
    have hlocal := compactSupportFundamentalClass_local I m e K hK o x hmem
    -- Identify RelativeTwistedClassDatum.local_eq's native pair map with
    -- twistedSupportLocalMap via the support inclusion and identity-coefficient square.
    sorry

omit finiteDimE t2M secondCountableM smoothM boundarylessM

end TauCetiRoadmap.AlgebraicTopology.GeneralModelOrientation

end
