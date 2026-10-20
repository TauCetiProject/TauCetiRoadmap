import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic

/-!
# P-adic local Langlands for GL₂(ℚ_p): representative target signatures

The roadmap is README.md. This file records light definitions and milestone
signatures statable against the pinned APIs, and is not exhaustive. The matrix
coordinates fix Colmez's involution and mirabolic convention. The finite-length
milestone is stated over a finite residue field; the README separately specifies
the integral torsion version and the compact-category applications.
-/

namespace TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

open Matrix

noncomputable section

/-! ## Layer 1: Local coordinates and the Colmez normalisation -/

namespace GL2Qp

variable (p : ℕ) [Fact p.Prime]

/-- The group of invertible two-by-two matrices over ℚ_p. -/
abbrev Gp := Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]

/-- Membership in the upper triangular Borel, on the existing matrix carrier. -/
def InBorel (g : Gp p) : Prop := g 1 0 = 0

/-- Membership in Colmez's mirabolic subgroup, whose bottom row is (0,1). -/
def InMirabolic (g : Gp p) : Prop := g 1 0 = 0 ∧ g 1 1 = 1

/-- The positive mirabolic monoid uses integral entries and nonzero upper left entry. -/
def InMirabolicPlus (g : Gp p) : Prop :=
  InMirabolic p g ∧ ‖g 0 0‖ ≤ 1 ∧ ‖g 0 1‖ ≤ 1

/-- Scalar matrices, using Mathlib's group homomorphism. -/
abbrev scalar : ℚ_[p]ˣ →* Gp p := Matrix.GeneralLinearGroup.scalar (Fin 2)

/-- Colmez's Weyl involution is (0 1;1 0), including at the prime two. -/
def weylElement : Gp p :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, 1; 1, 0] (by simp [Matrix.det_fin_two])

/-- The upper unipotent matrix with translation parameter b. -/
def unipotent (b : ℚ_[p]) : Gp p :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, b; 0, 1] (by simp [Matrix.det_fin_two])

/-- The diagonal mirabolic element with nonzero scaling parameter a. -/
def diagonal (a : ℚ_[p]ˣ) : Gp p :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![(a : ℚ_[p]), 0; 0, 1]
    (by simp [Matrix.det_fin_two])

/-- A character is a continuous multiplicative map on the units of ℚ_p. -/
abbrev Character (Λ : Type*) [CommRing Λ] [TopologicalSpace Λ] :=
  ContinuousMonoidHom ℚ_[p]ˣ Λˣ

/-- Colmez's generators give the whole group, not just a dense subgroup. -/
theorem closure_mirabolic_center_weyl :
    Subgroup.closure ({g : Gp p | InMirabolic p g} ∪ Set.range (scalar p) ∪
      {weylElement p}) = ⊤ := by
  sorry

/-- The intersection of the mirabolic subgroup with scalar matrices is trivial. -/
theorem mirabolic_inf_center (a : ℚ_[p]ˣ) :
    InMirabolic p (scalar p a) ↔ a = 1 := by
  sorry

/-- The Weyl square fixes the central sign used when gluing the two charts. -/
example : weylElement p * weylElement p = 1 := by
  apply Units.ext
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [weylElement, Matrix.mul_apply, Fin.sum_univ_two]

/-- The second Bruhat chart cannot be identified with the upper triangular chart. -/
example : ¬ InBorel p (weylElement p) := by
  simp [InBorel, weylElement]

/-- Every affine translation belongs to the mirabolic group. -/
example (b : ℚ_[p]) : InMirabolic p (unipotent p b) := by
  simp [InMirabolic, unipotent]

/-- Translation by an integral parameter belongs to the positive monoid. -/
example (b : ℚ_[p]) (hb : ‖b‖ ≤ 1) : InMirabolicPlus p (unipotent p b) := by
  simpa [InMirabolicPlus, InMirabolic, unipotent] using hb

/-- A nonintegral scaling fails the positive-monoid condition. -/
example (a : ℚ_[p]ˣ) (ha : 1 < ‖(a : ℚ_[p])‖) :
    ¬ InMirabolicPlus p (diagonal p a) := by
  simpa [InMirabolicPlus, InMirabolic, diagonal] using (not_le.mpr ha)

/-- Every diagonal(a,1) is mirabolic; it is central exactly when a=1. -/
example (a : ℚ_[p]ˣ) : InMirabolic p (diagonal p a) := by
  simp [InMirabolic, diagonal]

/-- A scalar can never have a nontrivial mirabolic lower-right entry. -/
example (a : ℚ_[p]ˣ) : (scalar p a) 1 1 = a := by
  simp [scalar, Matrix.scalar]

