import Mathlib
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
import TauCeti.RingTheory.Idempotents.Projective

/-! # KTheoryLowDegrees: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It specializes the existing split
Grothendieck group, uses native matrix groups, and fixes finite-rank and Koszul
sign conventions. Coherent K-spaces, determinant groupoids and arithmetic completions
are specified in the README.
-/

namespace TauCetiRoadmap.KTheoryLowDegrees

open CategoryTheory
open scoped Pointwise

universe u

/-! ## Layer 1: projective classes and patching -/

/-- The existing full subcategory of finitely generated projective left modules. -/
abbrev FiniteProjectives (R : Type u) [Ring R] :=
  (TauCeti.finiteProjectiveModules R).FullSubcategory

/-- Ring K₀ is the existing split Grothendieck group of finite projectives. -/
abbrev RingK0 (R : Type u) [Ring R] :=
  TauCeti.SplitK0.{u} (FiniteProjectives R)

/-- The finite free object of the projective category, including rank zero. -/
def freeProjective (R : Type u) [Ring R] (n : ℕ) : FiniteProjectives R :=
  ⟨ModuleCat.of R (Fin n → R), ⟨inferInstance, inferInstance⟩⟩

/-- The class of a projective object in the categorical split K₀ specialization. -/
noncomputable def projectiveClass {R : Type u} [Ring R]
    (P : FiniteProjectives R) : RingK0 R :=
  TauCeti.SplitK0.of P

/-- Every virtual class is one projective class minus a finite free class
(Weibel II.2, Lemma 2.1, p. 68). -/
theorem exists_projective_sub_free {R : Type u} [Ring R] (x : RingK0 R) :
    ∃ (P : FiniteProjectives R) (n : ℕ),
      x = projectiveClass P - projectiveClass (freeProjective R n) := by
  sorry

/-- The stable-equality criterion of ClassicalArithmeticCompletion §§7.6–7.7 and 7.23,
specialized to the finite-projective class notation used here. -/
theorem projectiveClass_eq_iff_stableFreeSum {R : Type u} [Ring R]
    (P Q : FiniteProjectives R) :
    projectiveClass P = projectiveClass Q ↔
      ∃ n : ℕ, Nonempty ((P.obj × (Fin n → R)) ≃ₗ[R] (Q.obj × (Fin n → R))) := by
  sorry

/-- Rank-zero free modules have zero class, including over the zero ring. -/
theorem projectiveClass_free_zero (R : Type u) [Ring R] :
    projectiveClass (freeProjective R 0) = 0 := by
  sorry

/-! ## Layer 2: locally constant rank and its kernel -/

/-- The additive specialization of SchemeKTheoryOperations §6.2.4's rank section,
transported through the affine comparison. It applies without connectedness or a
nonzero-ring assumption (Weibel II.2, pp. 71–72). -/
theorem rank_exists_split (R : Type u) [CommRing R] :
    ∃ (ρ : RingK0 R →+ LocallyConstant (PrimeSpectrum R) ℤ)
      (σ : LocallyConstant (PrimeSpectrum R) ℤ →+ RingK0 R),
      (∀ (P : FiniteProjectives R) (p : PrimeSpectrum R),
        ρ (projectiveClass P) p = (Module.rankAtStalk P.obj p : ℤ)) ∧
      (∀ f, ρ (σ f) = f) := by
  sorry

/-- The finite image of the native stalk-rank function, using compactness of Spec R. -/
noncomputable def rankFibres {R : Type u} [CommRing R] (P : FiniteProjectives R) :
    Finset ℕ := by
  letI : Module.FinitePresentation R P.obj := Module.finitePresentation_of_projective R P.obj
  exact (Module.isLocallyConstant_rankAtStalk (R := R) (M := P.obj)).range_finite.toFinset

/-- A finite free module has singleton rank-image on every nonempty affine spectrum. -/
theorem rankFibres_free (R : Type u) [CommRing R] [Nontrivial R] (n : ℕ) :
    rankFibres (freeProjective R n) = {n} := by
  sorry

/-- The projective R ⊕ R(0,1) over R = ℚ × ℚ has component ranks one and two. -/
noncomputable def twoRankProjective : FiniteProjectives (ℚ × ℚ) := by
  letI : Module.Projective (ℚ × ℚ) (Ideal.span {((0, 1) : ℚ × ℚ)} : Ideal (ℚ × ℚ)) :=
    (show IsIdempotentElem ((0, 1) : ℚ × ℚ) from by
      change ((0 : ℚ) * 0, (1 : ℚ) * 1) = (0, 1)
      norm_num).projective_span_singleton
  exact ⟨ModuleCat.of (ℚ × ℚ)
    ((ℚ × ℚ) × (Ideal.span {((0, 1) : ℚ × ℚ)} : Ideal (ℚ × ℚ))),
    ⟨inferInstance, inferInstance⟩⟩

