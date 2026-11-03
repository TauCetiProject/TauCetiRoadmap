import Mathlib
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Equivalence
import TauCeti.CategoryTheory.Exact.Resolution.Comparison
import TauCeti.CategoryTheory.Exact.Resolution.Horseshoe
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.CategoryTheory.GrothendieckGroup.Abelian
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated
import TauCeti.CategoryTheory.GrothendieckGroup.BoundedHomotopy
import TauCeti.CategoryTheory.GrothendieckGroup.Derived
import TauCeti.CategoryTheory.GrothendieckGroup.EulerCharacteristic
import TauCeti.CategoryTheory.GrothendieckGroup.Resolving
import TauCeti.CategoryTheory.GrothendieckGroup.Graded
import TauCeti.CategoryTheory.GrothendieckGroup.Laurent.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Laurent.Resolving
import TauCeti.CategoryTheory.GrothendieckGroup.ForgetGrading
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace
import TauCeti.Algebra.Module.GradedModule.Resolution
import TauCeti.Algebra.Category.GradedModuleCat.LinearResolution
import TauCeti.Algebra.Category.GradedModuleCat.CartanMap.Specialization
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Descent
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.DualNumbers
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Numerical
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.Descent
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.Sesquilinear
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.ForgetGrading
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.GradedVectorSpace
import TauCeti.RepresentationTheory.GrothendieckGroup.CartanMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.UnimodularCartanMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.ExtEulerMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.DualNumbers
import TauCeti.RepresentationTheory.GrothendieckGroup.Quiver.ExtEuler
import TauCeti.RepresentationTheory.Quiver.E8.ExtEuler
import TauCeti.RepresentationTheory.Quiver.PathAlgebra.Grading

/-!
# Grothendieck groups, Cartan maps, and Euler forms: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, so that the kernel checks what the
prose claims.

Every categorical carrier of the roadmap is a pinned Tau Ceti declaration: `TauCeti.ExactStructure`
(Bühler's E0--E2 and their duals on a `TauCeti.ConflationClass`, whose conflations are short
complexes), the Grothendieck groups `TauCeti.SplitK0`, `TauCeti.ExactK0`, `TauCeti.AbelianK0`,
`TauCeti.TriangulatedK0` and `TauCeti.LaurentK0`, the graded exact structures
`TauCeti.GradedExactStructure`, Euler admissibility `TauCeti.IsEulerAdmissible`, the Ext-Euler
characteristic `TauCeti.extEuler` and its graded form `TauCeti.gradedExtEuler`. No private copy of
any of them is declared here. The two names `ExactStructure` and `ExactStructure.Conflation` below
are abbreviations of the native structure and of its conflation predicate written on a composable
pair; they exist because a consumer of this module spells conflations that way, and they add
nothing to the native carrier.

Each headline theorem of the roadmap is a theorem of the pinned library. The sections below name
them layer by layer and pin each with `#check`, so that a pin whose statement moves or disappears
breaks this file. Realized at the pin:

* Layer 0: the split and canonical abelian exact structures (`TauCeti.ExactStructure.split`,
  `TauCeti.ExactStructure.abelian`); conflation-exactness for the canonical abelian structures is
  Mathlib's exactness (`TauCeti.ExactStructure.isConflationExact_abelian_iff`); an autoequivalence
  has conflation-exact inverse exactly when it reflects conflations
  (`TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations`).
* Layers 1--2: the universal property of exact `K₀` (`TauCeti.ExactK0.liftEquiv`), its
  functoriality and biadditive descent (`TauCeti.ExactK0.map`,
  `TauCeti.ExactK0.BiadditiveInvariant.bilift`), the comparison of split `K₀` with Mathlib's group
  completion (`TauCeti.SplitK0.grothendieckAddGroupEquiv`), the triangulated sign
  `[X[n]] = (-1)^n [X]` (`TauCeti.TriangulatedK0.of_shift`), the bounded-homotopy and
  bounded-derived comparisons (`TauCeti.SplitK0.boundedHomotopyEquiv`,
  `TauCeti.AbelianK0.boundedDerivedK0Equiv`, `TauCeti.TriangulatedK0.of_eq_sum_homology`), and
  the shift equivalence of graded exact `K₀` (`TauCeti.GradedExactStructure.shiftEquiv`).
