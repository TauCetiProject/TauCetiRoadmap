module

public import Mathlib
public import TauCeti.RingTheory.Huber.Basic
public import TauCeti.RingTheory.Huber.Padic.Basic
public import TauCeti.NumberTheory.Padics.PadicIntegers
public import TauCeti.NumberTheory.Padics.Distribution.Amice.Basis
public import TauCeti.NumberTheory.Padics.WeightSpace
public import TauCeti.NumberTheory.Padics.Measure.CharacterIntegral
public import TauCeti.Analysis.Normed.Module.Bases.Orthonormal
public import TauCeti.Topology.ContinuousMap.ZeroAtInfty.Matrix
public import TauCeti.NumberTheory.Padics.Measure.CompletedGroupAlgebra
public import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.PowerSeries
public import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic

/-!
# P-adic functional analysis: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`, which is
definitive. This file states, against the pinned Mathlib and Tau Ceti, headline theorems of the
roadmap that the pinned libraries do not already prove, together with the input-first matrix
adapter of §2.6. It uses the pinned carriers `ContinuousLinearMap.matrixCoeff` (§2.6),
`TauCeti.AnalyticStage` and `TauCeti.AnalyticStage.amiceMap` (§4.4), `TauCeti.WeightSpace` with
`TauCeti.WeightSpace.finiteChar` and `TauCeti.WeightSpace.coord`, `AbstractMeasure` with
`ContinuousMonoidHom.characterIntegralAlgHom`, and the completed-group-algebra equivalence
`AbstractMeasure.completedGroupAlgebraEquiv` with the power-series coordinate
`TauCeti.completedGroupAlgebra.powerSeriesCoordinate` (§5.3). Every result the pinned libraries
already prove is cited by name in the README, not restated here.

The unbounded Amice bijection of §4.7 is not stated: the pinned direct limit
`TauCeti.LocallyAnalytic` carries no topology, and there is no pinned carrier for the
distributions dual to it. The remaining targets of §§4.4–5.6 are specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicFunctionalAnalysis

open Filter Topology
open scoped ZeroAtInfty

noncomputable section

variable {p : ℕ} [Fact p.Prime]

/-! ## Layer 2: the input-first matrix adapter -/

/-- **The input-first coefficients** (§2.6): `matrixCoeffInputFirst u j i` is the pinned
output-first entry `ContinuousLinearMap.matrixCoeff u i j`, the `i`-th coordinate of the image of
the `j`-th coordinate vector. It only reindexes coefficients and does not define another operator
on `C₀`; composition reverses the order of the matrix product in this convention. -/
def matrixCoeffInputFirst {R I J : Type*} [SeminormedRing R] [TopologicalSpace I]
    [TopologicalSpace J] [DiscreteTopology J] [DecidableEq J]
    (u : C₀(J, R) →L[R] C₀(I, R)) (j : J) (i : I) : R :=
  ContinuousLinearMap.matrixCoeff u i j

/-! ## Layer 4: Amice's theorem -/

