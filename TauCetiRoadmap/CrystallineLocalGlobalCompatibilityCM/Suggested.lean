import Mathlib
import TauCeti.RingTheory.Ideal.ArtinRees

/-!
# CrystallineLocalGlobalCompatibilityCM: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. README.md is
the definitive roadmap. This file records light definitions and representative
milestone signatures statable against the pinned Mathlib and Tau Ceti APIs; it is
not exhaustive. Integral dual-Weyl coefficients, smooth derived ordinary parts,
arithmetic towers and automorphic Galois representations have their full targets
and supplier contracts in the README.

The formulas distinguish Siegel block exchange from full reversal, descending
central exponents from nonnegative exponents, and inverse scalar rescaling from
raw action. The Artin–Rees comparison retains the chosen submodule and its
natural quotient square. The degree bound includes odd dimensions. The finite
determinant-kernel criterion retains the cubic tetrahedral exception.
-/

open scoped BigOperators

noncomputable section

namespace TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM
namespace CrystallineCM

/-! ## Layer 0: Siegel parahorics and integral coefficient actions -/

#check finAddFlip

/-- Block exchange conjugates the two diagonal Levi blocks; README §0.1, CN §2.1.11, p.17. -/
theorem WeylElements_levi_conjugation {R : Type*} [CommRing R] (n : ℕ)
    (A D : Matrix (Fin n) (Fin n) R) :
    Equiv.Perm.permMatrix R (finAddFlip (m := n) (n := n)) *
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks A 0 0 D) *
      Equiv.Perm.permMatrix R (finAddFlip (m := n) (n := n)) =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks D 0 0 A) := by
  sorry

/-- Positive block-central cocharacters have descending integral exponents.
Negative scalar shifts are allowed; CN §2.1.13, p.19. -/
def PositiveCentralCocharacters (t : ℕ) : AddSubmonoid (Fin t → ℤ) where
  carrier := {a | Antitone a}
  zero_mem' := by
    intro i j hij
    simp
  add_mem' := by
    intro a b ha hb i j hij
    exact add_le_add (ha hij) (hb hij)

/-- The single-embedding torus value of the lowest-weight scaling character.
The full character multiplies these factors over embeddings and extends from
the torus to the positive monoid; CN §2.1.13, pp.20–21. -/
def lowestWeightScalar {E : Type*} [Field E] {r : ℕ}
    (π : Eˣ) (lam nu : Fin r → ℤ) : Eˣ :=
  π ^ (∑ i, lam i.rev * nu i)

/-- Rescale an existing representation by the inverse of its scalar character.
This fixes the normalization; the integral lattice is a separate arithmetic
input in CN Lemma 2.1.17, p.20. -/
def RescaledActions {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V)
    (α : G →* Eˣ) : Representation E G V where
  toFun g := ((α g)⁻¹ : Eˣ).val • ρ g
  map_one' := by simp
  map_mul' := by
    intro g h
    simp [mul_smul]

/-- Evaluation of the inverse-character rescaling; README §0.9. -/
theorem RescaledActions_apply {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V)
    (α : G →* Eˣ) (g : G) (x : V) :
    RescaledActions ρ α g x = ((α g)⁻¹ : Eˣ).val • ρ g x := by
  sorry

/-- A common scalar rescaling preserves coefficient intertwiners; README §0.9. -/
theorem RescaledActions_intertwiner {E G V W : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] [AddCommGroup W] [Module E W]
    (ρ : Representation E G V) (σ : Representation E G W)
    (α : G →* Eˣ) (f : Representation.IntertwiningMap ρ σ) :
    Representation.IsIntertwiningMap (RescaledActions ρ α) (RescaledActions σ α)
      f.toLinearMap := by
  sorry

example {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) : RescaledActions ρ (1 : G →* Eˣ) = ρ := by
  ext g x
  simp [RescaledActions]

example {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) (α : G →* Eˣ) (g : G) (x : V)
    (hρ : ρ g x = (α g : E) • x) : RescaledActions ρ α g x = x := by
  simp [RescaledActions, hρ, smul_smul]

/-! ## Layer 3: Artin–Rees coefficient control -/

#check TauCeti.ArtinRees.exists_controlled_lift

