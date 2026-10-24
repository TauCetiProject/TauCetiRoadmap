import Mathlib.Geometry.Manifold.SmoothApprox
import Mathlib.Analysis.Calculus.BumpFunction.FiniteDimension
import Mathlib.Analysis.Calculus.ContDiff.Operations
import TauCeti.Analysis.Fredholm.Basic
import TauCeti.Analysis.Fredholm.LevelSet.GlobalParametric

/-!
Illustrative native formulas and target signatures. The README is definitive;
this companion is nonexhaustive. Every data definition below is an actual formula.
The stated geometric/derivative laws are proof targets; no arbitrary carrier or
admitted regularity predicate substitutes for the incidence equation.
-/

open scoped ContDiff Topology

namespace TauCetiRoadmap.DifferentialGeometry.FiniteParameter

section Formulas
variable {E V W P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W]
  [NormedAddCommGroup P] [NormedSpace ℝ P]

def relativeTranslate (f : E → V) (beta : E → ℝ) (p : V) (x : E) : V :=
  f x + beta x • p

omit [NormedAddCommGroup E] [NormedSpace ℝ E] in
@[simp] theorem relativeTranslate_zero (f : E → V) (beta : E → ℝ) (x : E) :
    relativeTranslate f beta 0 x = f x := by simp [relativeTranslate]

omit [NormedAddCommGroup E] [NormedSpace ℝ E] in
theorem relativeTranslate_eqOn (f : E → V) (beta : E → ℝ) (C : Set E)
    (hzero : ∀ x ∈ C, beta x = 0) (p : V) :
    Set.EqOn (relativeTranslate f beta p) f C := by
  intro x hx
  simp [relativeTranslate, hzero x hx]

def relativeHomotopy (f : E → V) (beta : E → ℝ) (p : V)
    (t : ℝ) (x : E) : V :=
  f x + t • (beta x • p)

/-- Source coordinates precede the parameter, as in native IsRegularParameter. -/
def incidenceEquation (F : E × P → V) (j : W → V) : (E × W) × P → V :=
  fun z => F (z.1.1, z.2) - j z.1.2

/-- An actual native parameter predicate on the displayed difference equation. -/
def regularIncidenceParameter (F : E × P → V) (j : W → V) (p : P) : Prop :=
  TauCeti.IsRegularParameter (incidenceEquation F j) 0 p

noncomputable def incidenceSliceLinearization (F : E × P → V) (j : W → V)
    (x : E) (y : W) (p : P) : E × W →L[ℝ] V :=
  (fderiv ℝ (incidenceEquation F j) ((x, y), p)).comp
    (ContinuousLinearMap.inl ℝ (E × W) P)

/-- No smoothness of the ambient retraction is asserted. -/
def intervalRetract (t : ℝ) : ℝ := max 0 (min 1 t)

def squareRetract (z : ℝ × ℝ) : ℝ × ℝ :=
  (intervalRetract z.1, intervalRetract z.2)

noncomputable def ballRetract (v : E) : E := (max 1 ‖v‖)⁻¹ • v

end Formulas

section FiniteDimensional
variable {E V W P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W] [FiniteDimensional ℝ W]
  [NormedAddCommGroup P] [NormedSpace ℝ P] [FiniteDimensional ℝ P]

/-- The native generic engine, specialized rather than reconstructed. -/
theorem native_generic_parameters (g : E × P → V)
    (hsmooth : ContDiff ℝ ∞ g)
    (htotal : ∀ z, g z = 0 → Function.Surjective (fderiv ℝ g z)) :
    {p | TauCeti.IsRegularParameter g 0 p} ∈ residual P := by
  exact TauCeti.mem_residual_setOf_isRegularParameter
    (fun z _ => hsmooth.contDiffAt)
    (fun z _ => TauCeti.isFredholm_of_finiteDimensional _)
    htotal
    (fun z _ => WithTop.coe_le_coe.mpr le_top)

/-- The actual source/slice permutation and incidence equality are retained. -/
theorem regularIncidenceParameter_iff (F : E × P → V) (j : W → V) (p : P) :
    regularIncidenceParameter F j p ↔
      ∀ x y, F (x, p) = j y →
        Function.Surjective (incidenceSliceLinearization F j x y p) := sorry

theorem incidenceSliceLinearization_apply (F : E × P → V) (j : W → V)
    (hF : ContDiff ℝ ∞ F) (hj : ContDiff ℝ ∞ j)
    (x : E) (y : W) (p : P) (u : E) (v : W) :
    incidenceSliceLinearization F j x y p (u, v) =
      fderiv ℝ (fun z : E => F (z, p)) x u - fderiv ℝ j y v := sorry

theorem relativeTranslate_contDiff (f : E → V) (beta : E → ℝ)
    (hf : ContDiff ℝ ∞ f) (hbeta : ContDiff ℝ ∞ beta) :
    ContDiff ℝ ∞ (fun z : V × E => relativeTranslate f beta z.1 z.2) := sorry

theorem relativeTranslate_parameter_fderiv (f : E → V) (beta : E → ℝ)
    (x : E) (p : V) :
    fderiv ℝ (fun q : V => relativeTranslate f beta q x) p =
      beta x • ContinuousLinearMap.id ℝ V := sorry

theorem relativeTranslate_source_fderiv (f : E → V) (beta : E → ℝ)
    (hf : ContDiff ℝ ∞ f) (hbeta : ContDiff ℝ ∞ beta) (p : V) (x : E) :
    fderiv ℝ (relativeTranslate f beta p) x =
      fderiv ℝ f x + (fderiv ℝ beta x).smulRight p := sorry

/-- Native open-support construction, with its actual closed zero region. -/
theorem exists_relative_cutoff (C : Set E) (hC : IsClosed C) :
    ∃ beta : E → ℝ, ContDiff ℝ ∞ beta ∧
      (∀ x, 0 ≤ beta x ∧ beta x ≤ 1) ∧
      (∀ x, beta x = 0 ↔ x ∈ C) := sorry

/-- A direct dimension obstruction on the actual linearized equality. -/
theorem regular_incidence_avoids_of_dim (F : E × P → V) (j : W → V) (p : P)
    (hdim : Module.finrank ℝ E + Module.finrank ℝ W < Module.finrank ℝ V)
    (hp : regularIncidenceParameter F j p) :
    ∀ x y, F (x, p) ≠ j y := sorry

/-- All determining f/beta/C/j operands occur in the proposition. -/
theorem relative_incidence_choice (f : E → V) (beta : E → ℝ) (j : W → V)
    (C : Set E) (hf : ContDiff ℝ ∞ f) (hb : ContDiff ℝ ∞ beta)
    (hj : ContDiff ℝ ∞ j) (hnonneg : ∀ x, 0 ≤ beta x)
    (hzero : ∀ x, beta x = 0 ↔ x ∈ C)
    (hgood : ∀ x ∈ C, ∀ y, f x = j y →
      Function.Surjective ((fderiv ℝ f x).coprod (-fderiv ℝ j y)))
    (r : ℝ) (hr : 0 < r) :
    ∃ p : V, ‖p‖ < r ∧
      regularIncidenceParameter (fun z : E × V => relativeTranslate f beta z.2 z.1) j p ∧
      Set.EqOn (relativeTranslate f beta p) f C := sorry

end FiniteDimensional

end TauCetiRoadmap.DifferentialGeometry.FiniteParameter