/-- **Amice's theorem** (§4.4; [Am], [Col] I.4). For a complete ultrametric normed module `E`
with contractive `ℤ_p`-action, the pinned Amice map `(cₙ) ↦ ∑ₙ ⌊n/pʰ⌋! (x choose n) • cₙ`,
`C₀(ℕ, E) → LA_h(E)`, is bijective and preserves norms. The pinned library proves only that it is
norm-nonincreasing (`TauCeti.AnalyticStage.norm_amiceMap_le`). -/
theorem amiceMap_bijective_and_norm_eq (h : ℕ) {E : Type*} [NormedAddCommGroup E]
    [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
    Function.Bijective (TauCeti.AnalyticStage.amiceMap p h ℤ_[p] (E := E)) ∧
      ∀ c : C₀(ℕ, E), ‖TauCeti.AnalyticStage.amiceMap p h ℤ_[p] c‖ = ‖c‖ := by
  sorry

/-- **Amice's basis of `LA_h(ℤ_p)`** (§4.4; [Am], [Col] I.4): the disc expansions of the
polynomials `e_{h,n}(x) = ⌊n/pʰ⌋! (x choose n)` form an orthonormal basis of the analytic stage
`LA_h(ℤ_p)` over `ℤ_p`. -/
theorem isOrthonormalBasis_amiceTerm (h : ℕ) :
    TauCeti.IsOrthonormalBasis ℤ_[p]
      (fun n : ℕ ↦ TauCeti.AnalyticStage.amiceTerm p h n (1 : ℤ_[p])) := by
  sorry

/-! ## Layer 5: the adic universal character and separation by weights -/

section Adic

variable {S : Type*} [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
  [IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]

/-- **The adic universal character** (§5.3, adic target; the field case is [RJW] Remark 3.47).
Over a complete separated linearly topologised `ℤ_p`-algebra `S`, a finite part
`η : (ℤ/qℤ)ˣ →* Sˣ` and a coordinate `z` that is topologically nilpotent in the sense of
`PowerSeries.HasEval` determine a unique weight with that finite part and coordinate
`κ(γ) - 1 = z`, where `γ = exp q`. No norm on `S` is assumed; the pinned
`TauCeti.WeightSpace.ofCoord` is the normed case. -/
theorem exists_character_of_hasEval
    (η : (ZMod (p ^ TauCeti.padicUnitsDepth p))ˣ →* Sˣ) {z : S} (hz : PowerSeries.HasEval z) :
    ∃! κ : TauCeti.WeightSpace p S, κ.finiteChar = η ∧ κ.coord = z := by
  sorry

/-- **The binomial formula for an adic weight** (§5.3, adic target). If the coordinate of a weight
`κ` with values in `S` is topologically nilpotent, then `κ(x) = η(x mod q) · (1 + T_κ) ^ s(x)`,
where `x ↦ (x mod q, s(x))` is the pinned decomposition `ℤ_pˣ ≃ₜ* (ℤ/qℤ)ˣ × ℤ_p` and the power is
the binomial series evaluated at `T_κ`. -/
theorem eq_aeval_binomialSeries (κ : TauCeti.WeightSpace p S)
    (hκ : PowerSeries.HasEval κ.coord) (x : ℤ_[p]ˣ) :
    (κ x : S) = (κ.finiteChar (TauCeti.padicIntUnitsEquivZModUnitsProd p x).1 : S) *
      PowerSeries.aeval (R := ℤ_[p]) hκ (PowerSeries.binomialSeries ℤ_[p]
        (Multiplicative.toAdd (TauCeti.padicIntUnitsEquivZModUnitsProd p x).2)) := by
  sorry

end Adic

/-- **The Amice coordinate is the completed-group-algebra coordinate** (§5.3; [RJW]
Proposition 3.16 and Theorem 3.25). For an integral measure `μ` on `ℤ_p`, the power-series
coordinate `T ↦ [γ] - 1` at the topological generator `γ = ofAdd 1` of `Multiplicative ℤ_p` sends
the integral Amice transform of `μ` to the completed-group-algebra element of `μ`, so that `δ_a`
goes to `[γ^a]`. -/
theorem amiceTransform_completedGroupAlgebra_compat (μ : AbstractMeasure ℤ_[p] ℤ_[p] ℤ_[p]) :
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate (TauCeti.isProP_multiplicative_padicInt p)
        (TauCeti.topologicallyGenerates_ofAdd_one_padicInt p)
        (AbstractMeasure.amiceTransformEquiv μ) =
      AbstractMeasure.completedGroupAlgebraEquiv
        (AbstractMeasure.map ⟨Multiplicative.ofAdd, continuous_ofAdd⟩ μ) := by
  sorry

/-- **Weights separate field-valued measures on `ℤ_pˣ`** (§5.3; [RJW] Remark 3.47). A bounded
`ℂ_p`-valued measure on `ℤ_pˣ` is determined by its integrals `∫ κ dμ` against all continuous
weights `κ : ℤ_pˣ → ℂ_pˣ`. The pinned `TauCeti.measureFun_injective` is the case of extended
integral measures. -/
theorem measurePairing_injective :
    Function.Injective fun (μ : AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p])
      (κ : TauCeti.WeightSpace p ℂ_[p]) ↦ κ.weightTest.characterIntegralAlgHom μ := by
  sorry

end

end TauCetiRoadmap.PadicFunctionalAnalysis

end