/-- The concrete disconnected projective realizes two distinct stalk ranks. -/
theorem rankFibres_twoRanks : rankFibres twoRankProjective = {1, 2} := by
  sorry

/-- The zero projective has rank-image {0} on every nonempty affine spectrum. -/
theorem rankFibres_zero_nontrivial (R : Type u) [CommRing R] [Nontrivial R] :
    rankFibres (freeProjective R 0) = {0} := by
  sorry

/-- A zero ring has empty spectrum, hence an empty rank-image even for the zero module. -/
theorem rankFibres_zeroRing (R : Type u) [CommRing R] [Subsingleton R] :
    rankFibres (freeProjective R 0) = ∅ := by
  sorry

/-! ## Layer 5: Dedekind domains, ideal classes and transfer -/

/-- An invertible module regarded as an object of the existing projective category. -/
noncomputable def lineProjective (R : Type u) [CommRing R] (L : CommRing.Pic R) :
    FiniteProjectives R :=
  ⟨ModuleCat.of R L, ⟨inferInstance, inferInstance⟩⟩

/-- The finite-projective-to-lattice comparison transports ClassicalArithmeticCompletion
§7.0 to positive-rank projectives, identifying the Steinitz line with the determinant.
The nonzero hypothesis excludes the zero projective (Weibel I.3, pp. 18–20). -/
theorem steinitz_decomposition {R : Type u} [CommRing R]
    [IsDedekindDomain R] (P : FiniteProjectives R) [Nontrivial P.obj] :
    ∃ (n : ℕ) (L : CommRing.Pic R),
      Nonempty (P.obj ≃ₗ[R] ((Fin n → R) × L)) := by
  sorry

/-- The normalized additive rank–Picard classification, including arbitrary virtual ranks. -/
theorem rank_pic_equiv_exists (R : Type u) [CommRing R]
    [IsDedekindDomain R] :
    ∃ e : RingK0 R ≃+ (ℤ × Additive (CommRing.Pic R)),
      (∀ n : ℕ, e (projectiveClass (freeProjective R n)) = ((n : ℤ), 0)) ∧
      (∀ L : CommRing.Pic R,
        e (projectiveClass (lineProjective R L)) = (1, Additive.ofMul L)) := by
  sorry

/-- The supplied lattice rank/class criterion cancels a finite-projective stabilizer
after the lattice–determinant comparison, including rank zero. -/
theorem projective_cancellation {R : Type u} [CommRing R]
    [IsDedekindDomain R] (P Q T : FiniteProjectives R)
    (h : Nonempty ((P.obj × T.obj) ≃ₗ[R] (Q.obj × T.obj))) :
    Nonempty (P.obj ≃ₗ[R] Q.obj) := by
  sorry

/-! ## Layer 6: finite matrices and stable representatives -/

/-- Finite-rank elementary matrices generate a subgroup of the native general linear group.
The generators have distinct row and column indices. -/
def finiteElementaryGroup (R : Type u) [Ring R] (n : ℕ) :
    Subgroup (Matrix.GeneralLinearGroup (Fin n) R) :=
  Subgroup.closure {g | ∃ (i j : Fin n) (a : R), i ≠ j ∧
    (g : Matrix (Fin n) (Fin n) R) = 1 + Matrix.single i j a}

/-- With only one index there are no elementary generators, even when GL₁ is nontrivial. -/
example (R : Type u) [Ring R] : finiteElementaryGroup R 1 = ⊥ := by
  have h : {g : Matrix.GeneralLinearGroup (Fin 1) R |
      ∃ (i j : Fin 1) (a : R), i ≠ j ∧
        (g : Matrix (Fin 1) (Fin 1) R) = 1 + Matrix.single i j a} = ∅ := by
    ext g
    simp
  simp only [finiteElementaryGroup, h, Subgroup.closure_empty]

