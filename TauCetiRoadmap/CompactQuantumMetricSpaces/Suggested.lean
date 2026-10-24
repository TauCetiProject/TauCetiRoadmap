/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.CStarAlgebra.PositiveLinearFunctional
import Mathlib.Analysis.Normed.Module.WeakDual
import Mathlib.Analysis.Normed.Module.Seminorm.Basic
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.ContinuousMap.Bounded.Basic
import Mathlib.Topology.MetricSpace.GromovHausdorff
import Mathlib.Analysis.Normed.Group.Seminorm
import Mathlib.Algebra.Order.Monoid.Prod

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The new order-unit and extended-seminorm conditions are actual equations.
States are a subset of the native weak dual; positive maps use the native
`PositiveContinuousLinearMap`. No new state carrier or finite-valued
seminorm replaces the existing APIs. The finite-domain dictionary and
closed-domain completion are mathematical targets, not implementations here.
-/

noncomputable section
open Set
open scoped ENNReal NNReal Topology BoundedContinuousFunction

namespace CompactQuantumMetricSpaces
universe u v

section OrderUnit
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E]

/-- Compatibility of an existing norm and order with a nonzero order unit.
Q0 also constructs this norm from the Archimedean order-unit axioms. -/
structure IsOrderUnitNorm (e : E) : Prop where
  norm_e : ‖e‖ = 1
  norm_le_iff : ∀ (a : E) (r : ℝ), 0 ≤ r →
    (‖a‖ ≤ r ↔ -r • e ≤ a ∧ a ≤ r • e)

/-- The native weak-dual subset, with its inherited weak-star topology. -/
def stateSpace (e : E) : Set (WeakDual ℝ E) :=
  {φ | Monotone φ ∧ φ e = 1}

/-- Every positive normalized functional is a point of the same subset. -/
def positiveToState (e : E) (φ : E →P[ℝ] ℝ) (hφ : φ e = 1) : stateSpace e :=
  ⟨(φ.toContinuousLinearMap : WeakDual ℝ E), φ.monotone', hφ⟩

/-- State existence needs the nonzero Archimedean order-unit hypotheses. -/
theorem stateSpace_nonempty (e : E) (he : IsOrderUnitNorm e) :
    (stateSpace e).Nonempty := by
  sorry

/-- State norm detection; no completeness or separability is assumed. -/
theorem norm_eq_iSup_states (e : E) (he : IsOrderUnitNorm e) (a : E) :
    ‖a‖₊ = ⨆ φ : stateSpace e, ‖φ.1 a‖₊ := by
  sorry

/-- Banach–Alaoglu plus closed positivity and normalization. -/
theorem isCompact_stateSpace (e : E) (he : IsOrderUnitNorm e) :
    IsCompact (stateSpace e) := by
  sorry

/-- A dense, scalar-kernel extended seminorm. No weak-star-metrizing
condition or lower semicontinuity is assumed in these data. -/
structure ExtendedLipschitzSeminorm (e : E) where
  toFun : E → ℝ≥0∞
  map_zero : toFun 0 = 0
  map_add_le : ∀ a b : E, toFun (a + b) ≤ toFun a + toFun b
  map_smul : ∀ (r : ℝ) (a : E), toFun (r • a) = ENNReal.ofReal |r| * toFun a
  dense_finite : Dense {a : E | toFun a < ∞}
  kernel_iff : ∀ a : E, toFun a = 0 ↔ ∃ r : ℝ, a = r • e

instance (e : E) : CoeFun (ExtendedLipschitzSeminorm e) (fun _ => E → ℝ≥0∞) :=
  ⟨ExtendedLipschitzSeminorm.toFun⟩

variable {e : E}

/-- The supremum always lives in the complete lattice `ℝ≥0∞`. -/
def stateEDist (L : ExtendedLipschitzSeminorm e) (φ ψ : WeakDual ℝ E) : ℝ≥0∞ :=
  ⨆ (a : E) (_ : L a ≤ 1), ENNReal.ofReal |φ a - ψ a|

/-- A fixed-state slice, taken in E's norm topology. -/
def centeredUnitBall (L : ExtendedLipschitzSeminorm e) (φ : stateSpace e) : Set E :=
  {a | L a ≤ 1 ∧ φ.1 a = 0}

/-- The closed scalar line, with Mathlib's native quotient norm. -/
def scalarLine (e : E) : Submodule ℝ E := Submodule.span ℝ {e}

/-- The total-boundedness characterization is the Lip-norm condition. -/
def IsLipNorm (L : ExtendedLipschitzSeminorm e) : Prop :=
  TotallyBounded ((Submodule.Quotient.mk (p := scalarLine e)) '' {a : E | L a ≤ 1})

/-- Lower semicontinuity is a separate mathematical property. -/
def IsClosedLipNorm (L : ExtendedLipschitzSeminorm e) : Prop :=
  IsLipNorm L ∧ ∀ t : ℝ≥0∞, IsClosed {a : E | L a ≤ t}

omit [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E] in
theorem stateEDist_self (L : ExtendedLipschitzSeminorm e) (φ : WeakDual ℝ E) :
    stateEDist L φ φ = 0 := by
  simp [stateEDist]

omit [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E] in
theorem stateEDist_comm (L : ExtendedLipschitzSeminorm e) (φ ψ : WeakDual ℝ E) :
    stateEDist L φ ψ = stateEDist L ψ φ := by
  simp only [stateEDist, abs_sub_comm]

/-- This is a genuine estimate with φ and ψ retained in the conclusion. -/
theorem stateEDist_triangle (L : ExtendedLipschitzSeminorm e)
    (φ ψ χ : WeakDual ℝ E) :
    stateEDist L φ χ ≤ stateEDist L φ ψ + stateEDist L ψ χ := by
  sorry

theorem stateEDist_eq_zero_iff (L : ExtendedLipschitzSeminorm e)
    (φ ψ : stateSpace e) : stateEDist L φ.1 ψ.1 = 0 ↔ φ = ψ := by
  sorry

theorem isLipNorm_iff_centered (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (φ : stateSpace e) :
    IsLipNorm L ↔ TotallyBounded (centeredUnitBall L φ) := by
  sorry

theorem stateEDist_ne_top (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : IsLipNorm L) (φ ψ : stateSpace e) :
    stateEDist L φ.1 ψ.1 ≠ ∞ := by
  sorry

/-- Pointwise convergence of states is uniform over the Lip-unit ball
exactly under the compactness criterion. The theorem states convergence
for every filter, including nonsequential weak-star limits. -/
theorem tendsto_stateEDist_iff (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : IsLipNorm L)
    {ι : Type v} (l : Filter ι) (φ : ι → stateSpace e) (ψ : stateSpace e) :
    Filter.Tendsto (fun i => stateEDist L (φ i).1 ψ.1) l (𝓝 0) ↔
      Filter.Tendsto φ l (𝓝 ψ) := by
  sorry

/-- Lower semicontinuity is precisely what permits recovery from all
states. Q2 also proves the converse and the closure/finite-domain API. -/
theorem closedLipNorm_recovery (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : IsClosedLipNorm L) (a : E) :
    L a = ⨆ (φ : stateSpace e) (ψ : stateSpace e),
      ENNReal.ofReal |φ.1 a - ψ.1 a| / stateEDist L φ.1 ψ.1 := by
  sorry

/-- Construct the actual extended metric. Its topology is compared with
weak-star by `tendsto_stateEDist_iff`; no global metric instance overwrites
that inherited topology. -/
@[instance_reducible]
def stateEMetricSpace (L : ExtendedLipschitzSeminorm e) : EMetricSpace (stateSpace e) where
  edist φ ψ := stateEDist L φ.1 ψ.1
  edist_self φ := stateEDist_self L φ.1
  edist_comm φ ψ := stateEDist_comm L φ.1 ψ.1
  edist_triangle φ ψ χ := stateEDist_triangle L φ.1 ψ.1 χ.1
  eq_of_edist_eq_zero := fun h => (stateEDist_eq_zero_iff L _ _).mp h

end OrderUnit

section Bridges
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E]
variable {F : Type v} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [PartialOrder F] [IsOrderedAddMonoid F] [PosSMulMono ℝ F]
variable {e : E} {f : F}

