/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.Normed.Algebra.UnitizationL1
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.RingTheory.Jacobson.Radical
import Mathlib.Topology.Algebra.Module.ClosedSubmodule
import Mathlib.Topology.ApproximateUnit
import Mathlib.Topology.Sequences
import Mathlib.Algebra.Module.Submodule.Invariant
import Mathlib.Analysis.Normed.Algebra.Spectrum
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.MeasureTheory.Function.LpSpace.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Analysis.Normed.Lp.ProdLp
import Mathlib.Topology.UnitInterval

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Interfaces requiring the completed tensor and Banach bimodule APIs are specified
there, rather than represented by empty proposition fields here.
-/

noncomputable section
open Filter Topology

namespace BanachAlgebras

section SeparatingSpace

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup F] [NormedSpace ℂ F]

/-- The vertical fibre at zero of the closure of the graph. -/
def separatingSpace (T : E →ₗ[ℂ] F) : Submodule ℂ F :=
  T.graph.topologicalClosure.comap (LinearMap.inr ℂ E F)

theorem isClosed_separatingSpace (T : E →ₗ[ℂ] F) :
    IsClosed (separatingSpace T : Set F) := by
  exact T.graph.isClosed_topologicalClosure.preimage
    (continuous_const.prodMk continuous_id)

theorem mem_separatingSpace_iff (T : E →ₗ[ℂ] F) (y : F) :
    y ∈ separatingSpace T ↔
      ∃ x : ℕ → E, Tendsto x atTop (𝓝 0) ∧ Tendsto (T ∘ x) atTop (𝓝 y) := by
  sorry

theorem continuous_iff_separatingSpace_eq_bot [CompleteSpace E] [CompleteSpace F]
    (T : E →ₗ[ℂ] F) : Continuous T ↔ separatingSpace T = ⊥ := by
  sorry

end SeparatingSpace

section AutomaticContinuity

variable {A B : Type*} [NormedRing A] [NormedAlgebra ℂ A] [CompleteSpace A]

/-- Surjectivity is essential for a general noncommutative target. -/
theorem continuous_of_surjective_of_semisimple [NormedRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hφ : Function.Surjective φ)
    (hB : Ring.jacobson B = ⊥) : Continuous φ := by
  sorry

theorem continuous_of_commutative_semisimple [NormedCommRing B] [NormedAlgebra ℂ B]
    [CompleteSpace B] (φ : A →ₐ[ℂ] B) (hB : Ring.jacobson B = ⊥) :
    Continuous φ := by
  sorry

/-- The unbounded input map has the ordinary noncommutative Leibniz identity. -/
theorem derivation_continuous (D : A →ₗ[ℂ] A)
    (hD : ∀ a b, D (a * b) = a * D b + D a * b)
    (hA : Ring.jacobson A = ⊥) : Continuous D := by
  sorry

end AutomaticContinuity

section Factorization

