import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Analysis.Normed.Unbundled.RingSeminorm
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.Algebra.TopologicallyNilpotent
import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.Noetherian.Defs
import TauCeti.RingTheory.Huber.Basic
import TauCeti.NumberTheory.Padics.PadicIntegers

/-!
# P-adic functional analysis: representative interfaces

`README.md` is the mathematical specification. These signatures fix selected conventions and
supplier contracts, not an exhaustive checklist. Definitions have mathematical bodies; `sorry`
marks unproved roadmap targets. No admitted instance enters typeclass search.

This file uses the native Mahler isometry, Amice transform and topological Huber predicates.
It constructs neither a second Tate algebra, a distribution topology, nor a completed group
algebra. The chosen unit `γ` is a parameter in the character signatures; the production choice
is `exp(q)` with `q=4` at `p=2`.

Banach modules use the existing normed additive group, module, contractive scalar-action,
ultrametric and completeness classes. There is no replacement `BanachModule` class.
The normed `IsTate` below concerns a specified norm; it is not the topological
`TauCeti.Huber.IsTateRing`. The explicit bridge below uses the native topological predicates.

General coefficient extension of measures, completed tensors, and the completed group algebra
are imported interfaces in the README, not placeholder definitions in this file. Do not import
this roadmap prototype into production mathematics; implement its targets in the library.
-/

namespace TauCetiRoadmap.PadicFunctionalAnalysis

open Filter Topology
open scoped ZeroAtInfty Classical PowerSeries.WithPiTopology

noncomputable section

universe u

/-! ## Layers 0–1: Tate data, gauges and operator norms -/

def IsMultiplicative {R : Type*} [Norm R] [Mul R] (a : R) : Prop :=
  ∀ x, ‖a * x‖ = ‖a‖ * ‖x‖

/-- Chosen normed data; the intended production name is `NormedRing.PseudoUniformizer`.
Unlike `Huber.IsPseudoUniformizer`, this requires exact scaling for the specified norm. -/
structure PseudoUniformizer (R : Type*) [NormedRing R] where
  unit : Rˣ
  isMultiplicative : IsMultiplicative (unit : R)
  norm_pos : 0 < ‖(unit : R)‖
  norm_lt_one : ‖(unit : R)‖ < 1

/-- A property of the specified norm, intended as `NormedRing.IsTate` in production.
Completeness and the ultrametric property are separate hypotheses. -/
class IsTate (R : Type*) [NormedRing R] : Prop where
  exists_pseudoUniformizer : Nonempty (PseudoUniformizer R)

/-- The topological implication does not require completeness or exact scaling. -/
theorem PseudoUniformizer.isTopologicallyNilpotent {R : Type*} [NormedRing R]
    (ϖ : PseudoUniformizer R) : IsTopologicallyNilpotent (ϖ.unit : R) :=
  tendsto_pow_atTop_nhds_zero_of_norm_lt_one ϖ.norm_lt_one

/-- Normed data gives the existing topological pseudouniformiser predicate. -/
theorem PseudoUniformizer.isPseudoUniformizer {R : Type*} [NormedRing R]
    (ϖ : PseudoUniformizer R) : TauCeti.Huber.IsPseudoUniformizer (ϖ.unit : R) :=
  ⟨ϖ.unit.isUnit, ϖ.isTopologicallyNilpotent⟩

/-- Once §0.4 supplies the unit-ball pair of definition, this is the native Tate class.
No converse instance is installed for an arbitrary compatible norm. -/
theorem PseudoUniformizer.isTateRing {R : Type*} [NormedCommRing R]
    [TauCeti.Huber.IsHuberRing R] (ϖ : PseudoUniformizer R) :
    TauCeti.Huber.IsTateRing R where
  exists_isPseudoUniformizer := ⟨ϖ.unit, ϖ.isPseudoUniformizer⟩

/-- Numerical gauge, depending on all three choices (§0.4). -/
def tateGauge {A : Type*} [CommRing A] (A₀ : Subring A) (ϖ : Aˣ) (a : ℝ) (x : A) : ℝ :=
  sInf ((fun n : ℤ ↦ a ^ (-n)) '' {n | ((ϖ ^ (-n) : Aˣ) : A) * x ∈ A₀})

section Gauge

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
    (A₀ : Subring A) (ϖ : Aˣ) (a : ℝ) (ha : 1 < a)
    (hϖ : (ϖ : A) ∈ A₀) (hnil : IsTopologicallyNilpotent (ϖ : A))
    (hb : (𝓝 (0 : A)).HasBasis (fun _ : ℕ ↦ True)
      (fun n ↦ {x | ((ϖ ^ (-(n : ℤ)) : Aˣ) : A) * x ∈ A₀}))

