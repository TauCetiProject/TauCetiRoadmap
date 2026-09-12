import Mathlib

/-!
# Suggested interfaces: differential forms and smooth flows

This file is a compiled-interface sketch for the first, forms-and-flows slice of the
differential-geometry programme.

Prior work:
* Yury Kudryashov: https://github.com/urkud/DeRhamCohomology
* Yin--Kudryashov: https://arxiv.org/abs/2602.13247
* Kudryashov--Lindauer, ICERM May 2026 progress report:
  https://app.icerm.brown.edu/assets/583/10880/10880_6142_Kudryashov_051220260900_Slides.pdf
* Existing flow/Lie work:
  https://github.com/idontgetoutmuch/mathlib4/tree/smooth-exp-Lie-V/Mathlib/Geometry/Manifold/Algebra

The final implementation should consume existing Tau Ceti declarations where available,
rather than introduce parallel definitions. In particular, the existing degree-2 form is
`SmoothTwoForm` in `TauCeti/Geometry/Manifold/TwoForm.lean`; the general k-form API should bridge
to it rather than introduce another public two-form structure. The exact bundled manifold-form and
flow theorem signatures remain implementation targets to be verified against the live APIs.
-/

open Bundle Set
open scoped Manifold Bundle Topology ContDiff

namespace TauCetiRoadmap.DifferentialForms

/-! ## Layer 0: paired wedge -/

section Wedge

variable {E F₁ F₂ F₃ : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
  [NormedAddCommGroup F₂] [NormedSpace ℝ F₂]
  [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]

/-- Layer-0 paired wedge on continuous alternating maps at one normed space.

The shape follows Yury Kudryashov's `DeRhamCohomology`: the coefficient pairing is
an explicit continuous bilinear map. The manifold-form wedge is the corresponding
fibrewise lift after bundling. -/
noncomputable def wedgeWith {k l : ℕ}
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (φ : E [⋀^Fin k]→L[ℝ] F₁)
    (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    E [⋀^Fin (k + l)]→L[ℝ] F₃ :=
  sorry

/-- The ordinary real-valued wedge is the multiplication specialization. -/
noncomputable def wedge {k l : ℕ}
    (φ : E [⋀^Fin k]→L[ℝ] ℝ)
    (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    E [⋀^Fin (k + l)]→L[ℝ] ℝ :=
  wedgeWith (ContinuousLinearMap.mul ℝ ℝ) φ ψ

/-- Normalization gate for the determinant convention. -/
theorem wedge_apply_one_one
    (φ ψ : E [⋀^Fin 1]→L[ℝ] ℝ) (v w : E) :
    wedge φ ψ ![v, w] =
      φ ![v] * ψ ![w] - φ ![w] * ψ ![v] := by
  sorry

end Wedge

/-! ## Layer 0: rough manifold forms -/

section Forms

variable {E H M F : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- Rough `k`-forms, as unbundled sections of the alternating bundle. -/
def RoughForm (k : ℕ) :=
  (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] F

/-- Pullback of a rough form by the manifold derivative.

The final implementation should retain the total/junk-valued convention of `mfderiv`. -/
noncomputable def mpullback {E' H' M' : Type*}
    [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    [TopologicalSpace M'] [ChartedSpace H' M']
    (f : M → M') (ω : RoughForm (I := I') (M := M') (F := F) k)
    : RoughForm (I := I) (M := M) (F := F) k :=
  fun x =>
    (ω (f x)).compContinuousLinearMap (mfderiv I I' f x)

/-- The manifold exterior derivative is a separate target from flat `extDeriv`. -/
opaque mextDeriv : Prop

end Forms

/-! ## Layer 1: flat smoothness prerequisite -/

section ExtDeriv

variable {E F : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- The finite-regularity flat result needed to transfer `extDerivWithin` to charts. -/
theorem contDiffOn_extDerivWithin
    {k : ℕ} {n : WithTop ℕ∞}
    {φ : E → E [⋀^Fin k]→L[ℝ] F} {s : Set E}
    (hs : UniqueDiffOn ℝ s)
    (hφ : ContDiffOn ℝ n φ s) :
    ContDiffOn ℝ (n - 1) (extDerivWithin φ s) s := by
  sorry

end ExtDeriv

/-! ## Layer 3: smooth flows -/

section Flows

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I (minSmoothness ℝ 3) M]
  [T2Space M] [BoundarylessManifold I M]

/--
Smooth dependence of a family of integral curves on the initial condition.

This is the exact gap currently represented by the `contMDiff_flow_like` axiom in the existing
`ExpLie.lean` development. The theorem corresponds to the smooth-flow conclusion of Lee,
Theorem 9.12 (2nd ed.), with the precise finite-regularity hypotheses to be verified against the existing
Tau Ceti/Mathlib ODE and manifold infrastructure.
-/
theorem contMDiff_flow_like
    (X : ∀ x : M, TangentSpace I x)
    (hX :
      ContMDiff I I.tangent (minSmoothness ℝ 2)
        (fun x => (⟨x, X x⟩ : TangentBundle I M)))
    (Φ : ℝ → M → M)
    (hΦ₀ : ∀ x, Φ 0 x = x)
    (hΦ :
      ∀ x, IsMIntegralCurve (fun t => Φ t x) X) :
    ContMDiff
      (𝓘(ℝ, ℝ).prod I) I
      (minSmoothness ℝ 2)
      (fun p : ℝ × M => Φ p.1 p.2) := by
  sorry

end Flows

end TauCetiRoadmap.DifferentialForms