/-- Affine translations compose by addition of their parameters. -/
theorem unipotent_mul (b c : ℚ_[p]) :
    unipotent p b * unipotent p c = unipotent p (b + c) := by
  apply Units.ext
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [unipotent, Matrix.mul_apply, Fin.sum_univ_two, add_comm]

/-- Diagonal mirabolic scalings compose by multiplication. -/
theorem diagonal_mul (a b : ℚ_[p]ˣ) :
    diagonal p a * diagonal p b = diagonal p (a * b) := by
  apply Units.ext
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [diagonal, Matrix.mul_apply, Fin.sum_univ_two]

/-- A nonintegral affine translation lies outside the positive monoid. -/
theorem unipotent_not_mem_mirabolicPlus (b : ℚ_[p]) (hb : 1 < ‖b‖) :
    ¬ InMirabolicPlus p (unipotent p b) := by
  simpa [InMirabolicPlus, InMirabolic, unipotent] using (not_le.mpr hb)

/-- Translation by the inverse of p lies outside the positive monoid. -/
theorem unipotent_inv_prime_not_mem_mirabolicPlus :
    ¬ InMirabolicPlus p (unipotent p (p : ℚ_[p])⁻¹) := by
  apply unipotent_not_mem_mirabolicPlus
  rw [norm_inv, Padic.norm_p, inv_inv]
  exact_mod_cast (Fact.out : p.Prime).one_lt

end GL2Qp

/-! ## Layer 2: Torsion, compact and unitary representations -/

namespace SmoothTorsion

variable {p : ℕ} [Fact p.Prime]
variable {k : Type*} [Field k] [Finite k] [CharP k p]
  [TopologicalSpace k] [DiscreteTopology k]

/-- The fixed central-character condition on the pinned topological carrier. -/
def HasCentralCharacter (ζ : GL2Qp.Character p k) (X : TopRep k (GL2Qp.Gp p)) : Prop :=
  ∀ (a : ℚ_[p]ˣ) (v : X), X.ρ (GL2Qp.scalar p a) v = (ζ a : k) • v

/-- Over the residue field, admissibility is finite-dimensional compact-open invariants.
This is the GL₂ specialisation of the smooth-representation admissibility criterion. -/
def IsAdmissible (X : TopRep k (GL2Qp.Gp p)) : Prop :=
  ∀ H : Subgroup (GL2Qp.Gp p), IsOpen (H : Set (GL2Qp.Gp p)) →
    IsCompact (H : Set (GL2Qp.Gp p)) → Module.Finite k (X.ρ.restrict H.subtype).invariants

/-- A nonzero vector detects a wrong scalar character. -/
example (ζ η : GL2Qp.Character p k) (X : TopRep k (GL2Qp.Gp p))
    (hζ : HasCentralCharacter ζ X) (a : ℚ_[p]ˣ) (v : X) (hv : v ≠ 0)
    (hne : (ζ a : k) ≠ (η a : k)) : ¬ HasCentralCharacter η X := by
  intro hη
  have h : ((ζ a : k) - (η a : k)) • v = 0 := by
    rw [sub_smul, ← hζ a v, ← hη a v, sub_self]
  exact (smul_eq_zero.mp h).elim (fun hzero => hne (sub_eq_zero.mp hzero)) hv

/-- Finite-dimensional representations satisfy the compact-open invariant test. -/
example (X : TopRep k (GL2Qp.Gp p)) [Module.Finite k X] : IsAdmissible X := by
  intro H _ _
  infer_instance

omit [Finite k] [CharP k p] [DiscreteTopology k] in
/-- The zero representation satisfies every fixed central-character equation. -/
theorem hasCentralCharacter_of_subsingleton
    (ζ : GL2Qp.Character p k) (X : TopRep k (GL2Qp.Gp p)) [Subsingleton X] :
    HasCentralCharacter ζ X := by
  intro a v
  exact Subsingleton.elim _ _

/-- A finitely generated admissible smooth GL₂(ℚ_p)-module has finite representation
length, including at p=2. This is not finite length as a k-vector space.
Source: Paškūnas 2013 §2, pp.14–15, with its Emerton input. -/
theorem finiteLength_of_finitelyGenerated_admissible
    (ζ : GL2Qp.Character p k) (X : TopRep k (GL2Qp.Gp p))
    (hsm : TauCeti.IsSmoothDiscrete k X)
    (hζ : HasCentralCharacter ζ X) (hadm : IsAdmissible X)
    (hfg : Module.Finite (MonoidAlgebra k (GL2Qp.Gp p)) X.ρ.toRepresentation.asModule) :
    IsFiniteLength (MonoidAlgebra k (GL2Qp.Gp p)) X.ρ.toRepresentation.asModule := by
  sorry