/-- The integral rank-two elementary group contains a nonidentity transvection. -/
example : ∃ g ∈ finiteElementaryGroup ℤ 2, g ≠ 1 := by
  let g : Matrix.GeneralLinearGroup (Fin 2) ℤ :=
    Matrix.GeneralLinearGroup.mk'' (Matrix.transvection 0 1 1) (by simp)
  refine ⟨g, Subgroup.subset_closure ⟨0, 1, 1, by decide, rfl⟩, ?_⟩
  intro h
  have hentry := congrArg (fun u : Matrix.GeneralLinearGroup (Fin 2) ℤ =>
    (u : Matrix (Fin 2) (Fin 2) ℤ) 0 1) h
  norm_num [g, Matrix.transvection] at hentry

/-- Whitehead's block matrix is elementary already in rank 2n, over any unital ring.
The displayed matrix fixes the contiguous block order (Weibel III.1.3, pp. 182–183). -/
theorem finite_whitehead_block {R : Type u} [Ring R] (n : ℕ)
    (g : Matrix.GeneralLinearGroup (Fin n) R) :
    ∃ h ∈ finiteElementaryGroup R (n + n),
      (h : Matrix (Fin (n + n)) (Fin (n + n)) R) =
        Matrix.reindex (finSumFinEquiv) (finSumFinEquiv)
          (Matrix.fromBlocks (g : Matrix (Fin n) (Fin n) R) 0 0
            ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) R) : Matrix (Fin n) (Fin n) R)) := by
  sorry

/-- The opposite-root commutator retains the negative sign and coefficient order ba
for arbitrary associative rings (Weibel III.1.3, equation (1.3.1), p. 182). -/
theorem finiteElementary_commutator {R : Type u} [Ring R] (n : ℕ)
    (i j k : Fin n) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (a b : R) :
    (1 + Matrix.single i j a) * (1 + Matrix.single k i b) *
        (1 - Matrix.single i j a) * (1 - Matrix.single k i b) =
      (1 + Matrix.single k j (-(b * a)) : Matrix (Fin n) (Fin n) R) := by
  sorry

/-- Rank zero has no elementary roots, including over the zero ring. -/
theorem finiteElementaryGroup_zero (R : Type u) [Ring R] :
    finiteElementaryGroup R 0 = ⊥ := by
  sorry

/-- Every finite elementary group over a zero ring is trivial. -/
theorem finiteElementaryGroup_zeroRing (R : Type u) [Ring R] [Subsingleton R] (n : ℕ) :
    finiteElementaryGroup R n = ⊥ := by
  sorry

/-- The rank-two elementary group over 𝔽₂ is not perfect, unlike stable E. -/
theorem finiteElementaryGroup_F2_not_perfect :
    ¬ Group.IsPerfect (finiteElementaryGroup (ZMod 2) 2) := by
  sorry

/-! ## Layer 8: determinants, stable range and a nontrivial circle class -/

/-- Bass stable range in the left-column convention: shorten every unimodular column
of length greater than n by adding left multiples of its last entry. -/
def HasStableRange (R : Type u) [Ring R] (n : ℕ) : Prop :=
  1 ≤ n ∧ ∀ (r : ℕ), n ≤ r → ∀ a : Fin (r + 1) → R,
    Ideal.span (Set.range a) = ⊤ →
      ∃ b : Fin r → R,
        Ideal.span (Set.range (fun i : Fin r =>
          a i.castSucc + b i * a (Fin.last r))) = ⊤

/-- SchemeKTheoryOperations §3.6's semilocal shortening theorem gives stable range one
in the left-column predicate (BMS §7, pp. 106–107). -/
theorem stableRange_semilocal (R : Type u) [CommRing R] [Finite (MaximalSpectrum R)] :
    HasStableRange R 1 := by
  sorry

/-- Bass's noetherian dimension bound, with the finite bound stated explicitly. -/
theorem stableRange_noetherian_dimension (R : Type u) [CommRing R] [IsNoetherianRing R]
    (d : ℕ) (hd : ringKrullDim R ≤ d) : HasStableRange R (d + 1) := by
  sorry

/-- Dedekind domains have stable range at most two, including fields. -/
theorem stableRange_dedekind (R : Type u) [CommRing R]
    [IsDedekindDomain R] : HasStableRange R 2 := by
  sorry

/-- The bound two over ℤ cannot be replaced by one: the unimodular pair (2,5)
cannot be shortened to a unit 2+5b. -/
theorem integers_not_stableRange_one : ¬ HasStableRange ℤ 1 := by
  sorry

