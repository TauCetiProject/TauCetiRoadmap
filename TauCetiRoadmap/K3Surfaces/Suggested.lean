import Mathlib
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Operations
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Basic

/-!
# K3 surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: algebraic differential/vector-field
vanishing, the unirationality of a K3 surface with a nonzero vector field in every
positive characteristic, Picard number 22 for unirational K3 surfaces in every
characteristic, and integral extension through the discriminant gluing graph.

The remaining headlines cannot yet be stated on their geometric carriers:
* Kählerness, the Hodge diamond, integral (1,1) and projectivity comparisons need
  coherent analytic sheaves and their comparison with the complex manifold.
  The exact Picard segment of Layer 1 likewise needs the holomorphic
  line-bundle and structure-sheaf carriers on a general complex manifold.
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

universe u

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

/-- The unirationality reduction (U): over an algebraically closed field of characteristic
p > 0, p = 2 included, a K3 surface with a nonzero global vector field admits a dominant
rational k-map from the affine plane, equivalently from the projective plane
(Rudakov–Šafarevič 1976, §2, Theorem 5 and Corollary 1; Huybrechts, Proposition 9.4.6). -/
theorem unirational_of_nontrivial_vectorField
    (k : Type u) [Field k] [IsAlgClosed k] (p : ℕ) (hp : p.Prime) [CharP k p]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] (hX : IsAlgebraicK3 k X)
    (hD : Nontrivial (X.relativeDifferentials k ⟶ SheafOfModules.unit X.ringCatSheaf)) :
    ∃ f : 𝔸(ULift.{u} (Fin 2); Spec (.of k)) ⤏ X, f.IsOver (Spec (.of k)) ∧ f.IsDominant := by
  sorry

/-- A unirational K3 surface over an algebraically closed field of any characteristic has
Picard number 22. For a K3 surface Pic = NS = Num, so the Picard number is the ℤ-rank of the
group of line-bundle classes (Huybrechts, Propositions 17.2.7 and 1.2.4). -/
theorem finrank_lineBundleClass_eq_twentyTwo_of_unirational
    (k : Type u) [Field k] [IsAlgClosed k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] (hX : IsAlgebraicK3 k X)
    (hU : ∃ f : 𝔸(ULift.{u} (Fin 2); Spec (.of k)) ⤏ X,
      f.IsOver (Spec (.of k)) ∧ f.IsDominant) :
    Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) = 22 := by
  sorry

/-! ## Layer 7: Integral involutions and gluing -/

open TauCeti

/-- Let `S` and `T` be nondegenerate even lattices, `γ` an isometry from the discriminant
quadratic form of `S` to the negative of that of `T`, and `L` the graph-glued overlattice: the
lattice on `V × W` with the orthogonal-sum form whose carrier is the inverse image in the dual of
the graph of `γ`. The two hypotheses on `L` determine it; it is the lattice Tau Ceti builds as
`glueAlongDiscriminant`. A pair of integral isometries `g` of `S` and `h` of `T` extends to an
integral isometry of `L`, necessarily uniquely, exactly when the induced discriminant actions
commute with `γ` (Gritsenko–Hulek, §2, p.4; Huybrechts, §14.0.3(vii), p.284 for the K3
model). -/
theorem gluing_isometry_extension_iff
    {V W : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (S : IntegralLattice V) (T : IntegralLattice W)
    [S.IsNondegenerate] [T.IsNondegenerate] (hS : S.IsEven) (hT : T.IsEven)
    (γ : FiniteQuadraticModule.Isometry (S.discriminantQuadraticModule hS)
      (T.discriminantQuadraticModule hT).neg)
    (L : IntegralLattice (V × W)) (hform : L.form = (S.orthogonalSum T).form)
    (hcarrier : L.carrier =
      ((S.orthogonalSum T).intermediateCarrierOfDiscriminantSubgroup
        (γ.toAddEquiv.toAddMonoidHom.graph.comap
          (S.discriminantGroupOrthogonalSumEquiv T).toAddMonoidHom) : Submodule ℤ (V × W)))
    (g : S.Isometry S) (h : T.Isometry T) :
    (∃! F : L.Isometry L, ∀ v w, F (v, w) = (g v, h w)) ↔
      ∀ a, γ (g.discriminantGroupEquiv a) = h.discriminantGroupEquiv (γ a) := by
  sorry

end TauCetiRoadmap.K3Surfaces
