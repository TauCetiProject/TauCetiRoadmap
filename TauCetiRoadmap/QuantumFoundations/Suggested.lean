/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Analysis.Matrix.Order
import Mathlib.Analysis.SpecialFunctions.RegularizedHypergeometric
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.MeasureTheory.Measure.ResolventTransform
import Mathlib.Algebra.Star.StarProjection
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.Analysis.InnerProductSpace.Projection.Basic
import Mathlib.Analysis.InnerProductSpace.Orthonormal

/-!
**This file is not the roadmap and is not exhaustive.** These declarations prototype finite
matrix measurement data and the projective-ray carrier. The README is definitive. Finite density
matrices here are a concrete specialization; the generic C*-state carrier is supplied by V0.
-/

namespace QuantumFoundations

open scoped ComplexOrder MatrixOrder

variable {n outcomes kraus : ℕ}

/-- Finite-dimensional normal-state data, to be identified with the V0 state carrier. -/
def FiniteDensityState (n : ℕ) :=
  {ρ : Matrix (Fin n) (Fin n) ℂ // ρ.PosSemidef ∧ Matrix.trace ρ = 1}

/-- A finite POVM is a family of positive contractions whose sum is the identity. -/
structure FinitePOVM (n outcomes : ℕ) where
  effect : Fin outcomes → Matrix (Fin n) (Fin n) ℂ
  positive : ∀ i, (effect i).PosSemidef
  complete : ∑ i, effect i = 1

/-- Contractivity follows from positivity and completeness in the native matrix order. -/
theorem FinitePOVM.contractive (M : FinitePOVM n outcomes) (i : Fin outcomes) :
    M.effect i ≤ 1 := by
  rw [← M.complete]
  exact Finset.single_le_sum (fun j _ => (M.positive j).nonneg) (Finset.mem_univ i)

/-- Outcome equivalences transport the same finite measurement. -/
noncomputable def FinitePOVM.reindex {otherOutcomes : ℕ}
    (M : FinitePOVM n outcomes) (e : Fin otherOutcomes ≃ Fin outcomes) :
    FinitePOVM n otherOutcomes where
  effect i := M.effect (e i)
  positive i := M.positive (e i)
  complete := by
    sorry

@[simp] theorem FinitePOVM.reindex_effect {otherOutcomes : ℕ}
    (M : FinitePOVM n outcomes) (e : Fin otherOutcomes ≃ Fin outcomes)
    (i : Fin otherOutcomes) : (M.reindex e).effect i = M.effect (e i) := rfl

/-- A finite PVM uses native star-projection data; orthogonality is proved from the
positive projection and completeness laws rather than duplicated as a field. -/
structure FinitePVM (n outcomes : ℕ) where
  projection : Fin outcomes → Matrix (Fin n) (Fin n) ℂ
  isStarProjection : ∀ i, IsStarProjection (projection i)
  complete : ∑ i, projection i = 1

/-- Pairwise orthogonality follows from star-projection values and completeness. -/
theorem FinitePVM.projection_mul_eq_zero (M : FinitePVM n outcomes)
    (i j : Fin outcomes) (hij : i ≠ j) :
    M.projection i * M.projection j = 0 := by
  sorry

/-- The unnormalized complex Born weight for a finite POVM outcome. -/
noncomputable def bornWeight (ρ : FiniteDensityState n)
    (M : FinitePOVM n outcomes) (i : Fin outcomes) : ℂ :=
  Matrix.trace (ρ.1 * M.effect i)

/-- A finite POVM's Born weight is real and lies in `[0,1]`. -/
theorem bornWeight_isProbability (ρ : FiniteDensityState n)
    (M : FinitePOVM n outcomes) (i : Fin outcomes) :
    (bornWeight ρ M i).im = 0 ∧ 0 ≤ (bornWeight ρ M i).re ∧
      (bornWeight ρ M i).re ≤ 1 := by
  sorry

/-- Completeness makes the finite POVM outcome weights sum to one. -/
theorem bornWeight_sum_one (ρ : FiniteDensityState n)
    (M : FinitePOVM n outcomes) :
    ∑ i : Fin outcomes, bornWeight ρ M i = 1 := by
  sorry

/-- A finite-dimensional instrument in Kraus form. Its operations are indexed by outcomes;
trace preservation of the total operation is exactly the displayed normalization. -/
structure FiniteInstrument (n outcomes kraus : ℕ) where
  operator : Fin outcomes → Fin kraus → Matrix (Fin n) (Fin n) ℂ
  tracePreserving :
    ∑ i, ∑ k, star (operator i k) * operator i k = 1

/-- The POVM induced by a finite Kraus instrument. -/
noncomputable def FiniteInstrument.effect (I : FiniteInstrument n outcomes kraus)
    (i : Fin outcomes) : Matrix (Fin n) (Fin n) ℂ :=
  ∑ k, star (I.operator i k) * I.operator i k

/-- The outcome effect probabilities agree with the trace of the selective state operation. -/
theorem FiniteInstrument.born_probability (I : FiniteInstrument n outcomes kraus)
    (ρ : FiniteDensityState n) (i : Fin outcomes) :
    Matrix.trace (ρ.1 * I.effect i) =
      ∑ k, Matrix.trace (I.operator i k * ρ.1 * star (I.operator i k)) := by
  sorry


/-- Independent Kraus normalization supplies a positive normalized measurement;
contractivity then follows from `FinitePOVM.contractive`. -/
noncomputable def FiniteInstrument.toPOVM (I : FiniteInstrument n outcomes kraus) :
    FinitePOVM n outcomes where
  effect := I.effect
  positive := by
    sorry
  complete := I.tracePreserving

@[simp] theorem FiniteInstrument.toPOVM_effect (I : FiniteInstrument n outcomes kraus)
    (i : Fin outcomes) : I.toPOVM.effect i = I.effect i := rfl

/-- Finite measurements with a common outcome cardinal are the constant-cardinal
specialization of the general model below. -/
structure UniformFiniteOperationalModel (n states measurements outcomes : ℕ) where
  state : Fin states → FiniteDensityState n
  measurement : Fin measurements → FinitePOVM n outcomes

/-- A finite operational model is selected state and measurement data, not a universal physical
postulate. -/
structure FiniteOperationalModel (n states measurements : ℕ) where
  state : Fin states → FiniteDensityState n
  outcomes : Fin measurements → ℕ
  measurement : (m : Fin measurements) → FinitePOVM n (outcomes m)

/-- Include a common-outcome model into the varying-outcome presentation. -/
def UniformFiniteOperationalModel.toOperationalModel {states measurements : ℕ}
    (M : UniformFiniteOperationalModel n states measurements outcomes) :
    FiniteOperationalModel n states measurements where
  state := M.state
  outcomes _ := outcomes
  measurement := M.measurement

@[simp] theorem UniformFiniteOperationalModel.toOperationalModel_state
    {states measurements : ℕ}
    (M : UniformFiniteOperationalModel n states measurements outcomes) (i : Fin states) :
    M.toOperationalModel.state i = M.state i := rfl

/-- A finite-dimensional frame function for the Gleason acceptance theorem. -/
structure FiniteFrameFunction (n : ℕ) where
  weight : ℝ
  value : {v : EuclideanSpace ℂ (Fin n) // ‖v‖ = 1} → ℝ
  nonnegative : ∀ v, 0 ≤ value v
  basis_sum : ∀ b : OrthonormalBasis (Fin n) ℂ (EuclideanSpace ℂ (Fin n)),
    ∑ i, value ⟨b i, b.orthonormal.norm_eq_one i⟩ = weight

/-- Weight one is the normalized probability specialization. -/
abbrev NormalizedFiniteFrameFunction (n : ℕ) :=
  {f : FiniteFrameFunction n // f.weight = 1}

/-- Nonnegativity of the basis values forces nonnegative frame weight, also for n=0. -/
theorem FiniteFrameFunction.weight_nonnegative (f : FiniteFrameFunction n) :
    0 ≤ f.weight := by
  sorry

/-- Positive frame weights normalize without changing the outcome sphere. -/
noncomputable def FiniteFrameFunction.normalize (f : FiniteFrameFunction n)
    (hw : 0 < f.weight) : NormalizedFiniteFrameFunction n := by
  refine ⟨{ weight := 1
            value := fun v => f.value v / f.weight
            nonnegative := fun v => div_nonneg (f.nonnegative v) hw.le
            basis_sum := ?_ }, rfl⟩
  intro b
  sorry

@[simp] theorem FiniteFrameFunction.normalize_value (f : FiniteFrameFunction n)
    (hw : 0 < f.weight) (v : {v : EuclideanSpace ℂ (Fin n) // ‖v‖ = 1}) :
    (f.normalize hw).1.value v = f.value v / f.weight := rfl

/-- A globally strongly continuous unitary lift and its normalized continuous multiplier.
This stronger input excludes spin classes lacking a global continuous section. General ray
actions, Borel lifts and antiunitary actions have their distinct README interfaces. -/
structure GlobalContinuousProjectiveUnitaryLift
    (G H : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  operator : G → H →L[ℂ] H
  isometry : ∀ g x, ‖operator g x‖ = ‖x‖
  surjective : ∀ g, Function.Surjective (operator g)
  multiplier : G → G → ℂ
  multiplier_unit : ∀ g h, ‖multiplier g h‖ = 1
  multiplier_continuity : Continuous (fun x : G × G => multiplier x.1 x.2)
  normalized_left : ∀ g, multiplier 1 g = 1
  normalized_right : ∀ g, multiplier g 1 = 1
  multiplication : ∀ g h, operator g * operator h =
    multiplier g h • operator (g * h)
  cocycle : ∀ g h k,
    multiplier g h * multiplier (g * h) k =
      multiplier h k * multiplier g (h * k)
  strong_continuity : ∀ x, Continuous (fun g => operator g x)

/-- Compatibility spelling for the global-lift datum. General continuous ray
representations need not admit such a section and use the README's quotient interface. -/
abbrev StronglyContinuousProjectiveRepresentation := GlobalContinuousProjectiveUnitaryLift

/-- Normalization of the multiplier and surjectivity force the lift at identity. -/
theorem GlobalContinuousProjectiveUnitaryLift.operator_one
    {G H : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (U : GlobalContinuousProjectiveUnitaryLift G H) : U.operator 1 = 1 := by
  sorry

/-- Transition probability on actual projective rays, represented using the native
projectivization carrier. -/
noncomputable def rayTransitionProbability {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (x y : Projectivization ℂ H) : ℝ :=
  ‖inner ℂ x.rep y.rep‖ ^ 2 / (‖x.rep‖ ^ 2 * ‖y.rep‖ ^ 2)

/-- Projective transition probability does not depend on chosen representatives. -/
theorem rayTransitionProbability_mk {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (x y : H) (hx : x ≠ 0) (hy : y ≠ 0) :
    rayTransitionProbability (Projectivization.mk ℂ x hx)
      (Projectivization.mk ℂ y hy) =
      ‖inner ℂ x y‖ ^ 2 / (‖x‖ ^ 2 * ‖y‖ ^ 2) := by
  sorry

/-- Kummer's M is the Gamma-normalized native regularized hypergeometric function,
not a second hypergeometric series. The usual normalization excludes poles of Gamma b. -/
noncomputable def kummerM (a b z : ℂ) : ℂ :=
  Complex.Gamma b * Complex.regularizedHGFun {a} {b} z

/-- Principal Tricomi solution on the complex slit plane, supplied by QF6b's Laplace
construction and analytic continuation. The total function's values on the cut are fixed
separately by its boundary-value convention; the theorems below concern the slit plane. -/
noncomputable def kummerU (a b z : ℂ) : ℂ := by
  sorry

/-- The defining Laplace integral on its actual region of absolute convergence. -/
theorem kummerU_laplace (a b z : ℂ) (ha : 0 < a.re) (hz : 0 < z.re) :
    kummerU a b z = (Complex.Gamma a)⁻¹ *
      ∫ t : ℝ in Set.Ioi 0, Complex.exp (-z * (t : ℂ)) *
        (t : ℂ) ^ (a - 1) * ((1 + t : ℝ) : ℂ) ^ (b - a - 1) := by
  sorry

/-- Tricomi's equation has no exclusion of integer b; the domain excludes the branch cut. -/
theorem kummerU_differential_equation (a b z : ℂ) (hz : z ∈ Complex.slitPlane) :
    z * deriv (deriv (kummerU a b)) z + (b - z) * deriv (kummerU a b) z -
      a * kummerU a b z = 0 := by
  sorry

/-- The all-b Wronskian uses the native regularized M, so no Gamma(b) pole is hidden. -/
theorem kummerU_wronskian_regularized (a b z : ℂ) (hz : z ∈ Complex.slitPlane) :
    Complex.regularizedHGFun {a} {b} z * deriv (kummerU a b) z -
      deriv (fun w => Complex.regularizedHGFun {a} {b} w) z * kummerU a b z =
      -Complex.exp z * z ^ (-b) / Complex.Gamma a := by
  sorry

/-- The missing differential equation for the native one-numerator/one-denominator
specialization; convergence and coefficient recurrence are already native APIs. -/
theorem kummerM_differential_equation (a b z : ℂ) (hb : ∀ n : ℕ, b ≠ -(n : ℂ)) :
    z * deriv (deriv (kummerM a b)) z + (b - z) * deriv (kummerM a b) z -
      a * kummerM a b z = 0 := by
  sorry

/-- QF6b's scalar inversion target for the existing native finite-measure resolvent transform.
The positive imaginary part corresponds to (A-z) inverse, opposite UO's resolvent sign. -/
theorem stieltjes_inversion_interval (μ : MeasureTheory.Measure ℝ)
    [MeasureTheory.IsFiniteMeasure μ] (a b : ℝ) (hab : a < b) :
    Filter.Tendsto (fun ε : ℝ => (Real.pi)⁻¹ *
      ∫ E : ℝ in Set.Ioo a b,
        (MeasureTheory.resolventTransform μ ((E : ℂ) + (ε : ℂ) * Complex.I)).im)
      (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhds ((μ (Set.Ioo a b)).toReal + ((μ {a}).toReal + (μ {b}).toReal) / 2)) := by
  sorry

end QuantumFoundations
