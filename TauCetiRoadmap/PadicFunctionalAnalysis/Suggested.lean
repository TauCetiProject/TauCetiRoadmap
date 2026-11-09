module

public import Mathlib
public import TauCeti.RingTheory.Huber.Basic
public import TauCeti.RingTheory.Huber.Padic.Basic
public import TauCeti.NumberTheory.Padics.PadicIntegers
public import TauCeti.NumberTheory.Padics.Distribution.Amice.Basis
public import TauCeti.NumberTheory.Padics.Distribution.Amice.Character
public import TauCeti.NumberTheory.Padics.Distribution.LocallyAnalytic
public import TauCeti.RingTheory.PowerSeries.OpenDisc.Basic
public import TauCeti.NumberTheory.Padics.WeightSpace
public import TauCeti.NumberTheory.Padics.Measure.CharacterIntegral
public import TauCeti.Analysis.Normed.Module.Bases.Orthonormal
public import TauCeti.NumberTheory.Padics.Measure.CompletedGroupAlgebra
public import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.PowerSeries
public import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic

/-!
# p-adic functional analysis: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`, which is
definitive. This file states, against the pinned Mathlib and Tau Ceti, the headline theorems of
the roadmap that the pinned libraries do not already prove: Amice's theorem (§4.4), the analytic
level of an additive character (§4.6), the Amice bijection between locally analytic distributions
and series on the open unit disc (§4.7), the adic universal character, the Amice-coordinate
comparison and separation by weights (§5.3), and the analytic level of a weight (§5.4). It uses the
pinned carriers `TauCeti.AnalyticStage` with `TauCeti.AnalyticStage.amiceMap` and
`TauCeti.AnalyticStage.eval` (§§4.4, 4.6), `PadicInt.addChar_of_value_at_one` and
`TauCeti.amiceRadius` (§4.6), the algebraic direct limit `TauCeti.LocallyAnalytic` with
`TauCeti.LocallyAnalytic.ofStage` and `PowerSeries.OnOpenDisc` (§4.7), `TauCeti.WeightSpace` with
`TauCeti.WeightSpace.finiteChar`, `TauCeti.WeightSpace.coord` and
`TauCeti.WeightSpace.principalChar` (§§5.3–5.4), `AbstractMeasure` with
`ContinuousMonoidHom.characterIntegralAlgHom`, and the completed-group-algebra equivalence
`AbstractMeasure.completedGroupAlgebraEquiv` with the power-series coordinate
`TauCeti.completedGroupAlgebra.powerSeriesCoordinate` (§5.3). The two definitions `distributions`
and `binomialLA` exist only to state the §4.7 bijection. Every result the pinned libraries already
prove is cited by name in the README, not restated here.

Two headline targets are not statable at the pins and nothing is stated in their place. The
scalar analytic factors of §5.5: no pinned declaration extends a weight analytically from
`1 + p^(h') ℤ_p` to `1 + p^(h') 𝒪_K` for a unit level `h' ≥ v_p(q)`, and the expansion of
`κ(cz + d)` needs that extension. The annular coefficient ring `H` of §5.6: the ring is itself a
target of the roadmap, so no carrier exists before the roadmap builds it. The remaining targets of
§§4.4–5.6 are specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.PadicFunctionalAnalysis

open Filter Topology
open scoped ZeroAtInfty

noncomputable section

variable {p : ℕ} [Fact p.Prime]

/-! ## Layer 4: Amice's theorem, the analytic level of a character and distributions -/

/-- **Amice's theorem** (§4.4; [Am] Théorème 2, p. 150, with `uₙ = n`; [Col] Théorème I.4.7,
p. 15). For a complete ultrametric normed
module `E` with contractive `ℤ_p`-action, the pinned Amice map
`(cₙ) ↦ ∑ₙ ⌊n/pʰ⌋! (x choose n) • cₙ`, `C₀(ℕ, E) → LA_h(E)`, is bijective and preserves norms.
The pinned library proves only that it is norm-nonincreasing
(`TauCeti.AnalyticStage.norm_amiceMap_le`). -/
theorem amiceMap_bijective_and_norm_eq (h : ℕ) {E : Type*} [NormedAddCommGroup E]
    [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
    Function.Bijective (TauCeti.AnalyticStage.amiceMap p h ℤ_[p] (E := E)) ∧
      ∀ c : C₀(ℕ, E), ‖TauCeti.AnalyticStage.amiceMap p h ℤ_[p] c‖ = ‖c‖ := by
  sorry

/-- **Amice's basis of `LA_h(ℤ_p)`** (§4.4; [Am] Théorème 2, p. 150, with `uₙ = n`; [Col]
Théorème I.4.7, p. 15): the disc expansions of
the polynomials `e_{h,n}(x) = ⌊n/pʰ⌋! (x choose n)` form an orthonormal basis of the analytic
stage `LA_h(ℤ_p)` over `ℤ_p`. -/
theorem isOrthonormalBasis_amiceTerm (h : ℕ) :
    TauCeti.IsOrthonormalBasis ℤ_[p]
      (fun n : ℕ ↦ TauCeti.AnalyticStage.amiceTerm p h n (1 : ℤ_[p])) := by
  sorry

