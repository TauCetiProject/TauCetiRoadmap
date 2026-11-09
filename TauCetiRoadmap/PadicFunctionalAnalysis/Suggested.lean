module

public import Mathlib
public import TauCeti.RingTheory.Huber.Padic.Basic
public import TauCeti.NumberTheory.Padics.Distribution.Amice.Basis
public import TauCeti.NumberTheory.Padics.Distribution.Amice.Norm
public import TauCeti.NumberTheory.Padics.Distribution.LocallyAnalytic
public import TauCeti.RingTheory.PowerSeries.OpenDisc.Basic
public import TauCeti.NumberTheory.Padics.WeightSpace
public import TauCeti.NumberTheory.Padics.Measure.CharacterIntegral
public import TauCeti.Analysis.Normed.Module.Bases.Orthonormal
public import TauCeti.NumberTheory.Padics.Measure.CompletedGroupAlgebra
public import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.PowerSeries
public import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic

/-!
# P-adic functional analysis: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`, which is
definitive. This file states, against the pinned Mathlib and Tau Ceti, the headline theorems of
the roadmap that the pinned libraries do not already prove: Amice's theorem (§4.4), the analytic
level of an additive character (§4.6), the unbounded Amice transform (§4.7), the adic universal
character, the Amice-coordinate comparison and separation by weights (§5.3), and the analytic
level of a weight (§5.4). It uses the pinned carriers `TauCeti.AnalyticStage` with
`TauCeti.AnalyticStage.amiceMap`, `TauCeti.AnalyticStage.amiceTerm` and
`TauCeti.AnalyticStage.eval` (§§4.4, 4.6), the direct limit `TauCeti.LocallyAnalytic` and the
open-disc predicate `PowerSeries.OnOpenDisc` (§4.7), `PadicInt.addChar_of_value_at_one` and
`TauCeti.amiceRadius` (§4.6), `TauCeti.WeightSpace` with `TauCeti.WeightSpace.finiteChar`,
`TauCeti.WeightSpace.coord` and `TauCeti.WeightSpace.principalChar` (§§5.3–5.4),
`AbstractMeasure` with `ContinuousMonoidHom.characterIntegralAlgHom`, and the
completed-group-algebra equivalence `AbstractMeasure.completedGroupAlgebraEquiv` with the
power-series coordinate `TauCeti.completedGroupAlgebra.powerSeriesCoordinate` (§5.3). Every
result the pinned libraries already prove is cited by name in the README, not restated here. The
only definitions are the two that state §4.7: the predicate `IsLocallyAnalyticDistribution` and
the transform `amiceTransformLA`.

Two headline targets are not statable at the pins and nothing is stated in their place. The
scalar analytic factors of §5.5: no pinned declaration extends the principal part of a weight
analytically to `1 + p^h 𝒪_K`, and the expansion of `κ(cz + d)` needs that extension. The annular
coefficient ring `H` of §5.6: its headline, that `H[1/T]` with the gauge of unit ball `H` is a
Banach–Tate ring on which the evaluations at the points `p⁻¹ < |t| < 1` of `ℂ_p` are jointly
injective, needs the convolution ring of two-sided series and its evaluation maps, whose
definitions rest on the convergence theorems of §5.6; no pinned carrier provides them. The
remaining targets of §§4.4–5.6 are specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicFunctionalAnalysis

open Filter Topology
open scoped ZeroAtInfty

noncomputable section

variable {p : ℕ} [Fact p.Prime]

/-! ## Layer 4: Amice's theorem and the analytic level of a character -/

/-- **Amice's theorem** (§4.4; [Amice] Théorème 2, p. 150; the field case is [Col] Théorème I.4.7,
p. 15). For a complete ultrametric normed module `E` with contractive `ℤ_p`-action, the pinned Amice
map `(cₙ) ↦ ∑ₙ ⌊n/pʰ⌋! (x choose n) • cₙ`, `C₀(ℕ, E) → LA_h(E)`, is bijective and preserves norms.
The pinned library proves only that it is norm-nonincreasing
(`TauCeti.AnalyticStage.norm_amiceMap_le`). -/
theorem amiceMap_bijective_and_norm_eq (h : ℕ) {E : Type*} [NormedAddCommGroup E]
    [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
    Function.Bijective (TauCeti.AnalyticStage.amiceMap p h ℤ_[p] (E := E)) ∧
      ∀ c : C₀(ℕ, E), ‖TauCeti.AnalyticStage.amiceMap p h ℤ_[p] c‖ = ‖c‖ := by
  sorry

/-- **Amice's basis of `LA_h(ℤ_p)`** (§4.4; [Amice] Théorème 2; [Col] Théorème I.4.7): the disc
expansions of the polynomials `e_{h,n}(x) = ⌊n/pʰ⌋! (x choose n)` form an orthonormal basis of the
analytic stage `LA_h(ℤ_p)` over `ℤ_p`. -/
theorem isOrthonormalBasis_amiceTerm (h : ℕ) :
    TauCeti.IsOrthonormalBasis ℤ_[p]
      (fun n : ℕ ↦ TauCeti.AnalyticStage.amiceTerm p h n (1 : ℤ_[p])) := by
  sorry

/-- **The analytic level of an additive character** (§4.6; [Col] Théorème I.4.7 and the proof of
Lemme II.2.1, p. 30, with the coefficient criterion `TauCeti.tendsto_amiceCharCoeff_iff`). For a
complete ultrametric normed `ℚ_p`-algebra `K` with multiplicative norm, such as a complete normed
field over `ℚ_p`, and a topologically nilpotent `t`, the character `χ_t(x) = (1 + t)^x` is the
evaluation of a vector of the analytic stage `LA_h(K)` exactly when `‖t‖ < r_h = p^(−1/((p−1)pʰ))`.
The pinned library proves the "if" direction (`TauCeti.AnalyticStage.eval_addCharExpansion`); the
"only if" needs Amice's theorem. -/
theorem exists_eval_eq_addChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K] {t : K}
    (ht : Tendsto (t ^ ·) atTop (𝓝 0)) :
    (∃ f : TauCeti.AnalyticStage p h K,
        ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = PadicInt.addChar_of_value_at_one t ht) ↔
      ‖t‖ < TauCeti.amiceRadius p h := by
  sorry

