/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti contributors
-/
import Mathlib
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Binary
import TauCeti.LinearAlgebra.QuadraticForm.OrthogonalGroup.Quaternion
import TauCeti.FieldTheory.SquareClassGroup.Multiplicative
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.LowRank.Three
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.LowRank.Five
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.LowRank.Six
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Transvection
import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.SpinorNorm
import TauCeti.NumberTheory.QuadraticForm.OrthogonalGroup.AdelicSpinorNorm
import TauCeti.NumberTheory.QuadraticForm.OrthogonalGroup.Integral.Spin

/-!
# Suggested forms: native determinant–spinor kernels

The README specifies the full general-field, finite, rational, local and adelic library.
This selected interface imports implemented carriers; it introduces no admitted O/SO,
Clifford norm, spinor map, topology or adelic carrier. Earlier forms' mathematics is
retained in the README and linked to native inputs or outstanding owner milestones.

The definitions below use actual native types. The general joint-map portion reuses
previously validated private source, without inheriting a validation claim for this
new whole file. New targets retain explicit `sorry`; no finite-classical simplicity,
rational norm theorem or global supplier implementation is claimed. The complete
finite and rational tables, action-intertwining, norm/Hilbert algorithms, base change,
all low ranks and worked examples remain mandatory README targets even if no selected
signature appears here. Native validation of this exact successor is a separate step.
-/

open QuadraticMap

namespace TauCetiRoadmap.OrthogonalSpinGroups.Joint

universe u v
variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- The actual determinant, corestricted to its native square roots of unity. -/
noncomputable def determinantSign (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    TauCeti.QuadraticMap.orthogonalGroup Q →* rootsOfUnity 2 K :=
  (QuadraticMap.orthogonalDet Q).codRestrict _ (by
    intro g
    exact (mem_rootsOfUnity 2 _).mpr
      (TauCeti.QuadraticMap.orthogonalDet_sq ((QuadraticMap.nondegenerate_polar_iff.mpr hQ).1) g))

/-- χ is defined once for every field of characteristic different from two. -/
noncomputable def jointDetSpinorNorm (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    TauCeti.QuadraticMap.orthogonalGroup Q →*
      (rootsOfUnity 2 K × Multiplicative (TauCeti.SquareClassGroup K)) :=
  (determinantSign Q hQ).prod (CliffordAlgebra.orthogonalSpinorNorm Q hQ)

@[simp] theorem jointDetSpinorNorm_apply (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (g : TauCeti.QuadraticMap.orthogonalGroup Q) :
    jointDetSpinorNorm Q hQ g =
      (determinantSign Q hQ g, CliffordAlgebra.orthogonalSpinorNorm Q hQ g) := rfl

/-- The actual determinant–spinor kernel as a native subgroup of O(Q). -/
noncomputable abbrev omega (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    Subgroup (TauCeti.QuadraticMap.orthogonalGroup Q) := (jointDetSpinorNorm Q hQ).ker

/-- The projective quotient uses the center of this kernel group. -/
abbrev projectiveOmega (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) : Type v :=
  omega Q hQ ⧸ Subgroup.center (omega Q hQ)

/-- Comparison with the already native Spin-image/spinor-kernel API on SO(Q). -/
theorem omega_eq_map_spinorNorm_kernel (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    omega Q hQ = (CliffordAlgebra.spinorNorm Q hQ).ker.map
      (QuadraticMap.specialOrthogonalToOrthogonal Q) := by
  sorry

/-- Full finite-field joint image, including cardinality3 and binary forms. -/
theorem jointDetSpinorNorm_surjective_finite [Finite K]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (hn : 2 ≤ Module.finrank K V) :
    Function.Surjective (jointDetSpinorNorm Q hQ) := by
  sorry

/-- The finite orthogonal commutator kernel; no perfection of omega is assumed. -/
theorem omega_eq_commutator_finite [Finite K]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (hn : 2 ≤ Module.finrank K V) :
    omega Q hQ = commutator (TauCeti.QuadraticMap.orthogonalGroup Q) := by
  sorry

/-- Index four is a joint-image result; it is distinct from perfectness of the kernel. -/
theorem index_omega_finite [Finite K] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (hn : 2 ≤ Module.finrank K V) : (omega Q hQ).index = 4 := by
  sorry

/-- Higher-rank perfectness includes the finite field of cardinality three. -/
theorem omega_isPerfect_finite [Finite K] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (hn : 5 ≤ Module.finrank K V) : Group.IsPerfect (omega Q hQ) := by
  sorry

/-- The actual quotient by the kernel's center, not the center of Spin. -/
theorem projectiveOmega_isSimple_finite [Finite K] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hn : 5 ≤ Module.finrank K V) :
    IsSimpleGroup (projectiveOmega Q hQ) := by
  sorry

/-- Nonabelianity is explicit; IsSimpleGroup by itself also allows cyclic prime groups. -/
theorem projectiveOmega_noncommuting_finite [Finite K] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hn : 5 ≤ Module.finrank K V) :
    ∃ g h : projectiveOmega Q hQ, g * h ≠ h * g := by
  sorry

/-- Low dimensions are part of the same native general-field carrier. -/
theorem omega_subsingleton_of_finrank_le_one (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hn : Module.finrank K V ≤ 1) : Subsingleton (omega Q hQ) := by
  sorry

/-- Exact even/odd cosets over any field, at any represented nonzero value. -/
theorem range_jointDetSpinorNorm (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (v : V) (a : Kˣ) (ha : Q v = a) :
    Set.range (jointDetSpinorNorm Q hQ) =
      {dc | (dc.1 = 1 ∧ dc.2 ∈ (CliffordAlgebra.spinorNorm Q hQ).range) ∨
        ((dc.1 : Kˣ) = -1 ∧ ∃ t ∈ (CliffordAlgebra.spinorNorm Q hQ).range,
          dc.2 = TauCeti.squareClassHom a * t)} := by
  sorry

omit [Invertible (2 : K)] in
/-- The former unit-norm range is exactly the native norm subgroup mapped to square classes. -/
theorem quadraticNormSquareClass_range (d : K) :
    ((TauCeti.squareClassHom (K := K)).comp
      (Units.map (QuadraticAlgebra.norm : QuadraticAlgebra K d 0 →* K))).range =
      ((TauCeti.quadraticNormSubgroup d).map TauCeti.squareClassHom :
        Subgroup (Multiplicative (TauCeti.SquareClassGroup K))) := by
  rw [TauCeti.quadraticNormSubgroup_def]
  exact (MonoidHom.map_range _ _).symm

/-- The native binary marginal theorem, on its native carriers and full general-field scope. -/
theorem binary_spinorNorm_range (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    {a b : Kˣ} (h : Q.Equivalent (QuadraticMap.weightedSumSquares K ![(a : K), (b : K)])) :
    (CliffordAlgebra.spinorNorm Q hQ).range =
      ((TauCeti.quadraticNormSubgroup (-(a * b : K))).map TauCeti.squareClassHom :
        Subgroup (Multiplicative (TauCeti.SquareClassGroup K))) := by
  exact CliffordAlgebra.range_spinorNorm_of_equivalent_binary Q hQ h

/-- Binary specialization consumes the actual native norm-subgroup theorem. -/
theorem range_jointDetSpinorNorm_binary (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    {a b : Kˣ} (h : Q.Equivalent (QuadraticMap.weightedSumSquares K ![(a : K), (b : K)])) :
    Set.range (jointDetSpinorNorm Q hQ) =
      {dc | (dc.1 = 1 ∧ dc.2 ∈
          (TauCeti.quadraticNormSubgroup (-(a * b : K))).map TauCeti.squareClassHom) ∨
        ((dc.1 : Kˣ) = -1 ∧ ∃ t ∈
          (TauCeti.quadraticNormSubgroup (-(a * b : K))).map TauCeti.squareClassHom,
          dc.2 = TauCeti.squareClassHom a * t)} := by
  sorry

section Rational

variable {W : Type v} [AddCommGroup W] [Module ℚ W] [FiniteDimensional ℚ W]

/-- Positive-definite rational rank at least3 has both determinants and all positive classes. -/
theorem rational_range_posDef (Q : QuadraticForm ℚ W) (hQ : Q.Nondegenerate)
    (hn : 3 ≤ Module.finrank ℚ W) (hp : Q.PosDef) :
    Set.range (jointDetSpinorNorm Q hQ) =
      {dc | ∃ a : ℚˣ, 0 < (a : ℚ) ∧ TauCeti.squareClassHom a = dc.2} := by
  sorry

/-- Negative-definite rational rank at least3 has positive even and negative odd classes. -/
theorem rational_range_negDef (Q : QuadraticForm ℚ W) (hQ : Q.Nondegenerate)
    (hn : 3 ≤ Module.finrank ℚ W) (hp : (-Q).PosDef) :
    Set.range (jointDetSpinorNorm Q hQ) =
      {dc | ∃ a : ℚˣ, TauCeti.squareClassHom a = dc.2 ∧
        ((dc.1 = 1 ∧ 0 < (a : ℚ)) ∨ ((dc.1 : ℚˣ) = -1 ∧ (a : ℚ) < 0))} := by
  sorry

/-- Real-indefinite rational rank at least3 has full joint image, with no rational isotropy input. -/
theorem rational_joint_surjective_indefinite (Q : QuadraticForm ℚ W) (hQ : Q.Nondegenerate)
    (hn : 3 ≤ Module.finrank ℚ W) (hp : ¬Q.PosDef) (hm : ¬(-Q).PosDef) :
    Function.Surjective (jointDetSpinorNorm Q hQ) := by
  sorry

end Rational

end TauCetiRoadmap.OrthogonalSpinGroups.Joint

/-! ## Compatibility for the existing IntegralLattices consumer

These aliases preserve its checked names and reflection-product expression while using
implemented carriers. Its raw unit-square quotient is reached by the canonical equivalence.
The transvection-lift alias carries native nondegeneracy: for Q=0 the specified Clifford
lift is not in Mathlib's vector-generated Lipschitz group, so the old omitted premise was
not a valid general theorem about that lift.
-/
namespace TauCetiRoadmap.OrthogonalSpinGroups

universe u v
variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V]

abbrev orthogonalGroup (Q : QuadraticForm K V) :=
  TauCeti.QuadraticMap.orthogonalGroup Q

noncomputable abbrev specialOrthogonalGroup (Q : QuadraticForm K V) :=
  TauCeti.QuadraticMap.specialOrthogonalGroup Q

noncomputable def reflection (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) : V ≃ₗ[K] V := by
  letI : Invertible (Q v) := invertibleOfNonzero hv
  exact TauCeti.QuadraticMap.reflection Q v

omit [Invertible (2 : K)] in
theorem reflection_mem (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    reflection Q hv ∈ orthogonalGroup Q := by
  let : Invertible (Q v) := invertibleOfNonzero hv
  exact TauCeti.QuadraticMap.reflection_mem_orthogonalGroup Q v

noncomputable def spinorNorm [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) : orthogonalGroup Q →* (Kˣ ⧸ Subgroup.square Kˣ) :=
  TauCeti.multiplicativeSquareClassEquiv.symm.toMonoidHom.comp
    (CliffordAlgebra.orthogonalSpinorNorm Q hQ)

theorem spinorNorm_reflection [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {v : V} (hv : Q v ≠ 0) (a : Kˣ) (ha : (a : K) = Q v) :
    spinorNorm Q hQ ⟨reflection Q hv, reflection_mem Q hv⟩ =
      QuotientGroup.mk' (Subgroup.square Kˣ) a := by
  let : Invertible (Q v) := invertibleOfNonzero hv
  have he : unitOfInvertible (Q v) = a := Units.ext ha.symm
  apply TauCeti.multiplicativeSquareClassEquiv.injective
  change TauCeti.multiplicativeSquareClassEquiv
      (TauCeti.multiplicativeSquareClassEquiv.symm
        (CliffordAlgebra.orthogonalSpinorNorm Q hQ
          (TauCeti.QuadraticMap.reflectionOrthogonal Q v))) = _
  rw [MulEquiv.apply_symm_apply,
    CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal, he]
  exact (TauCeti.multiplicativeSquareClassEquiv_mk a).symm

noncomputable abbrev transvection (Q : QuadraticForm K V) {u w : V}
    (hu : Q u = 0) (huw : polar Q u w = 0) := QuadraticMap.transvection Q hu huw

noncomputable abbrev transvectionLiftHom (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    {u : V} (hu : Q u = 0) := CliffordAlgebra.spinTransvectionHom hQ hu

section AdelicCompatibility
variable {W : Type v} [AddCommGroup W] [Module ℚ W] [FiniteDimensional ℚ W]

abbrev OrthogonalCompactOpens (Q : QuadraticForm ℚ W) :=
  TauCeti.QuadraticMap.OrthogonalCompactOpens Q

abbrev finiteAdelicOrthogonal (Q : QuadraticForm ℚ W) (U : OrthogonalCompactOpens Q) :=
  U.finiteAdelicOrthogonal

end AdelicCompatibility
end TauCetiRoadmap.OrthogonalSpinGroups
