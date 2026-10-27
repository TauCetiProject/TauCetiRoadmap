/- Suggested forms only; the roadmap README is definitive and this file is not exhaustive. -/
import Mathlib

open scoped Quaternion

namespace QuaternionicAnalysisPrototype

abbrev H := Quaternion ℝ

def qi : H := ⟨0, 1, 0, 0⟩
def qj : H := ⟨0, 0, 1, 0⟩
def qk : H := ⟨0, 0, 0, 1⟩

/-- The differential associated with the left quotient `h⁻¹ * Δf`: `h ↦ h*b`. -/
noncomputable def rightMulCLM (b : H) : H →L[ℝ] H :=
  (ContinuousLinearMap.mul ℝ H).flip b

/-- The differential associated with the right quotient `Δf * h⁻¹`: `h ↦ a*h`. -/
noncomputable def leftMulCLM (a : H) : H →L[ℝ] H :=
  (ContinuousLinearMap.mul ℝ H) a

@[simp] theorem rightMulCLM_apply (b h : H) : rightMulCLM b h = h * b := rfl
@[simp] theorem leftMulCLM_apply (a h : H) : leftMulCLM a h = a * h := rfl

def HasLeftQuotientFDerivAt (f : H → H) (q b : H) : Prop :=
  HasFDerivAt f (rightMulCLM b) q

def HasRightQuotientFDerivAt (f : H → H) (q a : H) : Prop :=
  HasFDerivAt f (leftMulCLM a) q

/-- The pointwise left Fueter equation applied to the real Fréchet derivative. -/
def FueterLeft (D : H →L[ℝ] H) : Prop :=
  D 1 + qi * D qi + qj * D qj + qk * D qk = 0

/-- The pointwise right Fueter equation applied to the real Fréchet derivative. -/
def FueterRight (D : H →L[ℝ] H) : Prop :=
  D 1 + D qi * qi + D qj * qj + D qk * qk = 0

def LeftFueterAt (f : H → H) (q : H) : Prop :=
  ∃ D : H →L[ℝ] H, HasFDerivAt f D q ∧ FueterLeft D

def RightFueterAt (f : H → H) (q : H) : Prop :=
  ∃ D : H →L[ℝ] H, HasFDerivAt f D q ∧ FueterRight D

def LeftFueterOn (f : H → H) (Ω : Set H) : Prop :=
  ∀ q ∈ Ω, LeftFueterAt f q

def RightFueterOn (f : H → H) (Ω : Set H) : Prop :=
  ∀ q ∈ Ω, RightFueterAt f q

theorem leftFueter_realAnalytic
    (f : H → H) (Ω : Set H) (hopen : IsOpen Ω) (hf : LeftFueterOn f Ω) :
    AnalyticOnNhd ℝ f Ω := by
  sorry

theorem rightFueter_realAnalytic
    (f : H → H) (Ω : Set H) (hopen : IsOpen Ω) (hf : RightFueterOn f Ω) :
    AnalyticOnNhd ℝ f Ω := by
  sorry

/-- The singular kernel in the left Cauchy–Fueter formula. -/
noncomputable def cauchyFueterKernel (q q₀ : H) : H :=
  (q - q₀)⁻¹ / ‖q - q₀‖ ^ 2

/-- Quaternion coefficient order for the left Cauchy–Fueter integrand, before `Dq`. -/
noncomputable def leftCauchyKernelOrder (q q₀ u : H) : H :=
  cauchyFueterKernel q q₀ * u

/-- Quaternion coefficient order for the right Cauchy–Fueter integrand, after `Dq`. -/
noncomputable def rightCauchyKernelOrder (q q₀ u : H) : H :=
  u * cauchyFueterKernel q q₀

/-- Proposed full-strength rigidity target; no differentiability regularity is assumed separately. -/
theorem leftQuotient_rigidity
    (Ω : Set H) (hopen : IsOpen Ω) (hconn : IsConnected Ω)
    (f : H → H)
    (hd : ∀ q ∈ Ω, ∃ b, HasLeftQuotientFDerivAt f q b) :
    ∃ a b, ∀ q ∈ Ω, f q = a + q * b := by
  sorry

theorem rightQuotient_rigidity
    (Ω : Set H) (hopen : IsOpen Ω) (hconn : IsConnected Ω)
    (f : H → H)
    (hd : ∀ q ∈ Ω, ∃ a, HasRightQuotientFDerivAt f q a) :
    ∃ a b, ∀ q ∈ Ω, f q = a + b * q := by
  sorry

/-- Product rule for the left-quotient subclass, including its centrality condition. -/
theorem left_product_quotient_rule
    (f g : H → H) (q bf bg : H)
    (hf : HasLeftQuotientFDerivAt f q bf)
    (hg : HasLeftQuotientFDerivAt g q bg)
    (hcond : bg = 0 ∨ ∃ r : ℝ, f q = r) :
    HasLeftQuotientFDerivAt (fun x => f x * g x) q (bf * g q + f q * bg) := by
  sorry

theorem right_product_quotient_rule
    (f g : H → H) (q af ag : H)
    (hf : HasRightQuotientFDerivAt f q af)
    (hg : HasRightQuotientFDerivAt g q ag)
    (hcond : af = 0 ∨ ∃ r : ℝ, g q = r) :
    HasRightQuotientFDerivAt (fun x => f x * g x) q (af * g q + f q * ag) := by
  sorry

theorem left_inverse_quotient_rule
    (f : H → H) (q bf : H)
    (hf : HasLeftQuotientFDerivAt f q bf) (hq : f q ≠ 0)
    (hcond : bf = 0 ∨ ∃ r : ℝ, f q = r) :
    HasLeftQuotientFDerivAt (fun x => (f x)⁻¹) q
      (-((f q)⁻¹ * bf * (f q)⁻¹)) := by
  sorry

theorem right_inverse_quotient_rule
    (f : H → H) (q af : H)
    (hf : HasRightQuotientFDerivAt f q af) (hq : f q ≠ 0)
    (hcond : af = 0 ∨ ∃ r : ℝ, f q = r) :
    HasRightQuotientFDerivAt (fun x => (f x)⁻¹) q
      (-((f q)⁻¹ * af * (f q)⁻¹)) := by
  sorry

theorem left_composition_quotient_rule
    (f g : H → H) (q bf bg : H)
    (hf : HasLeftQuotientFDerivAt f (g q) bf)
    (hg : HasLeftQuotientFDerivAt g q bg) :
    HasLeftQuotientFDerivAt (fun x => f (g x)) q (bg * bf) := by
  sorry

theorem right_composition_quotient_rule
    (f g : H → H) (q af ag : H)
    (hf : HasRightQuotientFDerivAt f (g q) af)
    (hg : HasRightQuotientFDerivAt g q ag) :
    HasRightQuotientFDerivAt (fun x => f (g x)) q (af * ag) := by
  sorry

/-- Both quotient orders at one point force the common slope to be central. -/
theorem simultaneous_quotients_have_real_slope
    (f : H → H) (q : H) (a b : H)
    (_hl : HasLeftQuotientFDerivAt f q b)
    (_hr : HasRightQuotientFDerivAt f q a) :
    ∃ r : ℝ, a = r ∧ b = r := by
  sorry

/- The integral targets are specified in README.md with exact form/kernel order,
   orientation, domain, and regularity hypotheses. -/

end QuaternionicAnalysisPrototype
