import TauCetiRoadmap.AlgebraicTopology.OrientationComparison
import TauCeti.AlgebraicTopology.Singular.Twisted.ConstantNaturality
import TauCeti.AlgebraicTopology.Singular.Excision

/-!
AT-owned pure integer/local/class laws for compactly supported orientation classes.
This module depends on AT's orientation comparison and relative-class carriers only.  It does
not import the DG compact-integration interface; smooth forms and real coefficient maps remain
in DG.  Excision and geometric naturality statements below are explicit implementation targets.
-/

noncomputable section
universe u v w
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 800000
open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry
namespace TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws

abbrev Model (m : ℕ) := modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))
abbrev IntegralSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj (ModuleCat.of ℤ ℤ)
abbrev RelativeHomology (m : ℕ) (M : Type) [TopologicalSpace M] (K : Set M) :=
  twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
    (IntegralSystem M) m
abbrev LocalHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] (x : M) :=
  twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) (IntegralSystem M) m
abbrev ManifoldOrientation (m : ℕ) (M : Type) [TopologicalSpace M] [ChartedSpace
    (EuclideanSpace ℝ (Fin m)) M] := Manifold.Orientation (Model m) M (Fin m)
abbrev PointGenerator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator m M

/-- Coefficient-correct homology map for a map of pairs with constant coefficients. -/
noncomputable def constantSystemHomologyMap {R : Type u} [Ring R] {P Q : TopPair.{v}}
    (f : P ⟶ Q) (V : ModuleCat.{max v w} R) (m : ℕ) :
    P.twistedHomology ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj V) m ⟶
      Q.twistedHomology ((TauCeti.LocalCoefficientSystem.constantFunctor Q.fst).obj V) m := by
  let e := TauCeti.LocalCoefficientSystem.pullbackConstantIso (TopPair.Hom.fst f).hom V
  exact P.twistedHomologyCoefficientMap e.inv m ≫
    TopPair.twistedHomologyMap f
      ((TauCeti.LocalCoefficientSystem.constantFunctor Q.fst).obj V) m

