import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.Analysis.Normed.Operator.Fredholm.Basic
import Mathlib.Analysis.Normed.Module.Completion
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Trunc
import Mathlib.RingTheory.Noetherian.Defs

/-!
# Compact operators: representative interfaces

`README.md` is the specification. Theorems with `sorry` are deliberately unproved roadmap
targets. Definitions have bodies and there are no admitted instances. This file validates
representative interfaces, not an exhaustive checklist; it does not implement Fredholm theory.

`IsTate`, `opNorm`, `single` and `matrixCoeff` are local compatibility definitions for the PFA
supplier. `IsEntire` is the restricted-series supplier predicate. Replace these with imports
when those roadmaps are implemented; do not create competing production definitions. Generic
Hasse calculus, monic entire resultants and division are deliberately left in that supplier.
The ring-scalar bounded-action instance on `C₀` is an explicit hypothesis where needed.
The ring-level predicate is `IsRowCompact`. Its comparison
with compactoid image of the unit ball is a field theorem (§0.5); forgetting a coefficient
algebra to its scalar field need not preserve row compactness. The Banach-space compactoid-set
predicate below uses finite sums with coefficients in the scalar unit ball.

The tensor signature uses the native algebraic `TensorProduct` and its Hausdorff completion,
with the product-seminorm formula supplied explicitly. Part II must identify this presentation
with its single completed-tensor carrier. No placeholder completed tensor type is introduced.
The good-zero and Riesz predicates have bodies and include order zero.

Only library modules are imported. Production code should not import a roadmap prototype.
-/

namespace TauCetiRoadmap.CompactOperators

open Filter Topology
open scoped ZeroAtInfty Classical Polynomial

noncomputable section

def IsMultiplicative {R : Type*} [Norm R] [Mul R] (a : R) : Prop :=
  ∀ x, ‖a * x‖ = ‖a‖ * ‖x‖

structure PseudoUniformizer (R : Type*) [NormedRing R] where
  unit : Rˣ
  isMultiplicative : IsMultiplicative (unit : R)
  norm_pos : 0 < ‖(unit : R)‖
  norm_lt_one : ‖(unit : R)‖ < 1

class IsTate (R : Type*) [NormedRing R] : Prop where
  exists_pseudoUniformizer : Nonempty (PseudoUniformizer R)

def opNorm {R M N : Type*} [Semiring R] [SeminormedAddCommGroup M] [Module R M]
    [SeminormedAddCommGroup N] [Module R N] (u : M →L[R] N) : ℝ :=
  sInf {c | 0 ≤ c ∧ ∀ x, ‖u x‖ ≤ c * ‖x‖}

/-- Compatibility with the native field operator norm, with no competing instance. -/
theorem opNorm_eq {K M N : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup M] [NormedSpace K M]
    [NormedAddCommGroup N] [NormedSpace K N] (u : M →L[K] N) :
    opNorm u = ‖u‖ := rfl

def single {I E : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [NormedAddCommGroup E] (i : I) (x : E) : C₀(I, E) :=
  ⟨⟨Pi.single i x, continuous_of_discreteTopology⟩, by
    rw [cocompact_eq_cofinite]
    apply tendsto_const_nhds.congr'
    filter_upwards [Filter.eventually_cofinite_ne i] with j hj
    simp [hj]⟩

def matrixCoeff {R I J : Type*} [NormedRing R]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, R) →L[R] C₀(I, R)) (i : I) (j : J) : R :=
  u (single j 1) i

def IsEntire {R : Type*} [NormedCommRing R] (F : PowerSeries R) : Prop :=
  ∀ r : ℝ, 0 < r → F.IsRestricted r

/-! ## Layer 0 -/

section Approximation

variable {R M N : Type*} [NormedCommRing R]
    [NormedAddCommGroup M] [Module R M] [NormedAddCommGroup N] [Module R N]

def IsFiniteRank (u : M →L[R] N) : Prop :=
  ∃ Q : Submodule R N, Q.FG ∧ LinearMap.range (u : M →ₗ[R] N) ≤ Q

