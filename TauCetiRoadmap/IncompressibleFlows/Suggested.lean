import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.MeasureTheory.Function.L2Space
import TauCeti.Analysis.Semigroups.Defs

/-!
# Incompressible flows and Navier--Stokes: target signatures

**This file is not the roadmap and is not exhaustive.**  The definitive specification is
`README.md`.  The declarations below pin a few representation-sensitive boundaries: the
unit-torus Fourier normalization, the zero Fourier mode of the Leray symbol, the sign in the
mild Duhamel formula, Euclidean Navier--Stokes scaling, and backward parabolic cylinders.

Later signatures should be added only once their prerequisite types are honest library objects.
In particular, this file does not use `Prop` placeholders for Leray--Hopf solutions, suitable
solutions, Besov spaces, or parabolic Hausdorff measure.
-/

noncomputable section

open MeasureTheory Set
open scoped ENNReal NNReal

namespace TauCetiRoadmap.IncompressibleFlows

section FourierLeray

variable {d : Type*} [Fintype d] [DecidableEq d]

/-- Complex Fourier amplitudes of a `d`-dimensional velocity field.  Physical fields occupy the
real form, but the Fourier multiplier is most naturally complex-linear. -/
abbrev FourierVelocity (d : Type*) := d → ℂ

/-- The algebraic contraction `k dot a` used by the Leray multiplier. -/
def modeDot (k : d → ℤ) (a : FourierVelocity d) : ℂ :=
  ∑ i, (k i : ℂ) * a i

/-- The squared frequency, embedded into `ℂ` for the multiplier formula. -/
def modeNormSq (k : d → ℤ) : ℂ :=
  ∑ i, (k i : ℂ) ^ 2

/-- The Helmholtz--Leray symbol.  The zero mode is the identity: constant velocities are
divergence-free and are not deleted by the periodic projector. -/
def leraySymbol (k : d → ℤ) (a : FourierVelocity d) : FourierVelocity d :=
  if k = 0 then a else fun i => a i - (k i : ℂ) * modeDot k a / modeNormSq k

@[simp]
theorem leraySymbol_zero (a : FourierVelocity d) : leraySymbol 0 a = a := by
  sorry

theorem modeDot_leraySymbol {k : d → ℤ} (hk : k ≠ 0) (a : FourierVelocity d) :
    modeDot k (leraySymbol k a) = 0 := by
  sorry

theorem leraySymbol_idempotent (k : d → ℤ) (a : FourierVelocity d) :
    leraySymbol k (leraySymbol k a) = leraySymbol k a := by
  sorry

/-- Complex vector-valued `L²` on the normalized unit torus. -/
abbrev TorusVectorL2 (d : Type*) [Fintype d] :=
  Lp (FourierVelocity d) 2 (volume : Measure (UnitAddTorus d))

/-- Distributional divergence-freeness expressed without choosing a representative: every
Fourier coefficient is transverse to its frequency. -/
def IsFourierDivergenceFree (u : TorusVectorL2 d) : Prop :=
  ∀ k : d → ℤ, modeDot k (UnitAddTorus.mFourierCoeff u k) = 0

/-- The target continuous `L²` Leray projector obtained by extending `leraySymbol` from
trigonometric polynomials using Parseval. -/
noncomputable def torusLerayProjection :
    TorusVectorL2 d →L[ℂ] TorusVectorL2 d := by
  sorry

theorem torusLerayProjection_idempotent (u : TorusVectorL2 d) :
    torusLerayProjection (torusLerayProjection u) = torusLerayProjection u := by
  sorry

theorem torusLerayProjection_isFourierDivergenceFree (u : TorusVectorL2 d) :
    IsFourierDivergenceFree (torusLerayProjection u) := by
  sorry

theorem torusLerayProjection_eq_self_iff (u : TorusVectorL2 d) :
    torusLerayProjection u = u ↔ IsFourierDivergenceFree u := by
  sorry

theorem norm_torusLerayProjection_le_one :
    ‖torusLerayProjection (d := d)‖ ≤ 1 := by
  sorry

end FourierLeray

section Mild

open TauCeti.Semigroups

variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

/-- The honest abstract mild equation consumed by the concrete Navier--Stokes realization.
`nonlinear` is the projected convection term and `force` has already been projected.  The
integrability conjunct prevents the junk-value convention for the Bochner integral from making
the predicate vacuous. -/
def IsMildSolutionOn (S : StronglyContinuousSemigroup X) (nonlinear : X → X)
    (force : ℝ → X) (u0 : X) (T : ℝ) (u : ℝ → X) : Prop :=
  0 ≤ T ∧ ContinuousOn u (Icc 0 T) ∧
    ∀ t ∈ Icc (0 : ℝ) T,
      IntervalIntegrable
        (fun s : ℝ => S (t - s).toNNReal (force s - nonlinear (u s))) volume 0 t ∧
      u t = S t.toNNReal u0 + ∫ s in (0 : ℝ)..t,
        S (t - s).toNNReal (force s - nonlinear (u s))

theorem IsMildSolutionOn.zero
    (S : StronglyContinuousSemigroup X) {T : ℝ} (hT : 0 ≤ T) :
    IsMildSolutionOn S (fun _ => 0) (fun _ => 0) 0 T (fun _ => 0) := by
  sorry

end Mild

section Scaling

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Euclidean Navier--Stokes velocity scaling
`u_lambda(t,x) = lambda u(lambda^2 t, lambda x)`. -/
def scaleVelocity (lambda : ℝ) (u : ℝ → E → E) : ℝ → E → E :=
  fun t x => lambda • u (lambda ^ 2 * t) (lambda • x)

/-- Euclidean Navier--Stokes pressure scaling
`p_lambda(t,x) = lambda^2 p(lambda^2 t, lambda x)`. -/
def scalePressure (lambda : ℝ) (p : ℝ → E → ℝ) : ℝ → E → ℝ :=
  fun t x => lambda ^ 2 * p (lambda ^ 2 * t) (lambda • x)

/-- Euclidean body-force scaling
`f_lambda(t,x) = lambda^3 f(lambda^2 t, lambda x)`. -/
def scaleForce (lambda : ℝ) (f : ℝ → E → E) : ℝ → E → E :=
  fun t x => lambda ^ 3 • f (lambda ^ 2 * t) (lambda • x)

end Scaling

section ParabolicCylinder

variable {E : Type*} [PseudoMetricSpace E]

/-- The backward parabolic cylinder used by the CKN lane:
`Q_r(x0,t0) = B_r(x0) × (t0-r²,t0)`. -/
def parabolicCylinder (z0 : E × ℝ) (r : ℝ) : Set (E × ℝ) :=
  Metric.ball z0.1 r ×ˢ Ioo (z0.2 - r ^ 2) z0.2

@[simp]
theorem mem_parabolicCylinder {z z0 : E × ℝ} {r : ℝ} :
    z ∈ parabolicCylinder z0 r ↔
      dist z.1 z0.1 < r ∧ z0.2 - r ^ 2 < z.2 ∧ z.2 < z0.2 := by
  sorry

end ParabolicCylinder

end TauCetiRoadmap.IncompressibleFlows
