import Mathlib
import TauCeti.CategoryTheory.Exact.Split
import TauCeti.CategoryTheory.Exact.Biproduct
import TauCeti.CategoryTheory.Exact.Bicartesian
import TauCeti.CategoryTheory.Exact.BaseChange
import TauCeti.CategoryTheory.Exact.Opposite
import TauCeti.CategoryTheory.Exact.ExtensionClosed
import TauCeti.CategoryTheory.Exact.Functor
import TauCeti.CategoryTheory.Exact.Equivalence
import TauCeti.CategoryTheory.Exact.Resolution.Comparison
import TauCeti.CategoryTheory.Exact.Resolution.Horseshoe
import TauCeti.CategoryTheory.Exact.Resolution.HasFiniteResolution
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.CategoryTheory.GrothendieckGroup.Abelian
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated
import TauCeti.CategoryTheory.GrothendieckGroup.BoundedHomotopy.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Derived.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.EulerCharacteristic
import TauCeti.CategoryTheory.GrothendieckGroup.Resolving
import TauCeti.CategoryTheory.GrothendieckGroup.Graded
import TauCeti.CategoryTheory.GrothendieckGroup.Laurent.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Laurent.Resolving.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.ForgetGrading
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace
import TauCeti.Algebra.Module.GradedModule.Resolution
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.LinearResolution
import TauCeti.Algebra.Category.GradedModuleCat.CartanMap.Specialization
import TauCeti.Algebra.Category.GradedModuleCat.CartanMap.Resolution
import TauCeti.Algebra.Category.GradedModuleCat.LinearResolution.Converse
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Descent
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.DualNumbers
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Numerical
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.Numerical
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.Descent
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.Sesquilinear
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.ForgetGrading.Comparison
import TauCeti.Algebra.Category.GradedModuleCat.CartanMap.ForgetGrading
import TauCeti.Algebra.Homology.EulerCharacteristic.ExtEuler.Graded.GradedVectorSpace
import TauCeti.RepresentationTheory.GrothendieckGroup.CartanMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.UnimodularCartanMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.ExtEulerMatrix
import TauCeti.RepresentationTheory.GrothendieckGroup.DualNumbers
import TauCeti.RepresentationTheory.GrothendieckGroup.Quiver.ExtEuler
import TauCeti.RepresentationTheory.Quiver.E8.ExtEuler
import TauCeti.RepresentationTheory.Quiver.PathAlgebra.Grading
import TauCeti.RepresentationTheory.Quiver.PathAlgebra.GradedExtEuler.ExtComparison

/-!
# Grothendieck groups, Cartan maps, and Euler forms: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, so that the kernel checks what the
prose claims; the README carries every other target, its API and its Checks.

The categorical carriers are pinned Tau Ceti declarations: `TauCeti.ExactStructure` (Bühler's
axioms E0–E2 and their duals on a `TauCeti.ConflationClass`, whose conflations are short
complexes), the Grothendieck groups `TauCeti.SplitK0`, `TauCeti.ExactK0`, `TauCeti.AbelianK0`,
`TauCeti.TriangulatedK0` and `TauCeti.LaurentK0`, graded exact structures
`TauCeti.GradedExactStructure`, Euler admissibility `TauCeti.IsEulerAdmissible`, the Ext-Euler
characteristic `TauCeti.extEuler` and its graded form `TauCeti.gradedExtEuler`. No private copy of
any of them is declared here. The two names `ExactStructure` and `ExactStructure.Conflation` below
are an abbreviation of the Tau Ceti structure and its conflation predicate written on a
composable pair; they exist because the Lean file of StablePeriodicCurved imports this
module and spells conflations that way, and they add nothing to the Tau Ceti carrier.

The headline theorems of the roadmap, and where each stands at the pins:

* The resolution theorem (README §3.4) with its alternating-class inverse, and its module form:
  the Cartan map is an isomorphism when every finitely generated module has a finite resolution
  by finitely generated projectives (§4.4), with Cartan determinant `±1` (§4.6). Pinned below by
  `#check`: `TauCeti.ExactStructure.IsResolving.resolutionEquiv`, `TauCeti.cartanEquiv`,
  `TauCeti.cartanMatrix_det_eq_one_or_neg_one`.
* The general-field Euler identities `Cᵀ E = D` and `E = C⁻ᵀ D` (§5.6). Pinned:
  `TauCeti.cartanMatrix_transpose_mul_extEulerMatrix_eq_diagonal`,
  `TauCeti.extEulerMatrix_eq_inverseCartanMatrix_transpose_mul_diagonal`.
* The graded Cartan isomorphism (§4.5). Tau Ceti proves it when the grading data is a
  decomposition of the algebra (`TauCeti.gradedCartanMap_bijective`); the README asks for it for
  arbitrary grading data, which is `gradedCartanMap_bijective` below, stated with `sorry`.
* The `q`-Euler form: its sesquilinearity (§6.3), its value at `q = 1` under a graded Ext
  comparison (§6.6), and the comparison for the path-length grading of a finite-dimensional path
  algebra (§5.8). Pinned: `TauCeti.gradedExtEulerSesquilinear`,
  `TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler`,
  `TauCeti.GradedModuleCat.isGradedExtComparison_toModuleCat` (which applies to the grading
  `TauCeti.PathAlgebra.gradeBy` with every arrow of weight `1`, a graded algebra by a global
  instance) and `TauCeti.PathAlgebra.isGradedExtComparison_forget`.
* The nondegenerate pairing of the left and right numerical quotients (§7.2). Pinned:
  `TauCeti.extEulerNumericalPairing_nondegenerate`.

Not statable at the pins: the Betti form `C(q) · B(q, −1) = I` of the graded Cartan identity
(§4.5), between the graded Cartan matrix and the Betti Poincaré matrix of the graded simples
(§3.7). The Betti matrix records, for each term of a minimal graded projective resolution, the
multiplicity of each shifted indecomposable graded projective `P_i{d}` as a summand. The pinned
categorical `TauCeti.ExactStructure.FiniteResolution` exposes no per-term multiplicities from
which it could be formed, and the pinned minimality predicate
`TauCeti.GradedProjectiveResolution.IsMinimal` lives on module-level resolutions whose terms carry
no `TauCeti.LaurentK0` class. Its Ext-side counterpart is pinned in Tau Ceti and is named in the
README's supplier contracts.

The remaining pins record the further theorems of the layers, so that a pin whose statement
moves or disappears breaks this file.
-/

namespace TauCetiRoadmap.GrothendieckEulerForms

open CategoryTheory CategoryTheory.Limits

universe v u

/-! ## Layer 0: intrinsic exact structures and conflation-exact functors -/

/-- The Quillen exact structure of the pinned Tau Ceti, under the name used by the consumers of
this module. It is an abbreviation, not a second carrier. -/
abbrev ExactStructure (C : Type u) [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] :=
  _root_.TauCeti.ExactStructure C

/-- The conflation predicate written on a composable pair: `X ⟶ Y ⟶ Z` is a conflation
when it composes to zero and the short complex it forms is distinguished. -/
def ExactStructure.Conflation {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] (E : ExactStructure C) {X Y Z : C} (i : X ⟶ Y) (p : Y ⟶ Z) : Prop :=
  ∃ zero : i ≫ p = 0, E.toConflationClass.Conflation (ShortComplex.mk i p zero)

#check @TauCeti.ExactStructure.conflation_of_splitting
#check @TauCeti.ExactStructure.conflation_biprod
#check @TauCeti.ExactStructure.tfae_isPushout_of_isInflation
#check @TauCeti.ExactStructure.tfae_isPullback_of_isDeflation
#check @TauCeti.ExactStructure.conflation_cobaseChange
#check @TauCeti.ExactStructure.conflation_baseChange
#check @TauCeti.ExactStructure.op_conflation
#check @TauCeti.ExactStructure.op_inflations
#check @TauCeti.ExactStructure.split
#check @TauCeti.ExactStructure.abelian
#check @TauCeti.ExactStructure.isConflationExact_ι
#check @TauCeti.ExactStructure.reflectsConflations_ι
#check @TauCeti.ExactStructure.isConflationExact_abelian_iff
#check @TauCeti.ExactStructure.isConflationExact_inverse_iff_reflectsConflations

-- Layer 2: split, exact, abelian, and triangulated Grothendieck groups

#check @TauCeti.ExactK0.liftEquiv
#check @TauCeti.ExactK0.map
#check @TauCeti.ExactK0.BiadditiveInvariant.bilift
#check @TauCeti.SplitK0.grothendieckAddGroupEquiv
#check @TauCeti.TriangulatedK0.of_shift
#check @TauCeti.SplitK0.boundedHomotopyEquiv
#check @TauCeti.AbelianK0.boundedDerivedK0Equiv
#check @TauCeti.TriangulatedK0.of_eq_sum_homology
#check @TauCeti.GradedExactStructure.shiftEquiv

-- Layer 3: finite resolutions and the resolution theorem

#check @TauCeti.ExactStructure.IsResolving.resolutionEquiv
#check @TauCeti.ExactStructure.IsResolving.eulerHom
#check @TauCeti.ExactStructure.abelian_admitsFiniteResolution
#check @TauCeti.ExactStructure.FiniteResolution.lift
#check @TauCeti.ExactStructure.FiniteResolution.horseshoe
#check @TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv
#check @TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne
#check @TauCeti.GradedProjectiveResolution.IsLinear.isMinimal
#check @TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext

/-! ## Layer 4: finite-dimensional algebras and the Cartan map -/

#check @TauCeti.cartanMap
#check @TauCeti.cartanEquiv
#check @CategoryTheory.Equivalence.cartanMap_bijective_iff
#check @TauCeti.indecomposableProjectiveClassBasis
#check @TauCeti.simpleClassBasis
#check @TauCeti.projectiveSimplePairing_isPerfPair
#check @TauCeti.cartanMatrix
#check @TauCeti.cartanMap_of_eq_sum
#check @TauCeti.cartanMatrix_det_eq_one_or_neg_one
#check @TauCeti.cartanMatrix_dualNumber
#check @TauCeti.not_isUnit_cartanMatrix_dualNumber
#check @TauCeti.gradedCartanMap
#check @TauCeti.gradedCartanMap_bijective
#check @TauCeti.toMatrix_cartanMap_eq_map_gradedCartanMatrix

open TauCeti in
/-- **The graded Cartan map is an isomorphism** `K₀^gr(proj A) ≃ G₀^gr(mod A)` of
`ℤ[q,q⁻¹]`-modules whenever every finitely generated graded module admits a finite resolution by
finitely generated graded modules with projective underlying module, in the canonical exact
structure of graded modules. The grading data `𝒜` is arbitrary: no finiteness hypothesis on `A`
and no decomposition hypothesis on `𝒜`. Tau Ceti's `TauCeti.gradedCartanMap_bijective` is the
case where `𝒜` is a decomposition of `A`. The route is the graded resolution theorem
(`TauCeti.GradedExactStructure.IsResolving.laurentResolutionEquiv`) for the finitely generated
graded modules with projective underlying module inside all finitely generated graded modules:
they are closed under extensions, and under kernels of epimorphisms because a short exact sequence
whose third term has projective underlying module splits on underlying modules. The inverse sends
a class to the alternating class of any such resolution (Weibel, *The K-book*, Theorem II.7.6). -/
theorem gradedCartanMap_bijective {k : Type u} [CommRing k] {A : Type v} [Ring A] [Algebra k A]
    (𝒜 : ℤ → Submodule k A)
    (h : gradedFiniteModules 𝒜 ≤
      (_root_.TauCeti.ExactStructure.abelian (GradedModuleCat.{v} 𝒜)).admitsFiniteResolution
        (gradedFiniteProjectiveModules 𝒜)) :
    Function.Bijective (gradedCartanMap 𝒜) := by
  sorry

-- Layer 5: finite-support Euler characteristics and Ext-Euler descent

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
#check @TauCeti.IsGradedExtComparison
#check @TauCeti.IsGradedExtComparison.isEulerAdmissible
#check @TauCeti.isGradedExtComparison_of_subsingleton_ne
#check @TauCeti.GradedModuleCat.isGradedExtComparison_toModuleCat
#check @TauCeti.PathAlgebra.isGradedExtComparison_forget

-- Layer 6: Laurent coefficients, q-Euler forms, and specialization

#check @TauCeti.LaurentK0.T_smul
#check @TauCeti.gradedExtEulerSesquilinear
#check @TauCeti.gradedExtEulerSesquilinear_T_smul_left
#check @TauCeti.gradedExtEulerSesquilinear_T_smul_right
#check @TauCeti.gradedExtEulerSpecialized
#check @TauCeti.IsGradedExtComparison.laurentEval_one_gradedExtEuler
#check @TauCeti.LaurentK0.forgetGradingEquiv
#check @TauCeti.LaurentK0.forgetGradingMap_injective_iff
#check @TauCeti.GradedExactStructure.IsResolving.forgetGrading_laurentResolutionEquiv
#check @TauCeti.GradedVectorSpace.isGradedExtComparison_unit

-- Layer 7: left and right numerical Grothendieck groups

#check @TauCeti.ExtEulerLeftNumericalQuotient
#check @TauCeti.ExtEulerRightNumericalQuotient
#check @TauCeti.mem_extEulerLeftRadical_iff
#check @TauCeti.mem_gradedExtEulerLeftRadical_iff
#check @TauCeti.extEulerNumericalPairing_nondegenerate

-- Worked examples

#check @TauCeti.SplitK0.finrankEquiv
#check @TauCeti.AbelianK0.finrankEquiv

end TauCetiRoadmap.GrothendieckEulerForms