* Layer 3: the resolution theorem with its alternating-class inverse
  (`TauCeti.ExactStructure.IsResolving.resolutionEquiv`,
  `TauCeti.ExactStructure.IsResolving.eulerHom`), the comparison theorem and horseshoe lemma for
  finite projective resolutions (`TauCeti.ExactStructure.FiniteResolution.lift`,
  `TauCeti.ExactStructure.FiniteResolution.horseshoe`), the graded resolution theorem and its
  compatibility with forgetting the grading
  (`TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv`,
  `TauCeti.GradedExactStructure.IsResolving.forgetGrading_laurentResolutionEquiv`), and for
  linear graded resolutions the forward direction of the diagonal criterion, that a linear
  resolution forces the bigraded Ext against a target concentrated in one internal degree to
  vanish off the diagonal, together with minimality over a nonnegatively graded algebra
  (`TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne`,
  `TauCeti.GradedProjectiveResolution.IsLinear.isMinimal`). Only that direction is at the pin:
  the converse of Layer 3, that a minimal graded projective resolution with bounded-below terms
  over a nonnegatively graded algebra with semisimple degree-zero part is linear once the
  bigraded Ext against the degree-zero quotient vanishes off the diagonal, is a target of the
  README and is not stated here.
* Layer 4: the Cartan map and its bijectivity under finite projective resolutions
  (`TauCeti.cartanMap`, `TauCeti.cartanEquiv`), Morita invariance
  (`CategoryTheory.Equivalence.cartanMap_bijective_iff`), the perfect projective/simple
  multiplicity pairing (`TauCeti.projectiveSimplePairing_isPerfPair`), the Cartan matrix with
  `C i j = [P j : S i]` (`TauCeti.cartanMatrix`, `TauCeti.cartanMap_of_eq_sum`), its determinant
  `±1` (`TauCeti.cartanMatrix_det_eq_one_or_neg_one`), the dual-number boundary
  (`TauCeti.cartanMatrix_dualNumber`, `TauCeti.not_isUnit_cartanMatrix_dualNumber`), the graded
  Cartan map and its `q = 1` specialization (`TauCeti.gradedCartanMap`,
  `TauCeti.toMatrix_cartanMap_eq_map_gradedCartanMatrix`).
* Layer 5: the finite Euler--Poincaré theorem in `AbelianK0`
  (`TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`), Euler admissibility and the Ext-Euler
  characteristic (`TauCeti.IsEulerAdmissible`, `TauCeti.extEuler`), its additivity in both
  variables (`TauCeti.extEuler_shortExact₁`, `TauCeti.extEuler_shortExact₂`), descent to a
  pairing of exact `K₀` groups (`TauCeti.extEulerPairing`, `TauCeti.extEulerPairing_of_of`),
  the general-field identities `CᵀE = D` and `E = C⁻ᵀD`
  (`TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_diagonal`,
  `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose_mul_diagonal`) with their split
  corollaries, the dual-number rejection (`TauCeti.not_isEulerAdmissible_dualNumberResidue`),
  the quiver comparison with the Ringel and Tits forms (`TauCeti.extEuler_eq_eulerForm_dimVector`,
  `TauCeti.extEulerPairing_add_flip_eq_titsPolarForm`), the `E₈` check
  (`TauCeti.Quiver.E8.extEulerMatrix_add_transpose`,
  `TauCeti.Quiver.E8.posDef_map_intCast_extEulerMatrix_add_transpose`), and the bigraded Ext-Euler
  characteristic with its descent (`TauCeti.IsGradedEulerAdmissible`, `TauCeti.gradedExtEuler`,
  `TauCeti.gradedExtEulerPairing`).
* Layer 6: the Laurent module structure `[M{n}] = qⁿ[M]` (`TauCeti.LaurentK0.T_smul`), the
  sesquilinear q-Euler form with its two shift laws (`TauCeti.gradedExtEulerSesquilinear`,
  `TauCeti.gradedExtEulerSesquilinear_T_smul_left`,
  `TauCeti.gradedExtEulerSesquilinear_T_smul_right`), its algebraic specialization at a unit
  (`TauCeti.gradedExtEulerSpecialized`), the `q = 1` comparison with the ungraded Ext-Euler
  characteristic under the graded Ext comparison
  (`TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler`), the factorization of the
  forgetful map through the `q = 1` base change and its injectivity criterion
  (`TauCeti.LaurentK0.forgetGradingEquiv`, `TauCeti.LaurentK0.forgetGradingMap_injective_iff`),
  and the minimal graded check (`TauCeti.GradedVectorSpace.isGradedExtComparison_unit`).
* Layer 7: the left and right numerical quotients with their radical descriptions and the
  nondegenerate descended pairing (`TauCeti.ExtEulerLeftNumericalQuotient`,
  `TauCeti.ExtEulerRightNumericalQuotient`, `TauCeti.mem_extEulerLeftRadical_iff`,
  `TauCeti.extEulerNumericalPairing_nondegenerate`).
* Worked examples: finite-dimensional vector spaces (`TauCeti.SplitK0.finrankEquiv`,
  `TauCeti.AbelianK0.finrankEquiv`).

