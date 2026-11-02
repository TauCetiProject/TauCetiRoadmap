module

public import Mathlib

/-!
# Morse–Novikov homology and dynamical Reidemeister torsion: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the nondegenerate Lefschetz fixed-point
formula and the nondegenerate vector-field Poincaré–Hopf theorem.

The remaining headlines are not statable at these pins without substantial new
constructions. Layer 1's completion and universal property lack the period-controlled
completed group ring and topology. Layer 2's compactification and gluing lack the
closed-one-form cutoff trajectory spaces. Layer 3's continuation, completed cellular
comparison and top-degree vanishing lack the Novikov complex
and controlled cellular/singular chain models. Layer 4's Novikov inequalities, torsion decomposition and
transformation laws lack the based determinant-line torsion construction and the
Novikov ring. Layer 5's integral zeta product and cover-norm theorem lack the periodic
orbit counting series and its completion. Layer 6's dynamical torsion invariance,
cellular equality and mapping-torus/knot-surgery torsion formulas lack these torsion
and zeta carriers; the continuous fixed-point-index strengthening also lacks its
local index construction. Layer 7's Euler-refined equality lacks the Euler-structure
torsor and its determinant-volume normalization. None is replaced by admitted data.
-/

@[expose] public section

noncomputable section
open CategoryTheory
open scoped Manifold ContDiff BigOperators

namespace TauCetiRoadmap.MorseNovikov

/-! ## Layer 6: Lefschetz fixed-point formula -/

/-- The tangent endomorphism of a self-map at a fixed point, using the fixed-point
identity to identify the target tangent space with the source. -/
def fixedPointDerivative {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [ChartedSpace H M] (f : M → M) (x : {x // f x = x}) :
    TangentSpace I x.1 →ₗ[ℝ] TangentSpace I x.1 :=
  (x.2 ▸ mfderiv I I f x.1).toLinearMap

/-- The endomorphism on degree-i rational singular homology induced by a continuous
self-map, obtained from the native singular-homology functor. -/
def rationalHomologyMap {M : Type} [TopologicalSpace M] (f : C(M, M)) (i : ℕ) :=
  (((AlgebraicTopology.singularHomologyFunctor.{0} (ModuleCat.{0} ℚ) i).obj
    (ModuleCat.of.{0} ℚ ℚ)).map (TopCat.ofHom f)).hom

/-- On a closed smooth manifold, without an orientability or connectedness assumption,
the sum of the signs of det(1-df) at nondegenerate fixed points equals the alternating
trace on rational singular homology. Compactness and nondegeneracy make the sum finite. -/
theorem lefschetz_fixed_point_formula {E H M : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H) [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    (f : M → M) (hf : ContMDiff I I ∞ f)
    (hnd : ∀ x : {x // f x = x},
      (LinearMap.id - fixedPointDerivative I f x).det ≠ 0) :
    (∑ᶠ x : {x // f x = x},
      if 0 < (LinearMap.id - fixedPointDerivative I f x).det then (1 : ℚ) else -1) =
    ∑ i ∈ Finset.range (Module.finrank ℝ E + 1),
      (-1 : ℚ) ^ i * LinearMap.trace ℚ _ (rationalHomologyMap ⟨f, hf.continuous⟩ i) := by
  sorry

/-! ## Layer 7: Vector-field Poincaré–Hopf theorem -/

/-- The derivative of a vector field in the extended chart at x. At a zero of a smooth
field on a finite-dimensional boundaryless manifold, its determinant sign is independent of the chart. -/
def vectorFieldChartDerivative {E H M : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [ChartedSpace H M]
    (V : (x : M) → TangentSpace I x) (x : M) : E →ₗ[ℝ] E :=
  (fderiv ℝ (VectorField.mpullback 𝓘(ℝ, E) I (extChartAt I x).symm V)
    (extChartAt I x x)).toLinearMap

/-- For a smooth vector field with nondegenerate zeros on a closed smooth manifold,
the signed zero count is the Euler characteristic, expressed by rational Betti numbers.
No orientation, connectedness or Euler-characteristic-zero hypothesis is required. -/
theorem poincare_hopf {E H M : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H) [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    (V : (x : M) → TangentSpace I x)
    (hV : ContMDiff I I.tangent ∞ (fun x ↦ (V x : TangentBundle I M)))
    (hnd : ∀ x : M, V x = 0 → (vectorFieldChartDerivative I V x).det ≠ 0) :
    (∑ᶠ x : {x // V x = 0},
      if 0 < (vectorFieldChartDerivative I V x.1).det then (1 : ℚ) else -1) =
    ∑ i ∈ Finset.range (Module.finrank ℝ E + 1),
      (-1 : ℚ) ^ i *
        (Module.finrank ℚ (((AlgebraicTopology.singularHomologyFunctor.{0}
          (ModuleCat.{0} ℚ) i).obj (ModuleCat.of.{0} ℚ ℚ)).obj (TopCat.of M)) : ℚ) := by
  sorry

end TauCetiRoadmap.MorseNovikov
