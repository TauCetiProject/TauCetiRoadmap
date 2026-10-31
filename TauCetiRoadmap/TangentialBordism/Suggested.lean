import Mathlib
import TauCeti.Geometry.Manifold.Orientation

/-!
# Tangential bordism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, smooth oriented three-manifold parallelization (Layer 8, B3.1).
The finite quadratic algebra consumed by Layer 1 is specified in GeometricTopology.
Parallelization uses native tangent bundles and a chosen native oriented atlas.

The other headline theorems are not statable at the pins:
- the geometric bordism groups `Ω^O_n(X,A)`, `Ω^SO_n(X,A)`, `Ω^Spin_n(X,A)` and their low
  tables (B2, B3.1–B3.4), Thom's ring `ΩO_* ≃ F2[x_d]` (B4.6) and Wall's presentation of
  `ΩSO_*` (B6.2): Mathlib's `SingularManifold` has no bordism relation or quotient group;
- the Pontryagin–Thom isomorphism `Ω^ξ_n(X,A) ≃ π_n(Mξ ∧ Σ∞(X/A))` (B5.4c) and the stable
  framed isomorphism (B5.5): there are no Thom spectra or stable homotopy groups of spectra;
- `H*(MO;F2)`, the Steenrod algebras and Adams convergence (B4.1–B4.8): there are no Steenrod
  operations on singular cohomology;
- the ABS genus and its Dirac comparison (B3.0), Rokhlin-type consequences (B3.4) and the
  transfer kernel `ker(ΩSpin_n → KO_n) = im(ΩSpin_(n−8)(BPSp3) → ΩSpin_n)` (B6.6): there is
  no `KO` spectrum;
- the integral realization range and its degree-seven counterexample (B6.3), and the
  unoriented/oriented projective-transfer image theorems (B6.5): there are no geometric
  bordism groups, bordism orientation maps or associated-family transfer maps;
- the Cayley-plane theorems (B3.6–B3.9): the compact Albert algebra is not at the pins.
-/

namespace TauCetiRoadmap.TangentialBordism

/- The finite-F₂ Arf algebra is a prerequisite from GeometricTopology;
its constructors and theorem targets are specified there. -/

/-! ## Layer 8: smooth oriented three-manifold parallelization -/

open scoped Manifold ContDiff

/-- Every Hausdorff second-countable smooth oriented three-manifold, allowing boundary,
has a positive tangent frame whose associated bundle map and inverse are smooth.
Positivity is measured in every chart of the chosen oriented atlas. No compactness or
connectedness hypothesis is imposed. -/
theorem orientedThreeManifold_parallelization
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanHalfSpace 3) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M]
    (A : Set (OpenPartialHomeomorph M (EuclideanHalfSpace 3)))
    (hA : TauCeti.IsOrientedAtlas (modelWithCornersEuclideanHalfSpace 3) ∞ A) :
    ∃ b : (x : M) → Module.Basis (Fin 3) ℝ
        (TangentSpace (modelWithCornersEuclideanHalfSpace 3) x),
      (∀ e ∈ A, ∀ x ∈ e.source,
        0 < Matrix.det (fun i j : Fin 3 ↦
          WithLp.ofLp (mfderiv (modelWithCornersEuclideanHalfSpace 3)
            (modelWithCornersEuclideanHalfSpace 3) e x (b x j)) i)) ∧
      ContMDiff ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ))
        (modelWithCornersEuclideanHalfSpace 3).tangent ∞
        (fun p : M × (Fin 3 → ℝ) ↦
          (⟨p.1, (b p.1).equivFun.symm p.2⟩ :
            TangentBundle (modelWithCornersEuclideanHalfSpace 3) M)) ∧
      ContMDiff (modelWithCornersEuclideanHalfSpace 3).tangent
        ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ)) ∞
        (fun v : TangentBundle (modelWithCornersEuclideanHalfSpace 3) M ↦
          (v.proj, (b v.proj).equivFun v.2)) := by
  sorry

end TauCetiRoadmap.TangentialBordism