/-- The actual image of a chosen submodule in the ambient p-power quotient. -/
abbrev adicSubmoduleImage (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) (e : ℕ) :=
  ((((Ideal.span {(p : ℤ_[p])}) ^ e) • (⊤ : Submodule ℤ_[p] N)).mkQ.comp
    N'.subtype).range

/-- The canonical surjection onto the ambient quotient image. -/
abbrev adicSubmoduleImageMap (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) (e : ℕ) :
    N' →ₗ[ℤ_[p]] adicSubmoduleImage p N' e :=
  ((((Ideal.span {(p : ℤ_[p])}) ^ e) • (⊤ : Submodule ℤ_[p] N)).mkQ.comp
    N'.subtype).rangeRestrict

/-- One Artin–Rees shift works for every quotient of the chosen submodule and
every positive coefficient depth, with the natural comparison square.
This is the coefficient-control milestone of README §3.6, CN Lemma 2.3.18, p.43. -/
theorem subquotient_mod_p_pow_uniform (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N] [Module.Finite ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) :
    ∃ k₀ : ℕ, ∀ {M : Type*} [AddCommGroup M] [Module ℤ_[p] M]
      (f : N' →ₗ[ℤ_[p]] M), Function.Surjective f → ∀ m : ℕ, 1 ≤ m →
      ∃ g : adicSubmoduleImage p N' (m + k₀) →ₗ[ℤ_[p]]
        (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))),
      Function.Surjective g ∧
        g.comp (adicSubmoduleImageMap p N' (m + k₀)) =
          (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f := by
  sorry

/-- The proper submodule pZ_p has zero ambient depth-one image, so its
intrinsic mod-p quotient admits no natural comparison; README §3.6. -/
theorem subquotient_mod_p_pow_test_depth_one (p : ℕ) [Fact p.Prime] :
    let N' : Submodule ℤ_[p] ℤ_[p] := Ideal.span {(p : ℤ_[p])}
    ¬ ∃ g : adicSubmoduleImage p N' 1 →ₗ[ℤ_[p]]
      (N' ⧸ ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N'))),
      g.comp (adicSubmoduleImageMap p N' 1) =
        ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N')).mkQ := by
  sorry

/-- Ambient depth two recovers the intrinsic mod-p quotient of pZ_p
with its natural comparison square; README §3.6. -/
theorem subquotient_mod_p_pow_test_depth_two (p : ℕ) [Fact p.Prime] :
    let N' : Submodule ℤ_[p] ℤ_[p] := Ideal.span {(p : ℤ_[p])}
    ∃ g : adicSubmoduleImage p N' 2 →ₗ[ℤ_[p]]
      (N' ⧸ ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N'))),
      Function.Bijective g ∧
        g.comp (adicSubmoduleImageMap p N' 2) =
          ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N')).mkQ := by
  sorry

/-! ## Layer 6: Degree shifting and nilpotent Hecke comparisons -/

/-- The complementary local degree bound reaches unitary middle degree,
including odd total dimension; README §6.3, CN Lemma 4.2.5, p.62. -/
theorem degree_shift_bound (n D r q : ℕ)
    (hr : D ≤ 2 * r) (hq : n ^ 2 * D / 2 ≤ q) :
    n ^ 2 * D - q ≤ n ^ 2 * r := by
  sorry

/-! ## Layer 9: Barsotti–Tate automorphy lifting and solvable descent -/

/-- The projective matrix image, with precisely the ambient scalar kernel. -/
abbrev projectiveMatrixImage {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) :=
  (Matrix.ProjGenLinGroup.mk.comp ρ).range

/-- Reducibility on the determinant kernel means that it preserves a line. -/
def determinantKernelHasLine {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  ∃ W : Submodule K (Fin 2 → K), Module.finrank K W = 1 ∧
    ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) = 1 →
      ∀ v ∈ W, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec v ∈ W

/-- The trace-square condition gives a determinant-kernel line except for
determinant order three with tetrahedral projective image. In that case the
kernel has Klein-four projective image and no invariant line; the qualified
form of CN Lemma 5.6.5, pp.85–86 (README §9.2). -/
theorem determinant_kernel_reducible_except_tetrahedral
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {K G : Type*}
    [Field K] [IsAlgClosed K] [CharP K p] [Group G] [Finite G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K)
    (hd : 1 < Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range)
    (htrace : ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) ≠ 1 →
      Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) K) ^ 2 =
        (1 + (Matrix.GeneralLinearGroup.det (ρ g) : K)) ^ 2) :
    determinantKernelHasLine ρ ∨
      (Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range = 3 ∧
        Nonempty (projectiveMatrixImage ρ ≃* alternatingGroup (Fin 4)) ∧
        ¬ determinantKernelHasLine ρ ∧
        Nonempty (projectiveMatrixImage
          (ρ.comp (Matrix.GeneralLinearGroup.det.comp ρ).ker.subtype) ≃*
            Multiplicative (ZMod 2 × ZMod 2))) := by
  sorry