Stated with `sorry`: the graded Cartan comparison of Layer 4, that the graded Cartan map is an
isomorphism when every finite graded module has a finite resolution by finite graded projectives
(`gradedCartanMap_bijective`); and the graded quiver comparison of Layer 5, in the form of the
graded Ext comparison for the path-length grading (`isGradedExtComparison_toModuleCat_pathAlgebra`),
after which its `q = 1` specialization is the pinned `laurentEval_one_gradedExtEuler`.

Not statable at the pins: the Poincaré-matrix form of the Layer 3 identity between a linear
resolution of the graded simples and the graded Cartan matrix. Its `K₀`-level content is the
alternating-class inverse of `gradedCartanMap_bijective`, but the pinned categorical
`TauCeti.ExactStructure.FiniteResolution` exposes no per-term multiplicities from which the
matrix-valued Betti series could be formed, and the pinned minimality predicate
`TauCeti.GradedProjectiveResolution.IsMinimal` lives on module-level resolutions whose terms carry
no `TauCeti.LaurentK0` class.
-/

namespace TauCetiRoadmap.GrothendieckEulerForms

open CategoryTheory CategoryTheory.Limits

universe w₁ w₂ v u w

/-! ## Layers 0--3: exact structures, Grothendieck groups and finite resolutions -/

/-- The native Quillen exact structure of the pinned Tau Ceti, under the name used by the
consumers of this module. It is an abbreviation, not a second carrier. -/
abbrev ExactStructure (C : Type u) [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] :=
  _root_.TauCeti.ExactStructure C

/-- The native conflation predicate written on a composable pair: `X ⟶ Y ⟶ Z` is a conflation
when it composes to zero and the short complex it forms is distinguished. -/
def ExactStructure.Conflation {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] (E : ExactStructure C) {X Y Z : C} (i : X ⟶ Y) (p : Y ⟶ Z) : Prop :=
  ∃ zero : i ≫ p = 0, E.toConflationClass.Conflation (ShortComplex.mk i p zero)

#check @TauCeti.ExactStructure.split
#check @TauCeti.ExactStructure.abelian
#check @TauCeti.ExactStructure.isConflationExact_abelian_iff
#check @TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations

#check @TauCeti.ExactK0.liftEquiv
#check @TauCeti.ExactK0.map
#check @TauCeti.ExactK0.BiadditiveInvariant.bilift
#check @TauCeti.SplitK0.grothendieckAddGroupEquiv
#check @TauCeti.TriangulatedK0.of_shift
#check @TauCeti.SplitK0.boundedHomotopyEquiv
#check @TauCeti.AbelianK0.boundedDerivedK0Equiv
#check @TauCeti.TriangulatedK0.of_eq_sum_homology
#check @TauCeti.GradedExactStructure.shiftEquiv

#check @TauCeti.ExactStructure.IsResolving.resolutionEquiv
#check @TauCeti.ExactStructure.IsResolving.eulerHom
#check @TauCeti.ExactStructure.FiniteResolution.lift
#check @TauCeti.ExactStructure.FiniteResolution.horseshoe
#check @TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv
#check @TauCeti.GradedExactStructure.IsResolving.forgetGrading_laurentResolutionEquiv
#check @TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne
#check @TauCeti.GradedProjectiveResolution.IsLinear.isMinimal

/-! ## Layer 4: the Cartan map -/

#check @TauCeti.cartanMap
#check @TauCeti.cartanEquiv
#check @CategoryTheory.Equivalence.cartanMap_bijective_iff
#check @TauCeti.projectiveSimplePairing_isPerfPair
#check @TauCeti.cartanMatrix
#check @TauCeti.cartanMap_of_eq_sum
#check @TauCeti.cartanMatrix_det_eq_one_or_neg_one
#check @TauCeti.cartanMatrix_dualNumber
#check @TauCeti.not_isUnit_cartanMatrix_dualNumber
#check @TauCeti.gradedCartanMap
#check @TauCeti.toMatrix_cartanMap_eq_map_gradedCartanMatrix

open TauCeti in
/-- **The graded Cartan map is an isomorphism** `K₀^gr(proj A) ≃ G₀^gr(mod A)` of
`ℤ[q,q⁻¹]`-modules whenever every finite graded module admits a finite resolution by finite graded
projectives in the canonical exact structure of graded modules. This is the graded resolution
theorem (`TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv`) applied to the graded
module categories; the inverse sends a class to the alternating class of any such resolution. -/
theorem gradedCartanMap_bijective {k : Type u} [CommRing k] {A : Type v} [Ring A] [Algebra k A]
    (𝒜 : ℤ → Submodule k A)
    (h : gradedFiniteModules 𝒜 ≤
      (_root_.TauCeti.ExactStructure.abelian (GradedModuleCat.{v} 𝒜)).admitsFiniteResolution
        (gradedFiniteProjectiveModules 𝒜)) :
    Function.Bijective (gradedCartanMap 𝒜) := by
  sorry

