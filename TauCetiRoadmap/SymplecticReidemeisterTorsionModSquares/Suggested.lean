import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic

/-!
# Symplectic Reidemeister torsion mod squares: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

Zassenhaus's full primary-decomposition formula is statable here. The remaining
headlines are not statable at the pins:
* strict splitting and locally constant semicharacteristic parity lack the signed
  Poincare-complex carrier;
* boundary torsion, normal-domain extension and normalized specialization lack
  signed cellular torsion and determinant root-line comparisons;
* labelled oriented bordism in degrees at most three lacks labelled smooth bordism;
* evenness of three-dimensional symplectic semicharacteristic lacks the twisted
  finite cellular manifold complex and its duality;
* the circle, mapping-torus and Gaussian torsion formulas lack that torsion carrier;
* liftable-rank, transfer and density-one goodness lack the Chern slant and
  normalized torsion transformations;
* universal torsion/Chern equality, its topological theorem and the mapping-class
  identity lack universal equivariant etale slant and signed torsion;
* the real metaplectic-component identification and full mod-two Chern vanishing
  lack the real Chern components and their Bockstein comparison.

No auxiliary predicate substitutes for any missing object.
-/

namespace TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares

/-! ## Layer 4: circle torsion and mapping tori -/

/-- Zassenhaus's formula over every field with two invertible. The nilpotent
primary summand is the stable kernel of `A + 1`; its unsigned Gram determinant
uses the associated bilinear form, whose diagonal is `Q`. The complementary
factor is the determinant of `(A + 1) / 2` on the stable image. A basis change
multiplies the scalar by a square. Jouve--Rodriguez Villegas, arXiv v3,
Theorem 5.1 and equation (5.1), pp. 16--17. -/
theorem zassenhaus_primary_formula
    {K V : Type*} [Field K] [Invertible (2 : K)]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (A : TauCeti.QuadraticMap.orthogonalGroup Q) :
    let t : Module.End K V := A.val.toLinearMap + LinearMap.id
    let Vminus := LinearMap.ker (t ^ Module.finrank K V)
    let U := LinearMap.range (t ^ Module.finrank K V)
    ∀ (b : Module.Basis (Fin (Module.finrank K Vminus)) K Vminus)
      (hU : ∀ x ∈ U, t x ∈ U),
    let D := Matrix.det (fun i j => Q.associated (b i : V) (b j : V)) *
      LinearMap.det ((2 : K)⁻¹ • t.restrict hU)
    ∃ hD : D ≠ 0,
      CliffordAlgebra.orthogonalSpinorNorm Q hQ A =
        TauCeti.squareClassHom (Units.mk0 D hD) := by
  sorry

end TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares
