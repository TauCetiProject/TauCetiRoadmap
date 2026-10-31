import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Group.Action.Pi

/-! Representative native action/covariance forms, not an exhaustive checklist.
The definitive Layer8 programme constructs the ACTUAL regular-function subspace
and section restriction map. No finite-weight assertion about all functions is
made by this formal function-action model. No generic flag carrier is invented. -/

namespace TauCetiRoadmap.LieGroups.BigCellCovariance

variable {K T X V W : Type*} [Field K] [Group T]
variable [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]

/-- Twisting the actual native representation by the specified character. -/
def twist (χ : T →* Kˣ) (ρ : Representation K T V) : Representation K T V where
  toFun t := (χ t : K) • ρ t
  map_one' := by simp
  map_mul' t u := by
    ext v
    simp [smul_smul, Module.End.mul_apply, mul_comm]

/-- This fixes the INPUT equation; it must not be guessed from a shift label. -/
def IsCovariant (χ : T →* Kˣ) (ρ : Representation K T V)
    (τ : Representation K T W) (F : V →ₗ[K] W) : Prop :=
  ∀ t v, F (ρ t v) = (χ t : K) • τ t (F v)

/-- The same map is an ordinary intertwiner INTO the positive twist. -/
theorem covariant_iff_target_twist (χ : T →* Kˣ)
    (ρ : Representation K T V) (τ : Representation K T W) (F : V →ₗ[K] W) :
    IsCovariant χ ρ τ F ↔ ∀ t v, F (ρ t v) = twist χ τ t (F v) := Iff.rfl

/-- The actual negative weight shift uses the inverse scalar, regardless of labels. -/
theorem covariant_weight_shift (χ μ : T →* Kˣ)
    (ρ : Representation K T V) (τ : Representation K T W) (F : V →ₗ[K] W)
    (hF : IsCovariant χ ρ τ F) (v : V)
    (hv : ∀ t, ρ t v = (μ t : K) • v) (t : T) :
    τ t (F v) = ((μ t : K) / (χ t : K)) • F v := by
  have hh := hF t v
  rw [hv t, map_smul] at hh
  have ht : (χ t : K) ≠ 0 := (χ t).ne_zero
  calc
    τ t (F v) = (χ t : K)⁻¹ • ((χ t : K) • τ t (F v)) := by
      simp [smul_smul, ht]
    _ = (χ t : K)⁻¹ • ((μ t : K) • F v) := by rw [← hh]
    _ = ((μ t : K) / (χ t : K)) • F v := by
      simp [smul_smul, div_eq_mul_inv, mul_comm]

section Functions
variable [MulAction T X]

/-- Pullback by inverse translation on all functions: a formal action model only. -/
def functionRepresentation : Representation K T (X → K) where
  toFun t :=
    { toFun := fun f x => f (t⁻¹ • x)
      map_add' := by intros; rfl
      map_smul' := by intros; rfl }
  map_one' := by ext f x; simp
  map_mul' t u := by ext f x; simp [mul_smul]

/-- The scalar-fibre linearization multiplies the actual function action by χ. -/
def fibreFunctionRepresentation (χ : T →* Kˣ) : Representation K T (X → K) :=
  twist χ functionRepresentation

theorem fibre_action_formula (χ : T →* Kˣ) (t : T) (f : X → K) (x : X) :
    fibreFunctionRepresentation χ t f x = (χ t : K) * f (t⁻¹ • x) := rfl

theorem coefficient_identity_covariant (χ : T →* Kˣ) :
    IsCovariant χ (fibreFunctionRepresentation χ)
      functionRepresentation (LinearMap.id : (X → K) →ₗ[K] (X → K)) := by
  intro t f
  rfl

end Functions
end TauCetiRoadmap.LieGroups.BigCellCovariance