/-! ## Layers 5--7: Euler forms, Laurent coefficients, numerical quotients, worked examples -/

#check @TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar
#check @TauCeti.IsEulerAdmissible
#check @TauCeti.extEuler
#check @TauCeti.extEuler_shortExact₁
#check @TauCeti.extEuler_shortExact₂
#check @TauCeti.extEulerPairing
#check @TauCeti.extEulerPairing_of_of
#check @TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_diagonal
#check @TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose_mul_diagonal
#check @TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_one
#check @TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose
#check @TauCeti.not_isEulerAdmissible_dualNumberResidue
#check @TauCeti.extEuler_eq_eulerForm_dimVector
#check @TauCeti.extEulerPairing_add_flip_eq_titsPolarForm
#check @TauCeti.Quiver.E8.extEulerMatrix_add_transpose
#check @TauCeti.Quiver.E8.posDef_map_intCast_extEulerMatrix_add_transpose
#check @TauCeti.IsGradedEulerAdmissible
#check @TauCeti.gradedExtEuler
#check @TauCeti.gradedExtEulerPairing

open TauCeti in
/-- **The graded Ext comparison for the path-length grading.** For finitely generated graded
modules `X`, `Y` over the finite-dimensional path algebra `kQ` of a finite acyclic quiver
(`FiniteDimensional k (pathAlgebra k Q)`, which by `TauCeti.module_finite_pathAlgebra_iff` says
that `Q` has finitely many paths: finitely many arrows and no oriented cycle), graded by path
length (the pinned `TauCeti.PathAlgebra.gradeBy` with every arrow of weight `1`), the forgetful
functor to ungraded modules satisfies, in every cohomological degree `n`,
`⊕_j Ext^n_gr(X, Y{j}) ≅ Ext^n(U X, U Y)`. Finite dimension cannot be dropped: for one vertex
with two loops `x`, `y`, the cyclic module `X = kQ/(x yⁿ : n ≥ 0)` against the simple module `S`
has `Ext¹(X, S) ≅ ∏_ℕ k` but `⊕_j Ext¹_gr(X, S{j}) ≅ ⊕_ℕ k`. With this hypothesis the bigraded
Ext-Euler characteristic of `(X, Y)` specializes at `q = 1` to the ungraded one of `(U X, U Y)`,
by `TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler`, and hence to the Ringel form
of the dimension vectors by `TauCeti.extEuler_eq_eulerForm_dimVector`. -/
theorem isGradedExtComparison_toModuleCat_pathAlgebra
    (k : Type w) [Field k] (Q : Type u) [Quiver.{v} Q] [Finite Q]
    [FiniteDimensional k (pathAlgebra k Q)]
    [HasExt.{w₁} (GradedModuleCat.{max w u v} (PathAlgebra.gradeBy k (Q := Q) fun _ => (1 : ℤ)))]
    [HasExt.{w₂} (ModuleCat.{max w u v} (pathAlgebra k Q))]
    (X Y : GradedModuleCat.{max w u v} (PathAlgebra.gradeBy k (Q := Q) fun _ => (1 : ℤ)))
    (hX : gradedFiniteModules (PathAlgebra.gradeBy k (Q := Q) fun _ => (1 : ℤ)) X)
    (hY : gradedFiniteModules (PathAlgebra.gradeBy k (Q := Q) fun _ => (1 : ℤ)) Y) :
    IsGradedExtComparison.{w₁, w₂} k (GradedModuleCat.shift (PathAlgebra.gradeBy k (Q := Q) fun _ => (1 : ℤ)))
      X Y (GradedModuleCat.toModuleCat.obj X) (GradedModuleCat.toModuleCat.obj Y) := by
  sorry

#check @TauCeti.LaurentK0.T_smul
#check @TauCeti.gradedExtEulerSesquilinear
#check @TauCeti.gradedExtEulerSesquilinear_T_smul_left
#check @TauCeti.gradedExtEulerSesquilinear_T_smul_right
#check @TauCeti.gradedExtEulerSpecialized
#check @TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler
#check @TauCeti.LaurentK0.forgetGradingEquiv
#check @TauCeti.LaurentK0.forgetGradingMap_injective_iff
#check @TauCeti.GradedVectorSpace.isGradedExtComparison_unit

#check @TauCeti.ExtEulerLeftNumericalQuotient
#check @TauCeti.ExtEulerRightNumericalQuotient
#check @TauCeti.mem_extEulerLeftRadical_iff
#check @TauCeti.extEulerNumericalPairing_nondegenerate

#check @TauCeti.SplitK0.finrankEquiv
#check @TauCeti.AbelianK0.finrankEquiv

end TauCetiRoadmap.GrothendieckEulerForms