/-- **The analytic level of an additive character** (§4.6; [Am] Théorème 3 and Corollaire 1(c),
pp. 159–161; [Col] Théorème I.4.7, p. 15, with the coefficient criterion
`TauCeti.tendsto_amiceCharCoeff_iff`; the "if" direction is the argument of [Col] Lemme II.2.1,
p. 30). For a complete ultrametric normed
`ℚ_p`-algebra `K` with multiplicative norm, such as a complete normed field over `ℚ_p`, and a
topologically nilpotent `t`, the character `χ_t(x) = (1 + t)^x` is the evaluation of a vector of
the analytic stage `LA_h(K)` exactly when `‖t‖ < r_h = p^(−1/((p−1)pʰ))`. The pinned library
proves the "if" direction (`TauCeti.AnalyticStage.eval_addCharExpansion`); the "only if" needs
Amice's theorem. -/
theorem exists_eval_eq_addChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K] {t : K}
    (ht : Tendsto (t ^ ·) atTop (𝓝 0)) :
    (∃ f : TauCeti.AnalyticStage p h K,
        ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = PadicInt.addChar_of_value_at_one t ht) ↔
      ‖t‖ < TauCeti.amiceRadius p h := by
  sorry

/-- **Locally analytic distributions on `ℤ_p`** (§4.7; [Col] §II.2, p. 29). The `K`-linear forms
on the algebraic direct limit `LA(ℤ_p, K) = TauCeti.LocallyAnalytic p K K` whose restriction to
every analytic stage `LA_h(K)` is continuous for the stage norm. No topology on `LA(ℤ_p, K)` is
used. -/
def distributions (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K] :
    Submodule K (TauCeti.LocallyAnalytic p K K →ₗ[K] K) where
  carrier := {μ | ∀ h, Continuous (μ ∘ₗ TauCeti.LocallyAnalytic.ofStage K h)}
  zero_mem' h := by rw [LinearMap.zero_comp]; exact continuous_zero
  add_mem' hμ hν h := by simpa [LinearMap.add_comp] using (hμ h).add (hν h)
  smul_mem' c μ hμ h := by simpa [LinearMap.smul_comp] using (hμ h).const_smul c

/-- **The binomial function** `x ↦ (x choose n)` as an element of `LA(ℤ_p, K)`: the level-zero
vector `TauCeti.AnalyticStage.amiceTerm p 0 n ((n!)⁻¹ • 1)`. By
`TauCeti.AnalyticStage.eval_amiceTerm` it evaluates to `x ↦ (x choose n)`, the factor
`⌊n / p⁰⌋! = n!` of Amice's polynomial cancelling `(n!)⁻¹`. -/
def binomialLA (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K] (n : ℕ) :
    TauCeti.LocallyAnalytic p K K :=
  TauCeti.LocallyAnalytic.ofStage K 0
    (TauCeti.AnalyticStage.amiceTerm p 0 n (((n.factorial : ℚ_[p])⁻¹) • (1 : K)))

/-- The normalisation of `binomialLA`: its function is the Mahler term `x ↦ (x choose n) • 1`.
Without the factor `(n!)⁻¹` it would be `n! (x choose n)`. -/
example (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K]
    [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K] [CompleteSpace K] (n : ℕ) :
    TauCeti.LocallyAnalytic.eval K (binomialLA (p := p) K n) = PadicInt.mahlerTerm (1 : K) n := by
  rw [binomialLA, TauCeti.LocallyAnalytic.eval_ofStage, TauCeti.AnalyticStage.eval_amiceTerm,
    pow_zero, Nat.div_one, ← Nat.cast_smul_eq_nsmul ℚ_[p], smul_smul,
    mul_inv_cancel₀ (by exact_mod_cast n.factorial_ne_zero), one_smul]