/-- Quotient-only admissibility permits a coupled dense finite domain.
Q5 retains this class and proves its reduction to full-domain bridges. -/
structure QuotientAdmissibleLipNorm (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) where
  seminorm : ExtendedLipschitzSeminorm (e, f)
  lipNorm : IsLipNorm seminorm
  left_quotient : ∀ a : E, (⨅ b : F, seminorm (a,b)) = LE a
  right_quotient : ∀ b : F, (⨅ a : E, seminorm (a,b)) = LF b

/-- Maximum gluing needs every pair of finite-domain elements, not merely
coordinate quotient equality. The condition includes the exact domains. -/
structure AdmissibleLipNorm (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) extends QuotientAdmissibleLipNorm LE LF where
  finite_domain : ∀ (a : E) (b : F),
    seminorm (a,b) < ∞ ↔ LE a < ∞ ∧ LF b < ∞

/-- Coordinate pullbacks use native continuous-linear-map composition. -/
def leftState (φ : stateSpace e) : stateSpace (e, f) := by
  let φ' : WeakDual ℝ (E × F) :=
    (φ.1 : E →L[ℝ] ℝ).comp (ContinuousLinearMap.fst ℝ E F)
  exact ⟨φ', fun x y h => φ.2.1 h.1, φ.2.2⟩

def rightState (ψ : stateSpace f) : stateSpace (e, f) := by
  let ψ' : WeakDual ℝ (E × F) :=
    (ψ.1 : F →L[ℝ] ℝ).comp (ContinuousLinearMap.snd ℝ E F)
  exact ⟨ψ', fun x y h => ψ.2.1 h.2, ψ.2.2⟩

/-- Native Hausdorff extended distance, locally using the admissible state
metric rather than changing the weak-star instance globally. -/
def quotientBridgeEDist {LE : ExtendedLipschitzSeminorm e}
    {LF : ExtendedLipschitzSeminorm f} (M : QuotientAdmissibleLipNorm LE LF) : ℝ≥0∞ :=
  letI := stateEMetricSpace M.seminorm
  Metric.hausdorffEDist (Set.range (leftState (f := f)))
    (Set.range (rightState (e := e)))

/-- The same Hausdorff construction for bridges that support gluing. -/
def bridgeEDist {LE : ExtendedLipschitzSeminorm e} {LF : ExtendedLipschitzSeminorm f}
    (M : AdmissibleLipNorm LE LF) : ℝ≥0∞ :=
  quotientBridgeEDist M.toQuotientAdmissibleLipNorm

/-- Existence/finiteness and the metric laws are Q5 targets. -/
def quantumGHEDist (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) : ℝ≥0∞ :=
  ⨅ M : AdmissibleLipNorm LE LF, bridgeEDist M

/-- The broader infimum is retained, rather than silently discarded. -/
def quotientQuantumGHEDist (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) : ℝ≥0∞ :=
  ⨅ M : QuotientAdmissibleLipNorm LE LF, quotientBridgeEDist M

/-- Q5's quantitative infimal-convolution reduction proves equality of
the full-domain and quotient-only distance definitions. -/
theorem quantumGHEDist_eq_quotientQuantumGHEDist
    (LE : ExtendedLipschitzSeminorm e) (LF : ExtendedLipschitzSeminorm f)
    (he : IsOrderUnitNorm e) (hf : IsOrderUnitNorm f)
    (hLE : IsLipNorm LE) (hLF : IsLipNorm LF) :
    quantumGHEDist LE LF = quotientQuantumGHEDist LE LF := by
  sorry

end Bridges

section Classical
variable {X : Type u} [MetricSpace X]

