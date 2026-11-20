/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Compact
import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.KyFan
import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.EckartYoung
import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.HilbertSchmidt
import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.BlockSum
import TauCeti.Analysis.OperatorIdeal.Family.KyFan.Dominance
import TauCeti.Analysis.OperatorIdeal.Family.Schatten
import TauCeti.Analysis.OperatorIdeal.Family.SymmetricGauge.Faithfulness
import TauCeti.Analysis.InnerProductSpace.HilbertSchmidt.Columns

/-!
# Operator ideals, approximation numbers and Hilbert–Schmidt operators: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti.

The headline theorems are the compactness characterization `T` compact iff `aₙ(T) → 0` for a
Hilbert-space target (README §1.2, OI-A29), the Ky Fan triangle inequality (§1.5, OI-A48),
Eckart–Young (§1.5, OI-A49), Ky Fan dominance of the operator-ideal family induced by a symmetric
gauge (§2.5, OI-B75), the inclusions `S_p ⊆ S_q` of the Schatten scale (§2.5, OI-B88), the
Hilbert–Schmidt reconciliation `∑ aₙ(T)² = ∑ ‖T bᵢ‖²` (§2.5, OI-B90), the approximation numbers
of an orthogonal block sum (§2.6, OI-B91), the identification of the operators represented by `ℓ²`
families of columns with the operators of finite Hilbert–Schmidt energy and their compactness
(§3.1, OI-C08, OI-C14), and faithfulness of the symmetric-gauge construction (§2.4, OI-B72). All
are statable at the pins, on Tau Ceti's carriers, and all but the last are proved in Tau Ceti at
the pins; they are pinned below by `#check`. Faithfulness is proved there for scalars and spaces in
the lowest universe (`TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`), and is stated
here, with `sorry`, in arbitrary universes. No headline is unstatable.
-/

universe u v w

namespace TauCetiRoadmap.OperatorIdeals

open scoped ENNReal NNReal

/-- **Faithfulness of the symmetric-gauge construction** (README §2.4, OI-B72), in arbitrary
universes: if two symmetric gauges `Φ` and `Ψ` induce the same operator-ideal family over `𝕜`, on
Hilbert spaces with sources in the universe `v` and targets in the universe `w`, then their
extensions agree on every antitone sequence `a : ℕ → ℝ≥0∞`. Tau Ceti proves the case of the lowest
universe as `TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`. Gohberg and Kreĭn,
symmetric norming functions. -/
theorem symmetricGaugeFamily_injective {𝕜 : Type u} [RCLike 𝕜] {Φ Ψ : TauCeti.SymmetricGauge}
    (h : Φ.operatorIdealFamily.{u, v, w} 𝕜 = Ψ.operatorIdealFamily.{u, v, w} 𝕜)
    {a : ℕ → ℝ≥0∞} (ha : Antitone a) :
    Φ.extend a = Ψ.extend a := by
  sorry

/-! The headline theorems proved in Tau Ceti at the pins, in the order of `README.md`: the
compactness characterization (§1.2), the Ky Fan triangle inequality and Eckart–Young (§1.5), Ky Fan
dominance of induced families, the Schatten inclusions and the Hilbert–Schmidt reconciliation
(§2.5), the approximation numbers of a block sum (§2.6), and the column model with the compactness
of Hilbert–Schmidt operators (§3.1). -/

#check @ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue
#check @ContinuousLinearMap.kyFanGauge_add_le
#check @ContinuousLinearMap.singularValue_eq_linearMap_singularValues
#check @TauCeti.SymmetricGauge.isKyFanDominant_operatorIdealFamily
#check @TauCeti.OperatorIdealFamily.finiteSubmodule_schatten_le_of_le
#check @ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy
#check @ContinuousLinearMap.singularValue_withLpProdMap
#check @HilbertBasis.range_columnOperator
#check @ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top

end TauCetiRoadmap.OperatorIdeals
