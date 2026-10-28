# Native completion checks: OrthogonalSpinGroups

This is a compiled acceptance check for the dimension-zero rational-unit rejection and the split discriminant algebra of the real four-square form in the [definitive README](README.md).
It uses the implemented Tau Ceti APIs directly and contains no admitted targets.

The block below was extracted verbatim to a Lean file and checked with
`lake env lean -DwarningAsError=true` at Tau Ceti
[`40bc1c43779db5d437068c7c5c0250f535e22cec`](https://github.com/TauCetiProject/TauCeti/commit/40bc1c43779db5d437068c7c5c0250f535e22cec),
with Lean 4.36.0-rc1 and Mathlib `2cabef97`. The axiom reports contain only
`propext`, `Classical.choice`, and `Quot.sound`.

This evidence is separate from the roadmap repository's historical Tau Ceti `358314d4ab97` /
Lean 4.35.0-rc3 pin and from the target prototypes retained in `Suggested.lean`.

```lean
import Mathlib.Algebra.Algebra.Subalgebra.Prod
import TauCeti.Algebra.Subalgebra.Center
import TauCeti.Algebra.Quaternion.CentralSimple
import TauCeti.LinearAlgebra.CliffordAlgebra.Lipschitz.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.Four

open scoped Quaternion

namespace TauCetiRoadmap.OrthogonalSpinGroups.NativeCompletion

/-- The required dimension-zero rejection, on the literal rational-unit source. -/
theorem no_injective_ratUnits_lipschitz_zero (Q : QuadraticForm ℚ (Fin 0 → ℚ))
    (f : ℚˣ → lipschitzGroup Q) : ¬ Function.Injective f := by
  have : Subsingleton (lipschitzGroup Q) := by
    rw [CliffordAlgebra.lipschitzGroup_eq_bot]
    infer_instance
  intro hf
  exact (by decide : (1 : ℚˣ) ≠ -1) (hf (Subsingleton.elim _ _))

private def centerQuaternionProdEquiv :
    Subalgebra.center ℝ (ℍ × ℍ) ≃ₐ[ℝ] Subalgebra.center ℝ ℍ × Subalgebra.center ℝ ℍ :=
  have mem_iff : ∀ x : ℍ × ℍ,
      x ∈ Subalgebra.center ℝ (ℍ × ℍ) ↔
        x.1 ∈ Subalgebra.center ℝ ℍ ∧ x.2 ∈ Subalgebra.center ℝ ℍ := fun _ ↦ by
    rw [Subalgebra.center_prod, Subalgebra.mem_prod]
  { toFun := fun x ↦ (⟨x.1.1, ((mem_iff _).mp x.2).1⟩,
      ⟨x.1.2, ((mem_iff _).mp x.2).2⟩)
    invFun := fun y ↦ ⟨(y.1.1, y.2.1), (mem_iff _).mpr ⟨y.1.2, y.2.2⟩⟩
    left_inv := fun _ ↦ rfl
    right_inv := fun _ ↦ rfl
    map_mul' := fun _ _ ↦ rfl
    map_add' := fun _ _ ↦ rfl
    commutes' := fun _ ↦ rfl }

/-- The real four-square discriminant algebra splits, alongside its compact quaternion model. -/
noncomputable def realFourSquareDiscriminantEquivProd :
    Subalgebra.center ℝ (CliffordAlgebra.even (TauCeti.realCliffordForm 4 0)) ≃ₐ[ℝ] ℝ × ℝ := by
  letI : Invertible (2 : ℝ) := invertibleOfNonzero two_ne_zero
  letI : Algebra.IsCentral ℝ ℍ := TauCeti.QuaternionAlgebra.instIsCentral (-1 : ℝ) (-1 : ℝˣ)
  exact (TauCeti.centerCongr TauCeti.realCliffordFourZeroEvenEquivQuaternionProd).trans
    (centerQuaternionProdEquiv.trans
      (AlgEquiv.prodCongr (TauCeti.centerAlgEquivOfIsCentral ℝ ℍ)
        (TauCeti.centerAlgEquivOfIsCentral ℝ ℍ)))

#print axioms no_injective_ratUnits_lipschitz_zero
#print axioms realFourSquareDiscriminantEquivProd
#check TauCeti.realSpinFourEquivSpecialUnitaryProd

end TauCetiRoadmap.OrthogonalSpinGroups.NativeCompletion
```