include ha hϖ hnil hb

theorem exists_tateSeminorm :
    ∃ α : RingSeminorm A, (∀ x, α x = tateGauge A₀ ϖ a x) ∧
      (∀ x y, α (x + y) ≤ max (α x) (α y)) ∧
      (𝓝 (0 : A)).HasBasis (fun ε : ℝ ↦ 0 < ε) (fun ε ↦ {x | α x < ε}) := by
  sorry

theorem tateGauge_eq_zero_iff :
    (∀ x, tateGauge A₀ ϖ a x = 0 ↔ x ∈ closure ({0} : Set A)) ∧
      ((∀ x, tateGauge A₀ ϖ a x = 0 ↔ x = 0) ↔ T2Space A) := by
  sorry

theorem tateGauge_equiv (B₀ : Subring A) (hϖB : (ϖ : A) ∈ B₀)
    (hB : (𝓝 (0 : A)).HasBasis (fun _ : ℕ ↦ True)
      (fun n ↦ {x | ((ϖ ^ (-(n : ℤ)) : Aˣ) : A) * x ∈ B₀})) :
    ∃ C : ℝ, 0 < C ∧ ∀ x,
      tateGauge A₀ ϖ a x ≤ C * tateGauge B₀ ϖ a x ∧
      tateGauge B₀ ϖ a x ≤ C * tateGauge A₀ ϖ a x := by
  sorry

theorem tateGauge_rpow (b : ℝ) (hb' : 1 < b) (x : A) :
    tateGauge A₀ ϖ b x = (tateGauge A₀ ϖ a x) ^ (Real.log b / Real.log a) := by
  sorry

end Gauge

/-- The formula of Mathlib #42865; production uses `ContinuousLinearMap.opNorm`.
This local prototype does not install a competing norm instance. -/
def opNorm {R M N : Type*} [Semiring R] [SeminormedAddCommGroup M] [Module R M]
    [SeminormedAddCommGroup N] [Module R N] (u : M →L[R] N) : ℝ :=
  sInf {c | 0 ≤ c ∧ ∀ x, ‖u x‖ ≤ c * ‖x‖}

theorem le_opNorm {R M N : Type*} [NormedRing R] [IsTate R]
    [NormedAddCommGroup M] [Module R M] [IsBoundedSMul R M]
    [NormedAddCommGroup N] [Module R N] [IsBoundedSMul R N]
    (u : M →L[R] N) (x : M) : ‖u x‖ ≤ opNorm u * ‖x‖ := by
  sorry

theorem opNorm_eq {K M N : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup M] [NormedSpace K M]
    [NormedAddCommGroup N] [NormedSpace K N] (u : M →L[K] N) :
    opNorm u = ‖u‖ := rfl

/-! ## Layer 2: native models, coefficient norms and strict splitting -/

/-- A coordinate vector, with its decay proof rather than an admitted construction. -/
def single {I E : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [NormedAddCommGroup E] (i : I) (x : E) : C₀(I, E) :=
  ⟨⟨Pi.single i x, continuous_of_discreteTopology⟩, by
    rw [cocompact_eq_cofinite]
    apply tendsto_const_nhds.congr'
    filter_upwards [Filter.eventually_cofinite_ne i] with j hj
    simp [hj]⟩

/-- Coefficient norms are essential here: norms of `a i • e i` would allow torsion. -/
def IsOrthonormalFamily (R : Type*) [NormedRing R] {I M : Type*}
    [NormedAddCommGroup M] [Module R M] (e : I → M) : Prop :=
  ∀ (s : Finset I) (a : I → R), ‖∑ i ∈ s, a i • e i‖₊ = s.sup fun i ↦ ‖a i‖₊

/-- A topological basis predicate; equivalence with a complete model needs completeness. -/
def IsOrthonormalBasis (R : Type*) [NormedRing R] {I M : Type*}
    [NormedAddCommGroup M] [Module R M] (e : I → M) : Prop :=
  IsOrthonormalFamily R e ∧ Dense (Submodule.span R (Set.range e) : Set M)

def IsONable (R : Type*) (M : Type u) [NormedRing R] [NormedAddCommGroup M] [Module R M] : Prop :=
  ∃ (I : Type u) (_ : TopologicalSpace I) (_ : DiscreteTopology I),
    Nonempty (M ≃ₗᵢ[R] C₀(I, R))

section OrthonormalBasis

variable {R I M : Type*} [NormedCommRing R] [IsUltrametricDist R]
    [NormOneClass R] [CompleteSpace R]
    [TopologicalSpace I] [DiscreteTopology I]
    [NormedAddCommGroup M] [Module R M] [IsBoundedSMul R M]
    [IsUltrametricDist M] [CompleteSpace M]

/-- A specified basis gives coordinates and unconditional reconstruction, with no global choice. -/
theorem exists_linearIsometryEquiv_of_isOrthonormalBasis (e : I → M)
    (he : IsOrthonormalBasis R e) :
    ∃ c : M ≃ₗᵢ[R] C₀(I, R), (∀ i, c (e i) = single i 1) ∧
      ∀ x, HasSum (fun i ↦ (c x) i • e i) x := by
  sorry

/-- Either a basis or a model isometry can be the user's starting point (§2.2). -/
theorem exists_isOrthonormalBasis_iff :
    (∃ e : I → M, IsOrthonormalBasis R e) ↔ Nonempty (M ≃ₗᵢ[R] C₀(I, R)) := by
  sorry

end OrthonormalBasis

def IsPotentiallyONable (R : Type*) (M : Type u) [NormedRing R] [NormedAddCommGroup M]
    [Module R M] : Prop :=
  ∃ (I : Type u) (_ : TopologicalSpace I) (_ : DiscreteTopology I),
    Nonempty (M ≃L[R] C₀(I, R))

/-- A concrete continuous retract; no speculative projective-module instance. -/
def HasPr (R : Type*) (M : Type u) [NormedRing R] [NormedAddCommGroup M] [Module R M] : Prop :=
  ∃ (I : Type u) (_ : TopologicalSpace I) (_ : DiscreteTopology I)
    (i : M →L[R] C₀(I, R)) (r : C₀(I, R) →L[R] M), ∀ x, r (i x) = x

/-- Output first: columns are images of input vectors, as for `LinearMap.toMatrix`. -/
def matrixCoeff {R I J : Type*} [NormedCommRing R]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, R) →L[R] C₀(I, R)) (i : I) (j : J) : R :=
  u (single j 1) i

