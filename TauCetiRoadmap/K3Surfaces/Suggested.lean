import Mathlib
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Operations
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Basic

/-!
# K3 surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: algebraic differential/vector-field
vanishing and integral extension through the discriminant gluing graph.

The remaining headlines cannot yet be stated on their geometric carriers:
* Kählerness, the Hodge diamond, integral (1,1) and projectivity comparisons need
  coherent analytic sheaves and their comparison with the complex manifold.
  The holomorphic frame-torsor comparison in Layer 1 likewise needs the
  holomorphic line-bundle and structure-sheaf carriers on a general complex manifold.
* Ricci-flat existence/uniqueness, simple connectivity and the geometric K3 lattice
  need Kähler classes, Ricci curvature and the singular cup lattice of that manifold.
* The 20-dimensional and polarized 19-dimensional deformation theorems need actual
  proper analytic families, their deformation functors and relative line bundles.
* Local Torelli, twistor realization, global period surjectivity, strong Torelli,
  monodromy and the full cone/polarized period-image theorems need those families,
  the geometric period map and its integral marking and Kähler-cone comparisons.
* Free-involution realization, fixed-locus classification, the root-complement period image and the nodal
  divisor need geometric involutions on analytic K3 surfaces and their quotient
  and period constructions. The abstract gluing theorem below does not assert them.
-/

namespace TauCetiRoadmap.K3Surfaces

open CategoryTheory AlgebraicGeometry

/-! ## Layer 0: Algebraic surfaces and differential vanishing -/

/-- An algebraic K3 over an algebraically closed field: a smooth proper geometrically
integral surface with trivial canonical sheaf and vanishing first structure-sheaf
cohomology. Smooth proper surfaces over a field are projective. -/
def IsAlgebraicK3 (k : Type*) [Field k] [IsAlgClosed k] (X : Scheme) [X.Over (Spec (.of k))] : Prop :=
  SmoothOfRelativeDimension 2 (X ↘ Spec (.of k)) ∧
  IsProper (X ↘ Spec (.of k)) ∧ GeometricallyIntegral (X ↘ Spec (.of k)) ∧
  Nonempty ((SheafOfModules.exteriorPower X.sheaf 2).obj (X.relativeDifferentials k) ≅
    SheafOfModules.unit X.ringCatSheaf) ∧
  Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (SheafOfModules.unit X.ringCatSheaf) 1)

/-- A K3 over an algebraically closed field of characteristic greater than two
has no global regular one-forms or vector fields (Martin, Corollary 1.1,
with contraction by a nowhere-zero two-form). -/
theorem algebraicK3_differential_vanishing
    (k : Type*) [Field k] [IsAlgClosed k] (p : ℕ) [CharP k p] (hp : 2 < p)
    (X : Scheme) [X.Over (Spec (.of k))] (hX : IsAlgebraicK3 k X) :
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (X.relativeDifferentials k) 0) ∧
    Subsingleton (X.relativeDifferentials k ⟶ SheafOfModules.unit X.ringCatSheaf) := by
  sorry

/-! ## Layer 7: Integral involutions and gluing -/

open TauCeti

/-- The graph of a discriminant-group identification, transported to the
native discriminant group of the orthogonal sum. -/
def discriminantGraph {V W : Type*} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W] (S : IntegralLattice V) (T : IntegralLattice W)
    (γ : S.DiscriminantGroup ≃ₗ[ℤ] T.DiscriminantGroup) :
    AddSubgroup (S.orthogonalSum T).DiscriminantGroup :=
  (γ.toLinearMap.graph.comap (S.discriminantGroupOrthogonalSumEquiv T).toLinearMap).toAddSubgroup

/-- For nondegenerate even lattices glued along a discriminant anti-isometry,
a pair of integral isometries extends uniquely to the graph overlattice exactly
when the induced discriminant actions commute with the gluing identification.
The carrier equation fixes the actual integral overlattice, not only its rank. -/
theorem gluing_isometry_extension_iff
    {V W : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (S : IntegralLattice V) (T : IntegralLattice W)
    [S.IsNondegenerate] [T.IsNondegenerate] (hS : S.IsEven) (hT : T.IsEven)
    (γ : S.DiscriminantGroup ≃ₗ[ℤ] T.DiscriminantGroup)
    (hγ : ∀ a, T.discriminantQuadraticMap hT (γ a) = -S.discriminantQuadraticMap hS a)
    (L : IntegralLattice (V × W))
    (hform : L.form = (S.orthogonalSum T).form)
    (hcarrier : L.carrier =
      ((S.orthogonalSum T).intermediateCarrierOfDiscriminantSubgroup
        (discriminantGraph S T γ) : Submodule ℤ (V × W)))
    (g : S.Isometry S) (h : T.Isometry T) :
    (∃! F : L.Isometry L, ∀ v w, F (v, w) = (g v, h w)) ↔
      ∀ a, γ (g.discriminantGroupEquiv a) = h.discriminantGroupEquiv (γ a) := by
  sorry

end TauCetiRoadmap.K3Surfaces