end SmoothTorsion

/-!
The README specifies the bundled GL2Qp.borel, mirabolic, mirabolicPlus and
maximalCompact refinements of the coordinate predicates, and PadicChar with its
Galois dictionary. PhiGammaModuleEt.tateDual, residuePairing, plusPart, natural and
sharp and PsiModule.boxtimesQp require the period-ring and topological carriers.
Trianguline.IsTrianguline and param specialise the saturated triangulation theory.

The GL2Qp.SmoothTorsionRep, DualCategory and pontryaginDual constructions,
algebraicVectors and algebraicType, universalUnitaryCompletion and IsHCoherent,
principalSeries, colmezPrincipalSeries and steinberg retain their full signatures
in the README. NormalizerType.serreWeight/iwahoriCharacter/normalizerRep record
the finite and normaliser classifications.
The general PhiGammaModuleEt.ofRep/toRep and RobbaRankOne carriers come from
the supplier contracts. The Banach and analytic carriers are targets of README §0.1.

BoxtimesP1, MontrealFunctor.D/V and PiOfD/ofRep require Colmez's gluing and
completion constructions. Reconstruction.betaQp/betaP1/contragredient,
FontaineHeart.heart/twistedHeart and Kirillov.compactPAlgebraic with its two
function maps, AnalyticBoxtimes.daggerSections/rigSections and
AnalyticPrincipalSeries with its specialSubrep/specialQuotient are likewise
specified there. LocAlgType.smoothFactor/algFactor and
HenniartType.sigma/sigmaCris/sigmaW encode the algebraic and type comparisons.
Block, ProjEnvelope.P/endRing, BlockPsRing.ring/universal, BMCycles.typeRing/cycle,
KisinRingLL.completion/ring and Admits.sigma/simply/type require the compact
categories, deformation rings and cycles. The differential-period and Drinfeld
tower comparisons, including DrinfeldComparison.completionFamily/functions/
differentials, are likewise README targets. Their full APIs and checks remain
there; no carrier is postulated in this file.

README-only coordinate APIs in §1.1 include GL2Qp.mem_mirabolic_iff,
GL2Qp.mirabolicPlus_mul_mem, GL2Qp.phi_mem_mirabolicPlus,
GL2Qp.unipotent_mem_mirabolicPlus, GL2Qp.weylElement_sq and
GL2Qp.weylElement_not_mem_borel. The proved examples above test these conventions.
The representation APIs and checks in §§2.1–2.3 are
GL2Qp.locallyAdmissible_grothendieck, GL2Qp.trivial_isLocallyFinite,
GL2Qp.compactInduction_not_isLocallyFinite, GL2Qp.principalSeries_finiteLength,
GL2Qp.smooth_compat, GL2Qp.steinberg_length_not_O_length,
GL2Qp.dual_isAdmissible_iff_fg, GL2Qp.exists_projectiveEnvelope,
GL2Qp.pontryaginDual_antiEquivalence, GL2Qp.pontryaginDual_trivial,
GL2Qp.pontryaginDual_zero, GL2Qp.pontryaginDual_dual and
GL2Qp.pontryaginDual_compactInduction_not_fg.
Sections 2.4–2.5 specify GL2Qp.algebraicVectors_decomposition,
GL2Qp.algebraicVectors_character, GL2Qp.algebraicVectors_le_analytic,
GL2Qp.algebraicVectors_principalSeries_nonalgebraic, GL2Qp.analyticVectors_dense,
GL2Qp.analyticVectors_exact, GL2Qp.analyticVectors_zero, GL2Qp.analytic_coherent,
GL2Qp.coherent_completion, GL2Qp.coherent_lattice_commensurable,
GL2Qp.universalUnitaryCompletion_trivial, GL2Qp.universalUnitaryCompletion_zero,
GL2Qp.universalUnitaryCompletion_nonunitary_central and
GL2Qp.universalUnitaryCompletion_analytic.
Section 2.6 specifies GL2Qp.principalSeries_centralChar,
GL2Qp.principalSeries_irreducible_iff, GL2Qp.principalSeries_twist,
GL2Qp.principalSeries_trivial_reducible, GL2Qp.principalSeries_dim_invariants,
GL2Qp.colmezPrincipalSeries_centralChar and GL2Qp.steinberg_not_character.
These are proposed README APIs, without declarations on unconstructed carriers.

-/

end

end TauCetiRoadmap.PadicLocalLanglandsForGL2Qp