/-- **The Amice transform of locally analytic distributions** (§4.7; [Col] Théorème II.2.2,
p. 30; the one-variable case of [ST] Theorem 2.2, p. 9). For a complete normed extension `K` of
`ℚ_p`, the transform `μ ↦ A_μ = ∑ₙ μ((x choose n)) Tⁿ` sends every distribution to a series on the
open unit disc, and every series on the open unit disc is `A_μ` for exactly one distribution `μ`. -/
theorem amiceTransform_distribution_bijective (K : Type*) [NormedField K]
    [NormedAlgebra ℚ_[p] K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]
    [CompleteSpace K] :
    (∀ μ ∈ distributions (p := p) K,
        (PowerSeries.mk fun n ↦ μ (binomialLA (p := p) K n)).OnOpenDisc 1) ∧
      ∀ F : PowerSeries K, F.OnOpenDisc 1 →
        ∃! μ, μ ∈ distributions (p := p) K ∧ ∀ n, μ (binomialLA (p := p) K n) = F.coeff n := by
  sorry

/-! ## Layer 5: the adic universal character, separation by weights and analytic levels -/

section Adic

variable {S : Type*} [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
  [IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]

/-- **The adic universal character** (§5.3, adic target; the case `S = 𝒪_(ℂ_p)`, which holds the
values of every `ℂ_p`-valued weight, is [RJW] Remark 3.47, p. 25, for odd `p`, through
`ℤ_pˣ = μ_(p−1) × (1 + pℤ_p)`; `p = 2` runs the same way with `q = 4`).
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

/-- **The Amice coordinate is the completed-group-algebra coordinate** (§5.3; [RJW] diagram (3.4),
p. 18, with Proposition 3.16 and Theorem 3.25). For an integral measure `μ` on `ℤ_p`, the
power-series coordinate `T ↦ [γ] - 1` at the topological generator `γ = ofAdd 1` of
`Multiplicative ℤ_p` sends the integral Amice transform of `μ` to the completed-group-algebra
element of `μ`, so that `δ_a` goes to `[γ^a]`. -/
theorem amiceTransform_completedGroupAlgebra_compat (μ : AbstractMeasure ℤ_[p] ℤ_[p] ℤ_[p]) :
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate (TauCeti.isProP_multiplicative_padicInt p)
        (TauCeti.topologicallyGenerates_ofAdd_one_padicInt p)
        (AbstractMeasure.amiceTransformEquiv μ) =
      AbstractMeasure.completedGroupAlgebraEquiv
        (AbstractMeasure.map ⟨Multiplicative.ofAdd, continuous_ofAdd⟩ μ) := by
  sorry

/-- **Weights separate field-valued measures on `ℤ_pˣ`** (§5.3; [RJW] Remark 3.47, p. 25, for odd
`p`). A bounded `ℂ_p`-valued measure on `ℤ_pˣ` is determined by its integrals `∫ κ dμ` against all
continuous weights `κ : ℤ_pˣ → ℂ_pˣ`, for every prime `p`: the finite-order weights span the locally
constant functions on `ℤ_pˣ`, which are dense. The pinned `TauCeti.measureFun_injective` is the
case of extended integral measures. -/
theorem measurePairing_injective :
    Function.Injective fun (μ : AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p])
      (κ : TauCeti.WeightSpace p ℂ_[p]) ↦ κ.weightTest.characterIntegralAlgHom μ := by
  sorry

/-- **The analytic level of a weight** (§5.4). For a weight `κ` with values in a complete
ultrametric normed `ℚ_p`-algebra `K` with multiplicative norm, the principal part
`s ↦ κ(γ^s) = (1 + T_κ)^s` of `κ` (`TauCeti.WeightSpace.principalChar`) is the evaluation of a
vector of the analytic stage `LA_h(K)` exactly when `‖T_κ‖ < r_h = p^(−1/((p−1)pʰ))`. Through
`x ↦ log(x/ω(x̄))/q`, this is analyticity of `κ` on the cosets of `1 + p^(h + v_p(q)) ℤ_p` in
`ℤ_pˣ`, the level `h + v_p(q)` of the README, and `r_h = p^(−q/((p−1)p^(h + v_p(q))))`. It follows
from `exists_eval_eq_addChar_iff` and
`TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`. -/
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
