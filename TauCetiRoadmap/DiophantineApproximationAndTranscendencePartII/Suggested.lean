module

public import Mathlib

/-!
# Diophantine approximation and transcendence, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the integrated arithmetic rank bound and
its algebraicity theorem, with simple definitions on native carriers.

The corrected holonomic W rank bound, the field and scalar-span comparison, and
integral-coordinate holonomic finiteness are not statable at the pins: they lack
the scalar differential-equation carrier with full meromorphic local solution bases
and the resulting arithmetic holonomic germ ring. The centred capacity rank theorem
bounds the same span W and lacks the same carrier.
These remain targets of Layers 4 and 5, without substitute predicates here.
-/

public section

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII

open scoped BigOperators Topology LaurentSeries RatFunc
open Filter

/-! ## Layer 0: arithmetic germs and uniform denominators -/

/-- A rational power series is integral when each coefficient is an integer. -/
def IntegralSeries (f : PowerSeries ℚ) : Prop :=
  ∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n f = (a : ℚ)

/-- An analytic germ with Taylor coefficients f pulls back along φ to the germ of g.
The coefficient convention divides the nth ordinary derivative by n!. -/
def Uniformizes (φ : ℂ → ℂ) (f : PowerSeries ℚ) (g : ℂ → ℂ) : Prop :=
  ∃ F : ℂ → ℂ, AnalyticAt ℂ F 0 ∧
    (∀ n : ℕ, ((PowerSeries.coeff n f : ℚ) : ℂ) =
      iteratedDeriv n F 0 / (n.factorial : ℂ)) ∧
    g =ᶠ[𝓝 (0 : ℂ)] (F ∘ φ)

/-- The positive logarithmic mean on the unit circle uses probability normalization. -/
noncomputable def positiveLogMean (g : ℂ → ℂ) : ℝ :=
  Real.circleAverage (fun z => Real.log (max 1 ‖g z‖)) 0 1

/-- The scalar field Q(p) inside the native Laurent-series field. -/
noncomputable def rationalFunctionField (p : RatFunc ℚ) :
    IntermediateField ℚ (LaurentSeries ℚ) :=
  IntermediateField.adjoin ℚ {(p : LaurentSeries ℚ)}

/-! ## Layer 2: integrated rank and algebraicity -/

/-- The independent family size is bounded by e times the positive logarithmic mean,
divided by the logarithm of the uniformizing derivative. CDT, Theorem 2.0.1. -/
theorem mean_rank_bound (p : RatFunc ℚ) (pSeries χ : PowerSeries ℚ)
    (φ g : ℂ → ℂ) (m : ℕ) (f : Fin m → PowerSeries ℚ)
    (u : Fin m → ℂ → ℂ)
    (hp : ¬ ∃ a : ℚ, p = RatFunc.C a)
    (hregular : (pSeries : LaurentSeries ℚ) = (p : LaurentSeries ℚ))
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpInt : IntegralSeries (PowerSeries.subst χ pSeries))
    (hfInt : ∀ i, IntegralSeries (PowerSeries.subst χ (f i)))
    (hφ : AnalyticOnNhd ℂ φ (Metric.closedBall 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hg : AnalyticOnNhd ℂ g (Metric.closedBall 0 1)) (hgp : Uniformizes φ pSeries g)
    (hu : ∀ i, AnalyticOnNhd ℂ (u i) (Metric.closedBall 0 1))
    (huf : ∀ i, Uniformizes φ (f i) (u i))
    (hlin : LinearIndependent (rationalFunctionField p)
      (fun i => (f i : LaurentSeries ℚ))) :
    (m : ℝ) ≤ Real.exp 1 * positiveLogMean g / Real.log ‖deriv φ 0‖ := by
  sorry

/-- An integral arithmetic pullback and a common large analytic uniformization force
algebraicity over both Q(p) and Q(x). CDT, Theorem 2.0.1, algebraicity clause. -/
theorem arithmetic_algebraicity (p : RatFunc ℚ) (pSeries χ f : PowerSeries ℚ)
    (φ g u : ℂ → ℂ)
    (hp : ¬ ∃ a : ℚ, p = RatFunc.C a)
    (hregular : (pSeries : LaurentSeries ℚ) = (p : LaurentSeries ℚ))
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpInt : IntegralSeries (PowerSeries.subst χ pSeries))
    (hfInt : IntegralSeries (PowerSeries.subst χ f))
    (hφ : AnalyticOnNhd ℂ φ (Metric.closedBall 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hg : AnalyticOnNhd ℂ g (Metric.closedBall 0 1)) (hgp : Uniformizes φ pSeries g)
    (hu : AnalyticOnNhd ℂ u (Metric.closedBall 0 1)) (huf : Uniformizes φ f u) :
    IsAlgebraic (rationalFunctionField p) (f : LaurentSeries ℚ) ∧
      IsAlgebraic (RatFunc ℚ) (f : LaurentSeries ℚ) := by
  sorry

end TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII
