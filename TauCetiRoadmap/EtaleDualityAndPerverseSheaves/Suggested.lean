import Mathlib
import TauCeti.Algebra.Module.ZMod.Injective
import TauCeti.CategoryTheory.InvolutiveDual
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis
import TauCeti.LinearAlgebra.Determinant
import TauCeti.LinearAlgebra.Trace.Pi

/-!
# EtaleDualityAndPerverseSheaves: representative target signatures

The roadmap is README.md. This file records light definitions and milestone theorem
signatures statable against the pinned APIs. These are suggested forms, not an exhaustive
checklist; README.md is the definitive specification. Geometric duality, constructible
coefficient categories, perverse operations and trace classes are specified in the README.
The finite-module statements include nonprojective modules. The linear signatures retain the specified maps, perfectness,
Tate multiplier and signed determinant conventions, without a semisimplicity assumption.
-/

noncomputable section

open CategoryTheory Limits Pretriangulated Triangulated

universe u v

#check Module.Baer.zmod_self
#check LinearMap.BilinForm.IsAlt.even_finrank
#check LinearMap.trace_pi_of_apply_eq
#check LinearMap.det_eq_of_compl₁₂_self_eq_smul
#check TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self
#check CategoryTheory.Functor.dualityEquivalence
#check CategoryTheory.Functor.RightTExact
#check CategoryTheory.Functor.LeftTExact
#check CategoryTheory.Functor.TExact

namespace TauCetiRoadmap.EtaleDualityAndPerverseSheaves

/-! ## Layer 0: self-injective coefficient duality and flat traces -/