/-- The input-first coefficients used by LocallyAnalyticDistributions.
This only reindexes coefficients; it does not construct another operator on `C₀`.
Composition reverses matrix product order in this convention. -/
def matrixCoeffInputFirst {R I J : Type*} [NormedCommRing R]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, R) →L[R] C₀(I, R)) (j : J) (i : I) : R :=
  matrixCoeff u i j

theorem exists_finset_norm_le {R I : Type*} [NormedCommRing R] [IsUltrametricDist R]
    [NormOneClass R] [CompleteSpace R] [IsTate R] [IsNoetherianRing R]
    [TopologicalSpace I] [DiscreteTopology I] (P : Submodule R C₀(I, R)) (hP : P.FG) :
    ∃ (S : Finset I) (C : ℝ), 0 < C ∧ ∀ f ∈ P,
      ‖f‖ ≤ C * (S.sup fun i ↦ ‖f i‖₊) := by
  sorry

theorem exists_continuousLinearEquiv_prod_of_countableType
    {K M E N : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NormedAddCommGroup M] [NormedSpace K M] [IsUltrametricDist M] [CompleteSpace M]
    [NormedAddCommGroup E] [NormedSpace K E] [IsUltrametricDist E] [CompleteSpace E]
    [NormedAddCommGroup N] [NormedSpace K N] [IsUltrametricDist N] [CompleteSpace N]
    (e : ℕ → E) (he : Dense (Submodule.span K (Set.range e) : Set E))
    (i : M →L[K] E) (q : E →L[K] N) (hi : Topology.IsClosedEmbedding i)
    (hq : Function.Surjective q) (hex : LinearMap.range i.toLinearMap = LinearMap.ker q.toLinearMap) :
    ∃ d : E ≃L[K] M × N, (∀ m, d (i m) = (m, 0)) ∧ ∀ x, (d x).2 = q x := by
  sorry

/-! ## Layer 3: bounded Amice and the integral dual ball -/

section Measures

variable {p : ℕ} [Fact p.Prime]