/-- The characteristic-seven quaternion generators have no common eigenline
after any coefficient extension of characteristic seven; README §9.2. -/
theorem quaternion_no_common_eigenline {K : Type*} [Field K] [CharP K 7] :
    ¬ ∃ v : Fin 2 → K, v ≠ 0 ∧ ∃ a b : K,
      (!![0, 1; -1, 0] : Matrix (Fin 2) (Fin 2) K).mulVec v = a • v ∧
      (!![2, 3; 3, -2] : Matrix (Fin 2) (Fin 2) K).mulVec v = b • v := by
  sorry

/-- The GL₄ block partition for the chosen potentially semistable branches.
The orientation policy requires stᶜ ≤ st; CN Proposition 5.6.1, p.83. -/
def preparedUnitaryPartition (st stc : Bool) : List ℕ :=
  if st then (if stc then [1, 1, 1, 1] else [2, 1, 1]) else [2, 2]

/-
The following targets are stated in README.md; their arithmetic carriers and
full hypotheses are specified there. The API names below are README targets,
not additional Lean declarations.

0.2 Surjectivity of evaluation at the identity
  CrystallineCM.coefficient_evaluation_surjective

0.3 Parahoric levels P_{v̄}(b,c), Q_{v̄}, the operators Ũ and the monoids Δ̃
  CrystallineCM.ParahoricPVBC
  CrystallineCM.ParahoricPVBC_antitone_depth
  CrystallineCM.ParahoricPVBC_levi_quotient
  CrystallineCM.ParahoricPVBC_mem_iff
  CrystallineCM.ParahoricPVBC_test_b_zero
  CrystallineCM.ParahoricPVBC_test_diagonal_not_unipotent
  CrystallineCM.ParahoricPVBC_test_n_one

0.4 The eigenvalue of U_v on localized cohomology
  CrystallineCM.residual_central_hecke_eigenvalue

0.5 Positive central cocharacters
  CrystallineCM.PositiveCentralCocharacters_add
  CrystallineCM.PositiveCentralCocharacters_mem_iff
  CrystallineCM.PositiveCentralCocharacters_partial
  CrystallineCM.PositiveCentralCocharacters_test_central_scalar
  CrystallineCM.PositiveCentralCocharacters_test_root_pairing
  CrystallineCM.PositiveCentralCocharacters_test_two_blocks

0.6 Positive parahoric monoid
  CrystallineCM.PositiveParahoricMonoid
  CrystallineCM.PositiveParahoricMonoid_double_coset
  CrystallineCM.PositiveParahoricMonoid_levi_intersection
  CrystallineCM.PositiveParahoricMonoid_localization
  CrystallineCM.PositiveParahoricMonoid_test_identity
  CrystallineCM.PositiveParahoricMonoid_test_negative_central
  CrystallineCM.PositiveParahoricMonoid_test_partial_inverse

0.7 Positivity, monoid property and Hecke algebra isomorphism for Δ̃^Q
  CrystallineCM.positive_parahoric_hecke_iso

0.8 Lowest-weight scaling character
  CrystallineCM.LowestWeightScalingCharacter
  CrystallineCM.LowestWeightScalingCharacter_cocharacter
  CrystallineCM.LowestWeightScalingCharacter_compact
  CrystallineCM.LowestWeightScalingCharacter_mul
  CrystallineCM.LowestWeightScalingCharacter_test_compact_value
  CrystallineCM.LowestWeightScalingCharacter_test_distinct_weyl
  CrystallineCM.LowestWeightScalingCharacter_test_rank_one
  CrystallineCM.LowestWeightScalingCharacter_test_zero_weight

0.9 Rescaled actions of the monoids on coefficient lattices
  CrystallineCM.RescaledActions_one_mul
  CrystallineCM.RescaledActions_test_inverse_required
  CrystallineCM.RescaledActions_test_scalar
  CrystallineCM.RescaledActions_test_trivial_character

0.10 Stability of the lattice under the rescaled monoid action
  CrystallineCM.rescaled_lattice_stable

1.1 P-ordinary part of finite-level cohomology
  CrystallineCM.POrdinaryFiniteLevel
  CrystallineCM.POrdinaryFiniteLevel_cohomology
  CrystallineCM.POrdinaryFiniteLevel_idempotent
  CrystallineCM.POrdinaryFiniteLevel_pullback
  CrystallineCM.POrdinaryFiniteLevel_test_mixed
  CrystallineCM.POrdinaryFiniteLevel_test_unit
  CrystallineCM.POrdinaryFiniteLevel_test_zero

