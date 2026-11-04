import TauCetiRoadmap.DifferentialGeometry.Suggested
import TauCeti.Geometry.Manifold.Distribution

/-!
# Contact geometry: suggested interfaces

These are suggested forms, not an exhaustive checklist. The README is the definitive
specification. Reuse the generic smooth forms and native tangent-section carriers.
The explicit contact and Reeb/Hamiltonian equations below pin the conventions;
`sorry` marks the stated mathematical targets.
-/

open scoped Manifold ContDiff

noncomputable section

namespace TauCetiRoadmap.SymplecticGeometry.ContactGeometry

open TauCetiRoadmap.DifferentialGeometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [T2Space M] [BoundarylessManifold I M]
  [IsManifold I ∞ M]

abbrev ContactOneForm := SmoothForm I M ℝ 1

/-- Evaluate the already-owned smooth one-form on a tangent vector. -/
def contactEval (α : ContactOneForm (I := I) (M := M)) (x : M)
    (v : TangentSpace I x) : ℝ :=
  (α : RoughForm I M ℝ 1) x ![v]

/-- The pointwise exterior derivative of a contact one-form. -/
def contactDEval (α : ContactOneForm (I := I) (M := M)) (x : M)
    (v w : TangentSpace I x) : ℝ :=
  mextDeriv (α : RoughForm I M ℝ 1) x ![v, w]

/-- Intrinsic contact-form condition: α is nonzero, and dα is nondegenerate on ker α.
In finite dimension this forces `dim M` to be odd; the dimension-indexed form with
`dim M = 2*n+1` will be supplied as a convenience theorem/API. -/
def IsContactForm (α : ContactOneForm (I := I) (M := M)) : Prop :=
  ∀ x, (∃ v, contactEval α x v ≠ 0) ∧
    ∀ v, contactEval α x v = 0 →
      (∀ w, contactEval α x w = 0 → contactDEval α x v w = 0) → v = 0

/-- A smooth vector field is the native bundled smooth section of the tangent bundle. -/
abbrev SmoothVectorField (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  ContMDiffSection I E ∞ (TangentSpace I : M → Type _)

/-- Reeb field equations for the fixed cooriented form. Existence/uniqueness follows by
solving the finite-dimensional linear system determined by α and dα|ker α. -/
structure ReebField (α : ContactOneForm (I := I) (M := M)) where
  field : SmoothVectorField I M
  alpha_eq_one : ∀ x, contactEval α x (field x) = 1
  d_alpha_eq_zero : ∀ x (w : TangentSpace I x), contactDEval α x (field x) w = 0

/-- Contact Hamiltonian vector field with convention α(X_H)=H and
ι_(X_H)dα=(R(H))α−dH. -/
structure ContactHamiltonianField (α : ContactOneForm (I := I) (M := M))
    (R : ReebField α) (Hf : M → ℝ)
    where
  hamiltonian_smooth : ContMDiff I 𝓘(ℝ, ℝ) ∞ Hf
  field : SmoothVectorField I M
  alpha_eq_H : ∀ x, contactEval α x (field x) = Hf x
  d_alpha_eq : ∀ x (w : TangentSpace I x),
    contactDEval α x (field x) w =
      (mextDeriv (RoughForm.ofFunction I Hf) x ![R.field x]) *
        contactEval α x w - mextDeriv (RoughForm.ofFunction I Hf) x ![w]

/-- The contact-form linear algebra and smooth dependence construct Reeb data. -/
theorem exists_reebField (α : ContactOneForm (I := I) (M := M))
    (hfinite : FiniteDimensional ℝ E) (hα : IsContactForm α) : Nonempty (ReebField α) := by
  sorry

/-- For a smooth Hamiltonian, the contact equations determine a unique contact vector field. -/
theorem exists_contactHamiltonianField (α : ContactOneForm (I := I) (M := M))
    (hfinite : FiniteDimensional ℝ E) (hα : IsContactForm α) (R : ReebField α) (Hf : M → ℝ)
    (hH : ContMDiff I 𝓘(ℝ, ℝ) ∞ Hf) : Nonempty (ContactHamiltonianField α R Hf) := by
  sorry

/-- The Reeb equations determine the underlying smooth vector field uniquely. -/
theorem reebField_unique (α : ContactOneForm (I := I) (M := M))
    (hα : IsContactForm α) (R S : ReebField α) :
    ∀ x, R.field x = S.field x := by
  sorry

/-- Existing acceptance test: the standard rank-two contact distribution is not involutive.
This theorem is consumed from Tau Ceti; it is not a replacement proof of the contact criterion. -/
theorem standardContactDistribution_not_involutive :
    ¬TauCeti.IsInvolutiveDistribution 𝓘(ℝ, ℝ × ℝ × ℝ)
      (TauCeti.standardContactDistribution ℝ) :=
  TauCeti.not_isInvolutiveDistribution_standardContactDistribution

end TauCetiRoadmap.SymplecticGeometry.ContactGeometry
