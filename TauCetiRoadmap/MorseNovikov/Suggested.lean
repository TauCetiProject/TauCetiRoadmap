module

public import Mathlib

/-!
# Morse–Novikov homology and dynamical Reidemeister torsion: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the nondegenerate Lefschetz fixed-point
formula and the nondegenerate vector-field Poincaré–Hopf theorem.

Several algebraic headlines are proved at the pinned Tau Ceti and are consumed,
not restated: Layer 1's completion `TauCeti.NovikovSeries`, its universal property
`TauCeti.NovikovSeries.completionPkg`, its functoriality `TauCeti.NovikovSeries.mapRingHom`
and its domain theorem `TauCeti.NovikovSeries.isDomain_of_fg`; Layer 4's based torsion
`HomologicalComplex.reidemeisterTorsion` with its basis-change law
`HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det_toMatrix`, its homology-basis form
`HomologicalComplex.reidemeisterTorsionWithHomology` and its componentwise form
`HomologicalComplex.componentwiseReidemeisterTorsion`; and Layer 5's integral product
formula `TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct` for the algebraic
orbit zeta function `TauCeti.NovikovSeries.orbitZeta`.

The remaining headlines are not statable at these pins. Layer 3's comparison of Novikov
homology with completed cellular homology, its top-degree vanishing and Layer 4's Novikov
inequalities lack Novikov homology of a closed one-form: the pins have no complex built
from signed trajectory counts of a closed one-form on an abelian cover. Layer 5's flow
zeta function and cover-norm theorem lack the periodic-orbit data of a closed one-form:
the deck classes of the closed orbits of its negative dual flow and their return-map
signs. Layer 6's dynamical torsion invariance and its equality with cellular torsion lack
both carriers, and the mapping-torus formula for the flow zeta function lacks the
periodic-orbit data. The cellular torsion formulas for the mapping torus and the zero surgery
lack a based cellular torsion of an abelian cover of a finite CW complex: the pinned
equivariant cellular chains `TauCeti.cellularChainComplexRep` and the componentwise torsion
`HomologicalComplex.componentwiseReidemeisterTorsion` are not joined by a basis of lifted
cells and a scalar extension to the total quotient ring. The zero-surgery formula lacks, in
addition, the Alexander polynomial of a knot in the 3-sphere: the pinned
`TauCeti.KnotTheory.alexander` is defined on a Seifert matrix, and no pinned declaration
produces a Seifert matrix from a knot. Layer 7's refined equality lacks both carriers of
Layer 6 and, in addition, the Euler-structure torsor. None is replaced by admitted data.
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