/-- Euclidean division gives elementary generation in every positive finite rank;
this generalizes the supplied field and integer results (Weibel III.1, Ex. 1.5, p. 190). -/
theorem euclidean_elementary_generation (R : Type u) [EuclideanDomain R]
    (n : ℕ) (hn : 1 ≤ n) (g : Matrix.GeneralLinearGroup (Fin n) R)
    (hg : Matrix.GeneralLinearGroup.det g = 1) :
    g ∈ finiteElementaryGroup R n := by
  sorry

/-- Size zero cannot satisfy the positive-rank surjectivity claim for the determinant:
the only empty matrix has determinant one, whereas −1 is a distinct rational unit. -/
theorem sizeZero_det_not_surjective :
    ¬ Function.Surjective
      (Matrix.GeneralLinearGroup.det : Matrix.GeneralLinearGroup (Fin 0) ℚ →* ℚˣ) := by
  sorry

/-! ## Layer 11: arithmetic finite generation -/

/-- A finite overlap set for an open translate cover of a connected space gives
finite generation (Morris, Proposition 4.7.4, pp. 61–62). -/
theorem coarseFundamentalDomain_finitelyGenerated
    (G X : Type*) [Group G] [TopologicalSpace X] [ConnectedSpace X]
    [MulAction G X] [ContinuousConstSMul G X] (U : Set X) (hU : IsOpen U)
    (hcover : ∀ x : X, ∃ g : G, x ∈ g • U)
    (hoverlap : Set.Finite {g : G | ((g • U) ∩ U).Nonempty}) :
    Group.FG G := by
  sorry

/-! ## Layer 14: graded determinants and Witt support -/

/-- The Koszul sign uses integer powers in the unit group, including negative grades. -/
def koszulSign (R : Type u) [CommRing R] (a b : ℤ) : Rˣ :=
  (-1 : Rˣ) ^ (a * b)

/-- A negative odd grade and a positive odd grade still produce a minus sign. -/
example : koszulSign ℤ (-1) 1 = -1 := by
  norm_num [koszulSign]

/-- In characteristic two the odd–odd Koszul sign is the identity unit. -/
example : koszulSign (ZMod 2) 1 1 = 1 := by
  apply Units.ext
  norm_num [koszulSign]

/-- The Koszul sign is additive in a grade, which supplies the signed hexagon. -/
theorem koszulSign_add_left (R : Type u) [CommRing R] (a b c : ℤ) :
    koszulSign R (a + b) c = koszulSign R a c * koszulSign R b c := by
  sorry

/-
The README also specifies FreeSummandData, IdempotentPresentation,
imageIdempotent, StableIdempotent, zeroPad and conjugate;
matrixRingK0Equiv,
the opposite-transpose patching comparisons, rank, rankSection, ReducedK0,
clopenModule and componentwiseFree;
the ordered exterior-sum and determinant comparisons with the supplied
TauCeti.LambdaRing and TauCeti.RepresentationRing operations;
picardClassDifference, dedekindRankPicEquiv, projectiveLatticeComparison, projectiveLattice_steinitz_det,
dedekindK0Localization, dedekindTransferCoordinates, lineMapIndexIdeal and Picard norm;
finite-representative equality and block-sum class formulas, matrixRingK1Equiv, matrixClass, unitsToK1,
projectiveAutClass, rightModuleEnd, the supplied Bass presentation comparison,
projectiveTensorK1Action, transfer comparisons, SpecialK1, DieudonneDet, circleEvaluation
and specialLinear_QR_deformation;
RelativeGL, RelativeK1, RelativeUnits and relative K₀ opposite-side comparisons;
MennickePairs, IsMennickeSymbol, UniversalMennicke, firstRowPair, specialK1Symbol,
kubotaValue, kubotaHom, RelativeUnimodularColumn, OrientedRelated,
ExtensionConditions, StandardForm, standardFormValue, extendedValue,
MultiplierSubgroup, ValueConjugationStabilizer, reflectedTranspose, extendedHom,
FiniteLevelDefect, arithmeticSymbol, defectExponent, defectOrder, CongruenceCompletion,
LatticeCongruenceKernel, SerreElementary and RelativeCentralExtension;
curveDivisorClassToK0, rankDegree, the Euler/Cartan and transfer comparisons, congruenceLoop,
relativeK1PlusEquiv, Steinberg, steinbergProjection, SteinbergK2,
the normalized inverse lifted-word boundary and double comparisons;
GradedLine, projectiveGradedDet, projectiveGroupCompletion_spectrumComparison,
projectiveLoopClass, ringSpectrumDet,
schemeSpectrumDet, integerGradedDet_parityComparison and wittSupportedDet.

-/

end TauCetiRoadmap.KTheoryLowDegrees