1.2 Unipotent transfer action
  CrystallineCM.UnipotentTransferAction
  CrystallineCM.UnipotentTransferAction_compact
  CrystallineCM.UnipotentTransferAction_independent
  CrystallineCM.UnipotentTransferAction_intertwiner
  CrystallineCM.UnipotentTransferAction_mul
  CrystallineCM.UnipotentTransferAction_test_index_p
  CrystallineCM.UnipotentTransferAction_test_not_raw
  CrystallineCM.UnipotentTransferAction_test_trivial_u

1.3 Ordinary monoid localization
  CrystallineCM.OrdinaryMonoidLocalization
  CrystallineCM.OrdinaryMonoidLocalization_cohomology
  CrystallineCM.OrdinaryMonoidLocalization_test_finite
  CrystallineCM.OrdinaryMonoidLocalization_test_id
  CrystallineCM.OrdinaryMonoidLocalization_test_nilpotent
  CrystallineCM.OrdinaryMonoidLocalization_unit
  CrystallineCM.OrdinaryMonoidLocalization_universal

1.4 Functors of P-ordinary parts of smooth representations
  CrystallineCM.POrdinaryFunctors
  CrystallineCM.POrdinaryFunctors_comparison
  CrystallineCM.POrdinaryFunctors_degree_zero
  CrystallineCM.POrdinaryFunctors_derived_action
  CrystallineCM.POrdinaryFunctors_test_degree_zero
  CrystallineCM.POrdinaryFunctors_test_derived_transfer
  CrystallineCM.POrdinaryFunctors_test_nilpotent
  CrystallineCM.POrdinaryFunctors_test_trivial_u

1.5 Ordinary parts commute with K(b)-invariants
  CrystallineCM.ordinary_commutes_compact_invariants

1.6 P-ordinary invariants at level P(b,c)
  CrystallineCM.ordinary_parahoric_invariants

1.7 P-ordinary completed cohomology
  CrystallineCM.POrdinaryCompleted
  CrystallineCM.POrdinaryCompleted_boundary
  CrystallineCM.POrdinaryCompleted_sections
  CrystallineCM.POrdinaryCompleted_tame
  CrystallineCM.POrdinaryCompleted_test_boundary
  CrystallineCM.POrdinaryCompleted_test_empty_places
  CrystallineCM.POrdinaryCompleted_test_level_recovery

1.8 P-ordinary parts at parahoric level Q
  CrystallineCM.ParahoricVariant
  CrystallineCM.ParahoricVariant_hecke
  CrystallineCM.ParahoricVariant_invariants
  CrystallineCM.ParahoricVariant_siegel
  CrystallineCM.ParahoricVariant_test_finite_level
  CrystallineCM.ParahoricVariant_test_not_full_qord
  CrystallineCM.ParahoricVariant_test_siegel

1.9 Derived comparison of P-ordinary parts at finite level
  CrystallineCM.derived_ordinary_level_comparison

1.10 Finite-level P-ordinary cohomology from completed cohomology
  CrystallineCM.completed_ordinary_finite_level

1.11 Boundary version of the P-ordinary comparison
  CrystallineCM.completed_boundary_ordinary_finite_level

1.12 P-ordinary parts at parahoric level with their Hecke actions
  CrystallineCM.ordinary_parahoric_hecke_comparison

1.13 Independence of level for P-ordinary cohomology
  CrystallineCM.ordinary_independence_level

2.1 The Levi coefficient module as a tensor product over the two places
  CrystallineCM.levi_coefficient_tensor

2.2 The kernel of evaluation is killed by ũ^m
  CrystallineCM.evaluation_kernel_nilpotent

2.3 Independence of weight for P-ordinary completed cohomology
  CrystallineCM.ordinary_independence_weight

2.4 Independence of weight for boundary P-ordinary completed cohomology
  CrystallineCM.boundary_ordinary_independence_weight

2.5 P-ordinary parts for dual coefficients
  CrystallineCM.DualPOrdinary
  CrystallineCM.DualPOrdinary_conjugation
  CrystallineCM.DualPOrdinary_dual_pairing
  CrystallineCM.DualPOrdinary_inverse_operator
  CrystallineCM.DualPOrdinary_test_adjoints
  CrystallineCM.DualPOrdinary_test_lower_congruence
  CrystallineCM.DualPOrdinary_test_trivial_weight

2.6 Dual P-ordinary parts at parahoric level
  CrystallineCM.dual_ordinary_parahoric_comparison

3.1 Parabolic Bruhat decomposition and closure relations
  CrystallineCM.relative_bruhat_local_closure