/-- The coefficient model of §3.2 is already Mathlib's module-valued Mahler isometry. -/
theorem nonempty_mahler_coordinates {E : Type*} [NormedAddCommGroup E]
    [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
    Nonempty (C₀(ℕ, E) ≃ₗᵢ[ℤ_[p]] C(ℤ_[p], E)) :=
  ⟨(PadicInt.mahlerEquiv E).symm⟩

/-- The consumer's Mahler-term formula agrees with the native Amice transform. -/
theorem coeff_amiceTransform_eq_mahlerTerm {R : Type*} [NormedCommRing R]
    [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]
    (μ : AbstractMeasure ℤ_[p] R R) (n : ℕ) :
    (AbstractMeasure.amiceTransform μ).coeff n = μ (PadicInt.mahlerTerm (1 : R) n) := by
  rw [AbstractMeasure.coeff_amiceTransform]
  congr 1

theorem norm_toCLMEquiv_eq_iSup_coeff {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
    (μ : AbstractMeasure ℤ_[p] K K) :
    ‖AbstractMeasure.toCLMEquiv μ‖ = ⨆ n, ‖(AbstractMeasure.amiceTransform μ).coeff n‖ := by
  sorry

theorem mem_range_amiceTransform_iff {K : Type*} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K]
    (F : PowerSeries K) :
    (∃ μ : AbstractMeasure ℤ_[p] K K, AbstractMeasure.amiceTransform μ = F) ↔
      ∃ C : ℝ, 0 ≤ C ∧ ∀ n, ‖F.coeff n‖ ≤ C := by
  sorry

theorem existsUnique_integral_iff_norm_le_one (ν : AbstractMeasure ℤ_[p] ℚ_[p] ℚ_[p]) :
    (∃! μ : AbstractMeasure ℤ_[p] ℤ_[p] ℤ_[p], ∀ f : C(ℤ_[p], ℤ_[p]),
      ν ((⟨fun x : ℤ_[p] ↦ (x : ℚ_[p]), continuous_subtype_val⟩ : C(ℤ_[p], ℚ_[p])).comp f) =
        (μ f : ℚ_[p])) ↔ ‖AbstractMeasure.toCLMEquiv ν‖ ≤ 1 := by
  sorry

def phiMeasure (R : Type*) [NormedCommRing R] :
    AbstractMeasure ℤ_[p] R R →ₗ[R] AbstractMeasure ℤ_[p] R R :=
  AbstractMeasure.map ⟨fun x ↦ (p : ℤ_[p]) * x, continuous_const.mul continuous_id⟩

theorem amiceTransform_phiMeasure (μ : AbstractMeasure ℤ_[p] ℤ_[p] ℤ_[p]) :
    AbstractMeasure.amiceTransform (phiMeasure ℤ_[p] μ) =
      PowerSeries.subst ((1 + PowerSeries.X) ^ p - 1 : PowerSeries ℤ_[p])
        (AbstractMeasure.amiceTransform μ) := by
  sorry

end Measures

/-! ## Layer 4: analytic stages and the two quantitative seminorms -/

section Stages

variable (p : ℕ) [Fact p.Prime]

abbrev LocallyAnalytic (h : ℕ) (E : Type*) [NormedAddCommGroup E] :=
  C₀(ZMod (p ^ h) × ℕ, E)

/-- This is the evaluation relation, not a claim that all coefficient modules embed. -/
def IsDiscRealization {E : Type*} [NormedAddCommGroup E] [Module ℤ_[p] E]
    (h : ℕ) (c : LocallyAnalytic p h E) (f : ℤ_[p] → E) : Prop :=
  ∀ (a : ZMod (p ^ h)) (w : ℤ_[p]),
    f ((a.val : ℤ_[p]) + (p : ℤ_[p]) ^ h * w) = ∑' n : ℕ, w ^ n • c (a, n)

def amiceDualNorm {K : Type*} [NormedField K] (h : ℕ) (F : PowerSeries K) : ℝ :=
  ⨆ n, ‖F.coeff n‖ * ‖((n / p ^ h).factorial : ℚ_[p])‖

def amiceDiscNorm {K : Type*} [NormedField K] (h : ℕ) (F : PowerSeries K) : ℝ :=
  ⨆ n : ℕ, ‖F.coeff n‖ * (p : ℝ) ^ (-((n : ℝ) / (((p : ℝ) - 1) * (p : ℝ) ^ h)))

variable {p} {K : Type*} [NontriviallyNormedField K]
    [NormedAlgebra ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K]

/-- Restrictedness on all smaller discs prevents a junk real supremum. -/
theorem amiceDiscNorm_le_amiceDualNorm (h : ℕ) (F : PowerSeries K)
    (hF : ∀ ρ : ℝ, 0 < ρ → ρ < 1 → F.IsRestricted ρ) :
    amiceDiscNorm p h F ≤ amiceDualNorm p h F := by
  sorry

theorem amiceDualNorm_le_amiceDiscNorm (h : ℕ) (F : PowerSeries K)
    (hF : ∀ ρ : ℝ, 0 < ρ → ρ < 1 → F.IsRestricted ρ) :
    amiceDualNorm p h F ≤ p * amiceDiscNorm p (h + 1) F := by
  sorry

/-- The derivative functional is an unbounded measure sequence but a valid distribution. -/
example (h : ℕ) :
    let F : PowerSeries ℚ_[p] := PowerSeries.mk fun n ↦
      if n = 0 then 0 else (-1 : ℚ_[p]) ^ (n + 1) / n
    (∀ ρ : ℝ, 0 < ρ → ρ < 1 → F.IsRestricted ρ) ∧
      (¬ ∃ C : ℝ, ∀ n, ‖F.coeff n‖ ≤ C) ∧
      amiceDiscNorm p h F ≤ amiceDualNorm p h F ∧
      amiceDualNorm p h F ≤ p * amiceDiscNorm p (h + 1) F := by
  sorry

end Stages

/-! ## Layer 5: topology-neutral characters and separate specialisation contracts -/

def q (p : ℕ) : ℕ := if p = 2 then 4 else p

abbrev WeightSpace (p : ℕ) [Fact p.Prime] (R : Type*) [Monoid R] [TopologicalSpace R] :=
  ℤ_[p]ˣ →ₜ* Rˣ

def TCoord {p : ℕ} [Fact p.Prime] {R : Type*} [Ring R] [TopologicalSpace R]
    (γ : ℤ_[p]ˣ) (κ : WeightSpace p R) : R := (κ γ : R) - 1

section Characters

variable {p : ℕ} [Fact p.Prime]

/-- The base linear-topology assumption is a supplier fact, not an admitted local instance. -/
theorem exists_character_of_hasEval [IsLinearTopology ℤ_[p] ℤ_[p]]
    {S : Type*} [CommRing S] [UniformSpace S]
    [IsUniformAddGroup S] [IsTopologicalRing S] [IsLinearTopology S S] [CompleteSpace S]
    [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]
    (γ : ℤ_[p]ˣ) (e : ℤ_[p]ˣ ≃ₜ* ((ZMod (q p))ˣ × Multiplicative ℤ_[p]))
    (he : e γ = (1, Multiplicative.ofAdd 1))
    (η : (ZMod (q p))ˣ →* Sˣ) {z : S} (hz : PowerSeries.HasEval z) :
    ∃! κ : WeightSpace p S, TCoord γ κ = z ∧ ∀ x,
      (κ x : S) = (η (e x).1 : S) * PowerSeries.aeval (R := ℤ_[p]) hz
        (PowerSeries.binomialSeries ℤ_[p] (Multiplicative.toAdd (e x).2)) := by
  sorry

theorem existsUnique_character_of_norm_lt_one {A : Type*} [NormedCommRing A]
    [NormedAlgebra ℚ_[p] A] [IsUltrametricDist A] [CompleteSpace A]
    (γ : ℤ_[p]ˣ) (e : ℤ_[p]ˣ ≃ₜ* ((ZMod (q p))ˣ × Multiplicative ℤ_[p]))
    (he : e γ = (1, Multiplicative.ofAdd 1))
    (η : (ZMod (q p))ˣ →* Aˣ) {z : A} (hz : ‖z‖ < 1) :
    ∃! κ : WeightSpace p A, TCoord γ κ = z ∧ ∀ x,
      HasSum (fun n : ℕ ↦ (η (e x).1 : A) *
        (((Ring.choose (Multiplicative.toAdd (e x).2) n : ℤ_[p]) : ℚ_[p]) • z ^ n))
        (κ x : A) := by
  sorry

def weightTest {A : Type*} [NormedCommRing A] (κ : WeightSpace p A) : C(ℤ_[p]ˣ, A) :=
  ⟨fun x ↦ (κ x : A), Units.continuous_val.comp κ.continuous⟩

/-- Pair a weight with an already extended measure; integral extension is supplied elsewhere. -/
def measurePairing (μ : AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p])
    (κ : WeightSpace p ℂ_[p]) : ℂ_[p] := μ (weightTest κ)

theorem measurePairing_norm_le (μ : AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p])
    (κ : WeightSpace p ℂ_[p]) :
    ‖measurePairing μ κ‖ ≤ ‖AbstractMeasure.toCLMEquiv μ‖ := by
  sorry

/-- The stronger field-valued separation statement implies the integral-measure contract. -/
theorem measurePairing_injective : Function.Injective (measurePairing (p := p)) := by
  sorry

end Characters

end

end TauCetiRoadmap.PadicFunctionalAnalysis