/-- Pair map in the direction induced by support inclusion K ⊆ K'. -/
noncomputable def supportEnlargementPairMap {M : Type} [TopologicalSpace M]
    (K K' : Set M) (hKK' : K ⊆ K') :
    TopPair.ofSubset (X := TopCat.of M) K'ᶜ ⟶ TopPair.ofSubset (X := TopCat.of M) Kᶜ :=
  TopPair.ofSubsetMap (𝟙 (TopCat.of M)) (by
    intro x hx
    change x ∉ K
    intro hxK
    exact hx (hKK' hxK))

/-- Constant-integral homology map induced by enlargement of support. -/
noncomputable def supportEnlargementHomologyMap (m : ℕ) (M : Type)
    [TopologicalSpace M] (K K' : Set M) (hKK' : K ⊆ K') :
    RelativeHomology m M K' ⟶ RelativeHomology m M K :=
  constantSystemHomologyMap (supportEnlargementPairMap (M := M) K K' hKK')
    (ModuleCat.of ℤ ℤ) m

/-- Pair map for support transported along an open embedding. -/
noncomputable def supportOpenEmbeddingPairMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) :
    TopPair.ofSubset (X := TopCat.of M) Kᶜ ⟶
      TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ :=
  TopPair.ofSubsetMap (TopCat.ofHom ⟨f, hf.continuous⟩) (by
    intro x hx
    change f x ∉ f '' K
    intro h
    rcases h with ⟨y, hy, hxy⟩
    exact hx (hf.toIsEmbedding.injective hxy ▸ hy))

/-- Integral homology map on the support-pair open embedding, including constant-system pullback. -/
noncomputable def supportOpenEmbeddingHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) (m : ℕ) :
    RelativeHomology m M K ⟶ RelativeHomology m N (f '' K) :=
  constantSystemHomologyMap (supportOpenEmbeddingPairMap f hf K) (ModuleCat.of ℤ ℤ) m

/-- Integral local-homology map for an open embedding, using AT's native canonical
constant-system pullback comparison. -/
noncomputable def localOpenEmbeddingHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (x : M) :
    LocalHomology m M x ⟶ LocalHomology m N (f x) :=
  AlgebraicTopology.embeddingIntegralLocalMap
    (TopCat.ofHom ⟨f, hf.continuous⟩) hf.toIsEmbedding.injective x m

/-- Local point generator is natural under an orientation-preserving open embedding.
The tangent map and orientation transport are explicit hypotheses; the proof is an AT chart
comparison target, independent of integration. -/
theorem pointGenerator_openEmbedding_natural {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    [IsManifold (Model m) ∞ N] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (x : M) :
    (localOpenEmbeddingHomologyMap m f hf x).hom (PointGenerator m M oM x) =
      PointGenerator m N oN (f x) := by
  sorry

/-- Uniqueness of the AT selected compact class among relative classes with the same normalized
local images. -/
theorem chosenCompactClass_unique (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : ManifoldOrientation m M)
    (d : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x)) :
    d.fundamentalClass = OrientationComparison.chosenCompactClass m M K hK o := by
  exact OrientationComparison.chosenCompactClass_unique m M K hK o d

/-- Canonical compact-support class selected by AT's locally represented orientation section. -/
noncomputable abbrev chosenCompactClass := OrientationComparison.chosenCompactClass
noncomputable abbrev chosenCompactDatum := OrientationComparison.chosenCompactDatum

/-- Two class data with the same prescribed normalized local images are equal. -/
theorem relativeClass_unique (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : ManifoldOrientation m M)
    (a b : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x))
    : a = b := by
  have ha := OrientationComparison.chosenCompactClass_unique m M K hK o a
  have hb := OrientationComparison.chosenCompactClass_unique m M K hK o b
  have hab : a.fundamentalClass = b.fundamentalClass := ha.trans hb.symm
  cases a with
  | mk ac al =>
    cases b with
    | mk bc bl =>
      simp_all

/-- Compatibility of two normalized relative class data with support enlargement. -/
theorem relativeClass_enlarge (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K K' : Set (TopCat.of M))
    (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K') (o : ManifoldOrientation m M)
    (c : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x))
    (c' : RelativeTwistedClassDatum ℤ (TopPair.ofSubset K'ᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x)) :
    (supportEnlargementHomologyMap m M K K' hKK').hom c'.fundamentalClass =
      c.fundamentalClass := by
  sorry

/-- Naturality of arbitrary normalized compact-support class data for an oriented open embedding. -/
theorem relativeClass_openEmbedding_natural (m : ℕ) {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    [BoundarylessManifold (Model m) M] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (K : Set M) (hK : IsCompact K) (hK' : IsCompact (f '' K))
    (c : RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M oM x))
    (c' : RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ) (IntegralSystem N) m
      (fun x _ => PointGenerator m N oN x)) :
    (supportOpenEmbeddingHomologyMap f hf K m).hom c.fundamentalClass =
      c'.fundamentalClass := by
  sorry

/-- Negation law for the chosen integral compact class, derived from point-generator negation
and uniqueness of the normalized class. -/
theorem chosenCompactClass_orientation_neg (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set M) (hK : IsCompact K)
    (o : ManifoldOrientation m M) :
    (chosenCompactDatum m M K hK o.neg).fundamentalClass =
      -(chosenCompactDatum m M K hK o).fundamentalClass := by
  sorry

/-- Compact-class compatibility with the actual support-enlargement homology map. -/
theorem chosenCompactClass_enlarge (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K K' : Set M)
    (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K') (o : ManifoldOrientation m M) :
    (supportEnlargementHomologyMap m M K K' hKK').hom
      (chosenCompactDatum m M K' hK' o).fundamentalClass =
      (chosenCompactDatum m M K hK o).fundamentalClass := by
  sorry

/-- Compact-class naturality for an oriented open embedding. -/
theorem chosenCompactClass_openEmbedding_natural (m : ℕ) {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    [BoundarylessManifold (Model m) M] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (K : Set M) (hK : IsCompact K) (hK' : IsCompact (f '' K)) :
    (supportOpenEmbeddingHomologyMap f hf K m).hom
      (chosenCompactDatum m M K hK oM).fundamentalClass =
      (chosenCompactDatum m N (f '' K) hK' oN).fundamentalClass := by
  sorry

/-- The canonical component map for two support subsets is the pair of the two actual
support-enlargement maps. -/
noncomputable def disjointSupportComponentMap (m : ℕ) (M : Type)
    [TopologicalSpace M] (K₁ K₂ : Set M) :
    RelativeHomology m M (K₁ ∪ K₂) →ₗ[ℤ]
      (RelativeHomology m M K₁ × RelativeHomology m M K₂) := by
  let f₁ := supportEnlargementHomologyMap m M K₁ (K₁ ∪ K₂) (by intro x hx; exact Or.inl hx)
  let f₂ := supportEnlargementHomologyMap m M K₂ (K₁ ∪ K₂) (by intro x hx; exact Or.inr hx)
  refine { toFun := fun x => (f₁.hom x, f₂.hom x), map_add' := ?_, map_smul' := ?_ }
  · intro x y
    ext <;> simp
  · intro z x
    ext
    · simp only [Prod.smul_fst, RingHom.id_apply]
      rw [← int_smul_eq_zsmul (inferInstance : Module ℤ (RelativeHomology m M K₁)) z (f₁.hom x)]
      exact f₁.hom.map_smul z x
    · simp only [Prod.smul_snd, RingHom.id_apply]
      rw [← int_smul_eq_zsmul (inferInstance : Module ℤ (RelativeHomology m M K₂)) z (f₂.hom x)]
      exact f₂.hom.map_smul z x

/-- Excision for compact disjoint supports. The inverse is an implementation target based on
AT's excision theorem; the forward map is specified as the actual component map, not arbitrary
isomorphic data. -/
noncomputable def disjointSupportExcisionIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] (K₁ K₂ : Set M)
    (hK₁ : IsCompact K₁) (hK₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂) :
    RelativeHomology m M (K₁ ∪ K₂) ≃ₗ[ℤ]
      (RelativeHomology m M K₁ × RelativeHomology m M K₂) := by
  refine LinearEquiv.ofBijective (disjointSupportComponentMap m M K₁ K₂) ?_
  sorry

/-- The selected compact class decomposes under compact-disjoint-support excision. -/
theorem disjointComponentFundamentalClass_additivity (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K₁ K₂ : Set M)
    (h₁ : IsCompact K₁) (h₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂)
    (o : ManifoldOrientation m M) :
    disjointSupportExcisionIso m M K₁ K₂ h₁ h₂ hdisj
      (chosenCompactClass m M (K₁ ∪ K₂) (h₁.union h₂) o) =
      (chosenCompactClass m M K₁ h₁ o, chosenCompactClass m M K₂ h₂ o) := by
  sorry

end TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws
end
