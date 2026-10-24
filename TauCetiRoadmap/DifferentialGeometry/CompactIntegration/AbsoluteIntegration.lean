import TauCetiRoadmap.DifferentialGeometry.CompactIntegration.RelativeIntegration
import Mathlib.Algebra.Category.ModuleCat.Colimits

noncomputable section
open CategoryTheory
open scoped ContDiff Manifold
namespace TauCetiRoadmap.DifferentialGeometry.CompactIntegration
open TauCetiRoadmap.DifferentialGeometry

/-- The absolute Kronecker pairing is defined on the actual absolute singular-chain complex. -/
noncomputable def absolutePairKronecker (m : ℕ) (M : Type) [TopologicalSpace M] :
    (TopCat.of M).singularCohomology (ModuleCat.of ℝ ℝ) ℝ (ModuleCat.of ℝ ℝ) m →ₗ[ℝ]
      (AbsoluteRealHomology m M ⟶ ModuleCat.of ℝ ℝ) :=
  TauCeti.ChainComplex.kronecker ℝ
    (((AlgebraicTopology.singularChainComplexFunctor
      (ModuleCat.{0} ℝ)).obj (ModuleCat.of ℝ ℝ)).obj (TopCat.of M))
    (ModuleCat.of ℝ ℝ) m

/-- Exact bridge obligation from the empty relative pair to the absolute Kronecker pairing. It
uses the native `(M,∅)` inclusion isomorphism, the empty-subset pair isomorphism, the
chain-complex/SSet homology comparison, and `relativeDeRhamHom_absolute`. The input classes `c`
and `c'` are separately normalized `CompactFundamentalClass` values; the admitted proof must
identify their transported representatives using the local normalization and compact-class
uniqueness, rather than assuming an arbitrary homology isomorphism preserves them. -/
theorem absoluteKronecker_emptyPair_bridge (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [SigmaCompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (EuclideanModel m) ∞ M] [IsManifold (EuclideanModel m) 1 M]
    [BoundarylessManifold (EuclideanModel m) M]
    (o : Manifold.Orientation (EuclideanModel m) M (Fin m))
    (c : CompactFundamentalClass m M Set.univ isCompact_univ o)
    (c' : CompactFundamentalClass m M
      (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)
      (by simpa using (isCompact_univ : IsCompact (Set.univ : Set M))) o)
    (η : SmoothForm (EuclideanModel m) M ℝ m) :
    ((absolutePairKronecker m M)
      (deRhamHom (EuclideanModel m) M m
        (deRhamCohomology.mk (EuclideanModel m) M m
          ⟨η, euclideanTopForm_closed m M η⟩))).hom
        (absoluteRealFundamentalClass m M o c) =
    relativeKronecker (⊥ : TopologicalSpace.Opens M) m
      (relativeDeRhamHom (EuclideanModel m) (⊥ : TopologicalSpace.Opens M) m
        (relativeDeRhamClassOfVanishing (EuclideanModel m) (⊥ : TopologicalSpace.Opens M)
          m η (euclideanTopForm_closed m M η) (by
            ext x
            exact False.elim x.property)))
      (((openManifoldPair (⊥ : TopologicalSpace.Opens M)).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) m).hom
        (by
          have hK : (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)ᶜ =
              ((⊥ : TopologicalSpace.Opens M) : Set M) := by
            ext x
            simp
          have hpair : TopPair.ofSubset (X := TopCat.of M)
                ((((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)ᶜ) =
              openManifoldPair (⊥ : TopologicalSpace.Opens M) := by
            change TopPair.ofSubset (X := TopCat.of M)
                ((((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)ᶜ) =
              TopPair.ofSubset (X := TopCat.of M) ((⊥ : TopologicalSpace.Opens M) : Set M)
            exact congrArg (TopPair.ofSubset (X := TopCat.of M)) hK
          exact hpair ▸ c'.realClass)) := by
  sorry

/-- Absolute compact-boundaryless DG9.3 identity. The proof proceeds by specializing the
relative theorem to the empty open set and applying the typed absolute/relative bridge above. -/
theorem absoluteFundamentalIntegration_positive (q : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [SigmaCompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin (q + 1))) M]
    [IsManifold (EuclideanModel (q + 1)) ∞ M] [IsManifold (EuclideanModel (q + 1)) 1 M]
    [BoundarylessManifold (EuclideanModel (q + 1)) M]
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (c : CompactFundamentalClass (q + 1) M Set.univ isCompact_univ o)
    (η : SmoothForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :
    ((absolutePairKronecker (q + 1) M)
      (deRhamHom (EuclideanModel (q + 1)) M (q + 1)
        (deRhamCohomology.mk (EuclideanModel (q + 1)) M (q + 1)
          ⟨η, euclideanTopForm_closed (q + 1) M η⟩))).hom
        (absoluteRealFundamentalClass (q + 1) M o c) = integralTopForm o η := by
  let c' : CompactFundamentalClass (q + 1) M
      (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)
      (by simpa using (isCompact_univ : IsCompact (Set.univ : Set M))) o := by
    simpa using c
  have hK : IsCompact (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ) := by
    simpa using (isCompact_univ : IsCompact (Set.univ : Set M))
  have hrel := relativeFundamentalIntegration q M (⊥ : TopologicalSpace.Opens M)
    o hK c' η (by
      ext x
      exact False.elim x.property)
  exact (absoluteKronecker_emptyPair_bridge (q + 1) M o c c' η).trans hrel

/-- The absolute degree-zero point-normalized case is composed from the dedicated relative
zero-dimensional evaluation theorem; it does not pass through a negative-degree boundary term. -/
theorem absoluteFundamentalIntegration_zero (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [SigmaCompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (EuclideanModel 0) ∞ M] [IsManifold (EuclideanModel 0) 1 M]
    [BoundarylessManifold (EuclideanModel 0) M]
    (o : Manifold.Orientation (EuclideanModel 0) M (Fin 0))
    (c : CompactFundamentalClass 0 M Set.univ isCompact_univ o)
    (η : SmoothForm (EuclideanModel 0) M ℝ 0) :
    ((absolutePairKronecker 0 M)
      (deRhamHom (EuclideanModel 0) M 0
        (deRhamCohomology.mk (EuclideanModel 0) M 0
          ⟨η, euclideanTopForm_closed 0 M η⟩))).hom
        (absoluteRealFundamentalClass 0 M o c) = integralTopForm o η := by
  let c' : CompactFundamentalClass 0 M
      (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ)
      (by simpa using (isCompact_univ : IsCompact (Set.univ : Set M))) o := by
    simpa using c
  have hK : IsCompact (((⊥ : TopologicalSpace.Opens M) : Set M)ᶜ) := by
    simpa using (isCompact_univ : IsCompact (Set.univ : Set M))
  have hrel := relativeFundamentalIntegration_zero (M := M)
    (⊥ : TopologicalSpace.Opens M) o hK c' η (by
      ext x
      exact False.elim x.property)
  exact (absoluteKronecker_emptyPair_bridge 0 M o c c' η).trans hrel

end TauCetiRoadmap.DifferentialGeometry.CompactIntegration
end