3.2 The modulus-type character χ of M(L)
  CrystallineCM.ChiCharacter
  CrystallineCM.ChiCharacter_mul
  CrystallineCM.ChiCharacter_orientation
  CrystallineCM.ChiCharacter_test_identity
  CrystallineCM.ChiCharacter_test_rank_one_unit
  CrystallineCM.ChiCharacter_test_uniformizer
  CrystallineCM.ChiCharacter_unit_value

3.3 Cohomology of an induced space is the parabolic induction
  CrystallineCM.induced_space_cohomology

3.4 Splitting of the U₀-cohomology complex at deep level
  CrystallineCM.deep_unipotent_cohomology_split

3.5 Subquotients modulo p-powers (Artin–Rees)
  CrystallineCM.subquotient_mod_p_pow

3.6 Supplementary comparison API
  CrystallineCM.subquotient_mod_p_pow_equivariant
  CrystallineCM.subquotient_mod_p_pow_unique

3.7 The Bruhat filtration functors on parabolic induction
  CrystallineCM.InductionFiltrationFunctors
  CrystallineCM.InductionFiltrationFunctors_inclusion
  CrystallineCM.InductionFiltrationFunctors_restriction
  CrystallineCM.InductionFiltrationFunctors_test_above_length
  CrystallineCM.InductionFiltrationFunctors_test_rank_one
  CrystallineCM.InductionFiltrationFunctors_test_zero_index
  CrystallineCM.InductionFiltrationFunctors_zero

3.8 P-ordinary part of an inflation from the Levi
  CrystallineCM.ordinary_inflation_orientation_shift

3.9 Clopen approximations of the Bruhat filtration
  CrystallineCM.bruhat_clopen_approximation

3.10 Bruhat stratum induction
  CrystallineCM.BruhatStratumInduction
  CrystallineCM.BruhatStratumInduction_equivariance
  CrystallineCM.BruhatStratumInduction_restriction
  CrystallineCM.BruhatStratumInduction_test_empty_support
  CrystallineCM.BruhatStratumInduction_test_identity
  CrystallineCM.BruhatStratumInduction_test_unnormalized
  CrystallineCM.BruhatStratumInduction_translation

3.11 Bruhat open-cell induction
  CrystallineCM.BruhatOpenCellInduction
  CrystallineCM.BruhatOpenCellInduction_evaluate
  CrystallineCM.BruhatOpenCellInduction_extend_zero
  CrystallineCM.BruhatOpenCellInduction_support
  CrystallineCM.BruhatOpenCellInduction_test_identity
  CrystallineCM.BruhatOpenCellInduction_test_nonopen_support
  CrystallineCM.BruhatOpenCellInduction_test_w0_eval

3.12 Exactness of the Bruhat filtration of parabolic induction
  CrystallineCM.bruhat_filtration_exact

3.13 The open cell computes the P-ordinary part of the top Bruhat stratum
  CrystallineCM.ordinary_open_cell_comparison

3.14 The Bruhat filtration stays exact after taking K ⋉ U₀-cohomology
  CrystallineCM.bruhat_cohomology_exact

3.15 The open-cell summand is the w₀^P-twist
  CrystallineCM.open_cell_evaluation_twist

3.16 P-ordinary cohomology of a parabolic induction
  CrystallineCM.ordinary_induction_subquotients

3.17 Dual version: ordinary part for the opposite parabolic
  CrystallineCM.dual_ordinary_induction_subquotient

4.1 Q-ordinary Hecke operators Ũ^k_v
  CrystallineCM.QOrdinaryHecke
  CrystallineCM.QOrdinaryHecke_partial_operator
  CrystallineCM.QOrdinaryHecke_polynomial_algebra
  CrystallineCM.QOrdinaryHecke_rescale
  CrystallineCM.QOrdinaryHecke_test_borel
  CrystallineCM.QOrdinaryHecke_test_central_inverse_only
  CrystallineCM.QOrdinaryHecke_test_siegel

4.2 Newton above Hodge for semistable representations, and its equality case
  CrystallineCM.newton_hodge_equality_subrepresentation

4.3 Q-ordinary local subspace
  CrystallineCM.QOrdinaryLocalSubspace
  CrystallineCM.QOrdinaryLocalSubspace_p_comparison
  CrystallineCM.QOrdinaryLocalSubspace_scalar_extension
  CrystallineCM.QOrdinaryLocalSubspace_test_all_units
  CrystallineCM.QOrdinaryLocalSubspace_test_nonunit
  CrystallineCM.QOrdinaryLocalSubspace_test_zero_space
  CrystallineCM.QOrdinaryLocalSubspace_unit_eigenspaces

