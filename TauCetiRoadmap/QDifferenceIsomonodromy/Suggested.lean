import Mathlib.Algebra.Module.Projective
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.RingTheory.Finiteness.Defs

/-!
# Suggested interfaces for q-difference equations and isomonodromy

The README is the specification. These declarations suggest forms for selected targets.
The analytic classifications and geometric interfaces are specified in the README.
-/

namespace TauCetiRoadmap.QDifferenceIsomonodromy

universe u v

/-- §0.1. A finite projective module with an invertible semilinear operator. -/
structure DifferenceModule {R : Type u} [CommRing R] (σ : R ≃+* R) where
  carrier : Type v
  [isAddCommGroup : AddCommGroup carrier]
  [isModule : Module R carrier]
  [isFinite : Module.Finite R carrier]
  [isProjective : Module.Projective R carrier]
  operator :
    letI : RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ
    letI : RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv_symm σ
    LinearEquiv σ.toRingHom (σ' := σ.symm.toRingHom) carrier carrier

attribute [instance] DifferenceModule.isAddCommGroup DifferenceModule.isModule

/-- §0.1. Morphisms commute with the semilinear operators. -/
structure DifferenceModule.Hom {R : Type u} [CommRing R] {σ : R ≃+* R}
    (M N : DifferenceModule.{u, v} σ) where
  toLinearMap : M.carrier →ₗ[R] N.carrier
  commutes :
    letI : RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ
    letI : RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv_symm σ
    ∀ x : M.carrier,
      toLinearMap (M.operator.toLinearMap.toFun x) =
        N.operator.toLinearMap.toFun (toLinearMap x)

section Matrices

variable {K : Type*} [Field K]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- §0.3. The sizes of the source and target systems may differ. -/
def IsHorizontal (σ : K ≃+* K) (A : Matrix ι ι K) (A' : Matrix κ κ K)
    (H : Matrix κ ι K) : Prop :=
  H.map σ * A = A' * H

/-- §6.2. The time square for two gauges and their translates. -/
def TimeSquare {ι : Type*} [Fintype ι]
    (Bᵢ Bⱼ Bⱼ_after_i Bᵢ_after_j : Matrix ι ι K) : Prop :=
  Bⱼ_after_i * Bᵢ = Bᵢ_after_j * Bⱼ

end Matrices

section PolynomialSteps

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- §7.1. A disjoint spectrum makes the Sylvester equation uniquely solvable. -/
theorem sylvester_existsUnique (X Y Z : Matrix ι ι ℂ)
    (hXY : ∀ a, X.charpoly.IsRoot a → ¬ Y.charpoly.IsRoot a) :
    ∃! Λ : Matrix ι ι ℂ, Y * Λ - Λ * X = Z := by
  sorry

variable {K : Type*} [Field K]

/-- §7.2. The normalized gauge attached to a linear right factor. -/
def rightFactorGauge (z : K) (B : Matrix ι ι K) : Matrix ι ι K :=
  1 - z⁻¹ • B

/-- §7.2. The spatial equation for the step, written before cancellation. -/
theorem rightFactorGauge_horizontal (q z : K) (hq : q ≠ 0) (hz : z ≠ 0)
    (L D B : Matrix ι ι K) :
    rightFactorGauge (q * z) B * (L * D * (z • 1 - B)) =
      ((z • 1 - q⁻¹ • B) * L * D) * rightFactorGauge z B := by
  sorry

end PolynomialSteps

end TauCetiRoadmap.QDifferenceIsomonodromy
