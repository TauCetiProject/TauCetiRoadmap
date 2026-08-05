import Mathlib

/-!
# Geodesics, the exponential map, and Hopf-Rinow: target signatures

This file is not the roadmap and is not exhaustive. The definitive document is `README.md`.
The statements here suggest Lean forms for a few milestones; they are intentionally schematic and
do not commit Tau Ceti to a full geodesic API yet.
-/

namespace TauCetiRoadmap.HopfRinow

open Set
open scoped Bundle Manifold

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- Suggested shape for geodesic completeness, parametrised by the eventual intrinsic geodesic
predicate so this roadmap does not freeze the implementation API too early. -/
def IsGeodesicallyComplete (IsGeodesic : (ℝ → M) → Prop) : Prop :=
  ∀ p : M, ∀ _v : TangentSpace I p, ∃ γ : ℝ → M, γ 0 = p ∧ IsGeodesic γ

/-- Suggested shape for condition (a): the exponential map at `p` is defined on the whole tangent
space. The domain is a parameter until the exponential-map API exists. -/
def ExpEverywhereAt (expDomain : (p : M) → Set (TangentSpace I p)) (p : M) : Prop :=
  expDomain p = univ

/-- Suggested shape for Hopf-Rinow's minimizing-geodesic conclusion. -/
def HasLengthMinimizingGeodesicsFrom (IsGeodesic : (ℝ → M) → Prop) (p : M) : Prop :=
  ∀ q : M, ∃ γ : ℝ → M, γ 0 = p ∧ γ 1 = q ∧ IsGeodesic γ ∧
    Manifold.pathELength I γ 0 1 = ENNReal.ofReal (dist p q)

/-- Layer 1/3 target: metric completeness and geodesic completeness agree for the Riemannian
distance. -/
theorem completeSpace_iff_isGeodesicallyComplete
    (IsGeodesic : (ℝ → M) → Prop) [ConnectedSpace M] [IsRiemannianManifold I M] :
    CompleteSpace M ↔ IsGeodesicallyComplete (I := I) IsGeodesic := by
  sorry

/-- Layer 3 target: the classical Hopf-Rinow equivalence at a base point, plus the minimizing
geodesic conclusion. -/
theorem hopfRinow
    (IsGeodesic : (ℝ → M) → Prop) (expDomain : (p : M) → Set (TangentSpace I p))
    [ConnectedSpace M] [IsRiemannianManifold I M] (p : M) :
    List.TFAE
      [ExpEverywhereAt (I := I) expDomain p,
       ProperSpace M,
       CompleteSpace M,
       IsGeodesicallyComplete (I := I) IsGeodesic] ∧
      (ExpEverywhereAt (I := I) expDomain p →
        ∀ q : M, ∃ γ : ℝ → M, γ 0 = p ∧ γ 1 = q ∧ IsGeodesic γ ∧
          Manifold.pathELength I γ 0 1 = ENNReal.ofReal (dist p q)) := by
  sorry

/-- Layer 4 target: do Carmo, Corollary 2.9. -/
theorem isGeodesicallyComplete_of_compactSpace
    (IsGeodesic : (ℝ → M) → Prop) [CompactSpace M] [IsRiemannianManifold I M] :
    IsGeodesicallyComplete (I := I) IsGeodesic := by
  sorry

end TauCetiRoadmap.HopfRinow
