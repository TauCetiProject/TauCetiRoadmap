import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated

/-!
# GeneralAlgebraicKTheory: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Classifying spaces use the
existing nerve and realization. The other definitions record the arithmetic conventions
for sphere interchange, relative differences, boundaries, projective-line twists and
finite Euler classes. The categorical K-theory constructions and their full interfaces
are targets in the README and are named in the closing comment.
-/

noncomputable section

universe u v

namespace TauCetiRoadmap.GeneralAlgebraicKTheory

open CategoryTheory
open scoped ContinuousMap

/- ## Layer 1: Categorical homotopy tools -/

/-- The classifying space is the realization of Mathlib's category nerve (§1.1). -/
abbrev classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} :=
  SSet.toTop.obj (CategoryTheory.nerve C)

/-- The continuous map obtained by realizing the existing nerve map (§1.1). -/
abbrev classifyingSpaceMap {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) : C(classifyingSpace C, classifyingSpace D) :=
  (SSet.toTop.map (CategoryTheory.nerveMap F)).hom

/- ## Categorical homotopy milestones -/

/-- Contractible under-comma realizations make the realized functor a homotopy equivalence
(§1.4, QuillenA). -/
theorem QuillenA {C D : Type u} [Category.{u} C] [Category.{u} D]
    (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : classifyingSpace C ≃ₕ classifyingSpace D,
      e.toFun = classifyingSpaceMap F := sorry

/-- Contractible over-comma realizations give the dual homotopy equivalence criterion
(§1.4, QuillenA_dual). -/
theorem QuillenA_dual {C D : Type u} [Category.{u} C] [Category.{u} D]
    (F : C ⥤ D) (h : ∀ d : D, ContractibleSpace (classifyingSpace (CostructuredArrow F d))) :
    ∃ e : classifyingSpace C ≃ₕ classifyingSpace D,
      e.toFun = classifyingSpaceMap F := sorry

/-- Realization of a product is the compactly generated product, with the realized projections
as its coordinates (§1.1, classifyingSpace_product). -/
theorem classifyingSpace_product (C D : Type u) [Category.{u} C] [Category.{u} D] :
    letI : TopologicalSpace (classifyingSpace C × classifyingSpace D) :=
      TopologicalSpace.compactlyGenerated.{u} (classifyingSpace C × classifyingSpace D)
    ∃ e : classifyingSpace (C × D) ≃ₜ (classifyingSpace C × classifyingSpace D),
      ∀ x, e x = (classifyingSpaceMap (CategoryTheory.Prod.fst C D) x,
        classifyingSpaceMap (CategoryTheory.Prod.snd C D) x) := sorry

/-- Reversing the simplices identifies a category's realization with that of its opposite
(§1.1, classifyingSpace_op). -/
theorem classifyingSpace_op (C : Type u) [Category.{u} C] :
    Nonempty (classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C) := sorry

/- ## Layer 11: Dense triangulated subcategories -/

section DenseSubcategories

variable {T : Type u} [Category.{v} T] [Preadditive T] [Limits.HasZeroObject T]
  [HasShift T ℤ] [∀ n : ℤ, (shiftFunctor T n).Additive]
  [Pretriangulated T] [IsTriangulated T] [EssentiallySmall.{u} T]

/-- A strictly full dense triangulated subcategory is detected by its image in triangulated K₀
(§11.4, DenseClasses.membership_iff). -/
theorem DenseClasses.membership_iff (A : ObjectProperty T) [A.IsTriangulated]
    [A.IsClosedUnderIsomorphisms] [EssentiallySmall.{u} A.FullSubcategory]
    (hdense : A.retractClosure = ⊤) (X : T) :
    A X ↔ TauCeti.TriangulatedK0.of X ∈ (TauCeti.TriangulatedK0.map A.ι).range := sorry

/-- Subgroups of triangulated K₀ determine unique strictly full dense triangulated subcategories
by the classes of their objects (§11.4, DenseClasses.classification). -/
theorem DenseClasses.classification (H : AddSubgroup (TauCeti.TriangulatedK0 T)) :
    ∃! A : ObjectProperty T,
      A.IsTriangulated ∧ A.IsClosedUnderIsomorphisms ∧ A.retractClosure = ⊤ ∧
        ∀ X : T, A X ↔ TauCeti.TriangulatedK0.of X ∈ H := sorry

/-- Inclusion of a dense triangulated subcategory is injective on triangulated K₀
(§11.4, DenseClasses.map_injective). -/
theorem DenseClasses.map_injective (A : ObjectProperty T) [A.IsTriangulated]
    [EssentiallySmall.{u} A.FullSubcategory] (hdense : A.retractClosure = ⊤) :
    Function.Injective (TauCeti.TriangulatedK0.map A.ι) := sorry

end DenseSubcategories

/- ## Layer 1: Functor homotopies and boundary cases -/

/-- A natural transformation gives a homotopy, including when it is not invertible (§1.1). -/
theorem classifyingSpace_natTrans {C D : Type u} [Category.{u} C] [Category.{u} D]
    {F G : C ⥤ D} (α : F ⟶ G) :
    Nonempty (ContinuousMap.Homotopy (classifyingSpaceMap F) (classifyingSpaceMap G)) := sorry

/-- An equivalence realizes to a homotopy equivalence (§1.1). -/
theorem classifyingSpace_equivalence {C D : Type u} [Category.{u} C] [Category.{u} D]
    (e : C ≌ D) : Nonempty (classifyingSpace C ≃ₕ classifyingSpace D) := sorry

/-- Filteredness includes nonemptiness; the empty category is excluded (§1.1). -/
theorem classifyingSpace_filtered (C : Type u) [Category.{u} C] [IsFiltered C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- Finite-poset detection requires a nonempty target category (§1.1; Schlichting A.10). -/
theorem classifyingSpace_finitePosetDetection (C : Type u) [Category.{u} C] [Nonempty C]
    (h : ∀ (P : Type u) [PartialOrder P] [Finite P] (F : P ⥤ C),
      (classifyingSpaceMap F).Nullhomotopic) :
    ContractibleSpace (classifyingSpace C) := sorry

/-- The discrete one-object category has contractible realization (§1.1). -/
theorem classifyingSpace_point : ContractibleSpace (classifyingSpace (Discrete PUnit)) := sorry

/-- Two discrete objects retain distinct components after realization (§1.1). -/
theorem classifyingSpace_discreteTwo_not_contractible :
    ¬ ContractibleSpace (classifyingSpace (Discrete Bool)) := sorry

/-- The empty realization is not contractible (§1.1). -/
theorem classifyingSpace_empty_not_contractible :
    ¬ ContractibleSpace (classifyingSpace (Discrete PEmpty)) := sorry

/-- The initial endpoint of the interval category realizes as a homotopy equivalence (§1.1). -/
theorem classifyingSpace_initialEndpoint :
    ∃ e : classifyingSpace (Discrete PUnit) ≃ₕ classifyingSpace (Fin 2),
    e.toFun = classifyingSpaceMap ((Functor.const (Discrete PUnit)).obj (0 : Fin 2)) := sorry

/-- The terminal endpoint of the interval category realizes as a homotopy equivalence (§1.1). -/
theorem classifyingSpace_terminalEndpoint :
    ∃ e : classifyingSpace (Discrete PUnit) ≃ₕ classifyingSpace (Fin 2),
    e.toFun = classifyingSpaceMap ((Functor.const (Discrete PUnit)).obj (1 : Fin 2)) := sorry

/-- Realization preserves identity maps (§1.1). -/
theorem classifyingSpaceMap_id (C : Type u) [Category.{u} C] :
    classifyingSpaceMap (𝟭 C) = ContinuousMap.id (classifyingSpace C) := sorry

/-- Realization preserves composition of functors (§1.1). -/
theorem classifyingSpaceMap_comp {C D E : Type u}
    [Category.{u} C] [Category.{u} D] [Category.{u} E]
    (F : C ⥤ D) (G : D ⥤ E) :
    classifyingSpaceMap (F ⋙ G) =
      (classifyingSpaceMap G).comp (classifyingSpaceMap F) := sorry

/- ## Layer 1: The sphere interchange convention -/

/-- Interchanging spheres in integer degrees contributes this unit (§1.8). -/
def sphereInterchangeSign (i j : ℤ) : ℤˣ := (-1) ^ (i * j)

/- ## Layer 4: The relative-triple difference -/

/-- A relative triple has difference [P] − [Q], in that order (§4.15). -/
def relativeDifference {A : Type*} [AddCommGroup A] (source target : A) : A :=
  source - target

/- ## Layer 8: Boundary and clutching conventions -/

/-- Localization index is cokernel minus kernel (§8.11), opposite to a two-term Euler class. -/
def indexClass {A : Type*} [AddCommGroup A] (ker coker : A) : A := coker - ker

/-- The uniformizer-last boundary has this sign in positive degree n (§8.13). -/
def uniformizerLastSign (n : ℕ) : ℤˣ := (-1) ^ (n - 1)

/- ## Layer 9: Two-chart formulas -/

/-- Twisting uᵢ by n changes the gluing exponent to i − n (§9.1). -/
def twistExponent (i n : ℤ) : ℤ := i - n

/-- Plus-chart first Koszul map, x ↦ (tx,−x), for the pair (X₁,−X₀) (§9.2). -/
def koszulLeft {R : Type*} [Ring R] (t x : R) : R × R := (t * x, -x)

/-- Plus-chart second Koszul map, (a,b) ↦ a+tb, for (X₀,X₁) (§9.2). -/
def koszulRight {R : Type*} [Ring R] (t : R) (xy : R × R) : R := xy.1 + t * xy.2

/-- The specified two-chart Koszul maps compose to zero over any ring (§9.2). -/
theorem koszulRight_left {R : Type*} [Ring R] (t x : R) :
    koszulRight t (koszulLeft t x) = 0 := by
  simp [koszulRight, koszulLeft]

/-- The first Koszul chart map preserves zero (§9.2, koszulLeft_zero). -/
theorem koszulLeft_zero {R : Type*} [Ring R] (t : R) : koszulLeft t 0 = 0 := by
  simp [koszulLeft]

/-- The second Koszul chart map preserves zero (§9.2, koszulRight_zero). -/
theorem koszulRight_zero {R : Type*} [Ring R] (t : R) : koszulRight t 0 = 0 := by
  simp [koszulRight]

/- ## Layer 10: Diagonal and chart difference -/

/-- The two-chart map is a difference, so the diagonal lies in its kernel (§10.2). -/
def chartDifference {A : Type*} [AddCommGroup A] : (A × A) →+ A where
  toFun xy := xy.1 - xy.2
  map_zero' := by simp
  map_add' x y := by simp only [Prod.fst_add, Prod.snd_add]; abel

/- ## Layer 12: Completion and finite Euler conventions -/

/-- At an odd top support degree use the complementary idempotent (§12.6). -/
def topProjector {R : Type*} [Ring R] (n : ℕ) (p : R) : R :=
  if Even n then p else 1 - p

/-- Degree zero is positive in the two-term Euler convention (§12.6). -/
def twoTermEuler {A : Type*} [AddCommGroup A] (degreeZero degreeOne : A) : A :=
  degreeZero - degreeOne

/- ## Layer 13: Unitization and the Artin counterexample -/

/-- In unitization product coordinates the second component is diag(c,z), for R=ℤ (§13.3). -/
def cornerUnitizationSecond (z c : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![c,0;0,z]

/-
Full interfaces specified in README.md, using constructions developed there:
Layer 1: classifyingSpace_filteredColimit_pi;
HomotopyFibre as a supplied-carrier alias, with pathReversal/map/boundary/exact adapters;
bisimplicialRealization,
edgewiseSubdivision/homeomorph, isomorphismDoubleNerve, QuillenB and QuillenB_dual,
PlusConstruction/pi1/localHomology/map, MonoidalLocalization/action/pi0/cofinality,
MonoidalLocalization.actionFibration with its chosen object and pointed-action naturality,
kTheorySequentialComparison and kTheoryPairingComparison in the supplied stable category.
Layer 2: QSpan, qSpanSetoid, QCat/lift/op, qCategory, SmallExactModel,
qConstruction, kSpace, kGroup, kGroupAddCommGroup, twoEdgeLoop, pi1QEquivExactK0.
Layer 3: projBaseChange/projBaseChange_exact/projBaseChange_id/projBaseChange_comp/
projBaseChange_comm are left-projective adapters to AlgebraicKTheory's supplied
scalar extension. StableGL/stabilizeMatrix/stableElementaryMatrix/map,
stableElementary/stableElementary_perfect/stableElementary_eq_commutator,
classicalK1/unit and finiteGLBlockSum use its A1–A2 carriers and maps;
the finite block conjugations acquire coherent realization homotopies here.
RingKSpace/ringKMap, ringKGroup/map/zeroEquiv/oneEquiv retain the native exact K0
and compare to the supplied classical K1, with the classwise transpose adapter.
idempotentBaseChange, ExtQ/ExtCat/ExtFibre with actions and cartesian lifts,
plusEqualsQ, cofinalFreeComparison, k0Equiv/k1Equiv.
Layer 4: conflationExactStructure and its evaluation exactness,
additivity, resolutionSubcategory, resolution, devissage, LocalizationModel and serreLocalization,
RelativeTriple, ClassicalRelativeK0/difference/naturality,
ClassicalAdditiveK1/map/quillenEquiv/boundary, the relative five-term sequence.
Layers 5–6: WaldhausenCategory/ofExact, SConstruction/restrict/simplicial,
standardTwoStepFlag, KSpace/KGroup, iteratedS, AdditivityFibre, edgewiseQ,
relative S, CylinderFunctor, CofibrantPosetDiagram, IteratedCylinder,
classWeak and the approximation/fibration/cofinality comparisons;
ExactStructure.yonedaExactEmbedding, ExactStructure.k0CofinalCompletion,
gilletWaldhausen_general with intrinsic homotopy-acyclic weak maps and both cofibration classes.
Layer 7: BiexactSGrid, stable biexact pairings and coherence,
transfer and its Artin base-change formula.
Layer 8: relativeK/group/les/ofPair/waldhausen, nonunitalK/map/compare,
MilnorPatch/baseChange/reconstruct/boundary/inverse transport AlgebraicKTheory A6
by the inverse clutching parameter, with at least one surjective leg;
milnorK1_exact and milnorMayerVietoris compare its sequence with Q-theory.
Ideal K0 excision, AbsoluteExcision, TorUnital and the Tor criterion.
Layer 9: ProjectiveLine.Module/VectorBundle/KSpace/twist/u/koszul/map/directImage,
ProjectiveLine.IsRegular, P1.T0/Z0/T1/canonicalResolution/localisationModels/bundleLattices,
laurentTSection, NilCat/forget/zero,
nilGroup, torsion comparison and the positive Fundamental Theorem.
Layer 10: IsFlasqueRing, IsInfiniteSumRing, coneRing, contraction, IsAcyclic,
IsContracted, negativeK, NegativeKTheory, bassTheory, deloop, bassSpectrum;
noetherianRing_G0_polynomial, regularRing_K0_polynomial,
noetherianRing_G0_laurent and regularRing_K0_laurent with mixed-extension regularity.
Layer 11: FrobeniusPair/derived/map/ofExact/waldhausen, DenseClasses stable quotient with zero_iff/euler/quotientEquiv,
countableEnvelope, enlarge/suspension/setup/IK, IsExactSequence,
NegativeKSetup, IK0/negativeIK, FrobeniusReplacement and spectrum localization.
Layer 12: KaroubiFiltration/finiteIdeal/quotient, KaroubiCone/Suspension/Negative,
FiniteChainDomination, FiniteDomination.idempotent/finiteModel/modelEquivalence/euler,
restricted completion and KaroubiNegative_eq_negativeIK;
bassToFrobenius/bassToFrobenius_equivalence/bassToFrobenius_compatibility are the
natural Bass-to-Frobenius spectrum map, its equivalence and its polynomial,
Laurent, suspension and localization-boundary diagrams, with positive t boundary;
ExactStructure.unboundedDerivedCategory with its boundedness and Frobenius comparisons.
Layer 13: NonunitalBass/map/unitalEquiv, ArtinStableModel and its Cartan K-fibration,
enhanced derived invariance and integer-graded relative/transfer products;
finiteField_adamsInput, finiteGroup_KU_completion, finiteField_brauerLift,
finiteFieldKGroups, finiteField_K4_vanishing, ArtinStableModel.k3_pPrimary (p > 3).
-/

end TauCetiRoadmap.GeneralAlgebraicKTheory