/-- A `K`-linear functional `μ` on the algebraic direct limit `LA(ℤ_p, K)` of the analytic stages
is a **locally analytic distribution** (§4.7) when its restriction to every stage `LA_h(K)` is
continuous, that is, bounded for the stage norm. -/
def IsLocallyAnalyticDistribution {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    (μ : TauCeti.LocallyAnalytic p K K →ₗ[K] K) : Prop :=
  ∀ h : ℕ, Continuous (μ ∘ₗ TauCeti.LocallyAnalytic.ofStage K h)

/-- The **Amice transform** `∑ₙ μ((· choose n)) Tⁿ` of a `K`-linear functional `μ` on
`LA(ℤ_p, K)` (§4.7). The function `x ↦ (x choose n)` enters as the stage-zero vector
`TauCeti.AnalyticStage.amiceTerm p 0 n (n!)⁻¹`, the expansion of `n! (x choose n) • (n!)⁻¹`. -/
noncomputable def amiceTransformLA {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    (μ : TauCeti.LocallyAnalytic p K K →ₗ[K] K) : PowerSeries K :=
  PowerSeries.mk fun n ↦ μ <|
    TauCeti.LocallyAnalytic.ofStage K 0 (TauCeti.AnalyticStage.amiceTerm p 0 n (n.factorial : K)⁻¹)

/-- **The unbounded Amice transform** (§4.7; [Col] Théorème II.2.2, p. 30; [RJW] Theorem 3.43,
p. 25). For a complete normed field `K` over `ℚ_p`, the Amice transform is a bijection from the
locally analytic distributions with values in `K` onto the power series over `K` that converge on
the open unit disc, in the sense of the pinned `PowerSeries.OnOpenDisc`. The bounded case is
Mathlib's `AbstractMeasure.amiceTransformEquiv`. -/
theorem bijOn_amiceTransformLA {K : Type*} [NormedField K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K] [NormSMulClass ℚ_[p] K] [IsUltrametricDist K]
    [CompleteSpace K] :
    Set.BijOn (amiceTransformLA (p := p) (K := K)) {μ | IsLocallyAnalyticDistribution μ}
      {F | F.OnOpenDisc 1} := by
  sorry

/-! ## Layer 5: the adic universal character, separation by weights and analytic levels -/

section Adic

variable {S : Type*} [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
  [IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]

/-- **The adic universal character** (§5.3, adic target; the case of `ℂ_p` is [RJW] Remark 3.47,
pp. 25–26).
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

/-- **The Amice coordinate is the completed-group-algebra coordinate** (§5.3; [RJW] Proposition
3.16, p. 16, and Theorem 3.25, p. 18). For an integral measure `μ` on `ℤ_p`, the power-series
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

/-- **Weights separate field-valued measures on `ℤ_pˣ`** (§5.3; [RJW] Remark 3.47, p. 26). A bounded
`ℂ_p`-valued measure on `ℤ_pˣ` is determined by its integrals `∫ κ dμ` against all continuous
weights `κ : ℤ_pˣ → ℂ_pˣ`. The pinned `TauCeti.measureFun_injective` is the case of extended
integral measures. -/
theorem measurePairing_injective :
    Function.Injective fun (μ : AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p])
      (κ : TauCeti.WeightSpace p ℂ_[p]) ↦ κ.weightTest.characterIntegralAlgHom μ := by
  sorry

/-- **The analytic level of a weight** (§5.4). For a weight `κ` with values in a complete
ultrametric normed `ℚ_p`-algebra `K` with multiplicative norm, the principal part `s ↦ κ(γ^s) = (1 +
T_κ)^s` of `κ` (`TauCeti.WeightSpace.principalChar`) is the evaluation of a vector of the analytic
stage `LA_h(K)` exactly when `‖T_κ‖ < r_h = p^(−1/((p−1)pʰ))`. Through `x ↦ log(x/ω(x̄))/q`, this is
analyticity of `κ` on the cosets of `1 + p^(h + v_p(q)) ℤ_p` in `ℤ_pˣ`, the level `h + v_p(q)` of
the README, and `r_h = p^(−q/((p−1)p^(h + v_p(q))))`. It follows from `exists_eval_eq_addChar_iff`
and `TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`. -/
theorem exists_eval_eq_principalChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    (κ : TauCeti.WeightSpace p K) :
    (∃ f : TauCeti.AnalyticStage p h K,
        ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = κ.principalChar) ↔
      ‖κ.coord‖ < TauCeti.amiceRadius p h := by
  sorry

end

end TauCetiRoadmap.PadicFunctionalAnalysis

end