def IsCompletelyContinuous (u : M →L[R] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ v : M →L[R] N, IsFiniteRank v ∧ opNorm (u - v) < ε

theorem isFiniteRank_iff_range_fg [IsNoetherianRing R] (u : M →L[R] N) :
    IsFiniteRank u ↔ (LinearMap.range (u : M →ₗ[R] N)).FG := by
  sorry

theorem IsFiniteRank.isCompletelyContinuous {u : M →L[R] N} (hu : IsFiniteRank u) :
    IsCompletelyContinuous u := by
  sorry

end Approximation

section ModelSpaces

variable {R : Type*} [NormedCommRing R]
    {I J : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [TopologicalSpace J] [DiscreteTopology J]

def rowNorm (u : C₀(J, R) →L[R] C₀(I, R)) (i : I) : ℝ :=
  ⨆ j, ‖matrixCoeff u i j‖

/-- Uniform output decay, with bounded entries so that the real row suprema are meaningful.
The bound is automatic over Tate scalars; keep it explicit in this unrestricted definition. -/
def IsRowCompact (u : C₀(J, R) →L[R] C₀(I, R)) : Prop :=
  (∃ C : ℝ, 0 ≤ C ∧ ∀ i j, ‖matrixCoeff u i j‖ ≤ C) ∧
    Tendsto (rowNorm u) cofinite (𝓝 0)

theorem IsRowCompact.isCompletelyContinuous [IsTate R] [CompleteSpace R]
    [IsUltrametricDist R] [NormOneClass R]
    [IsBoundedSMul R C₀(I, R)] [IsBoundedSMul R C₀(J, R)]
    {u : C₀(J, R) →L[R] C₀(I, R)} (hu : IsRowCompact u) :
    IsCompletelyContinuous u := by
  sorry

/-- A bounded transpose requires an additional hypothesis; it is not automatic (§1.4). -/
theorem IsRowCompact.transpose [IsTate R] [NormOneClass R]
    {u : C₀(J, R) →L[R] C₀(I, R)} {v : C₀(I, R) →L[R] C₀(J, R)}
    (hu : IsRowCompact u) (hv : ∀ i j, matrixCoeff v j i = matrixCoeff u i j) :
    IsRowCompact v := by
  sorry

end ModelSpaces

/-- Serre §3, Proposition 4 and its corollary, without discreteness of the valuation.
Together with the compactoid-image comparison targeted in README §0.5, this identifies the
literature notion. -/
theorem isRowCompact_iff_isCompletelyContinuous
    {K I J : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, K) →L[K] C₀(I, K)) :
    IsRowCompact u ↔ IsCompletelyContinuous u := by
  sorry

/-- Finite absolutely convex approximation over the valued field, not a coefficient algebra.
The norm-ball formulation agrees with finite `K°`-spans modulo every zero neighbourhood. -/
def IsCompactoidSet (K : Type*) {F : Type*} [NormedField K]
    [NormedAddCommGroup F] [NormedSpace K F] (S : Set F) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ (n : ℕ) (v : Fin n → F), ∀ x ∈ S,
    ∃ a : Fin n → K, (∀ i, ‖a i‖ ≤ 1) ∧ ‖x - ∑ i, a i • v i‖ < ε

/-- The literature compactoid-image condition on the closed unit ball. -/
def HasCompactoidImage {K E F : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup E] [NormedSpace K E]
    [NormedAddCommGroup F] [NormedSpace K F] (u : E →L[K] F) : Prop :=
  IsCompactoidSet K (u '' Metric.closedBall 0 1)

section FieldBridge

variable {K E F : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [NormedAddCommGroup E] [NormedSpace K E]
    [IsUltrametricDist E] [CompleteSpace E] [NormedAddCommGroup F]
    [NormedSpace K F] [IsUltrametricDist F] [CompleteSpace F]

/-- The field comparison works on arbitrary Banach spaces without spherical completeness. -/
theorem hasCompactoidImage_iff_isCompletelyContinuous (u : E →L[K] F) :
    HasCompactoidImage u ↔ IsCompletelyContinuous u := by
  sorry

/-- This direction does not require local compactness (§0.5). -/
theorem isCompletelyContinuous_of_isCompactOperator (u : E →L[K] F)
    (hu : IsCompactOperator (u : E → F)) : IsCompletelyContinuous u := by
  sorry

theorem isCompletelyContinuous_iff_isCompactOperator [LocallyCompactSpace K]
    (u : E →L[K] F) : IsCompletelyContinuous u ↔ IsCompactOperator (u : E → F) := by
  sorry

end FieldBridge

/-! ## Pure completed scalar extension (README §1.7)

This tests the general ring-scalar interface independently of determinants. The product-seminorm
hypothesis describes Part II's normed presentation on the actual algebraic tensor, rather than
postulating a comparison equivalence or introducing another completed-tensor construction.
-/

section ScalarExtension

open scoped TensorProduct

variable {R S I : Type*} [NormedCommRing R] [NormedCommRing S]
    [NormOneClass R] [NormOneClass S] [IsUltrametricDist R] [IsUltrametricDist S]
    [CompleteSpace R] [CompleteSpace S] [Algebra R S]
    [TopologicalSpace I] [DiscreteTopology I]

/-- The product-seminorm completion realises ring-scalar `c₀` extension.
The pure comparison needs no common field, Noetherianity or compact operator.
The supplied seminorm keeps the native tensor addition and scalar actions. -/
theorem c0_completedBaseChange {L : ℝ} (hL : 1 ≤ L)
    (hφ : ∀ r : R, ‖algebraMap R S r‖ ≤ L * ‖r‖)
    (π : AddGroupSeminorm (S ⊗[R] C₀(I, R)))
    (hπ : ∀ z : S ⊗[R] C₀(I, R), π z = sInf {c : ℝ | 0 ≤ c ∧
      ∃ (n : ℕ) (s : Fin n → S) (x : Fin n → C₀(I, R)),
        z = ∑ i, s i ⊗ₜ[R] x i ∧ ∀ i, ‖s i‖ * ‖x i‖ ≤ c})
    (hsmul : ∀ (s : S) (z : S ⊗[R] C₀(I, R)), π (s • z) ≤ ‖s‖ * π z) :
    letI := π.toSeminormedAddCommGroup
    letI : IsBoundedSMul S (S ⊗[R] C₀(I, R)) :=
      IsBoundedSMul.of_norm_smul_le hsmul
    letI : UniformContinuousConstSMul S (S ⊗[R] C₀(I, R)) :=
      uniformContinuousConstSMul_of_continuousConstSMul S (S ⊗[R] C₀(I, R))
    ∃ e : UniformSpace.Completion (S ⊗[R] C₀(I, R)) ≃L[S] C₀(I, S),
      (∀ (s : S) (x : C₀(I, R)) (i : I),
        e ((s ⊗ₜ[R] x : S ⊗[R] C₀(I, R)) :
          UniformSpace.Completion (S ⊗[R] C₀(I, R))) i = s * algebraMap R S (x i)) ∧
      (∀ z, ‖e z‖ ≤ L * ‖z‖) ∧ (∀ y, ‖e.symm y‖ ≤ ‖y‖) := by
  sorry

end ScalarExtension

/-! ## Layers 1–2 -/

section Fredholm

variable {R : Type*} [NormedCommRing R]
    {I : Type*} [TopologicalSpace I] [DiscreteTopology I]

def minor (u : C₀(I, R) →L[R] C₀(I, R)) (S : Finset I) : R :=
  Matrix.det (Matrix.of fun i j : S ↦ matrixCoeff u i j)

/-- The raw sum is only interpreted after proving summability. -/
def charCoeff (u : C₀(I, R) →L[R] C₀(I, R)) (n : ℕ) : R :=
  (-1 : R) ^ n * ∑' S : {S : Finset I // S.card = n}, minor u S.val

def charPowerSeries (u : C₀(I, R) →L[R] C₀(I, R)) : PowerSeries R :=
  PowerSeries.mk (charCoeff u)

variable [IsUltrametricDist R] [NormOneClass R] [CompleteSpace R] [IsTate R]

theorem charPowerSeries_isEntire {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) : IsEntire (charPowerSeries u) := by
  sorry

theorem norm_charCoeff_mul_pow_le_of_rowNorm_le {ι : Type*}
    (u : ι → C₀(I, R) →L[R] C₀(I, R)) {r : I → ℝ}
    (hr0 : ∀ i, 0 ≤ r i) (hr : Tendsto r cofinite (𝓝 0))
    (hur : ∀ α i, rowNorm (u α) i ≤ r i) {ρ q B : ℝ}
    (hρ : 0 < ρ) (hq0 : 0 ≤ q) (hq1 : q < 1) (hB : 1 ≤ B)
    (T : Finset I) (hT : ∀ i ∉ T, ρ * r i ≤ q)
    (hrB : ∀ i, ρ * r i ≤ B) (α : ι) (n : ℕ) :
    ‖charCoeff (u α) n‖ * ρ ^ n ≤ B ^ T.card * q ^ (n - T.card) := by
  sorry

theorem charPowerSeries_eq_mul_of_comm {u p : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) (hp : p * p = p) (hup : u * p = p * u) :
    charPowerSeries u = charPowerSeries (u * (1 - p)) * charPowerSeries (u * p) := by
  sorry

variable [IsBoundedSMul R C₀(I, R)]

def resolventCoeff (u : C₀(I, R) →L[R] C₀(I, R)) (m : ℕ) :
    C₀(I, R) →L[R] C₀(I, R) :=
  ∑ k ∈ Finset.range (m + 1), charCoeff u k • u ^ (m - k)

/-- Operator-norm closure of polynomials, avoiding any implicit choice of CLM topology. -/
def IsOpLimitAeval (u v : C₀(I, R) →L[R] C₀(I, R)) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ P : R[X], opNorm (v - Polynomial.aeval u P) < ε

def evalAt (a : R) (F : PowerSeries R) : R :=
  ∑' n, PowerSeries.coeff n F * a ^ n

theorem isUnit_one_sub_smul_iff {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) (a : R) :
    IsUnit (1 - a • u) ↔ IsUnit (evalAt a (charPowerSeries u)) := by
  sorry

/-- Supplier Hasse evaluation, with no division by factorials. -/
def hasseEval (a : R) (F : PowerSeries R) (h : ℕ) : R :=
  ∑' n, ((n + h).choose h : R) * PowerSeries.coeff (n + h) F * a ^ n

/-- Order zero means the value is a unit. Entireness is a separate hypothesis. -/
def IsGoodZero (F : PowerSeries R) (a : R) (h : ℕ) : Prop :=
  (∀ j < h, hasseEval a F j = 0) ∧ IsUnit (hasseEval a F h)

/-- Finite spectral projector, with a bounded inverse on its complementary summand.
The closure conditions use the ring-scalar operator norm explicitly. -/
def IsRieszProjection (u : C₀(I, R) →L[R] C₀(I, R)) (a : R) (h : ℕ)
    (E : C₀(I, R) →L[R] C₀(I, R)) : Prop :=
  E * E = E ∧ Commute u E ∧ IsOpLimitAeval u E ∧ (1 - a • u) ^ h * E = 0 ∧
    ∃ w : C₀(I, R) →L[R] C₀(I, R),
      (1 - a • u) * w = 1 - E ∧ w * (1 - a • u) = 1 - E ∧
      E * w = 0 ∧ w * E = 0 ∧ IsOpLimitAeval u w

theorem exists_rieszProjection {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) {a : R} {h : ℕ}
    (ha : IsGoodZero (charPowerSeries u) a h) :
    ∃ E : C₀(I, R) →L[R] C₀(I, R), IsRieszProjection u a h E ∧ IsRowCompact E ∧
      LinearMap.range (E : C₀(I, R) →ₗ[R] C₀(I, R)) =
        LinearMap.ker (((1 - a • u) ^ h : C₀(I, R) →L[R] C₀(I, R)).toLinearMap) ∧
      Module.Finite R (LinearMap.range E.toLinearMap) ∧
      Module.Projective R (LinearMap.range E.toLinearMap) := by
  sorry

omit [DiscreteTopology I] [NormOneClass R] [CompleteSpace R] [IsTate R] in
/-- The projector convention handles the zero-rank summand without extra choices. -/
theorem IsRieszProjection.eq_zero_of_order_zero
    {u E : C₀(I, R) →L[R] C₀(I, R)} {a : R}
    (hE : IsRieszProjection u a 0 E) : E = 0 := by
  simpa using hE.2.2.2.1

end Fredholm

/-- This native predicate includes strictness, closed range and complemented kernel,
not only the two dimension conditions (README §3.2). -/
theorem isFredholm_one_sub_smul {K I : Type*}
    [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
    [TopologicalSpace I] [DiscreteTopology I]
    (u : C₀(I, K) →L[K] C₀(I, K)) (hu : IsRowCompact u) (a : K) :
    (1 - a • u).IsFredholm := by
  sorry

/-! ## Layer 3: the finite transform has a specified rank -/

def colemanDBounded {R : Type*} [CommRing R] (n m : ℕ) (B P : R[X]) : R[X] :=
  Polynomial.resultant ((Polynomial.reflect n P).map Polynomial.C)
    (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m

theorem colemanDBounded_succ {R : Type*} [CommRing R] (n m : ℕ) (B P : R[X])
    (hP : P.natDegree ≤ n) (hB : B.natDegree ≤ m) (hP0 : P.coeff 0 = 1) :
    colemanDBounded (n + 1) m B P =
      (1 - Polynomial.C (B.coeff 0) * Polynomial.X) * colemanDBounded n m B P := by
  sorry

/-- A concrete negative control for using the actual degree in place of rank. -/
example : colemanDBounded 1 0 (1 : ℤ[X]) 1 = 1 - Polynomial.X ∧
    colemanDBounded 0 0 (1 : ℤ[X]) 1 = 1 := by
  sorry

section EntireTransform

variable {R : Type*} [NormedCommRing R] [IsUltrametricDist R]
    [NormOneClass R] [CompleteSpace R]

def colemanMajorant (B : PowerSeries R) (r : ℝ) : ℝ :=
  ⨆ m : ℕ, ‖PowerSeries.coeff (m + 1) B‖ * r ^ (m + 1)

theorem exists_newtonMajorant {F : PowerSeries R} (hF : IsEntire F)
    (hF0 : PowerSeries.coeff 0 F = 1) :
    ∃ ρ : ℕ → ℝ, (∀ i, 0 < ρ i) ∧ Antitone ρ ∧ Tendsto ρ atTop (𝓝 0) ∧
      ∀ j, ‖PowerSeries.coeff j F‖ ≤ ∏ i ∈ Finset.range j, ρ i := by
  sorry

/-- Convergence is a separate obligation, not a consequence of this raw limit definition. -/
def colemanDEntire (B F : PowerSeries R) : PowerSeries R :=
  PowerSeries.mk fun k ↦ limUnder (atTop ×ˢ atTop) fun NM : ℕ × ℕ ↦
    (colemanDBounded NM.1 NM.2 (PowerSeries.trunc (NM.2 + 1) B)
      (PowerSeries.trunc (NM.1 + 1) F)).coeff k

theorem tendsto_gaussNorm_colemanDBounded {B F : PowerSeries R}
    (hB : IsEntire B) (hB0 : PowerSeries.coeff 0 B = 0)
    (hF : IsEntire F) (hF0 : PowerSeries.coeff 0 F = 1) {r : ℝ} (hr : 0 < r) :
    Tendsto (fun NM : ℕ × ℕ ↦ PowerSeries.gaussNorm norm r
      ((colemanDBounded NM.1 NM.2 (PowerSeries.trunc (NM.2 + 1) B)
        (PowerSeries.trunc (NM.1 + 1) F) : PowerSeries R) - colemanDEntire B F))
      (atTop ×ˢ atTop) (𝓝 0) := by
  sorry

theorem colemanDEntire_isEntire {B F : PowerSeries R}
    (hB : IsEntire B) (hB0 : PowerSeries.coeff 0 B = 0)
    (hF : IsEntire F) (hF0 : PowerSeries.coeff 0 F = 1) :
    IsEntire (colemanDEntire B F) ∧ PowerSeries.coeff 0 (colemanDEntire B F) = 1 := by
  sorry

example {F : PowerSeries R} (hF : IsEntire F) (hF0 : PowerSeries.coeff 0 F = 1) :
    colemanDEntire PowerSeries.X F = F := by
  sorry

example {ε : R} (hε : ε ^ 2 = 0) :
    colemanDEntire PowerSeries.X (1 - PowerSeries.C ε * PowerSeries.X ^ 2) =
      1 - PowerSeries.C ε * PowerSeries.X ^ 2 := by
  sorry

variable [IsTate R] {I : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [IsBoundedSMul R C₀(I, R)]

theorem exists_tendsto_opNorm_sum_pow (u : C₀(I, R) →L[R] C₀(I, R))
    {B : PowerSeries R} (hB : IsEntire B) :
    ∃ v : C₀(I, R) →L[R] C₀(I, R), Tendsto (fun N ↦ opNorm
      (v - ∑ m ∈ Finset.range N, PowerSeries.coeff m B • u ^ m)) atTop (𝓝 0) := by
  sorry

theorem charPowerSeries_eq_colemanDEntire {u v : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) {B : PowerSeries R} (hB : IsEntire B)
    (hB0 : PowerSeries.coeff 0 B = 0)
    (hv : Tendsto (fun N ↦ opNorm
      (v - ∑ m ∈ Finset.range N, PowerSeries.coeff m B • u ^ m)) atTop (𝓝 0)) :
    IsRowCompact v ∧ charPowerSeries v = colemanDEntire B (charPowerSeries u) := by
  sorry

end EntireTransform

/-! ## Layer 4: exact coefficients need a genuine compactness hypothesis -/

section ExactCase

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

theorem norm_charCoeff_of_unit_minors
    (u : C₀(ℕ, K) →L[K] C₀(ℕ, K)) (hu : IsRowCompact u) (d : ℕ → K)
    (hd : ∀ i, d i ≠ 0) (hdec : StrictAnti fun i ↦ ‖d i‖)
    (hb : ∀ i j, ‖matrixCoeff u i j‖ ≤ ‖d i‖)
    (hminor : ∀ n : ℕ, ‖Matrix.det (Matrix.of fun i j : Fin n ↦
      (d i.val)⁻¹ * matrixCoeff u i.val j.val)‖ = 1) (n : ℕ) :
    ‖charCoeff u n‖ = ∏ i ∈ Finset.range n, ‖d i‖ := by
  sorry

end ExactCase

end

end TauCetiRoadmap.CompactOperators