variable {A E : Type*} [NonUnitalNormedRing A] [NormedSpace ℂ A]
  [IsScalarTower ℂ A A] [SMulCommClass ℂ A A] [CompleteSpace A]
  [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A bounded associative left action, without a unit or a contractivity assumption. -/
theorem cohen_hewitt (L : A →L[ℂ] E →L[ℂ] E)
    (hL : ∀ a b x, L (a * b) x = L a (L b x))
    (l : Filter A) [l.NeBot]
    (hl : ∀ a : A, Tendsto (fun e ↦ e * a) l (𝓝 a))
    (C : ℝ) (hC : 0 < C) (hbound : ∀ᶠ e in l, ‖e‖ ≤ C)
    (x : E)
    (hx : x ∈ (Submodule.span ℂ {y : E | ∃ a z, y = L a z}).topologicalClosure)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ a : A, ∃ y : E, ‖a‖ ≤ C ∧ L a y = x ∧ ‖y - x‖ < ε ∧
      y ∈ (Submodule.span ℂ (Set.range (fun b : A ↦ L b x))).topologicalClosure := by
  sorry

end Factorization


section Ritt
variable {A : Type*} [NormedRing A] [NormedAlgebra ℂ A] [CompleteSpace A]

/-- A2: the denominator is |z−1|, with inverse existence stated separately. -/
theorem ritt_power_bound (a : A) (C : ℝ) (hC : 0 < C)
    (hres : ∀ z : ℂ, 1 < ‖z‖ → z ∈ resolventSet ℂ a)
    (hbound : ∀ z : ℂ, 1 < ‖z‖ → ‖resolvent a z‖ ≤ C / ‖z - 1‖) :
    ∀ n : ℕ, ‖a ^ n‖ ≤ 3 * C ^ 2 := by
  sorry
end Ritt

section AbsolutelyContinuous
open MeasureTheory
open scoped Interval

abbrev intervalLebesgue : Measure ℝ := volume.restrict (Set.Icc (0 : ℝ) 1)
abbrev IntervalL1 := Lp ℂ 1 intervalLebesgue
abbrev ACData := WithLp 1 (ℂ × IntervalL1)

/-- A3: initial value and an actual L1 derivative determine the function. -/
def acFunction (f : ACData) (x : unitInterval) : ℂ :=
  f.ofLp.1 + ∫ t in (0 : ℝ)..(x : ℝ), f.ofLp.2 t

/-- A3: construction and continuity of indefinite integration on its L1 carrier. -/
noncomputable def acContinuousFunction : ACData →L[ℂ] C(unitInterval, ℂ) := by
  sorry

theorem acContinuousFunction_apply (f : ACData) (x : unitInterval) :
    acContinuousFunction f x = acFunction f x := by
  sorry

/-- A3: the corrected calculus puts the derivative outside the Volterra integral. -/
noncomputable def acOperatorCalculus : ACData →L[ℂ] (IntervalL1 →L[ℂ] IntervalL1) := by
  sorry

theorem acOperatorCalculus_apply_ae (f : ACData) (h : IntervalL1) :
    ∀ᵐ x ∂intervalLebesgue,
      acOperatorCalculus f h x =
        (f.ofLp.1 + ∫ t in (0 : ℝ)..x, f.ofLp.2 t) * h x +
        f.ofLp.2 x * ∫ t in (0 : ℝ)..x, h t := by
  sorry

theorem norm_acOperatorCalculus_le (f : ACData) : ‖acOperatorCalculus f‖ ≤ ‖f‖ := by
  sorry
end AbsolutelyContinuous

/-- A8: Lomonosov's lemma is stated on the existing bounded algebra carrier. -/
theorem lomonosov_lemma {𝕜 E : Type*} [RCLike 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [CompleteSpace E]
    (A : Subalgebra 𝕜 (E →L[𝕜] E))
    (htrans : ∀ x : E, x ≠ 0 →
      closure (Set.range (fun a : A => a.val x)) = Set.univ)
    (K : E →L[𝕜] E) (hK : IsCompactOperator K) (hK0 : K ≠ 0) :
    ∃ a : A, ∃ x : E, x ≠ 0 ∧ a.val (K x) = x := by
  sorry

section InvariantSubspaces
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A8: nonscalarity is needed for the hyperinvariant conclusion. -/
theorem lomonosov_hyperinvariant (T K : E →L[ℂ] E)
    (hT : ∀ c : ℂ, T ≠ c • ContinuousLinearMap.id ℂ E)
    (hK : IsCompactOperator K) (hK0 : K ≠ 0) (hcomm : Commute T K) :
    ∃ U : Submodule ℂ E, IsClosed (U : Set E) ∧ U ≠ ⊥ ∧ U ≠ ⊤ ∧
      ∀ S : E →L[ℂ] E, Commute S T → U ∈ Module.End.invtSubmodule S.toLinearMap := by
  sorry

/-- A8: the compact-map fixed-point theorem does not assume linear approximation. -/
theorem schauder_fixedPoint {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    [CompleteSpace F] (C : Set F) (hC : C.Nonempty) (hclosed : IsClosed C)
    (hbounded : Bornology.IsBounded C) (hconvex : Convex ℝ C)
    (f : F → F) (hf : ContinuousOn f C) (hmap : Set.MapsTo f C C)
    (hcompact : IsCompact (closure (f '' C))) :
    ∃ x ∈ C, f x = x := by
  sorry
end InvariantSubspaces

end BanachAlgebras
