import Mathlib
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Graph
import TauCeti.LinearAlgebra.IntegralLattice.Examples
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeE.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.OrthogonalGroup

/-!
# K3 surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: algebraic differential/vector-field
vanishing, the unirationality of a K3 surface with a nonzero vector field in every
positive characteristic, Picard number 22 for unirational K3 surfaces in every
characteristic, integral extension through the discriminant gluing graph, and the
surjectivity of `O(S) → O(q_S)` for the invariant lattice `S ≃ U(2) ⊕ E₈(−2)` of the
K3 model.

The remaining headlines cannot yet be stated on their geometric carriers:
* Kählerness, the Hodge diamond, integral (1,1) and projectivity comparisons need
  coherent analytic sheaves and their comparison with the complex manifold.
  The Layer 1 embedding of holomorphic line-bundle classes into `H²(X, ℤ)` for a
  compact complex surface with `H¹(X, O_X) = 0` needs the group of holomorphic
  line-bundle classes and their integral first Chern class, neither of which is pinned.
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

/-! ## Layer 0: Algebraic surfaces and the early differential theorem -/

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

/-! ## Layer 7: Integral involutions and free quotients -/

open TauCeti

/-- Let `S` and `T` be nondegenerate even lattices, `γ` an isometry from the discriminant
quadratic form of `S` to the negative of that of `T`, and `S.glueAlongDiscriminant T hS hT γ`
the graph-glued even unimodular overlattice of `S ⊕ T`: the lattice on `V × W` with the
orthogonal-sum form whose carrier is the inverse image in the dual of the graph of `γ`. A pair
of integral isometries `g` of `S` and `h` of `T` extends to an integral isometry of the glued
lattice, necessarily uniquely, exactly when the induced discriminant actions commute with `γ`
(Huybrechts, Lemma 14.2.5 and Proposition 14.2.6, pp.291–292; Huybrechts, §14.0.3(vii),
p.284 for the K3 model). -/
theorem gluing_isometry_extension_iff
    {V W : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (S : IntegralLattice V) (T : IntegralLattice W)
    [S.IsNondegenerate] [T.IsNondegenerate] (hS : S.IsEven) (hT : T.IsEven)
    (γ : FiniteQuadraticModule.Isometry (S.discriminantQuadraticModule hS)
      (T.discriminantQuadraticModule hT).neg)
    (g : S.Isometry S) (h : T.Isometry T) :
    (∃! F : (S.glueAlongDiscriminant T hS hT γ).Isometry (S.glueAlongDiscriminant T hS hT γ),
        ∀ v w, F (v, w) = (g v, h w)) ↔
      ∀ a, γ (g.discriminantGroupEquiv a) = h.discriminantGroupEquiv (γ a) := by
  sorry

/-- Let `M = U ⊕ E₈(−1)` be the orthogonal sum of the hyperbolic plane and the negated `E₈`
root lattice, so that `(2 : ℤ) • M = U(2) ⊕ E₈(−2)` is the invariant lattice of the K3 model.
For every nondegenerate even lattice `S` with an integral isometry onto `M(2)`, every isometry
of the discriminant quadratic form of `S` is induced by an integral isometry of `S`: the map
`O(S) → O(q_S)` is surjective (Gritsenko–Hulek, §2, p.3, from Nikulin's Theorem 3.6.3; the
route reduces modulo two and uses the generation of the orthogonal group of a nonsingular
quadratic space in characteristic two by orthogonal transvections, Hunnell–Hutchens–Schwartz,
§3, p.6). -/
theorem discriminantOrthogonalHom_surjective_of_isometry_scale_two
    {V : Type*} [AddCommGroup V] [Module ℚ V] (S : IntegralLattice V) [S.IsNondegenerate]
    (hS : S.IsEven)
    (e : S.Isometry ((2 : ℤ) •
      IntegralLattice.hyperbolicPlane.orthogonalSum (-IntegralLattice.typeE₈RootLattice))) :
    Function.Surjective (IntegralLattice.Isometry.discriminantOrthogonalHom S hS) := by
  sorry

end TauCetiRoadmap.K3Surfaces
