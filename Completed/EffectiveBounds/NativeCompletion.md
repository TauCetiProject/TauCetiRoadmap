# Effective bounds: native-source evidence

This is evidence against the full [roadmap README](README.md), which remains definitive.
The native certificate below was checked on 2026-10-28 with Lean `4.36.0-rc1` and Mathlib
`2cabef97b63d3275776b8b060d802de6a6fa1055`, in local true-merge integration
`4d80c8b09b99ba15806968a60a95ae4d7028912c`, based on actual Tau Ceti main
[`302238ea98ea`](https://github.com/TauCetiProject/TauCeti/commit/302238ea98ea621d689041f67e935f0b4eb1285e).
That base already contains Layer 0's Mathlib reconciliation from
[#22092](https://github.com/TauCetiProject/TauCeti/pull/22092) (`35edf89e32bd`); the integration
adds the exact heads of [#22059](https://github.com/TauCetiProject/TauCeti/pull/22059)
(`bc20ab2249ca`) and [#22064](https://github.com/TauCetiProject/TauCeti/pull/22064)
(`1b334efdcc44`) without conflict resolutions or source patches. All fifteen inventory modules
build, and the verbatim certificate plus supplementary scope probes produce eleven axiom
reports containing only the standard three axioms.

Both #22092 and #22064 have since passed genuine CI and landed through the ordinary pipeline.
Their changed source files match actual main
[`40eaa661fe7a`](https://github.com/TauCetiProject/TauCeti/commit/40eaa661fe7abb44c5e87aac7bdd2ca66011e972)
byte for byte. #22059 has all ten normal review rubrics and genuine CI passing, but its ordinary
merge is still required. The full inventory must then be replayed on actual main before this
document supports an archive declaration. The local integration alone does not establish that
the regulator bound has merged.

The repository's [Suggested.lean](Suggested.lean) remains a historical prototype checked against
the roadmap checkout's Lean `4.35.0-rc3`, Tau Ceti `358314d4ab97`, and Mathlib `f6090c7095e1` pins.
Its old `box` names and its account of
missing Layer-3 results describe that older source snapshot. It is not evidence that the current
native interfaces have those names, or that its old-pin build checks the new results. The code
block below is a separate current-source check, extracted verbatim and run with
`lake env lean -DwarningAsError=true`.

## Full normative inventory

| README target | Native evidence and exact scope |
| --- | --- |
| Layer 0: packing in boxes/polydiscs | [Doubling.lean](https://github.com/TauCetiProject/TauCeti/blob/35edf89e32bd584800cbb4a42368fa9f03db1a47/TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean) gives `finite_and_ncard_le_of_subset_pi_closedBall_of_separated` and the subgroup form, retaining the explicit bounds `(4c/ε)^(2·#ι)` and `(8/ρ)^(2·#ι)`. The separation hypothesis is an explicit coordinate inequality. |
| Layer 0: doubling | The same file proves `ncard_inter_pi_closedBall_two_le_pow_mul`, with factor `49^#ι` for an arbitrary additive subgroup whose radius-two intersection is finite. |
| Layer 0: mandatory Mathlib reconciliation | #22092 removes the redundant `box`, `mem_box`, and `box_mono` declarations, replaces all native consumers with literal `Set.pi`/`Metric.closedBall` carriers, and provides `ncard_inter_pi_closedBall_two_le_pow_mul_of_discreteTopology` for a native `Submodule ℤ`. It uses `.toAddSubgroup`, compactness of the product of closed balls, and Mathlib's closed/discrete subgroup API. Thus an `IsZLattice ℝ` supplies the needed discreteness without a parallel lattice or covolume convention. The only private engine definitions left are genuine finite-grid counting maps. **Present on actual main `40eaa661fe7a`.** |
| Layer 1: discriminant from algebraic integers | [`abs_discr_le_of_basis_isIntegral`](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean) applies to an arbitrary rational basis of algebraic integers, with equality available for an integral basis. The [trace helper](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/FieldTheory/Trace.lean) is `NumberField.trace_eq_zero_of_sq_ratCast`. |
| Layer 1: explicit ideal count | [`card_ideal_absNorm_le`](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean) proves both finiteness and `# {I ≠ ⊥ : N(I) ≤ X} ≤ X²·2ⁿ` for every real `X ≥ 1`, rather than extracting a constant from an eventual asymptotic. |
| Layer 1: class number | [`classNumber_le_bound`](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/ClassNumber/Basic.lean) proves `h_K ≤ |d_K|·4ⁿ`, using the explicit ideal count and Mathlib's ideal representative of bounded norm. |
| Layer 1: unit squares and its group prerequisite | [`units_sq_index_le`](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/UnitSquares/Basic.lean) bounds the square-subgroup index by `2ⁿ`. The abstract [group square-index API](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/Algebra/Group/PowMonoidHom.lean) is consumed in its canonical square-subgroup vocabulary. |
| Layer 2: effective Hermite–Minkowski | [HermiteCount/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean) supplies the explicit coefficient bound, bounded integral generator, and `ncard_setOf_finiteDimensional_abs_discr_le_le`, bounding the number of subfields of a fixed ambient `A/ℚ` by `(2C+1)^(D+1)·D`. It consumes Mathlib's discriminant/degree/primitive-generator estimates and counts bounded integer polynomials; qualitative finiteness is not substituted for the requested count. |
| Layer 3: an explicit positive lower bound in every rank | [UnitHeight.lean](https://github.com/TauCetiProject/TauCeti/blob/bc20ab2249ca9bb9beec195e114861c9edffdf23/TauCeti/NumberTheory/EffectiveBounds/UnitHeight.lean) defines the natural-number expression `N(d) = ∑ₖ₌₀ᵈ k·(2·4ᵏ+1)ᵏ` and `δ(d) = log(2)/(N(d)+1)`, proves the nontorsion-unit **relative** logarithmic-height gap `δ(d)`, and [Regulator.lean](https://github.com/TauCetiProject/TauCeti/blob/bc20ab2249ca9bb9beec195e114861c9edffdf23/TauCeti/NumberTheory/EffectiveBounds/Regulator.lean) proves `0 < δ(d)^r/r! ≤ R_K`. It combines an explicit bounded-house count with Minkowski's unit-lattice theorem; no ineffective Northcott minimum is chosen. No factor of `d` from absolute-height normalization is omitted. The formula includes rank zero, where it equals one. **Archive prerequisite: #22059.** |
| Layer 3: full unit-log volume normalization | [Log/Covolume.lean](https://github.com/TauCetiProject/TauCeti/blob/1b334efdcc4441eb8ca3880cbbb3f27a75e8d46e/TauCeti/NumberTheory/NumberField/Units/Log/Covolume.lean) proves the covolume of the existing `TauCeti.fullUnitLattice K`, for its explicitly transported induced Euclidean measure, is `√(r+1)·NumberField.Units.regulator K`. The full logarithms retain weight one at real places and weight two at complex places. The regulator is Mathlib's canonical regulator, and the number-field and measure hypotheses appear in the checked statement below. **Present on actual main `40eaa661fe7a`.** |
| Layer 3: volumes feeding the analytic class number formula | Mathlib already proves [`fundamentalCone.volume_normLeOne`](https://github.com/leanprover-community/mathlib4/blob/2cabef97b63d3275776b8b060d802de6a6fa1055/Mathlib/NumberTheory/NumberField/CanonicalEmbedding/NormLeOne.lean) with factor `2^r₁·π^r₂·R_K`, and the [Dedekind-zeta residue/class-number formula](https://github.com/leanprover-community/mathlib4/blob/2cabef97b63d3275776b8b060d802de6a6fa1055/Mathlib/NumberTheory/NumberField/DedekindZeta.lean). These are consumed as existing exact identities. The additional full-log Euclidean normalization is proved in #22064. |
| Worked example: `ℚ(√−5)` | [MinusFive/ClassNumber.lean](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/Multiquadratic/MinusFive/ClassNumber.lean) computes the actual class number two. The checked example below uses the named `AdjoinRoot (X²+5)` field, its degree two and discriminant `−20`, and specializes the general class-number bound to `2 ≤ 20·16`. |
| Worked example: a rank-two lattice in `ℝ²` | [RankTwoDoubling.lean](https://github.com/TauCetiProject/TauCeti/blob/35edf89e32bd584800cbb4a42368fa9f03db1a47/TauCeti/NumberTheory/GeometryOfNumbers/RankTwoDoubling.lean) applies both packing and doubling to `ℤ+ℤi ⊆ ℂ ≃ ℝ²`, retaining the explicit packing count `256` and doubling factor `49`. The literal closed-ball version is checked below. |
| Worked example: `ℚ(i)` | [EffectiveBounds/WorkedExamples.lean](https://github.com/TauCetiProject/TauCeti/blob/dcf283057e3c0f0a98976fea21b2dec8f4316fb5/TauCeti/NumberTheory/EffectiveBounds/WorkedExamples.lean) recovers discriminant `−4` and absolute discriminant four for `CyclotomicField 4 ℚ`, using its integral basis `{1, ζ}` with `ζ² = −1` and the trace/discriminant API. |
| Long horizon | The README labels Brauer–Siegel and its effective constants an **aspiration**. No Brauer–Siegel theorem or effective asymptotic is claimed by this evidence. |

The standing hypotheses are preserved: the packing bounds are stated for general subgroups,
the lattice specialization uses only discreteness, and the arithmetic statements quantify over
arbitrary number fields without bundling extra invariant hypotheses. The ported Layer-1 source
files retain their credit to `kim-em/erdos-unit-distance`.

## Current-source certificate

The following complete block was extracted without rewriting, checked in the native-source
integration with warnings treated as errors, and audited by its six `#print axioms` commands.
All six lists contain only `propext`, `Classical.choice`, and `Quot.sound`.

```lean
import Mathlib
import TauCeti.FieldTheory.Trace
import TauCeti.NumberTheory.EffectiveBounds.ClassNumber.Basic
import TauCeti.NumberTheory.EffectiveBounds.Discriminant.Basic
import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic
import TauCeti.NumberTheory.EffectiveBounds.IdealCount.Basic
import TauCeti.NumberTheory.EffectiveBounds.Regulator
import TauCeti.NumberTheory.EffectiveBounds.UnitSquares.Basic
import TauCeti.NumberTheory.EffectiveBounds.WorkedExamples
import TauCeti.NumberTheory.GeometryOfNumbers.RankTwoDoubling
import TauCeti.NumberTheory.Multiquadratic.MinusFive.ClassNumber
import TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers
import TauCeti.NumberTheory.NumberField.Units.Log.Covolume
import Mathlib.NumberTheory.NumberField.DedekindZeta

open scoped NumberField

namespace TauCetiRoadmap.EffectiveBounds.NativeCompletion

open TauCeti.GeometryOfNumbers

example {ι : Type*} [Fintype ι] (r : ι → ℝ) (hr : ∀ i, 0 < r i)
    (L : Submodule ℤ (ι → ℂ)) [DiscreteTopology L] :
    (((L : Set (ι → ℂ)) ∩ Set.pi Set.univ
      (fun i ↦ Metric.closedBall (0 : ℂ) (2 * r i))).ncard : ℝ) ≤
      49 ^ Fintype.card ι * ((L : Set (ι → ℂ)) ∩ Set.pi Set.univ
        (fun i ↦ Metric.closedBall (0 : ℂ) (r i))).ncard :=
  ncard_inter_pi_closedBall_two_le_pow_mul_of_discreteTopology r hr L

example :
    (((gaussianLattice : Set (Fin 1 → ℂ)) ∩ Set.pi Set.univ
      (fun _ ↦ Metric.closedBall (0 : ℂ) 2)).ncard : ℝ) ≤
      49 * ((gaussianLattice : Set (Fin 1 → ℂ)) ∩ Set.pi Set.univ
        (fun _ ↦ Metric.closedBall (0 : ℂ) 1)).ncard :=
  gaussianLattice_ncard_inter_pi_closedBall_two_le

example (K : Type*) [Field K] [NumberField K] :
    0 < TauCeti.NumberField.Units.regulatorLowerBound
      (Module.finrank ℚ K) (NumberField.Units.rank K) ∧
    (Real.log 2 /
        (TauCeti.NumberField.Units.unitPowerCountBound (Module.finrank ℚ K) + 1 : ℝ)) ^
        NumberField.Units.rank K / (NumberField.Units.rank K).factorial ≤
      NumberField.Units.regulator K := by
  refine ⟨TauCeti.NumberField.Units.regulatorLowerBound_pos _ _, ?_⟩
  exact TauCeti.NumberField.Units.regulatorLowerBound_le_regulator K

open Classical in
example (K : Type*) [Field K] [NumberField K] :
    ZLattice.covolume (TauCeti.fullUnitLattice K) (TauCeti.fullLogEuclideanVolume K) =
      Real.sqrt (NumberField.Units.rank K + 1) * NumberField.Units.regulator K :=
  TauCeti.covolume_fullUnitLattice_fullLogEuclideanVolume K

local notation "QsqrtNegFive" => AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (-5 : ℚ))

private theorem sqrtNegFive_degree : Module.finrank ℚ QsqrtNegFive = 2 := by
  obtain ⟨θ, hmin, hgen⟩ :=
    TauCeti.NumberField.exists_minpoly_eq_X_sq_add_five_and_adjoin_eq_top
  exact NumberField.finrank_rat_eq_two hmin hgen

private theorem sqrtNegFive_discriminant : NumberField.discr QsqrtNegFive = -20 := by
  obtain ⟨θ, hmin, hgen⟩ :=
    TauCeti.NumberField.exists_minpoly_eq_X_sq_add_five_and_adjoin_eq_top
  simpa using NumberField.discr_eq_four_mul_of_mod_four_ne_one hmin hgen
    ((Int.prime_iff_natAbs_prime.mpr (by decide)).squarefree) (by norm_num)

example : (2 : ℝ) ≤ 20 * 16 := by
  have h := NumberField.classNumber_le_bound QsqrtNegFive
  rw [TauCeti.NumberField.classNumber_adjoinRoot_sqrt_neg_five_eq_two,
    sqrtNegFive_discriminant, sqrtNegFive_degree] at h
  convert h using 1
  norm_num

example : |NumberField.discr (CyclotomicField 4 ℚ)| = 4 :=
  NumberField.WorkedExamples.abs_discr_cyclotomicField_four

#check NumberField.abs_discr_le_of_basis_isIntegral
#check NumberField.trace_eq_zero_of_sq_ratCast
#check NumberField.card_ideal_absNorm_le
#check NumberField.classNumber_le_bound
#check NumberField.units_sq_index_le
#check NumberField.coeffBoundOfDiscrBdd
#check NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le
#check NumberField.mixedEmbedding.fundamentalCone.volume_normLeOne
#check NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT

#print axioms finite_and_ncard_le_of_subset_pi_closedBall_of_separated
#print axioms ncard_inter_pi_closedBall_two_le_pow_mul_of_discreteTopology
#print axioms gaussianLattice_ncard_inter_pi_closedBall_two_le
#print axioms TauCeti.NumberField.Units.unitHeightLowerBound_le_logHeight₁
#print axioms TauCeti.NumberField.Units.regulatorLowerBound_le_regulator
#print axioms TauCeti.covolume_fullUnitLattice_fullLogEuclideanVolume

end TauCetiRoadmap.EffectiveBounds.NativeCompletion
```