/-- On all continuous real functions the Lipschitz constant is extended.
The empty pair supremum is zero. Distinct pairs avoid division by zero. -/
def classicalLip (f : C(X, ℝ)) : ℝ≥0∞ :=
  ⨆ (x : X) (y : X) (_ : x ≠ y), ENNReal.ofReal |f x - f y| / edist x y

theorem classicalLip_le_iff (f : C(X, ℝ)) (r : ℝ≥0) :
    classicalLip f ≤ r ↔ LipschitzWith r f := by
  sorry

/-- The point-distance formula also holds on noncompact metric spaces,
using bounded Lipschitz tests rather than a fictitious uniform norm on C(X). -/
theorem dist_eq_iSup_bounded_lipschitz (x y : X) :
    edist x y = ⨆ (f : X →ᵇ ℝ) (_ : LipschitzWith 1 f),
      ENNReal.ofReal |f x - f y| := by
  sorry
end Classical

section CStar
open ComplexOrder
variable {A : Type u} [CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]

/-- C*-states use native positive continuous complex-linear functionals. -/
abbrev cstarStateSpace : Type u := {φ : A →P[ℂ] ℂ // φ 1 = 1}

/-- Native C*-norm normalization, proved here by an actual imported API. -/
theorem cstarState_norm (φ : cstarStateSpace (A := A)) :
    ‖(φ.1 : A →L[ℂ] ℂ)‖ = 1 := by
  have h := PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one φ.1
  rw [φ.2] at h
  exact_mod_cast h

/-- Representative full-algebra Leibniz condition. The order-unit metric
uses its self-adjoint restriction; a full extension is additional data. -/
structure StarLeibnizSeminorm where
  toFun : A → ℝ≥0∞
  zero : toFun 0 = 0
  add_le : ∀ a b, toFun (a + b) ≤ toFun a + toFun b
  smul : ∀ (z : ℂ) a, toFun (z • a) = ENNReal.ofReal ‖z‖ * toFun a
  star : ∀ a, toFun (star a) = toFun a
  mul_le : ∀ a b, toFun (a * b) ≤ toFun a * ENNReal.ofReal ‖b‖ +
    ENNReal.ofReal ‖a‖ * toFun b

/-- Strong Leibniz is not inferred from ordinary Leibniz: it is proved for
the action examples. In particular the inverse must actually exist. -/
def IsStrongLeibniz (L : StarLeibnizSeminorm (A := A)) : Prop :=
  ∀ (a : Aˣ), L.toFun (↑(a⁻¹) : A) ≤
    ENNReal.ofReal (‖(↑(a⁻¹) : A)‖ ^ 2) * L.toFun (a : A)
end CStar

section Actions
variable {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable {A : Type u} [CStarAlgebra A]

/-- A native GroupNorm is the continuous length function; continuity is a
hypothesis in Q4. No second independent length-function structure is used. -/
def actionLip (ℓ : GroupNorm G) (α : G →* (A ≃⋆ₐ[ℂ] A)) (a : A) : ℝ≥0∞ :=
  ⨆ (g : G) (_ : g ≠ 1), ENNReal.ofReal ‖α g a - a‖ / ENNReal.ofReal (ℓ g)

/-- The Leibniz estimate follows from the automorphism identity. -/
theorem actionLip_mul_le (ℓ : GroupNorm G) (α : G →* (A ≃⋆ₐ[ℂ] A)) (a b : A) :
    actionLip ℓ α (a * b) ≤ actionLip ℓ α a * ENNReal.ofReal ‖b‖ +
      ENNReal.ofReal ‖a‖ * actionLip ℓ α b := by
  sorry

/-- The inverse estimate is stated for actual native units. -/
theorem actionLip_inv_le (ℓ : GroupNorm G) (α : G →* (A ≃⋆ₐ[ℂ] A)) (a : Aˣ) :
    actionLip ℓ α (↑(a⁻¹) : A) ≤
      ENNReal.ofReal (‖(↑(a⁻¹) : A)‖ ^ 2) * actionLip ℓ α (a : A) := by
  sorry
end Actions
end CompactQuantumMetricSpaces
