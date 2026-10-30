import Mathlib.Geometry.Manifold.Instances.Sphere
import Mathlib.Geometry.Manifold.ContMDiffMap
import TauCeti.AlgebraicTopology.Cohomology.Basic

/-!
# Transverse homology representatives: suggested classifying-map target

This file is not the roadmap and is not exhaustive. `README.md`, Stage 8.13,
is definitive. The statement below checks the integral codimension-one classifying map
and its regular fibre; the README also specifies the embedded representative, normal bundle,
fundamental-class comparison and real/complex projective constructions.
-/

open scoped Manifold ContDiff

namespace TauCetiRoadmap.AlgebraicTopology.TransverseRepresentatives

open CategoryTheory

/-- Native integral singular cohomology with the coefficient module in both slots. -/
noncomputable abbrev integralCohomology (X : TopCat) (n : ℕ) :=
  X.singularCohomology (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) n

variable {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
  [I.Boundaryless] [T2Space M] [SecondCountableTopology M] [CompactSpace M]

/-- For any generator of H¹(Circle;ℤ), every integral degree-one class has a smooth
classifying map transverse to 1. The README selects the generator with positive winding.
The inverse image theorem and Thom comparison turn this map into the actual representative. -/
theorem exists_transverse_circle_classifying_map
    (b : Module.Basis (Fin 1) ℤ (integralCohomology (TopCat.of Circle) 1))
    (a : integralCohomology (TopCat.of M) 1) :
    ∃ f : C^∞⟮I, M; 𝓡 1, Circle⟯,
      (TopCat.singularCohomologyMap (R := ModuleCat.of ℤ ℤ) (k := ℤ)
        (M := ModuleCat.of ℤ ℤ) (TopCat.ofHom ⟨f, f.contMDiff.continuous⟩) 1) (b 0) = a ∧
      ∀ x : M, f x = 1 → Function.Surjective (mfderiv I (𝓡 1) f x) := by
  sorry

end TauCetiRoadmap.AlgebraicTopology.TransverseRepresentatives