/-- Every positive uniformizer-power quotient of a DVR is self-injective.
This includes equal-characteristic DVRs and ramified mixed-characteristic DVRs. -/
theorem uniformizerQuotient_selfInjective
    (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (π : O) (hπ : Irreducible π) (m : ℕ) (hm : 0 < m) :
    Module.Injective (O ⧸ Ideal.span {π ^ m}) (O ⧸ Ideal.span {π ^ m}) := by
  sorry

/-- Finite biduality over a Noetherian self-injective coefficient ring requires
finite generation, but does not require projectivity. -/
theorem finiteModule_eval_bijective
    (R : Type u) [CommRing R] [IsNoetherianRing R] [Module.Injective R R]
    (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    Function.Bijective (Module.Dual.eval R M) := by
  sorry

/-- The nonprojective `ℤ/4`-module `ℤ/2` has a nonzero dual generator sending `1` to `2`. -/
theorem nonprojective_zmod_dual_generator :
    letI : Module (ZMod 4) (ZMod 2) :=
      AddCommGroup.zmodModule (by decide : ∀ x : ZMod 2, (4 : ℕ) • x = 0)
    ¬ Module.Projective (ZMod 4) (ZMod 2) ∧
      ∃ f : Module.Dual (ZMod 4) (ZMod 2),
        f 1 = 2 ∧ f ≠ 0 ∧ ∀ g : Module.Dual (ZMod 4) (ZMod 2), ∃ r : ZMod 4, g = r • f := by
  sorry

/-! ## Layer 1: higher Chern classes and Chow descent

The étale cohomology and Chow carriers needed for these targets are specified in README.md.
-/

/-! ## Layer 2: abstract hearts and the perverse functor calculus -/

section TExact

variable {C : Type*} [Category C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]
  {D : Type*} [Category D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- The adjoint criterion (BBD 1.3.17 (iii)): for triangulated `L ⊣ R`, `L` is right t-exact
iff `R` is left t-exact, using Mathlib's native classes. -/
theorem Functor.isRightTExact_iff_isLeftTExact_of_adjunction {t₁ : TStructure C}
    {t₂ : TStructure D} {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) [L.CommShift ℤ] [R.CommShift ℤ]
    [L.IsTriangulated] [R.IsTriangulated] :
    L.RightTExact t₁ t₂ ↔ R.LeftTExact t₂ t₁ := by
  sorry

/-- A t-exact triangulated functor restricts to an exact functor between the hearts. -/
theorem Functor.heartRestriction_exists [IsTriangulated C] [IsTriangulated D]
    (t₁ : TStructure C) (t₂ : TStructure D) (T : C ⥤ D)
    [T.CommShift ℤ] [T.IsTriangulated] [T.TExact t₁ t₂] :
    ∃ H : t₁.heart.FullSubcategory ⥤ t₂.heart.FullSubcategory,
      Nonempty (H ⋙ t₂.heart.ι ≅ t₁.heart.ι ⋙ T) ∧
      PreservesFiniteLimits H ∧ PreservesFiniteColimits H := by
  sorry

end TExact

/-- The heart of a t-structure on a triangulated category admits an abelian structure.
The existence is stated as a proposition; no unproved data instance is introduced. -/
theorem heart_abelian {C : Type*} [Category C] [Preadditive C] [HasZeroObject C]
    [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
    [Pretriangulated C] [IsTriangulated C] (t : TStructure C) :
    Nonempty (Abelian t.heart.FullSubcategory) := by
  sorry

/-! ## Layer 3: ramified adic coefficients and comparison maps

The enhanced normalized-system and realization functors are specified in README.md.
-/

/-! ## Layer 4: refined Lefschetz and geometric decompositions -/

namespace LinearModels

variable {E U V W : Type*} [Field E]
variable [AddCommGroup U] [Module E U] [AddCommGroup V] [Module E V]
variable [AddCommGroup W] [Module E W]

/-- The linear model of the vanishing space is the kernel of the specified Gysin map. -/
def vanishingSubspace (gysin : V →ₗ[E] W) : Submodule E V :=
  LinearMap.ker gysin

/-- The restricted space is the range of the specified restriction map. -/
def restrictedSubspace (restriction : U →ₗ[E] V) : Submodule E V :=
  LinearMap.range restriction

/-- The primitive space is the kernel of the specified power of the Lefschetz operator.
The geometric exponent and Tate twist are specified in the roadmap document. -/
def primitiveSubspace (lefschetzPower : V →ₗ[E] W) : Submodule E V :=
  LinearMap.ker lefschetzPower

/-- Adjointness and separation on the target of Gysin identify the vanishing space
with the orthogonal of the restricted space. This is the linear part of the geometric
Poincaré-duality argument; it does not assume a direct-sum decomposition. -/
theorem vanishingSubspace_eq_orthogonal
    (restriction : U →ₗ[E] V) (gysin : V →ₗ[E] W)
    (pairX : U →ₗ[E] W →ₗ[E] E) (pairY : LinearMap.BilinForm E V)
    (hX : ∀ w, (∀ u, pairX u w = 0) → w = 0)
    (hAdjoint : ∀ u v, pairY (restriction u) v = pairX u (gysin v)) :
    vanishingSubspace gysin = pairY.orthogonal (restrictedSubspace restriction) := by
  sorry

/-- Finite-dimensional perfect reflexive duality gives the reverse orthogonality.
Perfectness alone does not assert that the two subspaces have zero intersection. -/
theorem restrictedSubspace_eq_orthogonal [FiniteDimensional E V]
    (restriction : U →ₗ[E] V) (gysin : V →ₗ[E] W)
    (pairX : U →ₗ[E] W →ₗ[E] E) (pairY : LinearMap.BilinForm E V)
    (hX : ∀ w, (∀ u, pairX u w = 0) → w = 0)
    (hY : pairY.Nondegenerate) (hRefl : pairY.IsRefl)
    (hAdjoint : ∀ u v, pairY (restriction u) v = pairX u (gysin v)) :
    restrictedSubspace restriction = pairY.orthogonal (vanishingSubspace gysin) := by
  sorry

end LinearModels

/-- The primitive middle Betti number `((d - 1)^(m + 2) + (-1)^m (d - 1)) / d` of a smooth
hypersurface of degree `d ≥ 1` and dimension `m ≥ 1`; in this range the division is exact.
The raw integer expression is defined for all natural arguments. -/
def hypersurfacePrimitiveRank (d m : ℕ) : ℤ :=
  (((d : ℤ) - 1) ^ (m + 2) + (-1) ^ m * ((d : ℤ) - 1)) / d

/-! ## Layer 5: perverse weights, decomposition and relative hard Lefschetz

README §5.3's `intersectionComplexPurity` identifies `IC` with `IC⁰[d]`, where
AutomorphicLFunctionsAndLocalFactors AL.3's `normalized-scheme-ic-purity` supplies
purity of `IC⁰`. The shift transports weight `w` to `w + d` and identifies degree `i`
cohomology of `IC` with degree `i + d` cohomology of `IC⁰`. The affine intermediate-extension
weight bounds and this geometric adapter are specified in the README.
-/

section Semisimple
variable {C : Type u} [Category.{v} C] [Preadditive C] [HasFiniteBiproducts C]

/-- A finite semisimple object: `X` is isomorphic to a finite biproduct of simple objects. -/
def IsSemisimpleObject (X : C) : Prop :=
  ∃ (n : ℕ) (S : Fin n → C), (∀ i, Simple (S i)) ∧ Nonempty (X ≅ ⨁ S)

/- The subobject and quotient API, including
`TauCeti.EtaleDuality.IsSemisimpleObject.of_mono`, is specified in README §5.5. -/

end Semisimple

section SemisimpleAbelian
variable {C : Type u} [Category.{v} C] [Abelian C]
attribute [local instance] Abelian.hasFiniteBiproducts

/-- a finite-length object is semisimple iff every subobject
has a complement in the subobject lattice (equivalently it is the sum of its simple subobjects). -/
theorem isSemisimpleObject_iff_socle (X : C) [IsArtinianObject X] [IsNoetherianObject X] :
    IsSemisimpleObject X ↔ ∀ A : Subobject X, ∃ B : Subobject X, A ⊓ B = ⊥ ∧ A ⊔ B = ⊤ := sorry

end SemisimpleAbelian

section SplittingLemma
variable {C : Type u} [Category.{v} C] [Abelian C]

/-- The simple subquotients of `X` all satisfy `P`: for subobjects `A ≤ B` with `B / A` simple,
`P (B / A)`. -/
def SimpleSubquotientsIn (P : C → Prop) (X : C) : Prop :=
  ∀ (A B : Subobject X) (h : A ≤ B), Simple (cokernel (Subobject.ofLE A B h)) →
    P (cokernel (Subobject.ofLE A B h))

/-- BBD Lemme 5.3.6: for a partition of the simple
objects into `P` and `¬ P` with every extension of a `¬ P`-simple by a `P`-simple split, every
finite-length object has a unique subobject with all simple subquotients in `¬ P` and quotient
with all simple subquotients in `P`. -/
theorem exists_unique_torsion_subobject (P : C → Prop)
    (hP : ∀ {X Y : C}, Nonempty (X ≅ Y) → (P X ↔ P Y))
    (hsplit : ∀ S : ShortComplex C, S.ShortExact → Simple S.X₁ → Simple S.X₃ → P S.X₁ →
      ¬ P S.X₃ → Nonempty S.Splitting)
    (F : C) [IsArtinianObject F] [IsNoetherianObject F] :
    ∃! W : Subobject F, SimpleSubquotientsIn (fun Z => ¬ P Z) (W : C) ∧
      SimpleSubquotientsIn P (cokernel W.arrow) := sorry

end SplittingLemma

/-- A nonsplit unipotent Jordan module has only the permitted simple constituent. -/
theorem jordanModule_constituents_not_semisimple :
    SimpleSubquotientsIn
        (fun S : ModuleCat (Polynomial ℚ) => Nonempty (S ≅
          ModuleCat.of (Polynomial ℚ)
            (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X - 1 : Polynomial ℚ)})))
        (ModuleCat.of (Polynomial ℚ)
          (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X - 1 : Polynomial ℚ) ^ 2})) ∧
      ¬ IsSemisimpleObject (ModuleCat.of (Polynomial ℚ)
        (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X - 1 : Polynomial ℚ) ^ 2})) := by
  sorry

/-! ## Layer 6: cohomological correspondences and contracting trace formulas

The geometric correspondence and trace-class constructions are specified in README.md.
`CohCorr.restrictClosed` uses reduced support. For schematically invariant closed subschemes,
the full scheme restriction has the same cohomological restriction and trace under étale
nilpotent invariance.
-/

/-! ## Layer 7: tubular neighbourhoods and isolated local terms

The fixed normal cone, ULA specialization and finite-jet constructions are specified in README.md.
Normal cones and their vertices use the full scheme restriction, including Artin nilpotents.
-/

/-! ## Layer 8: Frobenius reciprocity from graded duality -/

section FormSimilitude
variable {F : Type u} [Field F] {V : Type v} [AddCommGroup V] [Module F V] [FiniteDimensional F V]

/-- `det(φ)² = c^b` for a similitude of a
nondegenerate bilinear form. The case `c = 1` is Tau Ceti's
`TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self`. -/
theorem form_similitude_det_sq (B : LinearMap.BilinForm F V) (hB : B.Nondegenerate)
    (φ : V →ₗ[F] V) (c : F) (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    LinearMap.det φ ^ 2 = c ^ Module.finrank F V := sorry

/-- Alternating similitudes have
`det φ = c^(b/2)`; the rank-two case is Tau Ceti's
`LinearMap.det_eq_of_compl₁₂_self_eq_smul`. -/
theorem form_similitude_det_alt (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (halt : B.IsAlt) (φ : V →ₗ[F] V) (c : F)
    (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    LinearMap.det φ = c ^ (Module.finrank F V / 2) := sorry

/-- symmetric case with `s² = c` in `F`:
`det φ = (-1)^{m₋} s^b`, `m₋` the dimension of the generalized `(-s)`-eigenspace. -/
theorem form_similitude_det_symm (h2 : (2 : F) ≠ 0) (B : LinearMap.BilinForm F V)
    (hB : B.Nondegenerate) (hsymm : B.IsSymm) (φ : V →ₗ[F] V) (c s : F) (hs : s * s = c)
    (h : ∀ x y, B (φ x) (φ y) = c * B x y) :
    LinearMap.det φ =
      (-1) ^ Module.finrank F (Module.End.maxGenEigenspace φ (-s)) * s ^ Module.finrank F V := sorry

end FormSimilitude

/- Complementary-degree pairings are stated using families of native vector spaces.
The geometric construction of this family and the full GradedFrobeniusDuality API are
specified in README.md. The definitions below are only the two finite numerical expressions. -/

section GradedDeterminants
variable {E : Type u} [Field E]

/-- The bounded Euler sum uses integer degrees, with no truncated natural subtraction. -/
def gradedEulerChar (d : ℕ) (b : ℤ → ℕ) : ℤ :=
  ∑ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), (-1 : ℤ) ^ i.toNat * (b i : ℤ)

variable (H : ℤ → Type v) [∀ i, AddCommGroup (H i)] [∀ i, Module E (H i)]
  [∀ i, FiniteDimensional E (H i)]

/-- The alternating product of Frobenius determinants, in the unit group. -/
def gradedDelta (d : ℕ) (F : ∀ i, H i ≃ₗ[E] H i) : Eˣ :=
  ∏ i ∈ Finset.Icc (0 : ℤ) (2 * (d : ℤ)), LinearEquiv.det (F i) ^ ((-1 : ℤ) ^ i.toNat)

/-- End determinant identity: perfect complementary pairings and factor q^d imply Δ²=q^(dχ).
No Frobenius semisimplicity is assumed. -/
theorem graded_delta_sq (d : ℕ) (q : Eˣ) (F : ∀ i, H i ≃ₗ[E] H i)
    (B : ∀ i, H i →ₗ[E] H (2 * (d : ℤ) - i) →ₗ[E] E)
    (hB : ∀ i, (B i).IsPerfPair)
    (hsim : ∀ i (x : H i) (y : H (2 * (d : ℤ) - i)),
      B i (F i x) (F (2 * (d : ℤ) - i) y) = (q : E) ^ d * B i x y) :
    gradedDelta H d F ^ 2 = q ^ ((d : ℤ) * gradedEulerChar d (fun i => Module.finrank E (H i))) := sorry

/-- Even-dimensional middle cohomology: the magnitude is q^((d/2)·b), valid also for odd b. -/
theorem even_middle_det [CharZero E] (d : ℕ) (hd : Even d) (q : Eˣ)
    (B : LinearMap.BilinForm E (H d)) (hB : B.Nondegenerate) (hsymm : B.IsSymm)
    (F : H d ≃ₗ[E] H d)
    (hsim : ∀ x y, B (F x) (F y) = (q : E) ^ d * B x y) :
    LinearMap.det F.toLinearMap =
      (-1) ^ Module.finrank E (Module.End.maxGenEigenspace F.toLinearMap (-((q : E) ^ (d / 2)))) *
        (q : E) ^ ((d / 2) * Module.finrank E (H d)) := sorry

/-- Odd-dimensional middle cohomology: Koszul antisymmetry gives an alternating perfect form. -/
theorem odd_middle_det [CharZero E] (d : ℕ) (hd : Odd d) (q : Eˣ)
    (B : LinearMap.BilinForm E (H d)) (hB : B.Nondegenerate)
    (hskew : ∀ x y, B y x = (-1 : E) ^ d * B x y)
    (F : H d ≃ₗ[E] H d)
    (hsim : ∀ x y, B (F x) (F y) = (q : E) ^ d * B x y) :
    Even (Module.finrank E (H d)) ∧
      LinearMap.det F.toLinearMap = (q : E) ^ (d * Module.finrank E (H d) / 2) := sorry

end GradedDeterminants

end TauCetiRoadmap.EtaleDualityAndPerverseSheaves

/-
Definitions specified in README.md whose geometric or enhanced carriers are not present
at the pins: constructible all-coefficient Verdier duality, general flat trace and
fundamental class, semi-purity and cycle class with supports, higher étale Chern classes
and Chow cycle class, the Euler–Tor comparison for proper Chow intersections; recollement, glued t-structure, heart cohomology functors, abstract
intermediate extension, torsion tilt, Noetherian perverse category, locally closed
intermediate extension, intersection complex, nonconstructible perverse conditions,
semismall and small maps; ramified normalized constructible systems, strict derived
reduction and mapping limits, constructible lattices, finite coefficient extension,
perverse Betti comparison and the integral supported Thom comparison, Tate orientation,
analytic trace realization, diamond comparison mates; vanishing/restricted/primitive
cohomology as geometric subspaces, projective-bundle integration, sheaf blow-up columns,
complete-intersection cohomology; Weil and mixed perverse categories, perverse weights,
relative Lefschetz object and primitive objects, geometric-origin spread category and
pure specialization; scheme and cohomological correspondences, their proper pushforward,
pullback and composition, proper-support 2-morphisms and their coherence, trace classes and integrated local terms, specialization and
normal-cone deformation, contraction and Frobenius twisting with positive ramification exponents; the semisimple cyclic closure and character criterion; tubular-neighbourhood
conditions, ULA specialization, full Artin fixed components and their finite-jet weight
model; finite filtered localization and its graded trace; supported Betti purity for smooth closed pairs,
its realization agreement with ordinary Thom/Gysin, and
derived-complete Betti coefficient systems; GradedFrobeniusDuality and its geometric Poincaré export.

Additional prerequisite targets: curveEulerPoincareSwan, adicFiniteFieldHochschildSerre,
semisimpleCyclicClosure_diagonalizable, chowIntersection_eq_eulerTor.

Principal names for these README targets: quasiFiniteFlatTrace, curveTrace, trace,
derivedTrace, fundamentalClass, fundamentalClassOfCycle, chernClass, totalChernClass,
cycleClass, chowCycleClass; TStructure.homologyZero, TStructure.homology, heartFunctor,
Functor.rightTExact_comp, Functor.leftTExact_comp,
Recollement, intermediateExtension, TStructure.TorsionTheory.ofNoetherianLinear, tilt,
perverseLE, perverseGE, perverseTStructure, PerverseSheaf, perverseCoh,
intersectionComplex, perverseLEExt, perverseGEExt; normalizedSystem,
BettiSupportedPurity, BettiNormalizedSystem, thom_realization, gysin_realization,
tateOrientation_finite;
MixedPerverseSheaf, weightFiltration, IsGeometricallySemisimple,
IsGeometricallySplitSemisimple, GradedLefschetz, etaPow, HardLefschetz, primitive,
RestrictedCategory, GoodModel, GeometricOrigin, IsSemisimpleGeometricOrigin;
Correspondence, Correspondence.Hom, Correspondence.fix, Correspondence.graph,
compactify_preserving_invariance, CohCorr, CohCorr.pushforward, CohCorr.rgammac,
CohCorr.pullbackAlong, CohCorr.restrictOpen, CohCorr.restrictClosed,
CohCorr.naiveLocalTerm, CohCorr.comp, CohCorr.TwoHom, CohCorr.TwoHom.id,
CohCorr.TwoHom.vcomp, CohCorr.TwoHom.hcomp, CohCorr.twoCoherence,
CohCorr.traceMap, CohCorr.localTerm,
IsInvariant, IsLocallyInvariant, Lift, sp, CohCorr.sp, Stabilizes,
IsContractingNear, IsContractingNearFix, frobeniusTwist, ramification,
NoTubularFixed, NoAlmostTubularFixed, GradedFrobeniusDuality.
These names are design targets, not declarations in this file.
-/