4.4 ι-Q_{v̄}-ordinary cuspidal representations
  CrystallineCM.IotaQOrdinary
  CrystallineCM.IotaQOrdinary_isomorphism
  CrystallineCM.IotaQOrdinary_p_specialization
  CrystallineCM.IotaQOrdinary_test_no_fixed_vectors
  CrystallineCM.IotaQOrdinary_test_refinement
  CrystallineCM.IotaQOrdinary_test_wrong_weight
  CrystallineCM.IotaQOrdinary_witness

4.4a Characteristic-zero unitary transfer and Galois comparison
  CrystallineCM.unitary_characteristic_zero_comparison
  Full discrete constituent assembly, algebraic twists and local comparison;
  p splits in a fixed imaginary quadratic subfield F₀ of F (ACC+ Theorem 2.3.3).

4.5 Galois representations of Q-ordinary automorphic representations
  CrystallineCM.q_ordinary_crystalline_blocks
  Uses 4.4a, including its rational-prime splitting hypothesis.

5.1 The coefficient object V_U(λ̃_S̄, m) on the Levi locally symmetric spaces
  CrystallineCM.BoundaryCoefficientObject
  CrystallineCM.BoundaryCoefficientObject_amplitude
  CrystallineCM.BoundaryCoefficientObject_descent
  CrystallineCM.BoundaryCoefficientObject_fiber
  CrystallineCM.BoundaryCoefficientObject_test_empty_places
  CrystallineCM.BoundaryCoefficientObject_test_exterior_dual
  CrystallineCM.BoundaryCoefficientObject_test_zero_weight_rank_one

5.2 The Siegel boundary stratum and localization
  CrystallineCM.localized_siegel_stratum

5.3 Completed cohomology of the Siegel parabolic is inflated from the Levi
  CrystallineCM.parabolic_cohomology_inflation

5.4 The Siegel stratum as an induction at S̄₁
  CrystallineCM.siegel_stratum_induction

5.5 Inflation comparison with the U-cohomology coefficient object
  CrystallineCM.unipotent_coefficient_inflation

5.6 Completed P-cohomology through the Levi
  CrystallineCM.completed_parabolic_levi_comparison

5.7 A direct summand of completed boundary cohomology
  CrystallineCM.completed_siegel_boundary_summand

5.8 Levi cohomology with U-coefficients is a summand of completed boundary cohomology
  CrystallineCM.integral_levi_boundary_retract

6.1 Q-ordinary Hecke algebras, the twisted Satake map and duality involutions
  CrystallineCM.OrdHeckeAlgebras42
  CrystallineCM.OrdHeckeAlgebras42_dual_satake
  CrystallineCM.OrdHeckeAlgebras42_local_factor
  CrystallineCM.OrdHeckeAlgebras42_test_central_ratio
  CrystallineCM.OrdHeckeAlgebras42_test_dual_inverse
  CrystallineCM.OrdHeckeAlgebras42_test_empty
  CrystallineCM.OrdHeckeAlgebras42_twisted_satake

6.2 The dual Levi coefficient module is a summand of the dual U-cohomology
  CrystallineCM.dual_levi_coefficient_summand

6.4 Deep Levi congruence level
  CrystallineCM.DeepLeviLevel
  CrystallineCM.DeepLeviLevel_antitone
  CrystallineCM.DeepLeviLevel_empty
  CrystallineCM.DeepLeviLevel_mem
  CrystallineCM.DeepLeviLevel_test_empty
  CrystallineCM.DeepLeviLevel_test_local_uniformizer
  CrystallineCM.DeepLeviLevel_test_scalar

6.5 Deep unitary congruence level
  CrystallineCM.DeepUnitaryLevel
  CrystallineCM.DeepUnitaryLevel_empty
  CrystallineCM.DeepUnitaryLevel_mem
  CrystallineCM.DeepUnitaryLevel_test_empty
  CrystallineCM.DeepUnitaryLevel_test_not_principal
  CrystallineCM.DeepUnitaryLevel_test_upper_unipotent
  CrystallineCM.DeepUnitaryLevel_unipotent

6.6 Degree shifting to middle-degree P-ordinary cohomology of G̃
  CrystallineCM.middle_degree_hecke_comparison

6.7 Hecke images A(K,λ,q), A(K,λ,q,m), Ã(K̃,λ̃,S̄) and deep levels
  CrystallineCM.HeckeImagesA
  CrystallineCM.HeckeImagesA_factor
  CrystallineCM.HeckeImagesA_integral_to_rational
  CrystallineCM.HeckeImagesA_mem
  CrystallineCM.HeckeImagesA_test_range
  CrystallineCM.HeckeImagesA_test_scalar_image
  CrystallineCM.HeckeImagesA_test_zero_cohomology

6.8 Degree shifting with dual coefficients
  CrystallineCM.dual_middle_degree_hecke_comparison

6.9 Dual Hecke images A^∨ and Ã^∨
  CrystallineCM.HeckeImagesDual
  CrystallineCM.HeckeImagesDual_adjoint
  CrystallineCM.HeckeImagesDual_coefficient
  CrystallineCM.HeckeImagesDual_test_involution
  CrystallineCM.HeckeImagesDual_test_double_coset_degree
  CrystallineCM.HeckeImagesDual_test_scalar_inverse
  CrystallineCM.HeckeImagesDual_test_zero_cohomology
  CrystallineCM.HeckeImagesDual_unitary

6.10 Torsion Hecke image
  CrystallineCM.TorsionHeckeImage
  CrystallineCM.TorsionHeckeImage_faithful
  CrystallineCM.TorsionHeckeImage_image_reduction
  CrystallineCM.TorsionHeckeImage_mem
  CrystallineCM.TorsionHeckeImage_test_new_torsion
  CrystallineCM.TorsionHeckeImage_test_scalar_mod
  CrystallineCM.TorsionHeckeImage_test_zero

6.11 Unitary middle-degree Hecke image
  CrystallineCM.UnitaryMiddleHeckeImage
  CrystallineCM.UnitaryMiddleHeckeImage_character
  CrystallineCM.UnitaryMiddleHeckeImage_mem
  CrystallineCM.UnitaryMiddleHeckeImage_rational_injective
  CrystallineCM.UnitaryMiddleHeckeImage_test_characters
  CrystallineCM.UnitaryMiddleHeckeImage_test_torsion_free
  CrystallineCM.UnitaryMiddleHeckeImage_test_zero

6.12 Degree shifting for torsion coefficients at deep auxiliary level
  CrystallineCM.torsion_degree_shifting

6.13 Dual degree shifting for torsion coefficients
  CrystallineCM.dual_torsion_degree_shifting

7.1 Residual determinants of the blocks of a Q-ordinary Galois representation
  Uses 4.4a–4.5 with p split in an imaginary quadratic subfield of F.
  CrystallineCM.residual_block_determinants

7.2 Semisimplicity and automorphy of Q-ordinary middle-degree cohomology
  Uses 4.5 with p split in an imaginary quadratic subfield of F.
  CrystallineCM.q_ordinary_automorphic_characters

7.3 A twisting character separating local constituents
  CrystallineCM.local_constituent_separating_twist

7.4 Torsion local–global compatibility at a Q-ordinary place
  CrystallineCM.torsion_local_crystalline_block_lift

7.5 Local–global compatibility at p via deformation rings
  CrystallineCM.integral_local_global_deformation_factorization

7.6 Fixed-determinant refinement
  CrystallineCM.fixed_determinant_factorization

7.7 Crystallinity at p over totally real fields and the CM export
  CrystallineCM.unramified_automorphic_crystallinity

8.1 Cohomology of PGL₂ locally symmetric spaces at non-neat level
  CrystallineCM.Pgl2Cohomology
  CrystallineCM.Pgl2Cohomology_central_operator
  CrystallineCM.Pgl2Cohomology_coefficient
  CrystallineCM.Pgl2Cohomology_quotient_descent
  CrystallineCM.Pgl2Cohomology_test_central_scalar
  CrystallineCM.Pgl2Cohomology_test_nonneat
  CrystallineCM.Pgl2Cohomology_test_trivial_quotient

8.2 Two-system patching data
  CrystallineCM.TwoSystemPatchingData
  CrystallineCM.TwoSystemPatchingData_residual_identification
  CrystallineCM.TwoSystemPatchingData_specialization_relation
  CrystallineCM.TwoSystemPatchingData_support
  CrystallineCM.TwoSystemPatchingData_test_crossing_reject
  CrystallineCM.TwoSystemPatchingData_test_nilpotents
  CrystallineCM.TwoSystemPatchingData_test_same_system

8.3 Automorphic components propagate through the special fibre
  CrystallineCM.two_system_automorphic_component_propagation

8.4 Comparison with the Allen–Khare–Thorne complexes
  CrystallineCM.pgl2_akt_complex_comparison

8.5 Support of patched cohomology at points of automorphic components
  CrystallineCM.augmented_automorphic_support

8.6 Galois representations for PGL₂ over CM fields
  CrystallineCM.pgl2_hecke_galois_representation
  Residual representations exist at every maximal ideal of the full Hecke
  algebra T. At an absolutely irreducible residual ideal 𝔪, the integral lift
  takes values in GL₂(T_𝔪/J), where T_𝔪 = e_𝔪 T is the idempotent local factor
  and J^N = 0 with N depending only on [F : Q]. The full Frobenius polynomial
  X² − T_{v,1} X + q_v is mapped through T → T_𝔪 → T_𝔪/J.

8.7 Vanishing above the real dimension and perfectness
  CrystallineCM.nonneat_localized_perfectness

9.1 The data and hypotheses (1)–(15) of the special case of Theorem 5.2
  CrystallineCM.Setup56
  CrystallineCM.Setup56_auxiliary
  CrystallineCM.Setup56_local_branch
  CrystallineCM.Setup56_residual
  CrystallineCM.Setup56_test_small_residue
  CrystallineCM.Setup56_test_two_auxiliary
  CrystallineCM.Setup56_test_weak_degree

9.3 Taylor–Wiles data for GL₂ over CM fields without enormous image (Allen–Khare–Thorne)
  Fix an imaginary quadratic subfield F₀ of F and F=F⁺F₀.
  CrystallineCM.small_image_taylor_wiles_prime_selection
  CrystallineCM.small_image_dual_selmer_detection
  CrystallineCM.cm_taylor_wiles_relative_presentation

9.4 Prepared PGL₂ level and unitary parabolic branches
  CrystallineCM.PreparedPGL2Level
  CrystallineCM.PreparedPGL2Level_level_components
  CrystallineCM.PreparedPGL2Level_localized_perfectness
  CrystallineCM.PreparedPGL2Level_residual_hecke_ideal
  CrystallineCM.PreparedPGL2Level_test_auxiliary_level
  CrystallineCM.PreparedPGL2Level_test_mixed_orientation
  CrystallineCM.PreparedPGL2Level_test_non_neat
  CrystallineCM.PreparedPGL2Level_test_three_branches
  CrystallineCM.PreparedPGL2Level_unitary_partitions

9.5 The global deformation problem 𝒮_χ and its coefficient line
  CrystallineCM.DeformationProblemsSChi
  CrystallineCM.DeformationProblemsSChi_p_local
  CrystallineCM.DeformationProblemsSChi_residual_character
  CrystallineCM.DeformationProblemsSChi_tame_local
  CrystallineCM.DeformationProblemsSChi_test_chi_inverse
  CrystallineCM.DeformationProblemsSChi_test_chi_one
  CrystallineCM.DeformationProblemsSChi_test_mod_p

9.6 Patching complexes of homology
  CrystallineCM.taylor_wiles_perfect_dual_augmentation

9.7 Hecke-valued Galois representations satisfy the deformation problem 𝒮_χ
  CrystallineCM.deformation_to_hecke_surjection

9.8 Taylor–Wiles deformation problem
  CrystallineCM.TaylorWilesDeformationProblem
  CrystallineCM.TaylorWilesDeformationProblem_augmentation
  CrystallineCM.TaylorWilesDeformationProblem_diamond
  CrystallineCM.TaylorWilesDeformationProblem_forget
  CrystallineCM.TaylorWilesDeformationProblem_test_augmentation
  CrystallineCM.TaylorWilesDeformationProblem_test_empty_q
  CrystallineCM.TaylorWilesDeformationProblem_test_two_eigenvalues

9.9 The same at Taylor–Wiles level
  CrystallineCM.taylor_wiles_deformation_to_hecke_surjection

9.10 Automorphy lifting in the special case
  CrystallineCM.prepared_barsotti_tate_lifting
  CrystallineCM.pgl2_weight_zero_rational_comparison

9.11 Reduction of Theorem 5.2 to Proposition 5.6.1 by solvable base change
  CrystallineCM.solvable_preparation_and_descent_qualified

9.12 Potentially Barsotti–Tate automorphy lifting over imaginary CM fields
  CrystallineCM.potentially_barsotti_tate_lifting_qualified

9.2 Projective-image and invariant-line API
  projectiveMatrixImage_mem_iff
  projectiveMatrixImage_scalar_kernel
  projectiveMatrixImage_restrict_le
  determinantKernelHasLine_fixed_line
  determinantKernelHasLine_of_invariant_line
  determinantKernelHasLine_conjugate

The light lowestWeightScalar and preparedUnitaryPartition formulas above
record local values of the full scaling-character and prepared-level targets.
-/

end CrystallineCM
end TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM
